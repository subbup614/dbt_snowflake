{% set a=10 %}

{{a}}

{% set a = {
    'name' : 'ksk',
    'age' :29
} %}

{{a['name']}}
{{a.name}}

{% set a =['a','b'] %}
{{a[0]}}

{% set temperation=40 %}
hello sj
{% if temperation >=40%}
hello jsjs jsjs
{%else%}
temperater is 40
{%endif%}

{% set y=['a','b'] %}
{% for x in y%}
  {{x}}
{% endfor%}