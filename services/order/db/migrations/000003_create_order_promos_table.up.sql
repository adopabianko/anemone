CREATE TABLE IF NOT EXISTS order_promos(
    id SERIAL PRIMARY KEY NOT NULL,
    order_id SERIAL NOT NULL,
    promo_id SERIAL NOT NULL,
    promo_code VARCHAR(50) NOT NULL,
    promo_value NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100) NOT NULL,
    deleted_at TIMESTAMP,
    deleted_by VARCHAR(100),

    CONSTRAINT fk_order_id FOREIGN KEY(order_id) REFERENCES "orders"(id)
);