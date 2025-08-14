-- Databricks notebook source
-- COMMAND ----------

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.after_cursor` (STRING) debes recrear la columna o tabla con el nuevo esquema.

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.before_cursor` (STRING) debes recrear la columna o tabla con el nuevo esquema.

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.has_more` (BOOLEAN) debes recrear la columna o tabla con el nuevo esquema.

-- La columna/subcampo `metadata.partition` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `metadata.offset` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `metadata.timestampType` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `metadata.timestamp` ya no existe en el contrato. No se elimina por políticas de retención.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `__deleted` COMMENT "Campo que se usa como convención de integración con debezium.
False: El registro no ha sido eliminado (es un registro activo).
True: El registro ha sido eliminado (es un \"tombstone\").";
