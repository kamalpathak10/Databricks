-- Databricks notebook source
CREATE or REFRESH STREAMING TABLE st_sales
AS
select * from STREAM(samples.bakehouse.sales_customers)

-- COMMAND ----------

CREATE OR REPLACE MATERIALIZED VIEW agg_sales
AS
SELECT
  count(customerID) as TotalCustomer,
  state
  from LIVE.st_sales
  group by state
