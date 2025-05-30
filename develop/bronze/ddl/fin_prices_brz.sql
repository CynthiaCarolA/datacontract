-- Data Contract: urn:datacontract:develop:fin_prices_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE develop.bronze.fin_prices_brz (
  itemId STRING COMMENT "The unique identifier for the item",
  listPrice STRING COMMENT "The list price of the item (retail price)",
  costPrice STRING COMMENT "The cost price of the item",
  markup STRING COMMENT "The markup percentage for the item",
  basePrice STRING COMMENT "The base price of the item",
  fixedPrices STRING COMMENT "List of fixed prices for specific trade policies or null",
  updateTs STRING COMMENT "The timestamp when the update happened (in UTC-5)",
  metadata STRUCT<
      partition INT COMMENT "Indica la división lógica y física de un tópico",
      offset BIGINT COMMENT "Indica la posición secuencial de un mensaje dentro de una partición",
      timestampType STRING COMMENT "Flag que indica el tipo de fecha; '0' fecha de creación del evento, '1' fecha en que se encola el evento",
      timestamp TIMESTAMP COMMENT "Fecha en que se encola el evento cuando timestampType es '1'. Si timestampType es '0', corresponde a la fecha de creación del evento."
    > COMMENT "Metadata from kafka",
  document STRING COMMENT "JSON text from eventData",
  auditTime TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null,
  p_auditDate DATE COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0." not null
)
CLUSTER BY (auditTime, p_auditDate)
COMMENT "Schema for pricing updates events from VTEX"
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE develop.bronze.fin_prices_brz SET TAGS ('Domain'='develop', 'Schema'='bronze', 'TypeTable'='raw');
