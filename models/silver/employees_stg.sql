{{ config(
    materialized='incremental',
    unique_key='employee_id') }}

with source_data as (

    select * from {{ source('hrms_bronze_raw', 'employees') }}
    {% if is_incremental() %}
        where etl_record_created_at >= (select max(etl_record_created_at) from {{ this }})
    {% endif %}
)

select *
from source_data