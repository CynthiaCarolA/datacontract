-- Data Contract: urn:datacontract:experience:whatsappNotifier_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE experience.bronze.whatsappNotifier_brz (
  integrationId STRING COMMENT "Unique identifier to integrate with the provider",
  phoneNumber STRING COMMENT "Customer's cell phone number",
  templateName STRING COMMENT "Name of the template to be used",
  idYapeAccount STRING COMMENT "Unique Yape identifier",
  templateParams STRING COMMENT "Params to be used in the template",
  channel STRING COMMENT "Name of channel requested",
  processId STRING COMMENT "Unique identifier for the massive charge process",
  requester STRING COMMENT "Mail or abbreviate identifier of the requester",
  additionalInformation STRING COMMENT "Additional information for the notification",
  statusId STRING COMMENT "Identifier of the status of the notification",
  errorDescription STRING COMMENT "Error description in case of failure",
  conversationId STRING COMMENT "Unique identifier for the conversation",
  messageType STRING COMMENT "Type of message",
  requestDate STRING COMMENT "Timestamp of metadata request",
  processedDate STRING COMMENT "Date of processing the notification on Sunco",
  requestId STRING COMMENT "Identifier of the request",
  metadata STRUCT<
      partition INT COMMENT "Indica la división lógica y física de un tópico",
      offset BIGINT COMMENT "Indica la posición secuencial de un mensaje dentro de una partición",
      timestampType STRING COMMENT "Flag que indica el tipo de fecha; '0' fecha de creación del evento, '1' fecha en que se encola el evento",
      timestamp TIMESTAMP COMMENT "Fecha en que se encola el evento cuando timestampType es '1'. Si timestampType es '0', corresponde a la fecha de creación del evento."
    > COMMENT "Metadata from kafka" not null,
  document STRING COMMENT "JSON text from eventData" not null,
  auditTime TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null,
  p_auditDate DATE COMMENT "Fecha de ejecucion de la rutina de carga al datalake en UTC-0." not null
)
CLUSTER BY (auditTime, p_auditDate)
COMMENT "Guarda la información relacionada a las actualizaciones de precios de los productos.
Nivel de detalle:
Almacena cada actualización ocurrida en el tiempo."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE experience.bronze.whatsappNotifier_brz SET TAGS ('Domain'='experience', 'Schema'='bronze', 'TypeTable'='raw');
