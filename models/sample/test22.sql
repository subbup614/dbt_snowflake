select customer_id,
       sum(order_amount) as total_revenue
from DBT_JOB.PUBLIC.TRANSACTIONS
group by customer_id