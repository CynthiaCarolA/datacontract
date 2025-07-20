-- Databricks notebook source
-- COMMAND ----------

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `owner` COMMENT "Owner provider configurado dentro del backoffice. Sirve para identificar a que usuarios se mostrará el banner de acuerdo al owner provider. Este valor solo llegará cuando el banner es de tipo MASIVO.
Valores que pueden exisitir: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `__deleted` COMMENT "Campo que se usa como convención de integración con debezium.
False: El registro no ha sido eliminado (es un registro activo).
True: El registro ha sido eliminado (es un \"tombstone\").";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `blacklist` COMMENT "It corresponds to an array of values. This field indicates the list of segments that will act as a blacklist within the API Connect Hub logic. If a segment is included in this list, users belonging to that segment will not see the configured banner.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `organization_name` COMMENT "Es el naming de la ONG u Organización de la cual se está usando para crear el banner de tipo donación. Este field solo tendrá valor si el banner es de tipo donacion";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `type` COMMENT "Indica el tipo de banner que es. Puede ser de tipo funcional o de tipo donación.
Valores esperados:
NAVIGATION
DONATION";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `confirmation_name` COMMENT "It is the confirmation message name displayed in the donation modal. This field will only have a value if the banner is of the donation type.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `banner_type_position` COMMENT "Es el tipo indica la de configuracon de segmentacion que tiene el Bannercreado. Los valores indicaran que tipo Masivo, Segmentado o NBP.
Valores esperados:
MASIVO: Envios de acuerdo al owner provider del usuario.
SEGMENTADO: Segmentacion personalida por bases.
NBP: personalizacion a nivel usuario.
DEFAULT: Banners por defaull en caso un usuario no tenga banners pendientes.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `segment` COMMENT "Corresponde a un array de valores. Este campo indica el listado de segmentos a los cuales se les disponibilizará el banner.
Este valor solo vendrá cuando el banner sea de tipo SEGMENTADO";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `status` COMMENT "Indica el estado del registro de banner. 
Los valores que pueden llegar son estos:
BORRADOR: El registro aun se encuentra en borrador y puede ser modificado.
VALIDACION: El registro se encuentra en validación por un owner.
APROBADO: Indica que ya se encuentra activado
ELIMINADO: El registro se ha eliminado desde backoffice.";

-- No es posible actualizar el comentario de subcampos (ni de STRUCT ni de ARRAY<STRUCT>) vía ALTER en Unity Catalog: metadata.timestampType
-- Si necesitas actualizar el comentario de este subcampo, debes recrear la columna o la tabla.

-- No es posible actualizar el comentario de subcampos (ni de STRUCT ni de ARRAY<STRUCT>) vía ALTER en Unity Catalog: metadata.timestamp
-- Si necesitas actualizar el comentario de este subcampo, debes recrear la columna o la tabla.

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `document` COMMENT "JSON text from eventData";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `auditTime` COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `p_auditDate` COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0.";

-- Se detectó reordenamiento de columna según contrato (primera posición).
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `end_date` FIRST;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `owner` AFTER `end_date`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `product` AFTER `owner`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `__deleted` AFTER `product`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `deeplink` AFTER `__deleted`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `blacklist` AFTER `deeplink`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `description` AFTER `blacklist`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `created_at` AFTER `description`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `organization_name` AFTER `created_at`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `title` AFTER `organization_name`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `type` AFTER `title`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `confirmation_name` AFTER `type`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `banner_type_position` AFTER `confirmation_name`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `petitioner` AFTER `banner_type_position`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `url_image` AFTER `petitioner`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `updated_at` AFTER `url_image`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `segment` AFTER `updated_at`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `id` AFTER `segment`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `phone_donation` AFTER `id`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `position` AFTER `phone_donation`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `view_scope` AFTER `position`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `start_date` AFTER `view_scope`;

-- Se detectó reordenamiento de columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `status` AFTER `start_date`;

-- Tag eliminado por no estar en contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz UNSET TAGS ('app');
