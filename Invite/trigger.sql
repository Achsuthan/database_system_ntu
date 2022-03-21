DROP TRIGGER IF EXISTS `moneymanager`.`invite_BEFORE_INSERT`;

DELIMITER $$
USE `moneymanager`$$
CREATE DEFINER = CURRENT_USER TRIGGER `moneymanager`.`invite_BEFORE_INSERT` BEFORE INSERT ON `invite` FOR EACH ROW
BEGIN
		IF EXISTS(SELECT email FROM user WHERE email = NEW.email) THEN
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User account already exists in system.', MYSQL_ERRNO = 2000;
        END IF;
END$$
DELIMITER ;