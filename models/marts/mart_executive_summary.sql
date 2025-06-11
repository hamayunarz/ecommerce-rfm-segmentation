WITH summary_metrics AS (
    SELECT 
        COUNT(DISTINCT customer_id) AS total_customers,
        COUNT(DISTINCT booking_id) AS total_orders,
        SUM(total_amount) AS total_revenue,
        AVG(total_amount) AS avg_order_value,
        MAX(created_at::DATE) AS last_transaction_date,
        MIN(created_at::DATE) AS first_transaction_date
    FROM {{ ref('stg_transaction_metadata') }}
    WHERE payment_status = 'Success'
)
SELECT 
    'Business Health Dashboard' AS report_name,
    total_customers,
    total_orders,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(avg_order_value, 2) AS avg_order_value,
    ROUND(total_revenue / total_customers, 2) AS revenue_per_customer,
    first_transaction_date,
    last_transaction_date,
    last_transaction_date - first_transaction_date AS business_days_active
FROM summary_metrics