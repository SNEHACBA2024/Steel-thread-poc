{{ config(materialized="view", schema="DBT_SCHEMA") }}

select count(*), a.city
from {{ ref('sql_1') }} as a


inner join {{ ref("sql_2") }} as b on a.city = b.country_region
group by a.city limit 5
