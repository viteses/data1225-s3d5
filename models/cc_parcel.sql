SELECT
    par.*
    ,EXTRACT(MONTH FROM date_purchase) AS month_purchase
    ,CASE
    WHEN date_cancelled IS NOT NULL THEN 'İptal Edildi'
    WHEN date_shipping IS NULL THEN 'Devam Ediyor'
    WHEN date_delivery IS NULL THEN 'Taşınıyor'
    WHEN date_delivery IS NOT NULL THEN 'Teslim Edildi'
    ELSE NULL
    END AS status
    ,DATE_DIFF(date_shipping, date_purchase, DAY) AS expedition_time
    ,DATE_DIFF(date_delivery, date_shipping, DAY) AS transport_time
    ,DATE_DIFF(date_delivery, date_purchase, DAY) AS delivery_time
    ,IF(date_delivery IS NULL,NULL,IF(DATE_DIFF(date_delivery, date_purchase,DAY)>5,1,0)) AS delay
    ,qty
    ,nb_products
FROM {{ref("stg_parcel")}} as par
LEFT JOIN {{ref("int_product")}} as pro USING (parcel_id)