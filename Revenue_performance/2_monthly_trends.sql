/*
Monthly product revenue based on order purchase date:
    - Revenue is calculated as the sum of item-level product prices
    - Time dimension is the order purchase month (YYYY-MM)
    - Includes only orders that reached shipment or delivery stages
    - Excludes canceled, unavailable, and unfulfilled orders
    - Reflects fulfillment-backed customer demand rather than payment activity
*/
SELECT
    SUM(io.price) as monthly_revenue,
    TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS year_month
FROM orders_dataset o
INNER JOIN order_items_dataset io ON o.order_id = io.order_id
WHERE o.order_purchase_timestamp IS NOT NULL
    AND o.order_status IN ('delivered', 'shipped')
GROUP BY year_month
ORDER BY year_month;
