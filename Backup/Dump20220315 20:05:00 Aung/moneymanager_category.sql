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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(64) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `colour` varchar(64) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_category_created_by_idx` (`created_by`),
  CONSTRAINT `fk_category_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Food','mdi-food','2022-03-13 00:00:01','2022-03-13 00:00:01','#34568B',NULL),(3,'Loan','mdi-home-city-outline','2022-03-13 00:00:01','2022-03-13 00:00:01','#5B5EA6',NULL),(4,'Gifts','mdi-gift-open','2022-03-13 00:00:01','2022-03-13 00:00:01','#DFCFBE',NULL),(5,'Dress','mdi-hanger','2022-03-13 00:00:01','2022-03-13 00:00:01','#7FCDCD',NULL),(6,'Drink','mdi-glass-cocktail','2022-03-13 00:00:01','2022-03-13 00:00:01','#FF6F61',NULL),(7,'Income','mdi-cash','2022-03-13 00:00:01','2022-03-13 00:00:01','#88B04B',NULL),(8,'Expenses','mdi-cash','2022-03-13 00:00:01','2022-03-13 00:00:01','#DD4124',NULL),(9,'Transfer','mdi-bank-transfer','2022-03-13 00:00:01','2022-03-13 00:00:01','#955251',NULL),(10,'Sports','mdi-basketball','2022-03-13 00:00:01','2022-03-13 00:00:01','#B565A7',NULL),(11,'Studies','mdi-school','2022-03-13 00:00:01','2022-03-13 00:00:01','#D65076',NULL),(12,'Cinema','mdi-theater','2022-03-13 00:00:01','2022-03-13 00:00:01','#45B8AC',NULL),(13,'Travel','mdi-train-car','2022-03-13 00:00:01','2022-03-13 00:00:01','#EFC050',NULL),(16,'test','test','2022-03-13 05:39:43','2022-03-13 05:39:43',NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-15 20:03:15
