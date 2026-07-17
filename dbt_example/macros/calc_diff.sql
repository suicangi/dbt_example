{% macro calc_diff(value1, value2) %}
    DATEDIFF(DAY, {{ value1 }}, {{ value2 }})
{% endmacro %}