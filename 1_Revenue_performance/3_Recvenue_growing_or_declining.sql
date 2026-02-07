/*
Question -> Is revenue growing or declining over time?

Month-over-month (MoM) revenue growth/decline based on order purchase date:
- Revenue = sum of item-level product prices
- Time bucket = purchase month
- Includes only shipped and delivered orders
- Computes:
  1) monthly revenue
  2) previous month revenue (LAG)
  3) absolute change
  4) direction label (growing/declining/flat)
*/

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) as month,
        SUM(io.price) as revenue
    FROM orders_dataset o
    INNER JOIN order_items_dataset io ON o.order_id = io.order_id
    WHERE o.order_status IN ('delivered', 'shipped')
    GROUP BY month
    ORDER BY month
),
previous_month_revenue AS (
    SELECT
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue
    FROM monthly_revenue
)
SELECT 
    TO_CHAR(month, 'YYYY-MM') as month,
    ROUND(revenue) as revenue,
    ROUND(prev_month_revenue) AS prev_month_revenue,
    ROUND(revenue - prev_month_revenue) AS revenue_change,
    CASE
        WHEN revenue > prev_month_revenue THEN 'growing'
        WHEN revenue < prev_month_revenue THEN 'declining'
        ELSE 'flat'
    END AS trend_direction
FROM previous_month_revenue
ORDER BY month;