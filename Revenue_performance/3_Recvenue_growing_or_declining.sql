/*
Month-over-month (MoM) revenue growth/decline based on order purchase date:
- Revenue = sum of item-level product prices
- Time bucket = purchase month
- Includes only shipped and delivered orders
- Computes:
  1) monthly revenue
  2) previous month revenue (LAG)
  3) absolute change
  4) percent change
  5) direction label (growing/declining/flat)
*/

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month_start,
        SUM(oi.price) AS revenue
    FROM public.orders_dataset o
    INNER JOIN public.order_items_dataset oi
        ON o.order_id = oi.order_id
    WHERE o.order_purchase_timestamp IS NOT NULL
      AND o.order_status IN ('delivered', 'shipped')
    GROUP BY month_start
),
revenue_with_prev AS (
    SELECT
        month_start,
        revenue,
        LAG(revenue) OVER (ORDER BY month_start) AS prev_month_revenue
    FROM monthly_revenue
)
SELECT
    TO_CHAR(month_start, 'YYYY-MM') AS year_month,
    ROUND(revenue, 2) AS monthly_revenue,
    ROUND(prev_month_revenue, 2) AS previous_month_revenue,
    ROUND(revenue - prev_month_revenue, 2) AS revenue_change,
    ROUND(
        CASE
            WHEN prev_month_revenue IS NULL OR prev_month_revenue = 0 THEN NULL
            ELSE (revenue - prev_month_revenue) / prev_month_revenue * 100
        END,
        2
    ) AS mom_change_percent,
    CASE
        WHEN prev_month_revenue IS NULL THEN 'n/a'
        WHEN revenue > prev_month_revenue THEN 'growing'
        WHEN revenue < prev_month_revenue THEN 'declining'
        ELSE 'flat'
    END AS trend_direction
FROM revenue_with_prev
ORDER BY month_start;
