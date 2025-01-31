CREATE TABLE IF NOT EXISTS order_items(
    id SERIAL PRIMARY KEY NOT NULL,
    order_id SERIAL NOT NULL,
    product_sku VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    quantity NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100) NOT NULL,
    deleted_at TIMESTAMP,
    deleted_by VARCHAR(100)
);