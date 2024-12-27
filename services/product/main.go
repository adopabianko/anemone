package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

func main() {
	router := gin.Default()
	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"service_name":    "Product Service",
			"service_version": "1.0.0",
		})
	})

	router.GET("/health", healthCheck)

	srv := &http.Server{
		Addr:    ":8383",
		Handler: router.Handler(),
	}

	go func() {
		// service connections
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("listen: %s\n", err)
		}
	}()

	// Wait for interrupt signal to gracefully shutdown the server with
	// a timeout of 5 seconds.
	quit := make(chan os.Signal, 1)
	// kill (no param) default send syscall.SIGTERM
	// kill -2 is syscall.SIGINT
	// kill -9 is syscall. SIGKILL but can"t be catch, so don't need add it
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	log.Println("Shutdown Server ...")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := srv.Shutdown(ctx); err != nil {
		log.Fatal("Server Shutdown:", err)
	}
	// catching ctx.Done(). timeout of 5 seconds.
	select {
	case <-ctx.Done():
		log.Println("timeout of 5 seconds.")
	}
	log.Println("Server exiting")
}

func healthCheck(c *gin.Context) {
	postgresPing := postgresConn().Ping()

	postgresStatus := "Ok"
	if postgresPing != nil {
		postgresStatus = "Error"
	}

	c.JSON(200, gin.H{
		"postgres": postgresStatus,
	})
}

func postgresConn() *sqlx.DB {
	db, err := sqlx.Connect("postgres", "postgres://anemone:anemone@anemone-postgres:5432/anemone_product?sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	return db
}
