WITH rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary,
        -- Simple scoring (1-3 scale for junior level)
        CASE
            WHEN recency_days <= 30 THEN 3
            WHEN recency_days <= 90 THEN 2
            ELSE 1
        END AS recency_score,
        CASE
            WHEN frequency >= 5 THEN 3
            WHEN frequency >= 2 THEN 2
            ELSE 1
        END AS frequency_score,
        CASE
            WHEN monetary >= 1000 THEN 3
            WHEN monetary >= 300 THEN 2
            ELSE 1
        END AS monetary_score
    FROM {{ ref('prep_customer_metrics') }}
)
SELECT
    c.customer_id,
    c.full_name,
    c.email,
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
    END AS customer_segment
FROM rfm_scores r
JOIN {{ ref('stg_customers') }} c ON r.customer_id = c.customer_id