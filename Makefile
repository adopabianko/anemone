start:
	docker compose up -d

stop:
	docker compose down --rmi all -v --remove-orphans
