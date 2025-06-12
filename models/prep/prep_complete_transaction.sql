
    SELECT
        -- Transaction Line Item Details (from stg_transaction_metadata)
        t.created_at AS transaction_timestamp,
        t.booking_id AS transaction_id,
        t.session_id,
        t.payment_method,
        t.payment_status,
        t.promo_amount,
        t.promo_code,
        t.shipment_fee,
        t.shipment_date_limit,
        t.shipment_location_lat,
        t.shipment_location_long,
        t.total_amount AS transaction_total_amount,
        t.product_id AS line_item_product_id, 
        t.quantity AS line_item_quantity,
        t.item_price AS line_item_price,

        -- Customer Details (from stg_customers)
        c.customer_id,
        c.full_name AS customer_full_name,
        c.email AS customer_email,
        c.gender AS customer_gender,
        c.birthdate AS customer_birthdate,
        c.device_type AS customer_device_type,
        c.home_location AS customer_city,
        c.home_country AS customer_country,
        c.first_join_date,

        -- Product Details (from stg_products)
        p.product_name,
        p.category AS product_category,
        p."subCategory" AS product_sub_category,
        p."articleType" AS product_article_type,
        p."baseColour" AS product_base_colour,
        p.season AS product_season,
        p.year AS product_year,
        p.usage AS product_usage

    FROM {{ ref('stg_transaction_metadata') }} t 
    LEFT JOIN {{ ref('stg_customers') }} c ON t.customer_id = c.customer_id
    LEFT JOIN {{ ref('stg_products') }} p ON t.product_id = p.product_id
    WHERE t.payment_status = 'Success' 
