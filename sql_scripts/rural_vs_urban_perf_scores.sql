SELECT
  c.LIBDENS,
  ROUND(AVG(p.broadband_score),2)AS broadband_score,
  ROUND(AVG(p.`avg_down_mbps `),2) AS average_down_mbs,
  ROUND(AVG(p.load_lat_ms), 2) AS average_load_lat

FROM 
fixed_internet_perf_fr.fact_perf AS p
JOIN fixed_internet_perf_fr.dim_communes AS c
ON p.code_insee_comm = c.code_insee_comm
GROUP BY c.LIBDENS;





