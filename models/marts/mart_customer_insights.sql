WITH rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary,
        CASE
            WHEN recency_days <= 39 THEN 3 -- Top 25% most recent
            WHEN recency_days <= 111 THEN 2 -- Next 25% (up to median)
            ELSE 1
        END AS recency_score,
        CASE
            WHEN frequency >= 17 THEN 3    -- Top 25% most frequent
            WHEN frequency >= 6 THEN 2     -- Next 25% (from median)
            ELSE 1
        END AS frequency_score,
        CASE
            WHEN monetary >= 25943505.75 THEN 3 -- Top 25% highest spenders
            WHEN monetary >= 4964144.0 THEN 2  -- Next 25% (from median)
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