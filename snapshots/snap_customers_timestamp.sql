
{% snapshot  snap_customers_timestamp %}

{{
    config(
      strategy='timestamp',
      unique_key='id',
      updated_at='updated_at'
    )
}}
select * 
from {{source('source_data','customers_snap')}}

{% endsnapshot %}
