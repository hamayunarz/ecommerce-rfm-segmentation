WITH session_clicks AS (
    SELECT 
        session_id,
        COUNT(*) AS total_events,
        COUNT(CASE WHEN event_name = 'ADD_TO_CART' THEN 1 END) AS cart_adds,
        COUNT(CASE WHEN event_name = 'BOOKING' THEN 1 END) AS bookings,
        MIN(event_time) AS session_start,
        MAX(event_time) AS session_end
    FROM {{ ref('stg_click_event_metadata') }}
    GROUP BY session_id
),
session_transactions AS (
    SELECT 
        session_id,
        COUNT(DISTINCT booking_id) AS completed_orders,
        SUM(total_amount) AS session_revenue
    FROM {{ ref('stg_transaction_metadata') }}
    WHERE payment_status = 'completed'
    GROUP BY session_id
)
SELECT 
    sc.session_id,
    sc.total_events,
    sc.cart_adds,
    sc.bookings,
    sc.session_start,
    sc.session_end,
    COALESCE(st.completed_orders, 0) AS completed_orders,
    COALESCE(st.session_revenue, 0) AS session_revenue,
    CASE 
        WHEN st.completed_orders > 0 THEN 1 
        ELSE 0 
    END AS conversion_flag,
    CASE 
        WHEN sc.cart_adds > 0 AND st.completed_orders = 0 THEN 1 
        ELSE 0 
    END AS abandoned_cart_flag
FROM session_clicks sc
LEFT JOIN session_transactions st ON sc.session_id = st.session_id