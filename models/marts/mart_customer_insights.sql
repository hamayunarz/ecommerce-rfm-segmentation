WITH rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary,
        CASE
            WHEN recency_days <= 39 THEN 3
            WHEN recency_days <= 111 THEN 2
            ELSE 1
        END AS recency_score,
        CASE
            WHEN frequency >= 17 THEN 3
            WHEN frequency >= 6 THEN 2
            ELSE 1
        END AS frequency_score,
        CASE
            WHEN monetary >= 25943505.75 THEN 3
            WHEN monetary >= 4964144.0 THEN 2
            ELSE 1   
        END AS monetary_score
    FROM {{ ref('prep_customer_metrics') }}
),
customer_segments AS (
    SELECT
        c.customer_id,
        c.full_name,
        c.email,
        c.gender,
        c.device_type,
        c.home_location,
        r.recency_days,
        r.frequency,
        r.monetary,
        r.recency_score,    
        r.frequency_score,  
        r.monetary_score,   
        r.recency_score + r.frequency_score + r.monetary_score AS rfm_total,
        CASE
            WHEN r.recency_score + r.frequency_score + r.monetary_score >= 8 THEN 'VIP Customer'
            WHEN r.recency_score + r.frequency_score + r.monetary_score >= 6 THEN 'Loyal Customer'
            WHEN r.recency_score + r.frequency_score + r.monetary_score >= 4 THEN 'Regular Customer'
            ELSE 'At Risk Customer'
        END AS customer_segment,
        CASE
            WHEN r.recency_days > 180 THEN 1
            ELSE 0
        END AS churn_flag,
        CASE
            WHEN r.recency_days > 180 THEN 'Churned'
            WHEN r.recency_days > 90 THEN 'At Risk'
            WHEN r.recency_days > 30 THEN 'Active'
            ELSE 'Highly Active'
        END AS activity_status
    FROM rfm_scores r
    JOIN {{ ref('stg_customers') }} c ON r.customer_id = c.customer_id
)
SELECT * FROM customer_segments