SELECT provider_state,
       ROUND(AVG(average_total_payments), 0) AS avg_payment
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
GROUP BY provider_state
ORDER BY avg_payment DESC;