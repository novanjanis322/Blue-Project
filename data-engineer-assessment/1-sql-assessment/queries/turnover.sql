WITH
  inventory_summary AS (
    SELECT
      br.branch_name,
      SUM(
        CASE
          WHEN im.transaction_type = 'IN' THEN im.quantity
          ELSE 0
        END
      ) AS total_incoming_stock,
      SUM(
        CASE
          WHEN im.transaction_type = 'OUT' THEN im.quantity
          ELSE 0
        END
      ) AS total_outgoing_stock,
      SUM(
        CASE
          WHEN im.transaction_type = 'EXP' THEN im.quantity
          ELSE 0
        END
      ) AS number_of_expired_items,
      SUM(
        CASE
          WHEN im.transaction_type = 'ADJ' THEN im.quantity
          ELSE 0
        END
      ) AS total_adjustments,
      SUM(
        CASE
          WHEN im.transaction_type = 'RTN' THEN im.quantity
          ELSE 0
        END
      ) AS total_returns
    FROM
      branch_details br
      JOIN inventory_movements im ON br.branch_code = im.branch_code
    WHERE
      im.transaction_date >= (
        SELECT
          MAX(transaction_date)
        FROM
          inventory_movements
      ) - INTERVAL '3 months'
    GROUP BY
      br.branch_name
  ),
  current_stock_calculation AS (
    SELECT
      branch_name,
      total_incoming_stock,
      total_outgoing_stock,
      number_of_expired_items,
      total_incoming_stock + total_returns - total_adjustments - total_outgoing_stock - number_of_expired_items AS current_stock_level
    FROM
      inventory_summary
  )
SELECT
  branch_name,
  total_incoming_stock,
  total_outgoing_stock,
  current_stock_level,
  number_of_expired_items,
  CASE
    WHEN (total_incoming_stock + current_stock_level) > 0 THEN ROUND(
      (total_outgoing_stock + number_of_expired_items)::NUMERIC / (
        (total_incoming_stock + current_stock_level) / 2.0
      )::NUMERIC,
      2
    )
    ELSE 0
  END AS stock_turnover_rate
FROM
  current_stock_calculation
ORDER BY
  stock_turnover_rate DESC;