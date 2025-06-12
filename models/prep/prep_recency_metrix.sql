SELECT
    -- Overall statistics for Recency
    MIN(recency_days) AS min_recency_days,
    MAX(recency_days) AS max_recency_days,
    AVG(recency_days) AS avg_recency_days,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY recency_days) AS p25_recency_days, -- 25th percentile
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY recency_days) AS p50_recency_days, -- 50th percentile (Median)
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY recency_days) AS p75_recency_days, -- 75th percentile
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY recency_days) AS p90_recency_days, -- 90th percentile
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY recency_days) AS p95_recency_days, -- 95th percentile

    -- Overall statistics for Frequency
    MIN(frequency) AS min_frequency,
    MAX(frequency) AS max_frequency,
    AVG(frequency) AS avg_frequency,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY frequency) AS p25_frequency,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY frequency) AS p50_frequency,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY frequency) AS p75_frequency,
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY frequency) AS p90_frequency,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY frequency) AS p95_frequency,

    -- Overall statistics for Monetary
    MIN(monetary) AS min_monetary,
    MAX(monetary) AS max_monetary,
    AVG(monetary) AS avg_monetary,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY monetary) AS p25_monetary,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY monetary) AS p50_monetary,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY monetary) AS p75_monetary,
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY monetary) AS p90_monetary,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY monetary) AS p95_monetary

FROM {{ ref('prep_customer_metrics') }}