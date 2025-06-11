WITH customer_summary AS (
    SELECT 
        customer_id,
        MIN(created_at::DATE) AS first_purchase_date,
        MAX(created_at::DATE) AS last_purchase_date,
        COUNT(DISTINCT booking_id) AS total_orders,
        SUM(total_amount) AS total_spent,
        AVG(total_amount) AS avg_order_value
    FROM {{ ref('stg_transaction_metadata') }}
    WHERE payment_status = 'Success'
    GROUP BY customer_id
)
SELECT 
    customer_id,
    first_purchase_date,
    last_purchase_date,
    '2022-07-31'::DATE - last_purchase_date AS recency_days,
    total_orders AS frequency,
    total_spent AS monetary,
    avg_order_value
FROM customer_summary