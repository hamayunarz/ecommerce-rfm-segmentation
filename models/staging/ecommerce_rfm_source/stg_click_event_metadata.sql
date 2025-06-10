WITH click_raw AS (
    SELECT 
        session_id,
        event_name,
        event_time,
        event_id,
        traffic_source,
        REPLACE(event_metadata, '''', '"')::JSON AS json_data
    FROM {{ source('ecommerce_rfm_source', 'click_stream_raw') }}
),
click_flattened AS (
    SELECT 
        session_id,
        event_name,
        event_time,
        event_id,
        traffic_source,
        (json_data->>'product_id')::INTEGER AS product_id,
        (json_data->>'quantity')::INTEGER AS quantity,
        (json_data->>'item_price')::NUMERIC AS item_price
    FROM click_raw
)
SELECT * FROM click_flattened