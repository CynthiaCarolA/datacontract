-- Data Contract: urn:datacontract:checkout:orders-latest
-- SQL Dialect: snowflake
CREATE TABLE orders (
  order_id TEXT not null primary key COMMENT 'An internal ID that identifies an order in the online shop.',
  order_timestamp TIMESTAMP_TZ not null COMMENT 'The business timestamp in UTC when the order was successfully registered in the source system and the payment was successful.',
  order_total NUMBER not null COMMENT 'Total amount the smallest monetary unit (e.g., cents).',
  customer_id TEXT COMMENT 'Unique identifier for the customer.',
  customer_email_address TEXT not null COMMENT 'The email address, as entered by the customer.',
  processed_timestamp TIMESTAMP_TZ not null COMMENT 'The timestamp when the record was processed by the data platform.'
) COMMENT='One record per order. Includes cancelled and deleted orders.';
CREATE TABLE line_items (
  line_item_id TEXT not null COMMENT 'Primary key of the lines_item_id table',
  order_id TEXT COMMENT 'An internal ID that identifies an order in the online shop.',
  sku TEXT COMMENT 'The purchased article number'
) COMMENT='A single article that is part of an order.';
