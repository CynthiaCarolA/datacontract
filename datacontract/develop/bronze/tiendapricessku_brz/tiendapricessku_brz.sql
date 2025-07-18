-- Data Contract: urn:develop.bronze.tiendapricessku_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE develop.bronze.tiendapricessku_brz (
  itemId STRING COMMENT "Identificador único del SKU (stock keeping unit), que es un valor incremental autogenerado por la aplicación de VTEX.",
  listPrice STRING COMMENT "Precio de venta sugerido para el SKU, que representa el costo que se espera que pague el cliente.",
  costPrice STRING COMMENT "Costo base del SKU, utilizado para calcular los márgenes de ganancia y evaluar la rentabilidad del producto.",
  markup STRING COMMENT "Margen de ganancia deseado para la venta del SKU, expresado como un porcentaje sobre el costo.",
  basePrice STRING COMMENT "Precio base o de referencia del SKU, utilizado como punto de partida para cálculos de precios dinámicos o promociones.",
  fixedPrices STRING COMMENT "Lista de objetos que definen precios fijos para el SKU. Estos precios sobrescriben cualquier otra configuración de precios existente, asegurando que se aplique el precio correcto en situaciones específicas.",
  updateTs STRING COMMENT "Fecha de actualización de la información del SKU. Indica la fecha y hora en formato UTC-5 en que se produjo la actualización del catálogo, lo que permite rastrear cambios en la información.",
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
COMMENT "Esta tabla contiene información detallada sobre los productos (SKU) disponibles en el sistema, incluyendo sus precios, costos y márgenes de ganancia. Cada SKU está identificado de manera única y se registran tanto los precios sugeridos como los costos base, lo que permite realizar un análisis exhaustivo de la rentabilidad y la estrategia de precios."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE develop.bronze.tiendapricessku_brz SET TAGS ('Domain'='develop', 'Layer'='bronze', 'TypeTable'='raw');
