 select customer_id,
         sum(order_amount)
from transactions
group by customer_id