-- Data Contract: urn:core.bronze.backofficebannersconfigurations_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE core.bronze.backofficebannersconfigurations_brz (
  end_date STRING COMMENT "Fecha de finalización de la vigencia de un banner, configurada en el backoffice. Formato: dd/MM/yyyy HH:mm:ss+00.",
  owner STRING COMMENT "Owner provider configurado en el backoffice, utilizado para identificar a qué usuarios se mostrará el banner según el owner provider. Este valor se proporciona únicamente cuando el banner es de tipo MASIVO. Valores posibles: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA.",
  product STRING COMMENT "Producto asociado al home banner, que se utilizará para los clusters de NBP en el futuro.",
  __deleted STRING COMMENT "Campo utilizado como convención de integración con Debezium. False indica que el registro es activo, mientras que True indica que el registro ha sido eliminado (es un 'tombstone').",
  deeplink STRING COMMENT "Deeplink empleado en el banner que permite redireccionar a los usuarios al hacer tap en él.",
  blacklist STRING COMMENT "Corresponde a un array de valores que indica la lista de segmentos que actúan como blacklist dentro de la lógica del API Connect Hub. Si un segmento está incluido en esta lista, los usuarios pertenecientes a ese segmento no verán el banner configurado.",
  description STRING COMMENT "Descripción textual del banner creado, utilizada para funciones de accesibilidad en dispositivos.",
  created_at STRING COMMENT "Campo que corresponde a la fecha de creación del home banner. Formato: dd/MM/yyyy HH:mm:ss+00.",
  organization_name STRING COMMENT "Nombre de la ONG u organización asociada al banner de tipo donación. Este campo tendrá valor únicamente si el banner es de tipo donación.",
  title STRING COMMENT "Título asignado al banner dentro del backoffice.",
  type STRING COMMENT "Indica el tipo de banner. Puede ser funcional o de donación. Valores esperados: NAVIGATION, DONATION.",
  confirmation_name STRING COMMENT "Nombre del mensaje de confirmación que se muestra en el modal de donación. Este campo tendrá valor únicamente si el banner es de tipo donación.",
  banner_type_position STRING COMMENT "Indica el tipo de configuración de segmentación del banner creado. Los valores pueden ser MASIVO, SEGMENTADO, NBP o DEFAULT.",
  petitioner STRING COMMENT "Valor que indica el producto al que hace referencia la publicación, configurado en el backoffice desde una lista desplegable o un campo de texto.",
  url_image STRING COMMENT "URL de la imagen utilizada para mostrar el banner en el carrusel de Yape.",
  updated_at STRING COMMENT "Campo que corresponde a la fecha de modificación de un registro del banner. Formato: dd/MM/yyyy HH:mm:ss+00.",
  segment STRING COMMENT "Corresponde a un array de valores que indica los segmentos a los cuales se disponibilizará el banner. Este valor se proporciona únicamente cuando el banner es de tipo SEGMENTADO.",
  id STRING COMMENT "Identificador único del banner creado desde el backoffice, utilizado como clave primaria (PK).",
  phone_donation STRING COMMENT "Número celular de la ONG a la cual se realizarán los yapeos donativos. Este campo tendrá valor únicamente si el banner es de tipo donación.",
  position STRING COMMENT "Indica la posición relativa del banner dentro del carrusel o listado de banners en los flujos que lo soporten.",
  view_scope STRING COMMENT "Indica la pantalla donde deberá aparecer el banner configurado en el backoffice.",
  start_date STRING COMMENT "Fecha de inicio de la publicación del banner, configurada en el backoffice. Formato: dd/MM/yyyy HH:mm:ss+00.",
  status STRING COMMENT "Indica el estado del registro del banner. Valores posibles: BORRADOR, VALIDACION, APROBADO, ELIMINADO.",
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
COMMENT "Esta tabla contiene información sobre los banners configurados en el sistema, incluyendo detalles sobre su vigencia, propietario, tipo de producto y segmentación. Cada banner tiene un identificador único y puede estar asociado a diferentes tipos de campañas, como donaciones o promociones. La fecha de inicio y finalización de la vigencia del banner se establece en formato UTC-0, y se incluye información sobre su estado, tipo y otros atributos relevantes para su visualización y gestión en el backoffice."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE core.bronze.backofficebannersconfigurations_brz SET TAGS ('Domain'='core', 'Layer'='bronze', 'TypeTable'='raw');
ALTER TABLE core.bronze.backofficebannersconfigurations_brz ALTER COLUMN phone_donation SET TAGS ('dac');
