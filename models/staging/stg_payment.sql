with payments as(
select orderid as order_id,
       status,
       amount/100 as dollars
       from RAW.STRIPE.PAYMENT
       )
select * from payments