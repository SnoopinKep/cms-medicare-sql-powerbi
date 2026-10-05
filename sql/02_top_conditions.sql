SELECT drg_definition,
       SUM(total_discharges) AS total_discharges
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
GROUP BY drg_definition
ORDER BY total_discharges DESC
LIMIT 10;