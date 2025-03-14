-- tests/test_revenue_to_cost_ratio_not_null.sql
SELECT *
FROM {{ ref('mkt_sales_summary') }}
WHERE revenue_to_cost_ratio IS NULL
