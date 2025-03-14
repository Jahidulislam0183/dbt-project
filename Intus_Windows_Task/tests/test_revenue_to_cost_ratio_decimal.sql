-- tests/test_revenue_to_cost_ratio_decimal.sql
SELECT *
FROM {{ ref('mkt_sales_summary') }}
WHERE revenue_to_cost_ratio - ROUND(revenue_to_cost_ratio, 2) != 0
