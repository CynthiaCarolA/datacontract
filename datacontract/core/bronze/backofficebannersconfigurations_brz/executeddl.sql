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

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `metadata` COMMENT "Metadata from api";

-- Se detectó reordenamiento de columna según contrato (primera posición).
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `id` FIRST;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `banner_type_position` AFTER `id`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `blacklist` AFTER `banner_type_position`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `confirmation_name` AFTER `blacklist`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `organization_name` AFTER `confirmation_name`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `deeplink` AFTER `organization_name`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `phone_donation` AFTER `deeplink`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `start_date` AFTER `phone_donation`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `end_date` AFTER `start_date`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `owner` AFTER `end_date`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `segment` AFTER `owner`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `petitioner` AFTER `segment`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `position` AFTER `petitioner`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `type` AFTER `position`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `status` AFTER `type`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `title` AFTER `status`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `url_image` AFTER `title`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `product` AFTER `url_image`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `view_scope` AFTER `product`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `description` AFTER `view_scope`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `__deleted` AFTER `description`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `created_at` AFTER `__deleted`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `updated_at` AFTER `created_at`;
