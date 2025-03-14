-- tests/test_unique_combination.sql
SELECT transaction_year, transaction_month, category, COUNT(*)
FROM {{ ref('mkt_sales_summary') }}
GROUP BY transaction_year, transaction_month, category
HAVING COUNT(*) > 1
