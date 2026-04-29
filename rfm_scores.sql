-- Step 2: Assing deciles(10=best, 1=worst)

CREATE OR REPLACE VIEW `coherent-vision-494816-h7.thelook_data.rfm_scores`
AS
SELECT
  *,
  NTILE(10) OVER(ORDER BY r_rank DESC) as r_score, 
  NTILE(10) OVER(ORDER BY f_rank DESC) as f_score,
  NTILE(10) OVER(ORDER BY m_rank DESC) as m_score
FROM `coherent-vision-494816-h7.thelook_data.rfm_metrics`;
