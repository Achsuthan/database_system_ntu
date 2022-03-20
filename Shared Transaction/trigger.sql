DROP TRIGGER IF EXISTS `moneymanager`.`shared_transaction_BEFORE_INSERT`;

DELIMITER $$
USE `moneymanager`$$
CREATE DEFINER = CURRENT_USER TRIGGER `moneymanager`.`shared_transaction_BEFORE_INSERT` BEFORE INSERT ON `shared_transaction` FOR EACH ROW
BEGIN
		   IF NOT EXISTS (SELECT * FROM transaction WHERE transaction_id = NEW.transaction_id) THEN                
                    DELETE FROM transaction WHERE transaction_id = NEW.transaction_id;
           END IF;
END
$$
DELIMITER ;
