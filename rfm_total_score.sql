-- Step 3: total score

CREATE OR REPLACE VIEW `coherent-vision-494816-h7.thelook_data.rfm_total_scores`
AS
SELECT
  user_id,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  (r_score + f_score + m_score) as rfm_total_score

FROM `coherent-vision-494816-h7.thelook_data.rfm_scores`
ORDER BY rfm_total_score DESC; 
