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
-- Table structure for table `shared_transaction`
--

DROP TABLE IF EXISTS `shared_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_transaction` (
  `shared_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` double DEFAULT '0',
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`shared_transaction_id`),
  KEY `fk_shared_transaction_sender_id_idx` (`sender_id`),
  KEY `fk_shared_transaction_transaction_id_idx` (`transaction_id`),
  KEY `fk_shared_transaction_receiver_id_idx` (`receiver_id`),
  CONSTRAINT `fk_shared_transaction_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_shared_transaction_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_shared_transaction_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_transaction`
--

LOCK TABLES `shared_transaction` WRITE;
/*!40000 ALTER TABLE `shared_transaction` DISABLE KEYS */;
INSERT INTO `shared_transaction` VALUES (1,33.33,'2022-03-15 06:12:59','2022-03-15 06:12:59',1,1,1),(2,33.33,'2022-03-15 06:13:33','2022-03-15 06:13:33',2,1,1),(3,33.33,'2022-03-15 13:14:32','2022-03-15 13:14:32',3,2,1),(6,33.33,'2022-03-19 11:01:41','2022-03-19 11:01:41',3,2,10),(7,33.33,'2022-03-19 11:01:41','2022-03-19 11:01:41',1,2,10),(8,33.33,'2022-03-19 11:01:41','2022-03-19 11:01:41',2,2,10),(12,30,'2022-03-12 06:12:59','2022-03-12 06:12:59',1,1,28),(13,20,'2022-03-12 06:12:59','2022-03-12 06:12:59',1,2,28),(14,20,'2022-03-12 06:12:59','2022-03-12 06:12:59',1,3,28),(15,10,'2022-03-12 06:12:59','2022-03-12 06:12:59',1,4,28),(16,20,'2022-03-12 06:12:59','2022-03-12 06:12:59',1,5,28),(17,20,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,2,29),(18,30,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,3,29),(19,10,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,4,29),(20,20,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,6,29),(21,5,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,10,29),(22,5,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,12,29),(23,10,'2022-03-14 06:12:59','2022-03-14 06:12:59',1,11,29),(24,20,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,2,30),(25,20,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,3,30),(26,20,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,4,30),(27,20,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,5,30),(28,20,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,6,30),(29,33,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,2,31),(30,40,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,3,31),(31,27,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,4,31),(32,33.33,'2022-03-21 06:12:59','2022-03-21 06:12:59',1,2,32),(33,33.33,'2022-03-21 06:12:59','2022-03-21 06:12:59',1,3,32),(34,33.33,'2022-03-21 06:12:59','2022-03-21 06:12:59',1,4,32),(37,10,'2022-03-22 06:12:59','2022-03-22 06:12:59',1,4,33),(38,25,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,2,35),(39,25,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,3,35),(40,25,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,4,35),(41,25,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,5,35),(42,25,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,2,36),(43,25,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,3,36),(45,50,'2022-03-23 06:12:59','2022-03-23 06:12:59',1,4,36),(46,25,'2022-03-24 06:12:59','2022-03-24 06:12:59',2,1,37),(47,25,'2022-03-24 06:12:59','2022-03-24 06:12:59',3,1,37),(48,25,'2022-03-24 06:12:59','2022-03-24 06:12:59',4,1,37),(49,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,2,39),(50,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,3,39),(51,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,4,39),(52,50,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,5,39),(53,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',2,1,40),(54,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',2,3,40),(55,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',2,4,40),(56,50,'2022-03-20 06:12:59','2022-03-20 06:12:59',2,5,40),(57,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',1,3,41),(58,25,'2022-03-20 06:12:59','2022-03-20 06:12:59',2,3,41),(60,50,'2022-03-20 06:12:59','2022-03-20 06:12:59',5,3,41),(64,25,'2022-03-21 04:19:06','2022-03-21 04:19:06',4,7,43),(65,25,'2022-03-21 04:19:06','2022-03-21 04:19:06',5,7,43),(66,25,'2022-03-21 04:19:06','2022-03-21 04:19:06',6,7,43);
/*!40000 ALTER TABLE `shared_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mysqladmin`@`%`*/ /*!50003 TRIGGER `moneymanager`.`shared_transaction_AFTER_INSERT` AFTER INSERT ON `shared_transaction` FOR EACH ROW
BEGIN
		
				INSERT INTO intracted_friends (sender_id, receiver_id) values (new.sender_id, new.receiver_id);
END */;;
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

-- Dump completed on 2022-04-01 14:45:15
