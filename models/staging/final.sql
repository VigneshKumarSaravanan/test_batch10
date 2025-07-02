{{config(materialized='table',
        transient='false')}}

with customers as (
  select
  id as customer_id,
  first_name,
  last_name

    from {{source('source_data','raw_customers')}}

),
emp as (
    select * from {{ref('employees')}}
),
orders as (
    select
    id as order_id,
    user_id as customer_id,
    order_date,
from {{source('source_data','raw_order')}}

),

customer_orders as (

 select
customer_id,
min(order_date) as first_order_date,
max(order_date) as most_recent_order_date,
count(order_id) as number_of_orders
 from orders
group by 1

),

final as (

select
customers.customer_id,
customers.first_name,
customers.last_name,
emp.employee_id as emp_id,
customer_orders.first_order_date,
customer_orders.most_recent_order_date,
coalesce(customer_orders.number_of_orders, 0) as number_of_orders
from customers
left join customer_orders on customers.customer_id = customer_orders.customer_id
left join emp on customers.customer_id =emp.customer_id
)

select * from final
