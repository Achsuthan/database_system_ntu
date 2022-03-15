CREATE TABLE `bank_transaction`(
    `bank_transaction_id` int(20) NOT NULL AUTO_INCREMENT,
    `name` varchar(64) NOT NULL,
    `amount` double DEFAULT '0',
    `currency` varchar(64) NOT NULL,
    `description` varchar(100) NOT NULL,
    `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `transaction_type_id` int(11) NOT NULL,
    `bank_id` int(11) NOT NULL,
    PRIMARY KEY (`bank_transaction_id`),
    KEY `fk_bank_transaction_transaction_type_id_idx` (`transaction_type_id`),
    KEY `fk_bank_transaction_bank_id_idx` (`bank_id`),
    CONSTRAINT `fk_bank_transaction_transaction_type_id` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_bank_transaction_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
