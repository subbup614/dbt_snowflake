

{% snapshot scd_snap %}

{{config(
    target_schema ='my_snapshot',
    strategy= 'check',
    unique_key= 'ticket_id',
    check_cols=['ticket_status'],
    invalidate_hard_deletes=true
)}}
select * from {{ref('tickets')}}

{% endsnapshot %}
