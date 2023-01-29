{{
  config(
    materialized='table'
  )
}}

  select 
    o.user_guid,
    count(distinct i.order_guid) as orders_placed,
    count(distinct i.product_guid) as distinct_products_bought,
    count(distinct i.order_item_id) as total_products_bought
  from 
    {{ ref('stg_postgres__order_items') }} i
    join {{ ref('stg_postgres__orders') }} o using(order_guid)
  group by 
    user_guid