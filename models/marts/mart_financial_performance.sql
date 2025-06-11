SELECT 
    sale_date,
    daily_revenue,
    daily_orders,
    daily_avg_order_value,
    -- Growth calculations
    LAG(daily_revenue, 7) OVER (ORDER BY sale_date) AS revenue_7_days_ago,
    daily_revenue - LAG(daily_revenue, 7) OVER (ORDER BY sale_date) AS revenue_growth_7d,
    -- Running totals
    SUM(daily_revenue) OVER (ORDER BY sale_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS revenue_7_day_avg
FROM {{ ref('prep_daily_sales') }}
ORDER BY sale_date