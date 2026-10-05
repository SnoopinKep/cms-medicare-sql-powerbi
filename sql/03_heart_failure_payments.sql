SELECT provider_state, provider_name, drg_definition, average_total_payments
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
WHERE drg_definition LIKE '291%'
ORDER BY average_total_payments DESC
LIMIT 20;