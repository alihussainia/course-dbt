{{
    config(
        materialized = 'view'
    )
}}

SELECT  
    address_id as address_guid
    ,address 
    ,zipcode
    ,state
    ,country    
FROM    
    {{ source('postgres', 'addresses')}}