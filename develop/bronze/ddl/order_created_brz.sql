-- Data Contract: urn:datacontract:develop:order_created_brz-latest
-- SQL Dialect: databricks
CREATE OR REPLACE TABLE develop.bronze.order_created_brz (
  id_yape_account STRING COMMENT "Yape account id",
  shopping_cart_id STRING COMMENT "Shopping cart id VTEX",
  value STRING COMMENT "Total value of the order",
  order_id STRING COMMENT "Order id VTEX",
  status STRING COMMENT "Order status",
  order_date STRING COMMENT "Order date",
  shipping_data_id STRING COMMENT "Shipping data id",
  shipping_data_type STRING COMMENT "Shipping data type",
  shipping_data_receiver_name STRING COMMENT "Shipping data Receiver name",
  shipping_data_address_id STRING COMMENT "Shipping data Address id VTEX",
  shipping_data_postal_code STRING COMMENT "Postal code - Ubigeo",
  shipping_data_city STRING COMMENT "Shipping data City - Province",
  shipping_data_state STRING COMMENT "Shipping data State - Department",
  shipping_data_country STRING COMMENT "Shipping data Country",
  shipping_data_street STRING COMMENT "Shipping data Street",
  shipping_data_number STRING COMMENT "Shipping data Number",
  shipping_data_neighborhood STRING COMMENT "Shipping data Neighborhood - District",
  shipping_data_complement STRING COMMENT "Shipping data Complement",
  shipping_data_reference STRING COMMENT "Shipping data Reference",
  items STRING COMMENT "<<missing>>",
  logisticts_information STRING COMMENT "<<missing>>",
  totalisers_amount STRING COMMENT "<<missing>>",
  payment_error STRING COMMENT "Payment error",
  payment_status STRING COMMENT "Payment status",
  payment_transaction_id STRING COMMENT "Payment transaction id Yape",
  payment_card_error STRING COMMENT "Card error",
  payment_card_transaction_id STRING COMMENT "Card transaction id",
  payment_card_brand STRING COMMENT "Card brand",
  payment_card_number STRING COMMENT "Card number",
  route_type STRING COMMENT "Route type transaction",
  channel STRING COMMENT "Channel transaction",
  metadata STRING COMMENT "string",
  document STRING COMMENT "string",
  auditTime STRING COMMENT "string" not null,
  p_auditDate STRING COMMENT "string" not null
)
CLUSTER BY (auditTime, p_auditDate)
COMMENT "Schema for Create Order"
 TBLPROPERTIES (
  'delta.logRetentionDuration' = 'interval 30 days',
  'delta.deletedFileRetentionDuration' = 'interval 30 days',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true'
);
ALTER TABLE develop.bronze.order_created_brz SET TAGS ('Domain'='develop', 'Schema'='bronze', 'TypeTable'='raw');
