{% macro to_snake_case(value) %}
    {{ value | replace(' ', '_') | lower }}
{% endmacro %}