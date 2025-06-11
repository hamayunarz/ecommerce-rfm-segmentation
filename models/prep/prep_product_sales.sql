SELECT 
    t.product_id,
    p.product_name,
    p.category,
    COUNT(DISTINCT t.booking_id) AS orders_count,
    SUM(t.quantity) AS total_quantity_sold,
    SUM(t.quantity * t.item_price) AS total_revenue,
    AVG(t.item_price) AS avg_price
FROM {{ ref('stg_transaction_metadata') }} t
JOIN {{ ref('stg_products') }} p ON t.product_id = p.product_id
WHERE t.payment_status = 'Success'
GROUP BY t.product_id, p.product_name, p.category