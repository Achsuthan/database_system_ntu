CREATE TABLE `shared_transaction` (
  `shared_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` double DEFAULT '0',
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`shared_transaction_id`),
  KEY `fk_shared_transaction_sender_id_idx` (`sender_id`),
  KEY `fk_shared_transaction_transaction_id_idx` (`transaction_id`),
  KEY `fk_shared_transaction_receiver_id_idx` (`receiver_id`),
  CONSTRAINT `fk_shared_transaction_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_shared_transaction_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_shared_transaction_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE CASCADE
);
