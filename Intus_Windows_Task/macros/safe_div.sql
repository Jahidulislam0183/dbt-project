{% macro safe_div(numerator, denominator) %}
    ROUND(
      CASE 
          WHEN ({{ denominator }})::numeric = 0 THEN 0 
          ELSE ({{ numerator }})::numeric / ({{ denominator }})::numeric
      END,
      2
    )
{% endmacro %}

