WITH daily_summary AS (
    SELECT
        event_date,
        COUNT(DISTINCT session_id) AS daily_sessions,
        COUNT(*) AS total_clicks,
        COUNT(DISTINCT product_id) AS products_clicked
    FROM {{ ref('prep_click_behavior') }}
    GROUP BY event_date
)
SELECT *
FROM daily_summary
ORDER BY event_date