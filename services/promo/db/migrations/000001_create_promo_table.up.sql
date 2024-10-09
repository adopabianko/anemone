CREATE TABLE IF NOT EXISTS promo(
    id SERIAL PRIMARY KEY NOT NULL,
    code VARCHAR(50) NOT NULL,
    type VARCHAR(10) NOT NULL, -- PERCENTAGE, AMOUNT
    value NUMERIC(10,2) NOT NULL,
    quantity INTEGER NOT NULL,
    expired_at DATE NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT true,
    description VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100) NOT NULL,
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    deleted_at TIMESTAMP,
    deleted_by VARCHAR(100)
);