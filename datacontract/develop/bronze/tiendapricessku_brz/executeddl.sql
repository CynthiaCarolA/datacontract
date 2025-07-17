-- Databricks notebook source
-- COMMAND ----------

-- Tag actualizado/añadido por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.tiendapricessku_brz SET TAGS ('Domain'='develop');

-- Tag eliminado por no estar en contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.tiendapricessku_brz UNSET TAGS ('App');
