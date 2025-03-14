{{ config(materialized='table') }}

with sales_agg as (
    SELECT 
        EXTRACT(YEAR FROM s.transaction_timestamp) AS transaction_year,
        EXTRACT(MONTH FROM s.transaction_timestamp) AS transaction_month,
        p.category,
        COUNT(DISTINCT s.user_id) AS unique_customers,
        SUM(s.revenue) AS total_revenue,
        SUM(s.cost) AS total_cost
    FROM {{ source('dev', 'sales_transactions') }} s
    LEFT JOIN {{ source('dev', 'product_catalog') }} p 
      ON s.product_id = p.product_id
    GROUP BY 1, 2, 3
),
marketing_agg as (
    SELECT 
        EXTRACT(YEAR FROM event_timestamp) AS event_year,
        EXTRACT(MONTH FROM event_timestamp) AS event_month,
        SUM(cost) AS total_marketing_cost,
        COUNT(event_id) AS total_marketing_events
    FROM {{ source('dev', 'marketing_events') }}
    GROUP BY 1, 2
)
select
    s.transaction_year,
    s.transaction_month,
    s.category,
    s.unique_customers,
    s.total_revenue,
    s.total_cost,
    m.total_marketing_cost,
    m.total_marketing_events,
    ROUND({{ safe_div('s.total_revenue', 's.total_cost') }}, 2)  AS revenue_to_cost_ratio
    
from sales_agg s
left join marketing_agg m
    on s.transaction_year = m.event_year
    and s.transaction_month = m.event_month
where s.total_revenue > 0
order by s.transaction_year, s.transaction_month, s.category
