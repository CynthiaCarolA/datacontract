-- Data Contract: urn:develop.bronze.tiendapricessku_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE develop.bronze.tiendapricessku_brz (
  itemId STRING COMMENT "Identificador único del SKU (stock keeping unit). Este valor es autogenerado de manera incremental por la aplicación de VTEX. Ejemplo: 38.",
  listPrice STRING COMMENT "Precio de venta sugerido para el SKU. Este valor representa el costo que se recomienda al consumidor. Ejemplo: 119.",
  costPrice STRING COMMENT "Costo base del SKU, utilizado para calcular los márgenes de ganancia. Este valor es fundamental para determinar la rentabilidad del producto. Ejemplo: 49.",
  markup STRING COMMENT "Margen de ganancia deseado para la venta del SKU. Este valor se expresa en centavos y se utiliza para establecer el precio de venta. Ejemplo: 2040816327.",
  basePrice STRING COMMENT "Precio base o de referencia del SKU, utilizado como punto de partida para cálculos de precios dinámicos o promociones. Ejemplo: 50.",
  fixedPrices STRING COMMENT "Lista de objetos que definen precios fijos para el SKU. Estos precios sobrescriben cualquier otra configuración de precios existente, asegurando que se aplique un precio específico. Ejemplo: [] (sin precios fijos).",
  updateTs STRING COMMENT "Fecha de actualización de la información del SKU. Indica la fecha y hora en formato UTC-5 en que se produjo la actualización del catálogo. Formato: yyyy-MM-dd'T'HH:mm:ss.SSSXXX. Ejemplo: 2025-04-25T15:05:29.434-05:00.",
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
COMMENT "Esta tabla contiene información detallada sobre los productos, específicamente sobre los SKU (stock keeping units). Incluye datos como el identificador único, precios de venta y costo, márgenes de ganancia, así como información sobre actualizaciones y precios fijos. Estos datos son esenciales para la gestión de inventarios y la estrategia de precios en la plataforma VTEX."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE develop.bronze.tiendapricessku_brz SET TAGS ('Domain'='develop', 'Layer'='bronze', 'TypeTable'='raw');
