{{
    config(
        materialized = 'view'
    )
}}

SELECT  
    order_id as order_guid
    ,product_id as product_guid
    ,quantity
FROM
    {{ source('postgres','order_items') }}