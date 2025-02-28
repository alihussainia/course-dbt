{{
    config(
        materialized = 'table'
    )
}}

SELECT  
    event_id as event_guid
    ,session_id as session_guid
    ,user_id as user_guid
    ,page_url
    ,created_at::timestampntz as created_at_utc
    ,event_type
    ,order_id as order_guid
    ,product_id as product_guid
FROM
    {{ source('postgres', 'events')}}