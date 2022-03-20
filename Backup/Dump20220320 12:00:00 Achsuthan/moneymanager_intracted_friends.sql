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
-- Table structure for table `intracted_friends`
--

DROP TABLE IF EXISTS `intracted_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intracted_friends` (
  `intracted_friends_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  PRIMARY KEY (`intracted_friends_id`),
  KEY `fk_inrracted_friends_sender_id_idx` (`sender_id`),
  KEY `fk_intracted_friends_receiver_id_idx` (`receiver_id`),
  CONSTRAINT `fk_inrracted_friends_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_intracted_friends_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intracted_friends`
--

LOCK TABLES `intracted_friends` WRITE;
/*!40000 ALTER TABLE `intracted_friends` DISABLE KEYS */;
INSERT INTO `intracted_friends` VALUES (1,2,1),(2,3,3),(3,2,2),(4,3,2),(5,1,2),(6,2,2),(7,4,7),(8,5,7),(9,6,7),(10,2,1),(11,1,2),(12,1,3),(13,1,4),(14,1,5),(15,1,2),(16,1,3),(17,1,4),(18,1,6),(19,1,10),(20,1,12),(21,1,11),(22,1,2),(23,1,3),(24,1,4),(25,1,5),(26,1,6),(27,1,2),(28,1,3),(29,1,4),(30,1,2),(31,1,3),(32,1,4),(33,1,4),(34,1,2),(35,1,3),(36,1,4),(37,1,5),(38,1,2),(39,1,3),(40,1,4),(41,1,2),(42,1,3),(43,1,4),(44,1,2),(45,1,3),(46,1,4),(47,1,5),(48,2,1),(49,2,3),(50,2,4),(51,2,5),(52,3,1),(53,3,2),(54,3,3),(55,3,5);
/*!40000 ALTER TABLE `intracted_friends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 11:29:03
