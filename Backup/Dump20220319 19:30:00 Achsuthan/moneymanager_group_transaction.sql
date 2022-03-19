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
-- Table structure for table `group_transaction`
--

DROP TABLE IF EXISTS `group_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_transaction` (
  `group_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `createddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sender_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) NOT NULL,
  `shared_transaction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`group_transaction_id`),
  KEY `fk_group_transaction_sender_id_idx` (`sender_id`),
  KEY `fk_group_transaction_transaction_id_idx` (`transaction_id`),
  KEY `fk_group_transaction_shared_transaction_id_idx` (`shared_transaction_id`),
  KEY `fk_group_transaction_group_id_idx` (`group_id`),
  CONSTRAINT `fk_group_transaction_group_id` FOREIGN KEY (`group_id`) REFERENCES `spending_group` (`spending_group_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_transaction_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_group_transaction_shared_transaction_id` FOREIGN KEY (`shared_transaction_id`) REFERENCES `shared_transaction` (`shared_transaction_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_transaction_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_transaction`
--

LOCK TABLES `group_transaction` WRITE;
/*!40000 ALTER TABLE `group_transaction` DISABLE KEYS */;
INSERT INTO `group_transaction` VALUES (1,'2022-03-15 06:15:28','2022-03-15 06:15:28',2,1,1,1),(2,'2022-03-15 06:15:29','2022-03-15 06:15:29',3,1,2,1),(7,'2022-03-19 11:01:41','2022-03-19 11:01:41',3,10,6,4),(8,'2022-03-19 11:01:41','2022-03-19 11:01:41',1,10,7,4),(9,'2022-03-19 11:01:41','2022-03-19 11:01:41',2,10,8,4);
/*!40000 ALTER TABLE `group_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-19 19:27:02
