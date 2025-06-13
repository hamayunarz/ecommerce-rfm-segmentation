SELECT 
    CURRENT_DATE AS report_date,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN customer_segment = 'VIP Customer' THEN customer_id END) AS vip_customers,
    COUNT(DISTINCT CASE WHEN customer_segment = 'Loyal Customer' THEN customer_id END) AS loyal_customers,
    COUNT(DISTINCT CASE WHEN customer_segment = 'Regular Customer' THEN customer_id END) AS regular_customers,
    COUNT(DISTINCT CASE WHEN customer_segment = 'At Risk Customer' THEN customer_id END) AS at_risk_customers,
    SUM(CASE WHEN customer_segment = 'VIP Customer' THEN monetary ELSE 0 END) AS vip_revenue,
    SUM(CASE WHEN customer_segment = 'Loyal Customer' THEN monetary ELSE 0 END) AS loyal_revenue,
    SUM(CASE WHEN customer_segment = 'Regular Customer' THEN monetary ELSE 0 END) AS regular_revenue,
    SUM(CASE WHEN customer_segment = 'At Risk Customer' THEN monetary ELSE 0 END) AS at_risk_revenue,
    COUNT(DISTINCT CASE WHEN churn_flag = 1 THEN customer_id END) AS churned_customers,
    ROUND(
    (COUNT(DISTINCT CASE WHEN churn_flag = 1 THEN customer_id END)::NUMERIC / 
     COUNT(DISTINCT customer_id)::NUMERIC) * 100, 2
    ) AS overall_churn_rate,
    AVG(monetary) AS avg_customer_value,
    AVG(frequency) AS avg_purchase_frequency,
    AVG(recency_days) AS avg_days_since_purchase
FROM {{ ref('mart_customer_insights') }}