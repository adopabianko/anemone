CREATE TABLE IF NOT EXISTS products(
    id SERIAL PRIMARY KEY NOT NULL,
    product_category_id SERIAL NOT NULL,
    sku VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    barcode VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100) NOT NULL,
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    deleted_at TIMESTAMP,
    deleted_by VARCHAR(100),

    CONSTRAINT fk_product_category FOREIGN KEY(product_category_id) REFERENCES product_categories(id)
);