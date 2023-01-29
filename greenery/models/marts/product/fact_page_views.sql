{{
  config(
    materialized='table'
  )
}}

select 
    e.event_guid,
    e.session_guid,
    e.user_guid,
    e.page_url,
    e.created_at_utc,
    e.product_guid,
    p.unit_price as current_price_product,
    p.product_name as product_name,
    min(created_at_utc) over(partition by user_guid) as user_first_page_view_datetime,
    count(event_guid) over(partition by user_guid) as user_page_view_count,
    count(event_guid) over(partition by session_guid) as session_page_view_count    
from 
    {{ ref("stg_postgres__events") }} e
    left join {{ ref("stg_postgres__products") }} p using(product_guid)
where 
    e.event_type ='page_view'