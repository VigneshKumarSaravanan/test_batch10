{{ config(materialized="incremental",
          transient='false',
          incremental_strategy="append")
}}

WITH tb1 as(
    select id,
    order_date,
    user_id

    from {{source('source_data','raw_order')}})
select * from tb1
