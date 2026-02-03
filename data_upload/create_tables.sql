/*
    CREATING TABLES
*/

-- Creating customers_dataset table with primary key
CREATE TABLE public.customers_dataset (
    customer_id VARCHAR(32) PRIMARY KEY,
    customer_unique_id VARCHAR(32),
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state VARCHAR(2)
);

-- Creating sellers_dataset table with primary key
CREATE TABLE public.sellers_dataset (
    seller_id VARCHAR(32) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city TEXT,
    seller_state CHAR(2)
);

-- Creating products_dataset table with primary key
CREATE TABLE public.products_dataset (
    product_id VARCHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- Creating orders_dataset table with primary key and a foreign key
CREATE TABLE public.orders_dataset (
    order_id VARCHAR(32) PRIMARY KEY,
    customer_id VARCHAR(32) REFERENCES public.customers_dataset(customer_id),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);


-- Creating order_items_dataset table with foreign keys
CREATE TABLE public.order_items_dataset (
    order_id VARCHAR(32) REFERENCES public.orders_dataset(order_id),
    order_item_id INT,
    product_id VARCHAR(32) REFERENCES public.products_dataset(product_id),
    seller_id VARCHAR(32) REFERENCES public.sellers_dataset(seller_id),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10, 2),
    freight_value NUMERIC(10, 2),
    PRIMARY KEY (order_id, order_item_id)
);


-- Creating order_payments_dataset table with foreign key
CREATE TABLE public.order_payments_dataset (
    order_id VARCHAR(32) REFERENCES public.orders_dataset(order_id),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value NUMERIC(10, 2),
    PRIMARY KEY (order_id, payment_sequential)
);

-- Creating order_reviews_dataset table with primary key and a foreign key
CREATE TABLE public.order_reviews_dataset (
    review_id VARCHAR(32),
    order_id VARCHAR(32) REFERENCES public.orders_dataset(order_id),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    PRIMARY KEY (review_id, order_id)
);

-- Creating geolocation_dataset table 
CREATE TABLE public.geolocation_dataset (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(9, 6),
    geolocation_lng DECIMAL(9, 6),
    geolocation_city TEXT,
    geolocation_state CHAR(2)
);

-- Creating product_category_name_translation table 
CREATE TABLE public.product_category_name_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);
