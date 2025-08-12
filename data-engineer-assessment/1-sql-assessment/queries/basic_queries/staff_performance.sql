SELECT
  sr.staff_id,
  bd.branch_name,
  sr.performance_score,
  COUNT(DISTINCT st.transaction_id) AS number_of_transactions,
  ROUND(SUM(st.total_amount), 2) AS total_sales_amount,
  ROUND(AVG(st.total_amount), 2) AS average_transaction_value
FROM
  staff_records sr
  INNER JOIN branch_details bd ON sr.branch_code = bd.branch_code
  INNER JOIN sales_transactions st ON sr.staff_id = st.staff_id
WHERE
  sr.resignation_date IS NULL
  AND EXTRACT(
    YEAR
    FROM
      st.transaction_date
  ) = 2023
GROUP BY
  sr.staff_id,
  bd.branch_name,
  sr.performance_score
ORDER BY
  total_sales_amount DESC;
  