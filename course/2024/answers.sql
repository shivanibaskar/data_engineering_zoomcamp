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



-- Question 1. What is count of records for the 2022 Green Taxi Data?
SELECT
  COUNT(*)
FROM
  `absolute-axis-409317.green_taxi.2022_data`



  -- Write a query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
  -- What is the estimated amount of data that will be read when this query is executed on the External Table and the Table?
  -- #2022_data -> external table
  -- #trips_2022 ->biqquery table
SELECT
  COUNT(DISTINCT PULocationID)
FROM
  `absolute-axis-409317.green_taxi.2022_data`
SELECT
  COUNT( DISTINCT PULocationID)
FROM
  `absolute-axis-409317.green_taxi.trips_2022`



  -- How many records have a fare_amount of 0?
SELECT
  COUNT(*)
FROM
  `absolute-axis-409317.green_taxi.trips_2022`
WHERE
  fare_amount = 0





  -- What is the best strategy to make an optimized table in Big Query if your query will always order the results by PUlocationID and filter based on lpep_pickup_datetime?
CREATE TABLE
  `absolute-axis-409317.green_taxi.h3_q4`
PARTITION BY
  TIMESTAMP_TRUNC(lpep_pickup_datetime, DAY)
CLUSTER BY
  PULocationID AS (
  SELECT
    *
  FROM
    `absolute-axis-409317.green_taxi.trips_2022` );



    
  -- Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime 06/01/2022 and 06/30/2022 (inclusive)
  -- Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values?
SELECT
  DISTINCT PULocationID
FROM
  `absolute-axis-409317.green_taxi.trips_2022`
WHERE
  lpep_pickup_datetime >= '2022-06-01'
  AND lpep_pickup_datetime <= '2022-06-30'
SELECT
  DISTINCT PULocationID
FROM
  `absolute-axis-409317.green_taxi.h3_q4`
WHERE
  lpep_pickup_datetime >= '2022-06-01'
  AND lpep_pickup_datetime <= '2022-06-30'
