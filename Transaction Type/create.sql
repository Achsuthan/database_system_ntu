CREATE TABLE `transaction_type` (
  `transaction_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_type_id`)
);
