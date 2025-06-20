-- Databricks notebook source
-- COMMAND ----------
-- Data Contract: urn:retail.silver.m_storeStockKeepingUnitCatalog_slv-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE retail.silver.m_storeStockKeepingUnitCatalog_slv (
  skuId STRING COMMENT "Identificador único del SKU, es un incremental autogenerado desde la App de VTEX." not null,
  skuDesc STRING COMMENT "Nombre del SKU.",
  imageUrlDesc ARRAY<ARRAY> COMMENT "URL de la imagen.",
  sellerLegalIdentifierNum STRING COMMENT "Identificador del vendedor del SKU correspondiente al RUC del seller. Es un campo opcional que puede ser usado por el seller como identificador propio, en el caso de Tienda no es muy usado.",
  volumetricWeightNum DECIMAL COMMENT "Peso cúbico real del SKU medido en gramos, podría tomar valores decimales.",
  heightNum DECIMAL COMMENT "Altura real del SKU en centímetros, podría tomar valores decimales.",
  lengthNum DECIMAL COMMENT "Longitud real del SKU en centímetros, podría tomar valores decimales.",
  weightNum DECIMAL COMMENT "Peso real del SKU en gramos, podría tomar valores decimales.",
  widthNum DECIMAL COMMENT "Ancho real del SKU en centímetros, podría tomar valores decimales.",
  kitFlg STRING COMMENT "Indica si el SKU está compuesto por uno o más SKUs (parte de un kit) (S) o no (N). Debe activarse si estás añadiendo un kit. Una vez activada, esta definición no puede revertirse.",
  skuClassificationArray ARRAY<ARRAY> COMMENT "Array que contiene la estructura del departamento, categoría y subcategoría a la que pertenece el SKU.",
  principalCategoryActiveFlg STRING COMMENT "Indica si la categoría principal del SKU se encuentra activa o no.",
  sellerArray ARRAY<ARRAY> COMMENT "Array con los datos relacionados a los vendedores del SKU.",
  skuSpecificationArray ARRAY<ARRAY> COMMENT "Array de objeto con las especificaciones relacionadas del SKU.",
  commercialConditionId STRING COMMENT "Identificador de la condición comercial usada para definir promociones específicas del SKU o reglas de cuotas. Si no hay una condición específica, usar 1 (valor por defecto). Este campo no acepta 0, ya que tiene el valor por defecto 1.",
  eanCd STRING COMMENT "Código de barras estandarizado (EAN) a nivel mundial que identifica un producto (SKU).",
  sellerSkuId STRING COMMENT "Identificador de referencia del SKU.",
  measurementUnitDesc STRING COMMENT "Unidad de medida que debe utilizarse cuando sea necesario convertirla para efectos de venta. Por ejemplo, si un producto se comercializa en cajas, pero los clientes desean adquirirlo por metro cuadrado (m2). En casos comunes, se debe usar un.",
  logisticSegmentationTypeDesc STRING COMMENT "Vincula un tipo de SKU que requiere transporte especial (como carne, vidrio, colchones, entre otros) con un transportista especializado. Este campo debe completarse con el nombre del modal correspondiente (por ejemplo: Químicos o Productos refrigerados).",
  brandId STRING COMMENT "Identificador de la marca del producto.",
  brandDesc STRING COMMENT "Nombre de la marca del producto.",
  brandActiveFlg STRING COMMENT "Indica si la marca se encuentra activa o no. Si la marca se inactiva, se inactiva automaticamente el producto.",
  productId STRING COMMENT "Identificador del producto relacionado que hace referencia al identificador único del SKU (skuId), considerando que un mismo productId puede estar asociado a múltiples skuIds.",
  productDesc STRING COMMENT "Nombre del producto.",
  visibleProductFlg STRING COMMENT "Indica si el producto es visible o no.",
  sellerProductId STRING COMMENT "Identificador de referencia de un producto relacionado, definido por el vendedor (seller).",
  productSpecificationArray ARRAY<ARRAY> COMMENT "Array de objetos con las especificaciones relacionadas del producto.",
  productClustersArray ARRAY<ARRAY> COMMENT "Arreglo de objetos que contienen información sobre los clústeres comerciales a los que está asociado el producto. Estos clústeres agrupan productos con fines de campañas promocionales o iniciativas comerciales específicas.",
  productActiveFlg STRING COMMENT "Indica si el producto está activo o no.",
  displayIfOutOfStockFlg STRING COMMENT "Indica si el producto se mostrará cuando no esté disponible.",
  recordCreationTs TIMESTAMP COMMENT "Fecha y hora de lanzamiento del producto en formato UTC-5.",
  recordCreationDt DATE COMMENT "Fecha de lanzamiento del producto en formato UTC-5.",
  strikethroughPriceAmt DECIMAL COMMENT "Precio de venta sugerido para el SKU.",
  basePriceAmt DECIMAL COMMENT "Valor de referencia utilizado para el cálculo o comparación de precios del SKU.",
  tradePolicyArray ARRAY<ARRAY> COMMENT "Array de objetos que contiene los datos del cuerpo de la solicitud de precio fijo. Este valor tiene prioridad sobre cualquier otra configuración previamente definida en la tabla de precios.",
  priceRecordUpdateTs TIMESTAMP COMMENT "Fecha y hora de la última actualización de la información del SKU, expresada en formato UTC-5.",
  priceRecordUpdateDt DATE COMMENT "Fecha de la última actualización de la información del SKU, expresada en formato UTC-5.",
  skuStockArray ARRAY<ARRAY> COMMENT "Array que almacena objetos, cada uno representando el estado del inventario de un SKU específico en diferentes almacenes.",
  stockRecordUpdateTs TIMESTAMP COMMENT "Fecha y hora (UTC-5) en que se actualizó la información del SKU en el catálogo.",
  stockRecordUpdateDt DATE COMMENT "Fecha (UTC-5) en que se actualizó la información del SKU en el catálogo.",
  skuRecordUpdateTs TIMESTAMP COMMENT "Fecha y hora de actualización de la información del SKU. Indica la fecha y hora en formato UTC-5 en que se actualizó el catálogo.",
  skuRecordUpdateDt DATE COMMENT "Fecha de actualización de la información del SKU. Indica la fecha y hora en formato UTC-5 en que se actualizó el catálogo.",
  skuActiveFlg STRING COMMENT "Indica si el SKU se encuentra activo o no.",
  recordUpdateTs TIMESTAMP COMMENT "Fecha y hora de modificación del registro en la fuente.",
  recordUpdateDt DATE COMMENT "Fecha de modificación del registro en la fuente.",
  executionTs TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null
  ,CONSTRAINT m_storeStockKeepingUnitCatalog_slv_pk PRIMARY KEY(skuId)
)
CLUSTER BY (recordCreationDt, skuId, skuDesc)
COMMENT "Tabla que almacena información relacionada con las actualizaciones de SKU, precios de productos y disponibilidad de inventario en el catálogo de la Tienda."
 TBLPROPERTIES (
  'delta.enableChangeDataFeed' = 'true',
  'delta.logRetentionDuration' = 'interval 60 days',
  'delta.deletedFileRetentionDuration' = 'interval 60 days',
  'delta.tuneFileSizesForRewrites' = 'true',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE retail.silver.m_storeStockKeepingUnitCatalog_slv SET TAGS ('Schema'='silver', 'TypeTable'='master');
