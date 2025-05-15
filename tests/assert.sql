select order_id,
sum(dollars) as amount
from {{ref("stg_payment")}}
group by 1
having not (amount)>=0