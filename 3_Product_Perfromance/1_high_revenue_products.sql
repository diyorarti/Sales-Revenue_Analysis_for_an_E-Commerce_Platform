/*
Question -> Which product categories generate the highest revenue?
    - This query analyzes product category performance by aggregating revenue at the category level.
    - Order items are joined with products to map each sold item to its product category.
    - Orders are joined to filter transactions based on order status, ensuring only finalized shipments are included.
    - The result highlights which product categories contribute the most to total revenue.
*/
SELECT
    SUM(io.price) AS total_revenue,
    p.product_category_name
FROM products_dataset p
INNER JOIN order_items_dataset io ON p.product_id = io.product_id
INNER JOIN orders_dataset o ON io.order_id = o.order_id
WHERE o.order_status IN ('delivered', 'shipped')
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
