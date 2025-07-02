{{ config(materialized="incremental",
          incremental_strategy="insert+overwrite")
}}

WITH tb1 as(
    select id,
    order_date,
    user_id

    from {{source('source_data','test')}})
select * from tb1 limit 5
