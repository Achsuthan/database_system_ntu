-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
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
-- Table structure for table `group_access_level`
--

DROP TABLE IF EXISTS `group_access_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_access_level` (
  `group_access_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_accepted` tinyint(1) DEFAULT '0',
  `access_level_id` int(11) NOT NULL,
  `spending_group_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  PRIMARY KEY (`group_access_level_id`),
  KEY `fk_group_access_level_access_level_id_idx` (`access_level_id`),
  KEY `fk_group_access_level_spending_group_id_idx` (`spending_group_id`),
  KEY `fk_group_access_level_created_by_idx` (`created_by`),
  KEY `fk_group_access_level_receiver_id_idx` (`receiver_id`),
  CONSTRAINT `fk_group_access_level_access_level_id` FOREIGN KEY (`access_level_id`) REFERENCES `access_level` (`access_level_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_access_level_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_access_level_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_group_access_level_spending_group_id` FOREIGN KEY (`spending_group_id`) REFERENCES `spending_group` (`spending_group_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_access_level`
--

LOCK TABLES `group_access_level` WRITE;
/*!40000 ALTER TABLE `group_access_level` DISABLE KEYS */;
INSERT INTO `group_access_level` VALUES (1,'2022-03-13 00:00:01','2022-03-13 00:00:01',0,1,1,2,3),(2,'2022-03-13 00:00:01','2022-03-13 00:00:01',0,2,2,3,2);
/*!40000 ALTER TABLE `group_access_level` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 22:59:00
