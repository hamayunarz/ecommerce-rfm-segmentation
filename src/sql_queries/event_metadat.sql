SELECT event_metadata
FROM click_stream_raw;

WITH click_raw AS (
                    SELECT session_id
                          ,event_name
                          ,event_time
                          ,event_id
                          ,traffic_source
                          ,event_metadata AS json_data
                    FROM click_stream_raw		
),
click_flattened AS (
                    SELECT session_id
                          ,event_name
                          ,event_time
                          ,event_id
                          ,traffic_source
                          ,(json_data ->> 'product_id')::INTEGER AS product_id
                          ,(json_data ->> 'quantity')::INTEGER AS quantity
                          ,(json_data ->> 'item_price')::NUMERIC AS item_price
                    FROM click_raw
)
SELECT * FROM click_flattened;





/*  Run      */

SELECT REPLACE(event_metadata, '''', '"') AS fixed_json
FROM click_stream_raw;

SELECT REPLACE(event_metadata, '''', '"')::JSON -> 'product_id'
FROM click_stream_raw;

SELECT REPLACE(event_metadata, '''', '"')::JSON -> 'product_id' AS product_id
      ,REPLACE(event_metadata, '''', '"')::JSON -> 'quantity' AS quantity  
      ,REPLACE(event_metadata, '''', '"')::JSON -> 'item_price' AS item_price
FROM click_stream_raw;

SELECT session_id
      ,event_name
      ,event_time
      ,event_id
      ,traffic_source
      ,REPLACE(event_metadata, '''', '"')::JSON -> 'product_id' AS product_id
      ,REPLACE(event_metadata, '''', '"')::JSON -> 'quantity' AS quantity
      ,REPLACE(event_metadata, '''', '"')::JSON -> 'item_price' AS item_price
FROM click_stream_raw;

WITH click_raw AS (
                    SELECT session_id
                          ,event_name
                          ,event_time
                          ,event_id
                          ,traffic_source
                          ,REPLACE(event_metadata, '''', '"')::JSON AS json_data
                    FROM click_stream_raw		
),
click_flattened AS (
                    SELECT session_id
                          ,event_name
                          ,event_time
                          ,event_id
                          ,traffic_source
                          ,(json_data ->> 'product_id')::INTEGER AS product_id
                          ,(json_data ->> 'quantity')::INTEGER AS quantity
                          ,(json_data ->> 'item_price')::NUMERIC AS item_price
                    FROM click_raw
)
SELECT * FROM click_flattened;
