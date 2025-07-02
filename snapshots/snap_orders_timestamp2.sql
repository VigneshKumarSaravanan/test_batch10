
{% snapshot  snap_orders_timestamp2 %}

{{
    config(
      target_scheam='snapshot_schema',
      strategy='check',
      unique_key='id',
      check_cols=['user_id','status'],
      invalidate_hard_deletes='true'
    )
}}
select * 
from {{source('source_data','raw_order')}}

{% endsnapshot %}
