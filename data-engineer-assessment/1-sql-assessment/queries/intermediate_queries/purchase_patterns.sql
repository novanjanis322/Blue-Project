SELECT
  ph1.product_name || ' (' || ph1.category_l1 || ')' AS product_1,
  ph2.product_name || ' (' || ph2.category_l1 || ')' AS product_2,
  COUNT(*) AS co_occurrence_frequency
FROM
  sales_line_items sli1
  INNER JOIN sales_line_items sli2 ON sli1.transaction_id = sli2.transaction_id
  AND sli1.product_code < sli2.product_code
  INNER JOIN product_hierarchy ph1 ON sli1.product_code = ph1.product_code
  INNER JOIN product_hierarchy ph2 ON sli2.product_code = ph2.product_code
GROUP BY
  ph1.product_name,
  ph1.category_l1,
  ph2.product_name,
  ph2.category_l1
HAVING
  COUNT(*) >= 2
ORDER BY
  co_occurrence_frequency DESC
LIMIT
  10;