CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_bank_transaction` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `transaction_spent_for_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transaction_category_id_idx` (`category_id`),
  KEY `fk_transaction_created_by_idx` (`created_by`),
  KEY `fk_transaction_transaction_type_id_idx` (`transaction_type_id`),
  KEY `fk_transaction_transaction_spend_for_id_idx` (`transaction_spent_for_id`),
  KEY `idx_transaction_name` (`name`), --- Indexing
  CONSTRAINT `fk_transaction_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_transaction_spend_for_id` FOREIGN KEY (`transaction_spent_for_id`) REFERENCES `transaction_spent_for` (`transaction_spent_for_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_transaction_type_id` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON UPDATE CASCADE
);
