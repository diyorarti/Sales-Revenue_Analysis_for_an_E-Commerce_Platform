/*
Question -> How much total revenue did the platform generate?

Product sales revenue from fulfilled orders:
    - Sum of item-level product prices
    - Includes only orders that have been shipped or delivered
    - Excludes canceled and unavailable orders
    - Reflects realized and in-transit product revenue
*/
SELECT 
    SUM(oi.price) AS Delivered_Items_Revenue
FROM order_items_dataset oi 
INNER JOIN 
    orders_dataset o ON o.order_id = oi.order_id
WHERE o.order_status IN ('delivered', 'shipped');
