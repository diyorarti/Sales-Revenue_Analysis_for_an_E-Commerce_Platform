-- Creating tables

-- Creating table for order_payments_dataset.csv dataset
CREATE TABLE public.order_payments_dataset (
    order_id INT,
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10, 2)
);
/*
I have initially created incorrect data tupe for 'order_id' column, I will modify it
*/
ALTER TABLE public.order_payments_dataset
ALTER COLUMN order_id TYPE VARCHAR(50)
USING order_id::VARCHAR;
