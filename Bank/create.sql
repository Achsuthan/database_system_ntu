CREATE TABLE `bank`(
    `bank_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(64) NOT NULL,
    `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `owner_id` int(11) NOT NULL,
    PRIMARY KEY (`bank_id`),
    KEY `fk_bank_owner_id_idx` (`owner_id`),
    CONSTRAINT `fk_bank_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
);
