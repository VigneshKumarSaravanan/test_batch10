
{{ config(materialized='table') }}

WITH tb1 as(
    select
    id ,
    first_name,
    last_name
    from {{source('source_data','raw_customers')}})
select * from tb1
