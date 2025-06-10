SELECT
    id AS product_id, -- Renaming 'id' to 'product_id' for consistency
    gender,
    "masterCategory" AS category, -- Renaming 'masterCategory' to 'category'
    subCategory,
    articleType,
    baseColour,
    season,
    year,
    usage,
   "productDisplayName" AS product_name -- Renaming for clarity
FROM {{ source('ecommerce_rfm_source', 'products_raw') }}