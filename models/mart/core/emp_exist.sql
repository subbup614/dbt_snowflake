
with customers as
(
    select * from {{ref('stg_customers')}}
),
orders as
(
    select * from {{ref('stg_orders')}}
),
customer_order as (
    select customer_id,
    min(order_date) as first_order_date,
    max(order_date) as recent_order_date,
    count(order_id) as number_of_orders
from orders
group by 1
),
employee as(
   select * from {{ref('employee')}}
),

final as (
    select customers.customer_id as customer_id,
           customers.first_name as first_name,
           customers.last_name as last_name,
           employee.employee_id is not null as employ,
           customer_order.first_order_date as first_order_date,
           customer_order.recent_order_date as recent_order_date,
           coalesce(customer_order.number_of_orders,0) as number_of_orders
    from customers left join customer_order using(customer_id)
    left join employee using(customer_id)
)
select * from final