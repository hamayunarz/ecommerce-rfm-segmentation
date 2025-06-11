SELECT 
    product_name,
    category,
    total_quantity_sold,
    total_revenue,
    orders_count,
    avg_price,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
    RANK() OVER (ORDER BY total_quantity_sold DESC) AS quantity_rank
FROM {{ ref('prep_product_sales') }}
ORDER BY total_revenue DESC