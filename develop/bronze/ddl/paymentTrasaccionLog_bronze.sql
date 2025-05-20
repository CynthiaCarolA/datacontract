-- Data Contract: urn:datacontract:develop:paymentTrasaccionLog-bronze
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE paymentTrasaccionLog (
  yape_account_id STRING not null COMMENT "Account Identifier",
  currency_id INT not null COMMENT "Yape currency identifier.",
  balance DECIMAL not null COMMENT "Yapero balance up to the collection date",
  collection_date STRING not null COMMENT "Timestamp when the balance was collected (UTC)",
  servers STRING not null COMMENT "List of server identifiers",
  info STRING not null COMMENT "General information metadata",
  models STRING not null COMMENT "Associated model versions"
) COMMENT "Registro de paymentTrasaccionLog.";
