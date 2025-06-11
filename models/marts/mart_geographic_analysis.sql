SELECT
    c.home_country,
    c.home_location,
    COUNT(DISTINCT t.customer_id) AS customers_count,
    COUNT(DISTINCT t.booking_id) AS total_orders,
    SUM(t.total_amount) AS total_revenue,
    AVG(t.total_amount) AS avg_order_value
FROM {{ ref('stg_transaction_metadata') }} t 
JOIN {{ ref('stg_customers') }} c ON t.customer_id = c.customer_id
WHERE t.payment_status = 'Success' 
GROUP BY
    c.home_country,
    c.home_location 
ORDER BY total_revenue DESC