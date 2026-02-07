/*
Question -> What is the average items per order?

Average items per order
    - Calculates the average number of items per order based on order_id
    - Uses order_items_dataset and includes only valid (paid/fulfilled) orders
*/
SELECT
    ROUND(AVG(total_items), 2) AS average_items_per_order
FROM (
    SELECT
        COUNT(io.order_item_id) AS total_items
    FROM order_items_dataset io 
    INNER JOIN orders_dataset o ON io.order_id = o.order_id
    WHERE o.order_status IN ('delivered', 'shipped', 'approved', 'invoiced', 'processing')
    GROUP BY o.order_id
) AS items_per_order;
 