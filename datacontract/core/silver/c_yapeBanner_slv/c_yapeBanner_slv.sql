-- Databricks notebook source
-- COMMAND ----------
-- Data Contract: urn:core.silver.c_yapeBanner_slv-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE core.silver.c_yapeBanner_slv (
  executionTs TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null
)
CLUSTER BY (yapeBannerId, recordUpdateTs, hashCd)
COMMENT "Tabla de cambios que consolida la configuración de banners publicitarios gestionados desde el Backoffice. Esta configuración es utilizada tanto para la visualización personalizada en el aplicativo como para alimentar modelos de recomendación (ML). La tabla es estructurada y normalizada a partir del origen transaccional en Postgres."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE core.silver.c_yapeBanner_slv SET TAGS ('Domain'='core', 'Layer'='silver', 'TypeTable'='changes');
