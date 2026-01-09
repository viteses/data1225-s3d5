with

source as (

    select * from {{ source("raw", "product")}}

),

renamed as (

    SELECT
        ParCEL_id as parcel_id
        , Model_mAME as model_name
        , QUANTITY as quantity
    FROM source

)

SELECT * FROM renamed
