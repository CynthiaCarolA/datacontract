-- Data Contract: urn:core.silver.c_yapeBanner_slv-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE core.silver.c_yapeBanner_slv (
  yapeBannerId STRING COMMENT "Identificador único del banner, generado desde Backoffice. Actúa como clave primaria de la tabla y permite trazabilidad entre capas del modelo de datos." not null,
  recordUpdateTs TIMESTAMP COMMENT "Campo que corresponde a la fecha y hora de modificación de un registro del banner. Se tiene que llevar a UTC - 5" not null,
  segmentationTypeDesc STRING COMMENT "Estrategia de segmentación del banner. Puede ser MASIVO (por owner), SEGMENTADO (por segmentos), NBP (a nivel usuario) o DEFAULT (fallback genérico).",
  blacklistSegmentDesc ARRAY<ARRAY> COMMENT "Lista de segmentos a los cuales no se debe mostrar el banner, incluso si cumplen otros criterios. Actúa como lista de exclusión (blacklist lógica).",
  confirmationMessageDesc STRING COMMENT "Texto de confirmación que aparece en el modal al realizar una donación. Solo aplica para banners de tipo DONATION.",
  organizationName STRING COMMENT "Nombre de la organización u ONG asociada al banner. Aplica únicamente para banners de tipo DONATION.",
  deeplinkDesc STRING COMMENT "Enlace interno que redirige al usuario a una funcionalidad específica de la app (e.g., recargas, pagos) al hacer tap en el banner.",
  organizationPhoneNum STRING COMMENT "Número de celular de la ONG que recibe las donaciones. Este campo solo se utiliza cuando el banner es de tipo DONATION. Campo DAC tiene que ir cifrado",
  targetProviderDesc ARRAY<ARRAY> COMMENT "Lista de owner providers (como BCP, YAPEDIGITAL) a quienes se dirige el banner. Aplica solo cuando banner_type_position = MASIVO.",
  targetSegmentDesc ARRAY<ARRAY> COMMENT "Lista de segmentos objetivo definidos para el banner. Solo se usa si banner_type_position = SEGMENTADO.",
  contentOwnerDesc STRING COMMENT "Producto o flujo del app que solicita la publicación del banner (ej. RECARGAS). Ayuda a identificar al área dueña del contenido.",
  carouselPositionNum INT COMMENT "Orden relativo del banner en el carrusel de visualización. A menor valor, mayor prioridad visual.",
  bannerTypeDesc STRING COMMENT "Tipo de banner. Puede ser NAVIGATION (informativo, funcional) o DONATION (dirigido a campañas de donación).",
  bannerStatusTypeDesc STRING COMMENT "Estado del banner dentro del flujo de gestión (BORRADOR, VALIDACION, APROBADO, ELIMINADO). Solo los banners aprobados son vigentes.",
  titleDesc STRING COMMENT "Título visible del banner, definido por el equipo de producto o marketing.",
  imageUrl STRING COMMENT "URL donde se encuentra alojada la imagen que será mostrada en el banner.",
  productTypeDesc STRING COMMENT "Producto asociado al banner. Se usará para segmentación avanzada o modelos de recomendación (NBP).",
  displayScreenDesc STRING COMMENT "Pantalla específica de la app donde debe aparecer el banner (por ejemplo: BENEFICIOS_DMS, HOME, etc.).",
  descriptionDesc STRING COMMENT "Texto accesible o alternativo del banner. Se usa para funciones de accesibilidad y en algunos casos para enriquecer la semántica del banner.",
  startTs TIMESTAMP COMMENT "Fecha y hora de inicio de vigencia del banner convertido a hora peru UTC. -5",
  startDt DATE COMMENT "Fecha  de inicio de vigencia del banner convertido a hora peru UTC. -5",
  endTs TIMESTAMP COMMENT "Fecha y hora de finalización de la vigencia del banner convertido a hora peru UTC. -5",
  endDt DATE COMMENT "Fecha  de finalización de la vigencia del banner convertido a hora peru UTC. -5",
  recordCreationTs TIMESTAMP COMMENT "Campo que corresponde a la fecha y hora de creación del home banner. Se tiene que llevar a UTC - 5",
  recordCreationDt DATE COMMENT "Campo que corresponde a la fecha de creación del home banner. Se tiene que llevar a UTC - 5",
  deletedFlg STRING COMMENT "Indicador lógico para señalar eliminación  (soft delete). Si es 'S', el registro ha sido eliminado en origen y puede excluirse del consumo." not null,
  recordUpdateDt DATE COMMENT "Campo que corresponde a la fecha de modificación de un registro del banner. Se tiene que llevar a UTC - 5",
  _change_type STRING COMMENT "Insert, update_preimage, update_postimage, delete." not null,
  _commit_version INT COMMENT "El delta Log o la versión de la tabla que contiene el cambio." not null,
  _commit_timestamp TIMESTAMP COMMENT "La marca de tiempo asociada cuando se creó la confirmación." not null
  ,CONSTRAINT c_yapeBanner_slv_pk PRIMARY KEY(yapeBannerId, recordUpdateTs)
)
CLUSTER BY (yapeBannerId, recordUpdateTs, hashCd)
COMMENT "Tabla de cambios que consolida la configuración de banners publicitarios gestionados desde el Backoffice. Esta configuración es utilizada tanto para la visualización personalizada en el aplicativo como para alimentar modelos de recomendación (ML). La tabla es estructurada y normalizada a partir del origen transaccional en Postgres."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE core.silver.c_yapeBanner_slv SET TAGS ('Domain'='core', 'Layer'='silver', 'TypeTable'='changes');
ALTER TABLE core.silver.c_yapeBanner_slv ALTER COLUMN organizationPhoneNum SET TAGS ('dac');
