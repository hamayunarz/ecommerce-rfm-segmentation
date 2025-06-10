WITH transaction_raw AS (
    SELECT 
        created_at,
        customer_id,
        booking_id,
        session_id,
        payment_method,
        payment_status,
        promo_amount,
        promo_code,
        shipment_fee,
        shipment_date_limit,
        shipment_location_lat,
        shipment_location_long,
        total_amount,
        JSON_ARRAY_ELEMENTS(REPLACE(product_metadata, '''', '"')::JSON) AS json_data
    FROM {{ source('ecommerce_rfm_source', 'transactions_raw') }}
),
transaction_flattened AS (
    SELECT 
        created_at,
        customer_id,
        booking_id,
        session_id,
        payment_method,
        payment_status,
        promo_amount,
        promo_code,
        shipment_fee,
        shipment_date_limit,
        shipment_location_lat,
        shipment_location_long,
        total_amount,
        (json_data ->> 'product_id')::INTEGER AS product_id,
        (json_data ->> 'quantity')::INTEGER AS quantity,
        (json_data ->> 'item_price')::NUMERIC AS item_price
    FROM transaction_raw
    )
SELECT * FROM transaction_flattened