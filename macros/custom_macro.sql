{% macro concat_macro(country) %}
    concat({{ country }},  '_ssss' )
{% endmacro %}

{% macro percentage_macro(low_range,high_range) %}
    select c_birth_country from(select
        c_birth_country,
        count(c_customer_sk) as total_population,
        sum(
            case
                when (year(current_date) - c_birth_year) > {{ low_range }} and (year(current_date) - c_birth_year) < {{ high_range }}
                then 1
                else 0
            end
        ) as range_population
    from customer_temp group by c_birth_country) where (range_population/total_population)*100> 0.5 
    and c_birth_country in ('JAMAICA')
{% endmacro %}

{% macro cents_to_dollars(column_name, scale=2) %}
    ({{ column_name }} / 100)::numeric(16, {{ scale }})
{% endmacro %}
