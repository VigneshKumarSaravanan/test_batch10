  select id as order_id,
    count(*) as duplicate
    from {{source('source_data','raw_order')}}
    group by id
    having count(*)>1