-- Databricks notebook source
-- COMMAND ----------
-- Data Contract: urn:core.silver.h_loanAccountSettingLog_slv-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE core.silver.h_loanAccountSettingLog_slv (
  accountSettingId STRING COMMENT "Identificador único del registro en accountSettings, en formato UUID. Se genera en el momento de la afiliación del usuario o creación de la configuración." not null,
  recordCreationTs TIMESTAMP COMMENT "Fecha y hora de creación del registro. Normalmente coincide o tiene una diferencia mínima con la fecha de creación de la cuenta Yape." not null,
  loanAccountSettingTypeCd STRING COMMENT "Tipo de configuración. En este contexto, el valor 1 indica que el registro corresponde a configuraciones del producto Préstamos Express." not null,
  accountId STRING COMMENT "Identificador de la cuenta Yape asociada a la configuración. Puede repetirse temporalmente debido a errores en el flujo de afiliación (por ejemplo, durante la asociación de tarjeta). Estos registros se eliminan por TTL.",
  maxAmtPerTrxNum INT COMMENT "Monto máximo permitido por transacción. En contextos con préstamos activos, puede establecerse un valor especial como 999.",
  maxAmtPerDayNum INT COMMENT "Monto máximo permitido para enviar por día. Los valores comunes son 3000, 5000, 10000 y 20000.",
  expirationTs TIMESTAMP COMMENT "Fecha y hora de expiración del registro de configuración. Después de esta fecha, el préstamo o beneficio asociado dejaría de estar vigente. Debe transformarse a UTC 5",
  expirationDt DATE COMMENT "Fecha  de expiración del registro de configuración. Después de esta fecha, el préstamo o beneficio asociado dejaría de estar vigente.Debe transformarse a UTC 5",
  recordCreationDt DATE COMMENT "Fecha de creacion del registro debe estar en UTC 5",
  executionTs TIMESTAMP COMMENT "Fecha y hora de ejecucion de la rutina de carga al datalake en UTC-0." not null
  ,CONSTRAINT h_loanAccountSettingLog_slv_pk PRIMARY KEY(accountSettingId, recordCreationTs, loanAccountSettingTypeCd)
  ,CONSTRAINT h_loanAccountSettingLog_slv_accountSettingId_fk FOREIGN KEY (accountSettingId) REFERENCES accountsetting_slv.accountSettingId
  ,CONSTRAINT h_loanAccountSettingLog_slv_loanAccountSettingTypeCd_fk FOREIGN KEY (loanAccountSettingTypeCd) REFERENCES m_catalog_slv
  ,CONSTRAINT h_loanAccountSettingLog_slv_accountId_fk FOREIGN KEY (accountId) REFERENCES m_account_slv.accountId
)
CLUSTER BY (expirationDt, accountId, accountSettingId, loanAccountSettingTypeCd)
COMMENT "Tabla histórica que registra los eventos de activación o modificación de configuraciones asociadas al producto Préstamos Express de 10K para cuentas Yape.
Cada fila representa una instancia en el tiempo en la que se detectó una configuración activa del préstamo (type = 1) en la fuente accountSettings. Se considera tanto la primera activación como cualquier cambio posterior en los parámetros asociados (como montos máximos o fecha de expiración).
Esta tabla permite llevar trazabilidad de cambios en los valores configurados por usuario y mantener un log histórico para auditoría o análisis evolutivo."
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE core.silver.h_loanAccountSettingLog_slv SET TAGS ('Domain'='core', 'Layer'='silver', 'TypeTable'='historical');
