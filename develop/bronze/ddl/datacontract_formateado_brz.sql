-- Data Contract: urn:datacontract:checkout:orders-latest
-- SQL Dialect: snowflake
CREATE TABLE orders (
  order_id TIMESTAMP_TZ not null primary key COMMENT 'The business timestamp in UTC when the order was successfully registered in the source system and the payment was successful.'
) COMMENT='One record per order. Includes cancelled and deleted orders.';
