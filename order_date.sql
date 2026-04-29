CREATE OR REPLACE TABLE `thelook_data.order_items_copy` AS
SELECT 
  *,
  DATE(created_at) AS order_date
FROM `thelook_data.order_items_copy`;  