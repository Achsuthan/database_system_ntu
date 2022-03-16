CREATE TABLE `access_level`(
    `access_level_id` int(11) NOT NULL AUTO_INCREMENT,
    `level` varchar(64) NOT NULL,
    `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`access_level_id`)
);
