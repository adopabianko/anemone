CREATE TABLE IF NOT EXISTS "order"(
    id SERIAL PRIMARY KEY NOT NULL,
    order_code VARCHAR(50) NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    notes VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100) NOT NULL,
    deleted_at TIMESTAMP,
    deleted_by VARCHAR(100)
);