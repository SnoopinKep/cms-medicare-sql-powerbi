WITH state_avg AS (
  SELECT provider_state,
         AVG(average_total_payments) AS state_avg_payment
  FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
  WHERE drg_definition LIKE '291%'
  GROUP BY provider_state
)
SELECT p.provider_name,
       p.provider_state,
       ROUND(p.average_total_payments, 0) AS hospital_payment,
       ROUND(s.state_avg_payment, 0) AS state_avg_payment,
       ROUND(p.average_total_payments - s.state_avg_payment, 0) AS diff_from_state_avg
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015` p
JOIN state_avg s USING (provider_state)
WHERE p.drg_definition LIKE '291%'
ORDER BY diff_from_state_avg DESC
LIMIT 25;