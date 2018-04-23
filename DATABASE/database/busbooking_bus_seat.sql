-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: busbooking
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bus_seat`
--

DROP TABLE IF EXISTS `bus_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_number` int(11) NOT NULL,
  `seat_available` bit(1) NOT NULL DEFAULT b'0',
  `route_rid` int(11) NOT NULL,
  `bus_bid` int(11) NOT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `route_rid_idx` (`route_rid`),
  KEY `bus_bid2_idx` (`bus_bid`),
  CONSTRAINT `bus_bid2` FOREIGN KEY (`bus_bid`) REFERENCES `bus` (`bus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `route_rid` FOREIGN KEY (`route_rid`) REFERENCES `bus_table` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_seat`
--

LOCK TABLES `bus_seat` WRITE;
/*!40000 ALTER TABLE `bus_seat` DISABLE KEYS */;
INSERT INTO `bus_seat` VALUES (31,1,'\0',27,2),(32,2,'\0',27,2),(33,3,'\0',27,2),(34,4,'\0',27,2),(35,5,'\0',27,2),(36,6,'\0',27,2),(37,7,'\0',27,2),(38,8,'\0',27,2),(39,9,'\0',27,2),(40,10,'\0',27,2),(41,11,'\0',27,2),(42,12,'\0',27,2),(43,13,'\0',27,2),(44,14,'\0',27,2),(45,15,'\0',27,2),(46,16,'\0',27,2),(47,17,'\0',27,2),(48,18,'\0',27,2),(49,19,'\0',27,2),(50,20,'\0',27,2),(51,21,'\0',27,2),(52,22,'\0',27,2),(53,23,'\0',27,2),(54,24,'\0',27,2),(55,25,'\0',27,2),(56,26,'\0',27,2),(57,27,'\0',27,2),(58,28,'\0',27,2),(59,29,'\0',27,2),(60,30,'\0',27,2),(61,1,'\0',28,3),(62,2,'\0',28,3),(63,3,'\0',28,3),(64,4,'\0',28,3),(65,5,'\0',28,3),(66,6,'\0',28,3),(67,7,'\0',28,3),(68,8,'\0',28,3),(69,9,'\0',28,3),(70,10,'\0',28,3),(71,11,'\0',28,3),(72,12,'\0',28,3),(73,13,'\0',28,3),(74,14,'\0',28,3),(75,15,'\0',28,3),(76,16,'\0',28,3),(77,17,'\0',28,3),(78,18,'\0',28,3),(79,19,'\0',28,3),(80,20,'\0',28,3),(81,21,'\0',28,3),(82,22,'\0',28,3),(83,23,'\0',28,3),(84,24,'\0',28,3),(85,25,'\0',28,3),(86,26,'\0',28,3),(87,27,'\0',28,3),(88,28,'\0',28,3),(89,29,'\0',28,3),(90,30,'\0',28,3),(91,31,'\0',28,3),(92,32,'\0',28,3),(93,33,'\0',28,3),(94,34,'\0',28,3),(95,35,'\0',28,3),(96,36,'\0',28,3),(97,37,'\0',28,3),(98,38,'\0',28,3),(99,39,'\0',28,3),(100,40,'\0',28,3),(101,41,'\0',28,3),(102,42,'\0',28,3),(103,43,'\0',28,3),(104,44,'\0',28,3),(105,45,'\0',28,3),(106,46,'\0',28,3),(107,47,'\0',28,3),(108,48,'\0',28,3),(109,49,'\0',28,3),(110,50,'\0',28,3);
/*!40000 ALTER TABLE `bus_seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-23 17:30:06
