WITH click_events AS (
    SELECT
        session_id,
        event_name,
        event_time,
        product_id,
        quantity,
        item_price,
        event_time::DATE AS event_date,
        EXTRACT(HOUR FROM event_time) AS event_hour
    FROM {{ ref('stg_click_event_metadata') }}
    WHERE product_id IS NOT NULL
),
session_summary AS (
    SELECT
        session_id,
        COUNT(*) AS total_clicks,
        COUNT(DISTINCT product_id) AS products_viewed,
        MIN(event_time) AS session_start,
        MAX(event_time) AS session_end,
        EXTRACT(EPOCH FROM (MAX(event_time) - MIN(event_time)))/60 AS session_duration_minutes
    FROM click_events
    GROUP BY session_id
)
SELECT
    c.*,
    s.total_clicks,
    s.products_viewed,
    s.session_start,
    s.session_end,
    s.session_duration_minutes
FROM click_events c
JOIN session_summary s ON c.session_id = s.session_id
ORDER BY c.event_time