{% macro audit_operate(column_value) %}
 insert into raw.jaffle_shop.dbt_audits (audit_type) values({{column_value}})
{% endmacro%}