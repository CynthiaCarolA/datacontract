-- Databricks notebook source
-- COMMAND ----------

-- Se agrega columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ADD COLUMN `owner` STRING COMMENT "Owner provider configurado dentro del backoffice. Sirve para identificar a que usuarios se mostrará el banner de acuerdo al owner provider. Este valor solo llegará cuando el banner es de tipo MASIVO.
Valores que pueden exisitir: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA" AFTER `end_date`;

-- Se agrega columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ADD COLUMN `petitioner` STRING COMMENT "Valor que indica el producto al que hace referencia la publicación. Se configura dentro de backoffice desde una lista deplegable o desde un campo de texto." AFTER `segment`;

-- Se agrega columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ADD COLUMN `position` STRING COMMENT "Indica la posición relativa que tendrá el banner dentro del carrusel de banners o dentro de un listado de banners en los flujos que lo soporten." AFTER `petitioner`;

-- Se agrega columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ADD COLUMN `status` STRING COMMENT "Indica el estado del registro de banner. 
Los valores que pueden llegar son estos:
BORRADOR: El registro aun se encuentra en borrador y puede ser modificado.
VALIDACION: El registro se encuentra en validación por un owner.
APROBADO: Indica que ya se encuentra activado
ELIMINADO: El registro se ha eliminado desde backoffice." AFTER `type`;

-- Se agrega columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ADD COLUMN `description` STRING COMMENT "Es la descripción textual del banner creado. Se emplea para las funciones de accesibilidad en los dispositivos." AFTER `view_scope`;

-- Se agrega columna según contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ADD COLUMN `__deleted` STRING COMMENT "Campo que se usa como convención de integración con debezium.
False: El registro no ha sido eliminado (es un registro activo).
True: El registro ha sido eliminado (es un \"tombstone\")." AFTER `description`;

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.sequenceNumber` (BIGINT) debes recrear la columna o tabla con el nuevo esquema.

-- No es posible agregar subcampos a STRUCT o ARRAY<STRUCT> con ALTER en Unity Catalog.
-- Para agregar `metadata.enqueuedTime` (TIMESTAMP) debes recrear la columna o tabla con el nuevo esquema.

-- La columna/subcampo `Owner` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `Petitioner` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `Position` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `Status` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `Description` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `__delete` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `metadata.timestampType` ya no existe en el contrato. No se elimina por políticas de retención.
-- La columna/subcampo `metadata.timestamp` ya no existe en el contrato. No se elimina por políticas de retención.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `banner_type_position` COMMENT "Indica el tipo de configuración de segmentación que tiene el Banner creado. Los valores indicarán si es de tipo Masivo, Segmentado o NBP.
Valores esperados:
MASIVO: Envios de acuerdo al owner provider del usuario.
SEGMENTADO: Segmentación personalida por bases.
NBP: Personalización a nivel de usuario.
DEFAULT: Banners por defaull en caso un usuario no tenga banners pendientes.";

-- El tipo de dato de `blacklist` cambió de ARRAY<STRING> a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `segment` COMMENT "Corresponde a un array de valores. Este campo indica el listado de segmentos a los cuales se les disponibilizará el banner.
Este valor solo vendrá cuando el banner sea de tipo SEGMENTADO";

-- El tipo de dato de `segment` cambió de ARRAY<STRING> a STRING. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `type` COMMENT "Indica el tipo de banner que es. Puede ser de tipo funcional o de tipo donación.
Valores esperados:
NAVIGATION
DONATION";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `metadata` COMMENT "Metadata from eventhub";

-- El tipo de dato de `metadata.partition` cambió de STRING a INT. No se puede hacer ALTER automático. Revisar manualmente.
-- No es posible actualizar el comentario de subcampos (ni de STRUCT ni de ARRAY<STRUCT>) vía ALTER en Unity Catalog: metadata.offset
-- Si necesitas actualizar el comentario de este subcampo, debes recrear la columna o la tabla.

-- El tipo de dato de `metadata.offset` cambió de STRING a BIGINT. No se puede hacer ALTER automático. Revisar manualmente.
-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `document` COMMENT "JSON text from eventData";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `auditTime` COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0.";

-- Actualización de comentario detectado por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz ALTER COLUMN `p_auditDate` COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0.";

-- Tag actualizado/añadido por contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz SET TAGS ('Domain'='develop');

-- Tag eliminado por no estar en contrato.
ALTER TABLE ${env:ENV_CATALOG_NAME_DEVELOP}.bronze.backofficebannersconfigurations_brz UNSET TAGS ('app');
