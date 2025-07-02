{{ config(materialized="incremental",
          unique_key='id',
          incremental_strategy="delete+insert")
}}

WITH tb1 as(
    select id,
    order_date,
    user_id

    from {{source('source_data','raw_order')}})
select * from tb1
