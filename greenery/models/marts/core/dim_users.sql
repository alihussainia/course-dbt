{{
  config(
    materialized='table'
  )
}}

select 
  u.user_guid, 
  u.first_name, 
  u.last_name, 
  u.email, 
  u.phone_number, 
  u.created_at_utc, 
  u.updated_at_utc, 
  u.address_guid,
  o.orders_placed,
  o.distinct_products_bought,
  o.total_products_bought
from 
  {{ref('stg_postgres__users')}} u
  left join {{ref('int_user_orders')}} o using(user_guid)