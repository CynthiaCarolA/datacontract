-- Data Contract: urn:datacontract:develop:prices_update_3_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE develop.bronze.prices_update_3_brz (
  requestDate STRING COMMENT "Date of the request",
  requestId STRING COMMENT "Identifier of the request",
  notificationStatus STRING COMMENT "Status of the notification",
  notificationChannel STRING COMMENT "Channel used to the notification",
  contingencyId STRING COMMENT "Identifier of the contingency",
  idYapeAccount STRING COMMENT "Identifier of the Yape account",
  channel STRING COMMENT "Channel origin of the request",
  conversationId STRING COMMENT "Identifier of the conversation",
  preferredNotificationChannel STRING COMMENT "Preferred notification channel",
  userInformation STRING COMMENT "User information",
  issueInformation STRING COMMENT "Issue information",
  additionalInformation STRING COMMENT "Additional information",
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
COMMENT "Customer contingency association requested enriched"
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE develop.bronze.prices_update_3_brz SET TAGS ('Domain'='develop', 'Schema'='bronze', 'TypeTable'='raw');
