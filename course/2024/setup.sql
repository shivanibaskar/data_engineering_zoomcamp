-- creating an external table
CREATE OR REPLACE EXTERNAL TABLE
  `absolute-axis-409317.green_taxi.2022_data` OPTIONS ( format ="PARQUET",
    uris = ['gs://absolute-axis-409317-terra-bucket/2022_greentrip/green_tripdata_2022*'] );


--   Creating a biq query table from the previous table
CREATE TABLE
  green_taxi.trips_2022 AS (
  SELECT
    *
  FROM
    green_taxi.2022_data );