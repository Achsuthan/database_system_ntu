CREATE TABLE `invite`(
    `invite_id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(64) NOT NULL,
    `expire_time` datetime DEFAULT CURRENT_TIMESTAMP,
    `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `created_by` int(11) NOT NULL,
    PRIMARY KEY (`invite_id`),
    UNIQUE KEY `email_UNIQUE` (`email`),
    KEY `fk_invite_created_by_idx` (`created_by`),
    CONSTRAINT `fk_invite_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
);
