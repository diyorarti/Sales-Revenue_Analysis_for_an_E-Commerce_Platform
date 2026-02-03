/*
Total product sales revenue:
    - Sum of item-level product prices
    - Represents gross sales value of products sold
    - Excludes freight charges, vouchers, and payment mechanics
    - Includes all orders regardless of final order status
*/
SELECT
    SUM(price) AS total_revenue
FROM order_items_dataset;

/*
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

/*
Gross customer payments (total cash collected from customers)
   - Includes product prices, freight charges, vouchers/discount effects,
   - and installment-based payments across all orders
*/
SELECT
    SUM(payment_value) AS Gross_Revenue
FROM order_payments_dataset op;
