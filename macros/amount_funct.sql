{%- macro amount_data(column_name,decimals=2) -%}
    {{column_name}}/100
{%- endmacro -%}