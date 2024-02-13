{% macro concat_macro(country) %}
    concat({{ country }},  '_ssss' )
{% endmacro %}

{% macro trim_macro(column_name) %}
    trim({{ column_name }})
{% endmacro %}

{% macro cents_to_dollars(column_name, scale=2) %}
    ({{ column_name }} / 100)::numeric(16, {{ scale }})
{% endmacro %}
