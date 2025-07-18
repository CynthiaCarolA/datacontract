-- Databricks notebook source
-- COMMAND ----------

-- Data Contract: urn:${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz (
  end_date STRING COMMENT "Fecha de finalización de la vigencia del banner, configurada en el backoffice. La fecha está en formato UTC-0. Formato: dd/MM/yyyy HH:mm:ssZ.",
  owner STRING COMMENT "Owner provider configurado en el backoffice, utilizado para identificar a los usuarios a quienes se mostrará el banner según el owner provider. Este valor solo se presenta cuando el banner es de tipo MASIVO. Valores posibles: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA.",
  product STRING COMMENT "Producto asociado al home banner, empleado para los clusters de NBP (Next Best Product) en el futuro.",
  __deleted STRING COMMENT "Campo utilizado como convención de integración con Debezium. False: El registro no ha sido eliminado (registro activo). True: El registro ha sido eliminado (tombstone).",
  deeplink STRING COMMENT "Deeplink utilizado en el banner para redireccionar a los usuarios cuando interactúan con él.",
  blacklist STRING COMMENT "Corresponde a un arreglo de valores que indica la lista de segmentos que funcionarán como blacklist dentro de la lógica del API Connect Hub. Si un segmento está incluido en esta lista, los usuarios pertenecientes a ese segmento no visualizarán el banner configurado.",
  description STRING COMMENT "Descripción textual del banner creado, utilizada para funciones de accesibilidad en los dispositivos.",
  created_at STRING COMMENT "Fecha de creación del home banner. Formato UTC-0. Formato: dd/MM/yyyy HH:mm:ssZ.",
  organization_name STRING COMMENT "Nombre de la ONG u organización utilizado para crear el banner de tipo donación. Este campo solo tiene valor si el banner es de tipo donación.",
  title STRING COMMENT "Título asignado al banner dentro del backoffice.",
  type STRING COMMENT "Indica el tipo de banner. Puede ser funcional o de donación. Valores posibles: NAVIGATION, DONATION.",
  confirmation_name STRING COMMENT "Nombre del mensaje de confirmación mostrado en el modal de donación. Este campo solo tiene valor si el banner es de tipo donación.",
  banner_type_position STRING COMMENT "Indica el tipo de configuración de segmentación del banner. Valores posibles: MASIVO (envíos según owner provider del usuario), SEGMENTADO (segmentación personalizada por bases), NBP (personalización a nivel de usuario), DEFAULT (banners por defecto si el usuario no tiene banners pendientes).",
  petitioner STRING COMMENT "Valor que indica el producto al que hace referencia la publicación, configurado en el backoffice desde una lista desplegable o campo de texto.",
  url_image STRING COMMENT "URL de la imagen utilizada para mostrar el banner en el carrusel de Yape.",
  updated_at STRING COMMENT "Fecha de modificación de un registro del banner. Formato UTC-0. Formato: dd/MM/yyyy HH:mm:ssZ.",
  segment STRING COMMENT "Corresponde a un arreglo de valores que indica el listado de segmentos a los cuales se disponibilizará el banner. Este valor solo se presenta cuando el banner es de tipo SEGMENTADO.",
  id STRING COMMENT "Identificador único del banner creado desde el backoffice, utilizado como clave primaria (PK).",
  phone_donation STRING COMMENT "Número celular de la ONG a la cual se realizarán los yapeos donativos. Este campo solo tiene valor si el banner es de tipo donación.",
  position STRING COMMENT "Posición relativa del banner dentro del carrusel o listado de banners en los flujos que lo soportan.",
  view_scope STRING COMMENT "Indica la pantalla donde debe aparecer el banner configurado en el backoffice.",
  start_date STRING COMMENT "Fecha de inicio de la publicación del banner, configurada en el backoffice. La fecha está en formato UTC-0. Formato: dd/MM/yyyy HH:mm:ssZ.",
  status STRING COMMENT "Indica el estado del registro del banner. Valores posibles: BORRADOR (el registro aún se encuentra en borrador y puede ser modificado), VALIDACION (el registro está en validación por un owner), APROBADO (el registro está activado), ELIMINADO (el registro ha sido eliminado desde el backoffice).",
  metadata STRUCT<
      partition INT COMMENT "Indica la división lógica y física de un tópico",
      offset BIGINT COMMENT "Indica la posición secuencial de un mensaje dentro de una partición",
      timestampType STRING COMMENT "Flag que indica el tipo de fecha; 0 fecha de creación del evento, 1 fecha en que se encola el evento",
      timestamp TIMESTAMP COMMENT "Fecha en que se encola el evento cuando timestampType es 1. Si timestampType es 0, corresponde a la fecha de creación del evento."
    > COMMENT "Metadata from kafka" not null,
  document STRING COMMENT "JSON text from eventData" not null,
  auditTime TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null,
  p_auditDate DATE COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0." not null
)
CLUSTER BY (auditTime, p_auditDate)
COMMENT "Descripción de la tabla: Esta tabla almacena la configuración y atributos de los banners gestionados desde el backoffice, permitiendo su segmentación, personalización y control de visibilidad en la plataforma. Incluye información relevante como fechas de vigencia, tipo de banner, segmentación, estado, detalles de accesibilidad, y datos específicos para banners de tipo donación, facilitando la administración y despliegue de campañas visuales en la aplicación."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz SET TAGS ('Domain'='core', 'Layer'='bronze', 'TypeTable'='raw');
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz ALTER COLUMN phone_donation SET TAGS ('dac');
