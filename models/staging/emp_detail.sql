{{ config(
    materialized='table') 
    }}

with
emp_data as (
    select id,
           name, 
           sal,
           bonus,
           ({{amt_calc('sal','bonus')}}) as total_amount
     from 
    {{source('source_data','emp_details')}}
)
select * from emp_data
