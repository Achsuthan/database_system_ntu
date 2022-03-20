CREATE DATABASE  IF NOT EXISTS `moneymanager` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `moneymanager`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: ntudbms-1.mysql.database.azure.com    Database: moneymanager
-- ------------------------------------------------------
-- Server version	5.7.32-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'moneymanager'
--
/*!50003 DROP FUNCTION IF EXISTS `getUserEmailById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqladmin`@`%` FUNCTION `getUserEmailById`(iuser_id int(11)) RETURNS varchar(64) CHARSET latin1
    DETERMINISTIC
BEGIN
        DECLARE ouser_email VARCHAR(64);
		SELECT email INTO ouser_email FROM user WHERE user_id = iuser_id;
        RETURN(ouser_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUserNameById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqladmin`@`%` FUNCTION `getUserNameById`(iuser_id int(11)) RETURNS varchar(64) CHARSET latin1
    DETERMINISTIC
BEGIN
        DECLARE ouser_name VARCHAR(64);
		SELECT name INTO ouser_name FROM user WHERE user_id = iuser_id;
        RETURN(ouser_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_createtransaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqladmin`@`%` PROCEDURE `usp_createtransaction`()
BEGIN
	DECLARE `isrollback` BOOL DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET `isrollback` = 1;

    START TRANSACTION;
        
--   insert into transaction table
	INSERT INTO `transaction` (`name`, `description`, `amount`, `date`,`is_bank_transaction`, `category_id`, 
    `created_by`, `transaction_type_id`, `transaction_spent_for_id`)
	VALUES ('payment for gift','payment for fareware gift',300,NOW(),0,4,2,3,2);

	SET @lasttransactionId = LAST_INSERT_ID();

--   insert into shared transaction table
	INSERT INTO `shared_transaction`(`percentage`,`sender_id`,`receiver_id`,`transaction_id`)
	VALUES (33.33,3,2,@lasttransactionId),
	(33.33,1,2,@lasttransactionId),
    (33.33,2,2,@lasttransactionId)
    ;    
    
--   insert into group transaction table
	INSERT INTO `group_transaction`(`sender_id`,`transaction_id`,`shared_transaction_id`,`group_id`)
	SELECT `sender_id`, `transaction_id`, `shared_transaction_id`, 4 
    FROM  `shared_transaction`
    WHERE transaction_id = @lasttransactionId;
    
    IF `isrollback` THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There is an error at creating transaction.', MYSQL_ERRNO = 2000;
    END IF;
    
    
    COMMIT; -- this will not be executed
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_createtransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20  2:00:46
