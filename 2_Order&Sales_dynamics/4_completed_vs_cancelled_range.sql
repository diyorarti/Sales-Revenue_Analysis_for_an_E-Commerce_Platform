/*
Question -> What percentage of orders are completed vs canceled?

Definition:
    - Completed = delivered
    - Canceled  = canceled
*/
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM orders_dataset
WHERE order_status IN ('delivered', 'canceled')
GROUP BY order_status
ORDER BY order_status;
