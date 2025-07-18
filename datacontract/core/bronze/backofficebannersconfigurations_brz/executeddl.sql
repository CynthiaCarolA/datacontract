-- Databricks notebook source
-- COMMAND ----------

-- Data Contract: urn:${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz (
  end_date STRING COMMENT "Fecha de finalización de la vigencia de un banner, configurada dentro del backoffice. Formato: yyyy-MM-dd HH:mm:ss Z.",
  owner STRING COMMENT "Proveedor propietario configurado en el backoffice, utilizado para identificar a los usuarios que verán el banner según el propietario. Este campo solo tendrá valor si el banner es de tipo MASIVO. Valores posibles: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA.",
  product STRING COMMENT "Producto asociado al banner de inicio, que se utilizará para los clusters de NBP en el futuro.",
  __deleted STRING COMMENT "Campo utilizado como convención de integración con Debezium. False indica que el registro es activo, mientras que True indica que el registro ha sido eliminado (tombstone).",
  deeplink STRING COMMENT "Deeplink utilizado en el banner que permite redirigir a los usuarios al hacer clic en él.",
  blacklist STRING COMMENT "Lista de segmentos que actúan como una lista negra dentro de la lógica del API Connect Hub. Si un segmento está incluido en esta lista, los usuarios pertenecientes a ese segmento no verán el banner configurado.",
  description STRING COMMENT "Descripción textual del banner, utilizada para funciones de accesibilidad en dispositivos.",
  created_at STRING COMMENT "Fecha de creación del banner, configurada en formato UTC-0. Formato: yyyy-MM-dd HH:mm:ss Z.",
  organization_name STRING COMMENT "Nombre de la ONG u organización asociada al banner de tipo donación. Este campo solo tendrá valor si el banner es de tipo donación.",
  title STRING COMMENT "Título asignado al banner dentro del backoffice.",
  type STRING COMMENT "Tipo de banner, que puede ser funcional o de donación. Valores esperados: NAVIGATION, DONATION.",
  confirmation_name STRING COMMENT "Nombre del mensaje de confirmación mostrado en el modal de donación. Este campo solo tendrá valor si el banner es de tipo donación.",
  banner_type_position STRING COMMENT "Tipo de configuración de segmentación del banner creado, indicando si es MASIVO, SEGMENTADO, NBP o DEFAULT.",
  petitioner STRING COMMENT "Valor que indica el producto al que hace referencia la publicación, configurado en el backoffice desde una lista desplegable o un campo de texto.",
  url_image STRING COMMENT "URL de la imagen utilizada para mostrar el banner en el carrusel de Yape.",
  updated_at STRING COMMENT "Fecha de modificación del registro del banner, configurada en formato UTC-0. Formato: yyyy-MM-dd HH:mm:ss Z.",
  segment STRING COMMENT "Lista de segmentos a los cuales se disponibilizará el banner. Este valor solo estará presente si el banner es de tipo SEGMENTADO.",
  id STRING COMMENT "Identificador único del banner creado en el backoffice, utilizado como clave primaria.",
  phone_donation STRING COMMENT "Número celular de la ONG a la cual se realizarán los donativos. Este campo solo tendrá valor si el banner es de tipo donación.",
  position STRING COMMENT "Posición relativa del banner dentro del carrusel o listado de banners en los flujos que lo soportan.",
  view_scope STRING COMMENT "Pantalla donde debe aparecer el banner configurado en el backoffice.",
  start_date STRING COMMENT "Fecha de inicio de la publicación del banner, configurada en el backoffice. Formato: yyyy-MM-dd HH:mm:ss Z.",
  status STRING COMMENT "Estado del registro del banner, que puede ser BORRADOR, VALIDACION, APROBADO o ELIMINADO.",
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
COMMENT "Esta tabla contiene información sobre los banners configurados en el sistema, incluyendo detalles sobre su vigencia, tipo, propietario, y características específicas para su visualización y segmentación. Los banners pueden ser de tipo funcional o de donación, y su configuración se realiza a través del backoffice, permitiendo personalizar su presentación y el público objetivo al que se dirigen."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz SET TAGS ('Domain'='core', 'Layer'='bronze', 'TypeTable'='raw');
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz ALTER COLUMN phone_donation SET TAGS ('dac');
