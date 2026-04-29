--- Step 1 : calculate recency, frequency, monetary r,f,m ranks 
--- Combine views with CTE's 

CREATE OR REPLACE VIEW `coherent-vision-494816-h7.thelook_data.rfm_metrics`
AS
WITH current_date AS (

  SELECT DATE_ADD(DATE(MAX(created_at)), INTERVAL 1 DAY) AS analysis_date 
  FROM `coherent-vision-494816-h7.thelook_data.order_items_copy`
),
rfm AS (
  SELECT 
    user_id,
    MAX(DATE(created_at)) AS last_order_date,
    DATE_DIFF((SELECT analysis_date FROM current_date), DATE(MAX(created_at)), DAY) AS recency,
    COUNT(DISTINCT order_id) AS frequency,
    SUM(sale_price) as monetary
  FROM `coherent-vision-494816-h7.thelook_data.order_items_copy`
  WHERE status = 'Complete'
  GROUP BY user_id
)
SELECT
  rfm.*,
  ROW_NUMBER() OVER(ORDER BY recency ASC ) AS r_rank,
  ROW_NUMBER() OVER(ORDER BY frequency DESC) AS f_rank,
  ROW_NUMBER() OVER(ORDER BY monetary DESC) AS m_rank
FROM rfm;
