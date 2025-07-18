-- Databricks notebook source
-- COMMAND ----------

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.sequenceNumber` (BIGINT) debes recrear la columna o tabla con el nuevo esquema.

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.enqueuedTime` (TIMESTAMP) debes recrear la columna o tabla con el nuevo esquema.

-- La columna/subcampo `metadata.timestampType` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `metadata.timestamp` ya no existe en el contrato. No se elimina por políticas de retención.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `banner_type_position` COMMENT "Es el tipo indica la de configuracon de segmentacion que tiene el Bannercreado. Los valores indicaran que tipo Masivo, Segmentado o NBP.
Valores esperados:
MASIVO: Envios de acuerdo al owner provider del usuario.
SEGMENTADO: Segmentacion personalida por bases.
NBP: personalizacion a nivel usuario.
DEFAULT: Banners por defaull en caso un usuario no tenga banners pendientes.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `blacklist` COMMENT "It corresponds to an array of values. This field indicates the list of segments that will act as a blacklist within the API Connect Hub logic. If a segment is included in this list, users belonging to that segment will not see the configured banner.";

-- El tipo de dato de `blacklist` cambió de ARRAY<STRING> a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `confirmation_name` COMMENT "It is the confirmation message name displayed in the donation modal. This field will only have a value if the banner is of the donation type.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `organization_name` COMMENT "Es el naming de la ONG u Organización de la cual se está usando para crear el banner de tipo donación. Este field solo tendrá valor si el banner es de tipo donacion";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `owner` COMMENT "Owner provider configurado dentro del backoffice. Sirve para identificar a que usuarios se mostrará el banner de acuerdo al owner provider. Este valor solo llegará cuando el banner es de tipo MASIVO.
Valores que pueden exisitir: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA";

-- El tipo de dato de `owner` cambió de ARRAY<STRING> a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `segment` COMMENT "Corresponde a un array de valores. Este campo indica el listado de segmentos a los cuales se les disponibilizará el banner.
Este valor solo vendrá cuando el banner sea de tipo SEGMENTADO";

-- El tipo de dato de `segment` cambió de ARRAY<STRING> a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- El tipo de dato de `position` cambió de INT a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `type` COMMENT "Indica el tipo de banner que es. Puede ser de tipo funcional o de tipo donación.
Valores esperados:
NAVIGATION
DONATION";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `status` COMMENT "Indica el estado del registro de banner. 
Los valores que pueden llegar son estos:
BORRADOR: El registro aun se encuentra en borrador y puede ser modificado.
VALIDACION: El registro se encuentra en validación por un owner.
APROBADO: Indica que ya se encuentra activado
ELIMINADO: El registro se ha eliminado desde backoffice.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `__deleted` COMMENT "Campo que se usa como convención de integración con debezium.
False: El registro no ha sido eliminado (es un registro activo).
True: El registro ha sido eliminado (es un \"tombstone\").";

-- El tipo de dato de `__deleted` cambió de BOOLEAN a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `metadata` COMMENT "Metadata from eventhub";

-- El tipo de dato de `metadata.partition` cambió de STRING a INT. No se puede hacer ALTER automático. Revisar manualmente.
-- No es posible actualizar el comentario de subcampos (ni de STRUCT ni de ARRAY<STRUCT>) vía ALTER en Unity Catalog: metadata.offset
-- Si necesitas actualizar el comentario de este subcampo, debes recrear la columna o la tabla.

-- El tipo de dato de `metadata.offset` cambió de STRING a BIGINT. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `document` COMMENT "JSON text from eventData";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `auditTime` COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `p_auditDate` COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0.";

-- Tag eliminado por no estar en contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE_DESA}.bronze.backofficebannersconfigurations_brz UNSET TAGS ('app');
