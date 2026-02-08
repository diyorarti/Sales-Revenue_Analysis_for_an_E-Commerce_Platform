/*
Question -> Which product categories sell the highest quantity?
    - This query measures product category performance by counting the number of items sold per category.
    - Order items are joined with products to assign each sold item to its product category.
    - Orders are joined to filter only delivered transactions, ensuring quantities reflect completed sales.
    - The results identify which product categories have the highest sales volume.
`

*/
SELECT
    p.product_category_name,
    COUNT(*) AS items_sold
FROM order_items_dataset oi
JOIN products_dataset p
  ON oi.product_id = p.product_id
JOIN orders_dataset o
  ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY items_sold DESC;
