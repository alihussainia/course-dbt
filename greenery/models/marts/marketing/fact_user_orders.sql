{{
  config(
    materialized='table'
  )
}}

with order_stats as (
    select
        user_guid,
        sum(order_total) as total_spend,
        max(order_total) as highest_order
    from 
        {{ ref("stg_postgres__orders") }}
    group by
        user_guid
)

select
    u.user_guid,
    o.orders_placed,
    o.distinct_products_bought,
    o.total_products_bought,
    s.total_spend,
    s.highest_order
from 
    {{ ref("stg_postgres__users") }} u
    left join {{ ref("int_user_orders") }} o using(user_guid)
    left join order_stats s using (user_guid)