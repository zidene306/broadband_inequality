-- using CTE
WITH national_dwn_av AS (
  SELECT
  ROUND(AVG(`avg_down_mbps `), 2) AS national_average
  FROM fixed_internet_perf_fr.fact_perf
)

SELECT
  d.department_name,
  ROUND(AVG(p.`avg_down_mbps `), 2) AS department_avg,
  national_average
  
FROM fixed_internet_perf_fr.fact_perf AS p
JOIN fixed_internet_perf_fr.dim_department AS d
  ON p.code_insee_dept = d.code_insee_dept
CROSS JOIN national_dwn_av
GROUP BY
  d.department_name,
  national_average
HAVING
  AVG(p.`avg_down_mbps `) < national_average
ORDER BY
  department_avg ASC;

