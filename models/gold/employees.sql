with source_data as (

    select * from {{ ref('employees_stg') }}

)

select *
from source_data