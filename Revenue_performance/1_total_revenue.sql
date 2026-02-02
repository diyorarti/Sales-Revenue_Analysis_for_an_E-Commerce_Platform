/*
Calculating total revenue from order payments dataset
*/

SELECT
    SUM(payment_value) AS total_revenue
FROM order_payments_dataset

