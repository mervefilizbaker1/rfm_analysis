--- step 4: BI ready rfm segments table 

CREATE OR REPLACE TABLE `coherent-vision-494816-h7.thelook_data.rfm_segments_final`
AS 
SELECT
  user_id,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  rfm_total_score,
  CASE 
    WHEN rfm_total_score >= 28 THEN 'Fashion Icons'
    WHEN rfm_total_score >= 24 THEN 'Trendsetters'
    WHEN rfm_total_score >= 20 THEN 'Style Enthusiasts'
    WHEN rfm_total_score >= 16 THEN 'Regular Shoppers'
    WHEN rfm_total_score >= 12 THEN 'Seasonal Buyers'
    WHEN rfm_total_score >= 8  THEN 'Window Shoppers'
    WHEN rfm_total_score >= 4  THEN 'Fading Interest'
    ELSE 'Out of Style'
  END AS rfm_segment

FROM `coherent-vision-494816-h7.thelook_data.rfm_total_scores`
ORDER BY rfm_total_score DESC;