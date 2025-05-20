with orders as 
(
    select * from {{ref('orders')}}
),
order_dat as 
(
    select order_date,
    count(*) as number_of_orders
    from orders
    group by 1
),
final as (
    select 
   order_date,
   number_of_orders,
    lag(number_of_orders) over(order by number_of_orders) as prev_order
    from order_dat
)
select * from final
