CREATE TABLE `exchange` (
  `rate` double DEFAULT '0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `currency_id` int(11) NOT NULL,
  KEY `fk_currency_id_idx` (`currency_id`),
  CONSTRAINT `fk_exchange_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
