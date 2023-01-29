{{
  config(
    materialized='table'
  )
}}

with items_per_order as (
    select 
        order_guid,
        count(order_item_id) as number_of_items_ordered
    from 
        {{ref('stg_postgres__order_items')}}
    group by
      order_guid
)
select 
    o.order_guid, 
    o.user_guid, 
    o.promo_description, 
    o.address_guid, 
    o.created_at_utc, 
    o.order_cost, 
    o.shipping_cost, 
    o.order_total, 
    o.tracking_guid, 
    o.shipping_service, 
    o.estimated_delivery_at_utc, 
    o.delivered_at_utc, 
    o.status,
    i.number_of_items_ordered,
    datediff('hour',o.created_at_utc,o.delivered_at_utc) as hours_till_delivery
from 
    {{ref('stg_postgres__orders')}} o
    left join items_per_order i using(order_guid)