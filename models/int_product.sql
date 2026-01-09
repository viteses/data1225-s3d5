WITH nb_products_parcel AS (
  SELECT
    parcel_id
    ,SUM(quantity) AS qty
    ,COUNT(DISTINCT model_name) AS nb_products
  FROM {{ref('stg_product')}}
  GROUP BY parcel_id
)


select * from nb_products_parcel