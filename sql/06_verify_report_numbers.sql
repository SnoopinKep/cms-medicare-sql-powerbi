SELECT provider_state,
       SUM(total_discharges) AS discharges,
       ROUND(SAFE_DIVIDE(SUM(average_total_payments * total_discharges),
                         SUM(total_discharges)), 0) AS weighted_avg
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
WHERE drg_definition LIKE '291%'
  AND provider_state IN ('AK', 'CA', 'MD', 'NY')
GROUP BY provider_state
ORDER BY weighted_avg DESC;