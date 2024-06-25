{{ config(materialized='table', transient=false)
 }}

with source_data as (

    select * from {{ source('hrms_bronze_raw', 'departments') }}

)

select *
from source_data