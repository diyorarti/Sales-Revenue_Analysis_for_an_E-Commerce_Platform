/*
Question -> How many orders per month?
    - Counting order_id for per month
    - Includes orders that passed payment and entered the fulfillment process
    - Groups orders by purchase month (YYYY-MM)
*/
SELECT
    COUNT(order_id) AS total_orders,
    TO_CHAR(order_purchase_timestamp, 'YYYY-MM') as order_month
FROM orders_dataset
WHERE order_status IN ('delivered', 'shipped', 'approved', 'invoiced', 'processing')
GROUP BY order_month
ORDER BY order_month;
