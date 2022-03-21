DROP TRIGGER IF EXISTS `moneymanager`.`shared_transaction_AFTER_INSERT`;

DELIMITER $$
USE `moneymanager`$$
CREATE DEFINER = CURRENT_USER TRIGGER `moneymanager`.`shared_transaction_AFTER_INSERT` AFTER INSERT ON `shared_transaction` FOR EACH ROW
BEGIN
		
				INSERT INTO intracted_friends (sender_id, receiver_id) values (new.sender_id, new.receiver_id);
END
$$
DELIMITER ;