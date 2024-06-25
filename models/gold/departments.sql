{{ config(materialized='table') }}

with source_data as (

    select * from {{ ref('departments_stg') }}

)

select *
from source_data