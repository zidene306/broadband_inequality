SELECT
  d.department_name,
  ROUND(AVG(p.broadband_score),2)AS broadband_score
  
FROM `fixed_internet_perf_fr.fact_perf`AS p
JOIN `fixed_internet_perf_fr.dim_department`AS d
ON p.code_insee_dept = d.code_insee_dept
GROUP BY d.department_name
ORDER BY broadband_score DESC;
