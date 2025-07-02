
{% snapshot  snap_orders_timestamp %}

{{
    config(
      target_scheam='snapshot_schema',
      strategy='check',
      unique_key='id',
      check_cols=['user_id','status']
    )
}}
select * 
from {{source('source_data','raw_order')}}

{% endsnapshot %}
