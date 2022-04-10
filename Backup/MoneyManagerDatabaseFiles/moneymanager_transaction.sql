-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: ntudbms-1.mysql.database.azure.com    Database: moneymanager
-- ------------------------------------------------------
-- Server version	5.7.37-log

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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_bank_transaction` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `transaction_spent_for_id` int(11) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transaction_category_id_idx` (`category_id`),
  KEY `fk_transaction_created_by_idx` (`created_by`),
  KEY `fk_transaction_transaction_type_id_idx` (`transaction_type_id`),
  KEY `fk_transaction_transaction_spend_for_id_idx` (`transaction_spent_for_id`),
  KEY `idx_transaction_name` (`name`),
  CONSTRAINT `fk_transaction_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_transaction_spend_for_id` FOREIGN KEY (`transaction_spent_for_id`) REFERENCES `transaction_spent_for` (`transaction_spent_for_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_transaction_type_id` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'payment for lunch','payment for lunch',150,'2022-03-15 06:10:37','2022-03-15 06:10:37','2022-03-15 06:10:37',0,2,1,3,2),(10,'payment for gift','payment for fareware gift',300,'2022-03-19 11:01:41','2022-03-19 11:01:41','2022-03-19 11:01:41',0,4,2,3,2),(11,'Deposit','',1000,'2022-03-08 06:10:37','2022-03-08 06:10:37','2022-03-08 06:10:37',0,2,1,1,1),(12,'Food','',21,'2022-03-09 06:10:37','2022-03-09 06:10:37','2022-03-09 06:10:37',0,2,1,2,1),(13,'Income','',100,'2022-03-09 06:10:37','2022-03-09 06:10:37','2022-03-09 06:10:37',0,2,1,1,1),(14,'Pizza','',60,'2022-03-13 06:10:37','2022-03-13 06:10:37','2022-03-13 06:10:37',0,3,1,2,1),(15,'Depost','',200,'2022-03-13 06:10:37','2022-03-13 06:10:37','2022-03-13 06:10:37',0,4,1,1,1),(16,'Dinner','',20,'2022-03-14 06:10:37','2022-03-14 06:10:37','2022-03-14 06:10:37',0,3,1,2,1),(17,'Lunch','',10,'2022-03-16 06:10:37','2022-03-16 06:10:37','2022-03-16 06:10:37',0,5,1,2,1),(18,'Shopee','',50,'2022-03-24 06:10:37','2022-03-24 06:10:37','2022-03-24 06:10:37',0,10,1,2,1),(19,'Amazon','',150,'2022-03-28 06:10:37','2022-03-28 06:10:37','2022-03-28 06:10:37',0,12,1,2,1),(20,'shopee','',100,'2022-03-29 06:10:37','2022-03-29 06:10:37','2022-03-29 06:10:37',0,3,1,2,1),(21,'depost','',600,'2022-04-01 06:10:37','2022-04-01 06:10:37','2022-04-01 06:10:37',0,4,1,1,1),(22,'income','',1000,'2022-04-01 06:10:37','2022-04-01 06:10:37','2022-04-01 06:10:37',0,5,1,1,1),(23,'depost','',100,'2022-03-28 06:10:37','2022-03-28 06:10:37','2022-03-28 06:10:37',0,3,1,1,1),(24,'transfer','',50,'2022-03-15 06:10:37','2022-03-15 06:10:37','2022-03-15 06:10:37',0,2,1,1,1),(25,'home rental','',100,'2022-03-13 06:10:37','2022-03-13 06:10:37','2022-03-13 06:10:37',0,3,3,1,1),(26,'dinner','',100,'2022-03-12 06:10:37','2022-03-12 06:10:37','2022-03-12 06:10:37',0,2,1,1,1),(28,'Lunch with friends','',150,'2022-03-12 06:10:37','2022-03-12 06:10:37','2022-03-12 06:10:37',0,2,1,3,2),(29,'Trip','',1400,'2022-03-14 06:10:37','2022-03-14 06:10:37','2022-03-14 06:10:37',0,3,1,3,2),(30,'Breakfast','',60,'2022-03-20 06:10:37','2022-03-20 06:10:37','2022-03-20 06:10:37',0,2,1,3,2),(31,'Gift for you!','',60,'2022-03-20 06:10:37','2022-03-20 06:10:37','2022-03-20 06:10:37',0,4,1,3,2),(32,'Shopping','',80,'2022-03-21 06:10:37','2022-03-21 06:10:37','2022-03-21 06:10:37',0,5,1,3,2),(33,'Party Dinner','',80,'2022-03-22 06:10:37','2022-03-22 06:10:37','2022-03-22 06:10:37',0,2,1,3,2),(35,'Breakfast','',80,'2022-03-23 06:10:37','2022-03-23 06:10:37','2022-03-23 06:10:37',0,2,1,3,2),(36,'Lunch','',60,'2022-03-23 06:10:37','2022-03-23 06:10:37','2022-03-23 06:10:37',0,2,1,3,2),(37,'Dinner','',60,'2022-03-24 06:10:37','2022-03-24 06:10:37','2022-03-24 06:10:37',0,2,1,3,2),(39,'Flat rental','',2000,'2022-03-20 06:10:37','2022-03-20 06:10:37','2022-03-20 06:10:37',0,9,1,3,2),(40,'Flat rental','',2000,'2022-03-20 06:10:37','2022-03-20 06:10:37','2022-03-20 06:10:37',0,9,2,3,2),(41,'Food','gathering of foodies',200,'2022-03-25 06:10:37','2022-03-25 06:10:37','2022-03-25 06:10:37',0,2,3,3,3),(43,'Let have a drink','Birthday celebaration',400,'2022-03-21 04:19:06','2022-03-21 04:19:06','2022-03-21 04:19:06',0,6,7,3,3),(57,'Gift','Gift for Birthday Boy',400,'2022-04-02 03:41:57','2022-04-02 03:41:57','2022-04-02 03:41:57',0,4,7,3,3);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-06  8:03:58
