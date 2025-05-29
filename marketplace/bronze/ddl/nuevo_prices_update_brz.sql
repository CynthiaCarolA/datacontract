-- Data Contract: urn:datacontract:marketplace:nuevo_prices_update_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE marketplace.bronze.nuevo_prices_update_brz (
  itemId STRING COMMENT "The unique identifier for the item",
  listPrice STRING COMMENT "The list price of the item (retail price)",
  costPrice STRING COMMENT "The cost price of the item",
  markup STRING COMMENT "The markup percentage for the item",
  basePrice STRING COMMENT "The base price of the item",
  fixedPrices STRING COMMENT "List of fixed prices for specific trade policies or null",
  updateTs STRING COMMENT "The timestamp when the update happened (in UTC-5)",
  metadata STRUCT<
      
    > COMMENT "Metadata from kafka",
  document STRING COMMENT "JSON text from eventData",
  auditTime TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0.",
  p_auditDate DATE COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0."
)
CLUSTER BY AUTO
COMMENT "Schema for pricing updates events from VTEX"
;
ALTER TABLE marketplace.bronze.nuevo_prices_update_brz SET TAGS ('Domain'='marketplace', 'Schema'='bronze', 'TypeTable'='raw');
