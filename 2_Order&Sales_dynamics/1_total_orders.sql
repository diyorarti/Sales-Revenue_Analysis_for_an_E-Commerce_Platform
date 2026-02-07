/*
Question -> How many total orders were placed?

Total orders placed:
    - Count of order IDs
    - Filtering by order status 
*/

SELECT 
    COUNT(order_id)
FROM orders_dataset
WHERE order_status IN ('delivered', 'shipped', 'approved', 'invoiced', 'processing')