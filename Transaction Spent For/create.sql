CREATE TABLE `transaction_spent_for` (
  `transaction_spent_for_id` int(11) NOT NULL AUTO_INCREMENT,
  `for` varchar(64) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_spent_for_id`)
);
