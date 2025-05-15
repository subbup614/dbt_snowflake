{{config(materialized='table')}}

with orders as(
select * from {{ref('stg_orders')}}
),

payments as(
select * from {{ref('stg_payment')}}
       ),
orders_payments as (
  select order_id,
  sum(case when status='success' then dollars end) as total_amount
  from payments
  group by 1
),
final as
(
  select orders.order_id,
  orders.customer_id,
  orders.order_date,
  orders_payments.total_amount
  from orders left join orders_payments using (order_id)
)
select * from final