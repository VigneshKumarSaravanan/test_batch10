{{ config(materialized='table',
         transient='false',
         pre_hook="truncate table {{this}}",
         post_hook="delete from  {{source('source_data','raw_order')}} where id in(select id from  {{source('source_data','raw_order')}} group by id having count(*)>1)")
}}

WITH tb1 as(
    select id,
    order_date,
    user_id,
    status
    from {{source('source_data','raw_order')}})
select * from tb1
