-- Creating Tables

-- Creating customers_dataset table with primary key
CREATE TABLE public.customers_dataset (
    customer_id VARCHAR(32) PRIMARY KEY,
    customer_unique_id VARCHAR(32),
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state VARCHAR(2)
)

-- Creating sellers_dataset table with primary key
CREATE TABLE public.sellers_dataset (
    seller_id VARCHAR(32) NOT NULL PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city TEXT,
    seller_state CHAR(2)
);

