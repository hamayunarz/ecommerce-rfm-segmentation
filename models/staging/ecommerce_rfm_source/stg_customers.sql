SELECT
    customer_id,
    first_name,
    last_name,
    username,
    email,
    CASE 
        WHEN UPPER(gender) = 'M' THEN 'Male'
        WHEN UPPER(gender) = 'F' THEN 'Female'
        ELSE 'Other'
    END AS gender,
    birthdate,
    device_type,
    device_id,
    device_version,
    home_location_lat,
    home_location_long,
    home_location,
    home_country,
    first_join_date
FROM {{ source('ecommerce_rfm_source', 'customers_raw') }}
