-- Data Contract: urn:datacontract:develop:disaffiliate_history_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE develop.bronze.disaffiliate_history_brz (
  accountDetail STRING COMMENT "<<missing>>",
  channel STRING COMMENT "<<missing>>",
  detail STRING COMMENT "<<missing>>",
  idYapeAccount STRING COMMENT "<<missing>>",
  phoneNumber STRING COMMENT "<<missing>>",
  processDate STRING COMMENT "<<missing>>",
  processedBy STRING COMMENT "<<missing>>",
  reason STRING COMMENT "<<missing>>",
  requestId STRING COMMENT "<<missing>>",
  status STRING COMMENT "<<missing>>",
  maintainAccount STRING COMMENT "<<missing>>",
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
COMMENT "xxxxxxxx"
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE develop.bronze.disaffiliate_history_brz SET TAGS ('Domain'='develop', 'Schema'='bronze', 'TypeTable'='raw');
