<h1>Week#1 Questions & Answers</h1>

Note: I switched the database to `DEV_DB` and schema to `DBT_MALIRASHID1994GMAILCOM`.

<b>Q1: How many users do we have?</b>

<b>Ans: 130</b>

Query:
```sql
WITH users AS (   
    SELECT DISTINCT USER_GUID as used_ids 
    FROM stg_postgres__users
)
SELECT  COUNT(used_ids) 
FROM    users
```
