USE `moneymanager`;
DROP procedure IF EXISTS `usp_createtransactions`;

USE `moneymanager`;
DROP procedure IF EXISTS `moneymanager`.`usp_createtransactions`;
;

DELIMITER $$
USE `moneymanager`$$
CREATE DEFINER=`mysqladmin`@`%` PROCEDURE `usp_createtransactions`(
	IN trans_name VARCHAR(64),
    IN trans_desc VARCHAR(100),
    IN trans_amount DOUBLE,
    IN isBankTrans TINYINT(1),
    IN trans_catId INT(11),
    IN trans_createdby INT(11),
    IN trans_typeId INT(11),
    IN trans_spendforId INT(11),
    IN trans_percentage DOUBLE,
    IN trans_senderIds VARCHAR(300),
    IN trans_receiverId INT(11)
)
BEGIN
	DECLARE `isrollback` BOOL DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET `isrollback` = 1;

    START TRANSACTION;
        
--   insert into transaction table
	INSERT INTO `transaction` (`name`, `description`, `amount`, `date`,`is_bank_transaction`, `category_id`, 
    `created_by`, `transaction_type_id`, `transaction_spent_for_id`)
	VALUES (trans_name,trans_desc,trans_amount,NOW(),isBankTrans,trans_catId,trans_createdby,trans_typeId,trans_spendforId);

	SET @lasttransactionId = LAST_INSERT_ID();

--   insert into shared transaction table
	INSERT INTO `shared_transaction`(`percentage`,`sender_id`,`receiver_id`,`transaction_id`)
    SELECT trans_percentage, user_id as senderid, trans_receiverId, @lasttransactionId from  user where find_in_set(user_id, trans_senderIds);
    

--   insert into group transaction table
	INSERT INTO `group_transaction`(`sender_id`,`transaction_id`,`shared_transaction_id`,`group_id`)
	SELECT `sender_id`, `transaction_id`, `shared_transaction_id`, 4 
    FROM  `shared_transaction`
    WHERE transaction_id = @lasttransactionId;
    
    IF `isrollback` THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There is an error at creating transaction.', MYSQL_ERRNO = 2000;
    END IF;
    
    
    COMMIT; -- this will not be executed
END$$

DELIMITER ;
;