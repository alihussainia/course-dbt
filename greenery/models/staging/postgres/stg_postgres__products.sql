{{
    config(
        materialized = 'table'
    )
}}

SELECT
    product_id as product_guid
    ,name as product_name
    ,price as unit_price
    ,inventory as stock
FROM
     {{ source('postgres','products') }}