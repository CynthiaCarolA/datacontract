-- Data Contract: urn:core.bronze.backofficebannersconfigurations_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE core.bronze.backofficebannersconfigurations_brz (
  id STRING COMMENT "Identificador único del Banner creado desde Backoffice. Se utiliza como una PK.",
  banner_type_position STRING COMMENT "Es el tipo indica la de configuracon de segmentacion que tiene el Bannercreado. Los valores indicaran que tipo Masivo, Segmentado o NBP.
Valores esperados:
MASIVO: Envios de acuerdo al owner provider del usuario.
SEGMENTADO: Segmentacion personalida por bases.
NBP: personalizacion a nivel usuario.
DEFAULT: Banners por defaull en caso un usuario no tenga banners pendientes.",
  blacklist STRING COMMENT "It corresponds to an array of values. This field indicates the list of segments that will act as a blacklist within the API Connect Hub logic. If a segment is included in this list, users belonging to that segment will not see the configured banner.",
  confirmation_name STRING COMMENT "It is the confirmation message name displayed in the donation modal. This field will only have a value if the banner is of the donation type.",
  organization_name STRING COMMENT "Es el naming de la ONG u Organización de la cual se está usando para crear el banner de tipo donación. Este field solo tendrá valor si el banner es de tipo donacion",
  deeplink STRING COMMENT "Es el deeplink empleado en el banner el cual permitirá redireccionar a los usuarios cuando estos le den tap.",
  phone_donation STRING COMMENT "Numero celular de la ONG a la cual se realizarán los yapeos donativos. Este campo solo tendrá valor si el banner es de tipo donación.",
  start_date STRING COMMENT "Fecha de inicio de la publicación del banner. Esta fecha es configurada dentro del backoffice. La fecha es en UTC-0",
  end_date STRING COMMENT "Fecha de finalización de la vigencia de un banner. Esta fecha es configurada dentro del backoffice. La fecha está en formato UTC-0",
  owner STRING COMMENT "Owner provider configurado dentro del backoffice. Sirve para identificar a que usuarios se mostrará el banner de acuerdo al owner provider. Este valor solo llegará cuando el banner es de tipo MASIVO.
Valores que pueden exisitir: BCP, NIUBIZ, YAPEDIGITAL, YAPEEMPRESA",
  segment STRING COMMENT "Corresponde a un array de valores. Este campo indica el listado de segmentos a los cuales se les disponibilizará el banner.
Este valor solo vendrá cuando el banner sea de tipo SEGMENTADO",
  petitioner STRING COMMENT "Valor que indica el producto al que hace referencia la publicación. Se configura dentro de backoffice desde una lista deplegable o desde un campo de texto.",
  position STRING COMMENT "Indica la posición relativa que tendrá el banner dentro del carrusel de banners o dentro de un listado de banners en los flujos que lo soporten.",
  type STRING COMMENT "Indica el tipo de banner que es. Puede ser de tipo funcional o de tipo donación.
Valores esperados:
NAVIGATION
DONATION",
  status STRING COMMENT "Indica el estado del registro de banner. 
Los valores que pueden llegar son estos:
BORRADOR: El registro aun se encuentra en borrador y puede ser modificado.
VALIDACION: El registro se encuentra en validación por un owner.
APROBADO: Indica que ya se encuentra activado
ELIMINADO: El registro se ha eliminado desde backoffice.",
  title STRING COMMENT "Es el título que se le da al banner dentro del backoffice",
  url_image STRING COMMENT "Es la url de la imagen que se utiliza para mostrar el banner en el carrusel de Yape",
  product STRING COMMENT "Producto del home banner. Este se empleará para los clusters de NBP en un futuro.",
  view_scope STRING COMMENT "Indica la pantalla a la cual donde deberá aparecer el banner configurado en backoffice.",
  description STRING COMMENT "Es la descripción textual del banner creado. Se emplea para las funciones de accesibilidad en los dispositivos.",
  __deleted STRING COMMENT "Campo que se usa como convención de integración con debezium.
False: El registro no ha sido eliminado (es un registro activo).
True: El registro ha sido eliminado (es un \"tombstone\").",
  created_at STRING COMMENT "Campo que corresponde a la fecha de creación del home banner. Formato UTC - 0",
  updated_at STRING COMMENT "Campo que corresponde a la fecha de modificación de un registro del banner. Formato UTC-0",
  metadata STRUCT<
      after_cursor STRING COMMENT "cursor de la siguiente pagina",
      before_cursor STRING COMMENT "cursor de la anterior pagina",
      has_more BOOLEAN COMMENT "campo te indica si hay mas paginas"
    > COMMENT "Metadata from api" not null,
  document STRING COMMENT "JSON text from eventData" not null,
  auditTime TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null,
  p_auditDate DATE COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0." not null
)
CLUSTER BY (auditTime, p_auditDate)
COMMENT "Esta tabla guardará la información de la configuración de los Banners realizados desde el Backoffice y almacenada en Postgress.
La finalidad de la tabla es poder realizar cruces entre los eventos de la tabla app interactions junto con la forma en como se configuró el propio banner para medir el performance de acuerdo a la segmentación realizada.
Adicionalmente servirá para que el equipo de ML pueda consultar la información de los banners configurados y se utilice dentro de sus modelos de recomendación."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE core.bronze.backofficebannersconfigurations_brz SET TAGS ('Domain'='core', 'Layer'='bronze', 'TypeTable'='raw');
ALTER TABLE core.bronze.backofficebannersconfigurations_brz ALTER COLUMN phone_donation SET TAGS ('dac');
