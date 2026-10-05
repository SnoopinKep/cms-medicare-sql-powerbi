SELECT provider_state,
       drg_definition,
       SUM(total_discharges) AS discharges,
       ROUND(SAFE_DIVIDE(SUM(average_total_payments * total_discharges),
                         SUM(total_discharges)), 0) AS avg_payment
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`
GROUP BY provider_state, drg_definition;