{{config(materialized='table')}}

with customers as 
( 
    select * from {{ref('stg_customers')}}
),

orders as
(
  select * from {{ref('stg_orders')}}
),

customer_orders as(
select customer_id,
       min(order_date) as first_order,
       max(order_date) as recent_order,
       count(order_id) as number_of_orders
       from orders
       group by 1),
final as (
select customers.customer_id,
       customers.first_name,
       customers.last_name,
       customer_orders.first_order,
       customer_orders.recent_order,
       COALESCE(customer_orders.number_of_orders,0) as number_of_orders
from customers 
        left join customer_orders using(customer_id)
)
select * from final