CREATE TABLE `group_transaction` (
  `group_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `shared_transaction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`group_transaction_id`),
  KEY `fk_group_transaction_sender_id_idx` (`sender_id`),
  KEY `fk_group_transaction_transaction_id_idx` (`transaction_id`),
  KEY `fk_group_transaction_shared_transaction_id_idx` (`shared_transaction_id`),
  KEY `fk_group_transaction_group_id_idx` (`group_id`),
  CONSTRAINT `fk_group_transaction_group_id` FOREIGN KEY (`group_id`) REFERENCES `spending_group` (`spending_group_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_transaction_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_group_transaction_shared_transaction_id` FOREIGN KEY (`shared_transaction_id`) REFERENCES `shared_transaction` (`shared_transaction_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_transaction_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON UPDATE CASCADE
);
