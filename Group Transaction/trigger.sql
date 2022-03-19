DROP TRIGGER IF EXISTS `moneymanager`.`group_transaction_BEFORE_INSERT`;

DELIMITER $$
USE `moneymanager`$$
CREATE DEFINER = CURRENT_USER TRIGGER `moneymanager`.`group_transaction_BEFORE_INSERT` BEFORE INSERT ON `group_transaction` FOR EACH ROW
BEGIN
		   IF NOT EXISTS (SELECT * FROM transaction WHERE transaction_id = NEW.transaction_id) ||  
							(SELECT * FROM shared_transaction WHERE shared_transaction_id = NEW.shared_transaction_id && transaction_id = NEW.transaction_id) THEN                
                    DELETE FROM transaction WHERE transaction_id = NEW.transaction_id;
                    
                    DELETE FROM shared_transaction WHERE transaction_id = NEW.transaction_id;
           END IF;
END
$$
DELIMITER ;
