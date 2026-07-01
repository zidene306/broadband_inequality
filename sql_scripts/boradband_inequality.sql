SELECT
  r.region_name,
  ROUND(AVG(p.load_lat_ms), 2) AS average_load_lat,
  ROUND(AVG(p.broadband_score),2) AS average_bb_score
  
  FROM
  fixed_internet_perf_fr.fact_perf as p
  JOIN fixed_internet_perf_fr.dim_regions as r
  ON p.code_insee_region = r.code_insee_region
  GROUP BY r.region_name
  ORDER BY average_bb_score DESC;
