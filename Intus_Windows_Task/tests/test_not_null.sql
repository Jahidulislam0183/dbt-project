-- tests/test_not_null.sql
SELECT *
FROM {{ ref('mkt_sales_summary') }}
WHERE transaction_year IS NULL 
   OR transaction_month IS NULL 
   OR category IS NULL
