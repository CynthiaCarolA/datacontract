-- Databricks notebook source
-- COMMAND ----------

-- Data Contract: urn:${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz (
  end_date STRING COMMENT "Fecha de finalización de la vigencia de un banner, configurada dentro del backoffice. Formato: dd/MM/yyyy HH:mm:ss+00.",
  owner STRING COMMENT "Owner provider configurado dentro del backoffice, que identifica a qué usuarios se mostrará el banner según el owner provider. Este valor solo se presenta cuando el banner es de tipo MASIVO. Valores posibles: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA.",
  product STRING COMMENT "Producto asociado al home banner, que se utilizará para los clusters de NBP en el futuro.",
  __deleted STRING COMMENT "Campo utilizado como convención de integración con Debezium. False indica que el registro no ha sido eliminado (es un registro activo), mientras que True indica que el registro ha sido eliminado (es un 'tombstone').",
  deeplink STRING COMMENT "Deeplink utilizado en el banner que permite redireccionar a los usuarios al hacer tap.",
  blacklist STRING COMMENT "Corresponde a un array de valores que indica la lista de segmentos que actuarán como blacklist dentro de la lógica del API Connect Hub. Si un segmento está incluido en esta lista, los usuarios pertenecientes a ese segmento no verán el banner configurado.",
  description STRING COMMENT "Descripción textual del banner creado, utilizada para funciones de accesibilidad en los dispositivos.",
  created_at STRING COMMENT "Campo que corresponde a la fecha de creación del home banner. Formato: dd/MM/yyyy HH:mm:ss+00.",
  organization_name STRING COMMENT "Nombre de la ONG u organización utilizada para crear el banner de tipo donación. Este campo solo tendrá valor si el banner es de tipo donación.",
  title STRING COMMENT "Título asignado al banner dentro del backoffice.",
  type STRING COMMENT "Indica el tipo de banner. Puede ser de tipo funcional o de tipo donación. Valores esperados: NAVIGATION, DONATION.",
  confirmation_name STRING COMMENT "Nombre del mensaje de confirmación mostrado en el modal de donación. Este campo solo tendrá valor si el banner es de tipo donación.",
  banner_type_position STRING COMMENT "Indica el tipo de configuración de segmentación del banner creado. Los valores indican si es de tipo Masivo, Segmentado o NBP. Valores esperados: MASIVO (envíos de acuerdo al owner provider del usuario), SEGMENTADO (segmentación personalizada por bases), NBP (personalización a nivel de usuario), DEFAULT (banners por defecto si un usuario no tiene banners pendientes).",
  petitioner STRING COMMENT "Valor que indica el producto al que hace referencia la publicación, configurado dentro del backoffice desde una lista desplegable o un campo de texto.",
  url_image STRING COMMENT "URL de la imagen utilizada para mostrar el banner en el carrusel de Yape.",
  updated_at STRING COMMENT "Campo que corresponde a la fecha de modificación de un registro del banner. Formato: dd/MM/yyyy HH:mm:ss+00.",
  segment STRING COMMENT "Corresponde a un array de valores que indica el listado de segmentos a los cuales se disponibilizará el banner. Este valor solo se presenta cuando el banner es de tipo SEGMENTADO.",
  id STRING COMMENT "Identificador único del banner creado desde el backoffice, utilizado como clave primaria (PK).",
  phone_donation STRING COMMENT "Número celular de la ONG a la cual se realizarán los yapeos donativos. Este campo solo tendrá valor si el banner es de tipo donación.",
  position STRING COMMENT "Indica la posición relativa del banner dentro del carrusel de banners o en un listado de banners en los flujos que lo soporten.",
  view_scope STRING COMMENT "Indica la pantalla donde debe aparecer el banner configurado en el backoffice.",
  start_date STRING COMMENT "Fecha de inicio de la publicación del banner, configurada dentro del backoffice. Formato: dd/MM/yyyy HH:mm:ss+00.",
  status STRING COMMENT "Indica el estado del registro del banner. Los valores posibles son: BORRADOR (el registro se encuentra en borrador y puede ser modificado), VALIDACION (el registro está en validación por un owner), APROBADO (el registro está activado), ELIMINADO (el registro ha sido eliminado desde el backoffice).",
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
COMMENT "Esta tabla contiene información sobre los banners configurados en el sistema, incluyendo detalles sobre su vigencia, tipo, y segmentación. Cada banner tiene un identificador único y puede estar asociado a diferentes tipos de productos y organizaciones, así como a configuraciones específicas de visualización y acceso. La fecha de inicio y finalización de la vigencia del banner se establece en formato UTC-0, y se incluyen campos para la descripción, título, y otros atributos relevantes que determinan cómo y a quién se mostrará el banner."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz SET TAGS ('Domain'='core', 'Layer'='bronze', 'TypeTable'='raw');
ALTER TABLE ${env:ENV_CATALOG_NAME_CORE}.bronze.backofficebannersconfigurations_brz ALTER COLUMN phone_donation SET TAGS ('dac');
