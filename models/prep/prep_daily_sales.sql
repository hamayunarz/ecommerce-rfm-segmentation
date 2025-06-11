SELECT 
    created_at::DATE AS sale_date,
    COUNT(DISTINCT booking_id) AS daily_orders,
    COUNT(DISTINCT customer_id) AS daily_customers,
    SUM(total_amount) AS daily_revenue,
    AVG(total_amount) AS daily_avg_order_value
FROM {{ ref('stg_transaction_metadata') }}
WHERE payment_status = 'Success'
GROUP BY created_at::DATE