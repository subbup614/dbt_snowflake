with payments as(
select orderid as order_id,
       status,
       {{amount_data('amount')}} as dollars
       from RAW.STRIPE.PAYMENT
       )
select * from payments