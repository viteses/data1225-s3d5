with

source as (

    select * from {{ source("raw", "parcel")}}

),

renamed as (

    SELECT
        Parcel_id as parcel_id
        , Parcel_tracking as parcel_tracking
        , Transporter as transporter
        , Priority as priority
        , PARSE_DATE("%B %e, %Y", Date_purCHase) as date_purchase
        , PARSE_DATE("%B %e, %Y", Date_sHIpping) as date_shipping
        , PARSE_DATE("%B %e, %Y", DATE_delivery) as date_delivery
        , PARSE_DATE("%B %e, %Y", DaTeCANcelled) as date_cancelled
    FROM source

)

SELECT * FROM renamed

