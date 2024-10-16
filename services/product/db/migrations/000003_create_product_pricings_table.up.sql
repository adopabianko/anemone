CREATE TABLE IF NOT EXISTS product_pricings(
    id SERIAL PRIMARY KEY NOT NULL,
    product_id SERIAL NOT NULL,
    purchase_price NUMERIC(10,2) NOT NULL,
    selling_price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100) NOT NULL,
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    deleted_at TIMESTAMP,
    deleted_by VARCHAR(100),

    CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES products(id)
);