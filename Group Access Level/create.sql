CREATE TABLE `group_access_level`(
    `group_access_level_id` int(11) NOT NULL AUTO_INCREMENT,
    `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `is_accepted` boolean DEFAULT false,
    `access_level_id` int(11) NOT NULL,
    `spending_group_id` int(11) NOT NULL,
    `created_by` int(11) NOT NULL,
    `receiver_id` int(11) NOT NULL,
    PRIMARY KEY (`group_access_level_id`),
    KEY `fk_group_access_level_access_level_id_idx` (`access_level_id`),
    KEY `fk_group_access_level_spending_group_id_idx` (`spending_group_id`),
    KEY `fk_group_access_level_created_by_idx` (`created_by`),
    KEY `fk_group_access_level_receiver_id_idx` (`receiver_id`),
    CONSTRAINT `fk_group_access_level_access_level_id` FOREIGN KEY (`access_level_id`) REFERENCES `access_level` (`access_level_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_group_access_level_spending_group_id` FOREIGN KEY (`spending_group_id`) REFERENCES `spending_group` (`spending_group_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_group_access_level_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_group_access_level_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
);
