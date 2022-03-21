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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `salt` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `idx_user_email` (`email`),
  KEY `fk_user_currency_id_idx` (`currency_id`),
  KEY `idx_user_name` (`name`),
  CONSTRAINT `fk_user_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'achsuthan@gmail.com','Achsuthan','some salt','some password','2022-03-12 00:00:01','2022-03-12 00:00:01',1),(2,'aung@gmail.com','Aung Kyaw Thant','some salt for aung','some password for aung','2022-03-12 00:00:01','2022-03-12 00:00:01',1),(3,'yuyu@gmail.com','Yu Yu Lwin','some salt for Yu Yu','some password for yu yu','2022-03-12 00:00:01','2022-03-12 00:00:01',1),(4,'senthuran@gmail.com','Senthuran','some salt for senthuran','some password for senthuran','2022-03-19 00:00:01','2022-03-19 00:00:01',1),(5,'jhon@gmail.com','Jhon','some salt Jhon','Some password for Jhon','2022-03-19 00:00:01','2022-03-19 00:00:01',1),(6,'ram@gmail.com','Ram','some salt for Ram','some password for ram','2022-03-14 00:00:01','2022-03-13 00:00:01',1),(7,'peter@gmail.com','Peter','some salt for Peter','some password for peter','2022-03-10 00:00:01','2022-03-10 00:00:01',1),(8,'hung@gmail.com','Hung','some salt for Hung','some password for Hung','2022-03-06 00:00:01','2022-03-06 00:00:01',1),(9,'suhas@gmail.com','Suhas','some salt for Suhas','some password for Suhas','2022-03-08 00:00:01','2022-03-09 00:00:01',1),(10,'thabib@gmail.com','Thabib','some salt for thabib','some password for thabib','2022-03-10 00:00:01','2022-03-10 00:00:01',1),(11,'thony@gmail.com','Tony','some salt for tony','some password for tony','2022-03-16 00:00:01','2022-03-16 00:00:01',1),(12,'jenson@gmail.com','JEnson','some salt for jenson','some password for jenson','2022-03-16 00:00:01','2022-03-16 00:00:01',1),(13,'boon@gmail.com','Boon','some salt for Boon','some password for bpon','2022-03-16 00:00:01','2022-03-16 00:00:01',1),(14,'stanly@gmail.com','Stanly','some salt for stanly','some password for stanly','2022-03-18 00:00:01','2022-03-18 00:00:01',1),(15,'karthik@gmail.com','Karthik','some salt for karthik','some password for karthik','2022-03-21 00:00:01','2022-03-21 00:00:01',1),(16,'aungkyawthant@gmail.com','AKT','salted pwd','pwd','2022-03-21 22:59:22','2022-03-21 22:59:22',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`mysqladmin`@`%`*/ /*!50003 TRIGGER `moneymanager`.`user_AFTER_INSERT` AFTER INSERT ON `user` FOR EACH ROW
BEGIN
		DELETE I FROM invite as I WHERE I.email = NEW.email;
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

-- Dump completed on 2022-03-22  7:13:37
