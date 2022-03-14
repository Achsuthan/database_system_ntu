CREATE TABLE `bank`(
	`bank_id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(64) NOT NULL,
    `created_date` datetime DEFAULT NULL,
    `updated_date` datetime DEFAULT NULL,
    `owner_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`bank_id`),
    KEY `fk_bank_owner_id_idx` (`owner_id`),
    CONSTRAINT `fk_bank_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);