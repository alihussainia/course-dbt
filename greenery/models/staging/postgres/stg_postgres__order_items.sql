{{
    config(
        materialized = 'table'
    )
}}

SELECT 
    order_id || '-' || product_id as order_item_id
    ,order_id as order_guid
    ,product_id as product_guid
    ,quantity
FROM
    {{ source('postgres','order_items') }}