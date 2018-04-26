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
-- Table structure for table `bus_ticket`
--

DROP TABLE IF EXISTS `bus_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_type` enum('customer','ticket_seller') NOT NULL,
  `ticket_price` float NOT NULL,
  `bus_seat_sid` int(11) DEFAULT NULL,
  `payment_pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `bus_seat_sid_idx` (`bus_seat_sid`),
  KEY `payment_pid_idx` (`payment_pid`),
  CONSTRAINT `bus_seat_sid` FOREIGN KEY (`bus_seat_sid`) REFERENCES `bus_seat` (`seat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_pid` FOREIGN KEY (`payment_pid`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_ticket`
--

LOCK TABLES `bus_ticket` WRITE;
/*!40000 ALTER TABLE `bus_ticket` DISABLE KEYS */;
INSERT INTO `bus_ticket` VALUES (17,'customer',400,452,15),(18,'customer',400,456,16),(19,'customer',400,457,16),(20,'customer',400,456,17),(21,'customer',400,457,17),(22,'customer',400,456,18),(23,'customer',400,457,18),(24,'customer',400,456,19),(25,'customer',400,457,19),(26,'customer',400,466,20),(27,'customer',400,467,20),(28,'customer',400,466,21),(29,'customer',400,467,21),(30,'customer',400,466,22),(31,'customer',400,467,22),(32,'customer',400,466,23),(33,'customer',400,467,23),(34,'customer',400,466,24),(35,'customer',400,467,24),(36,'customer',400,466,25),(37,'customer',400,467,25),(38,'customer',400,466,26),(39,'customer',400,467,26),(40,'customer',400,472,27),(41,'customer',400,473,27),(42,'customer',400,454,28),(43,'customer',400,455,28),(44,'customer',400,430,29),(45,'customer',400,431,29),(46,'customer',400,430,30),(47,'customer',400,431,30);
/*!40000 ALTER TABLE `bus_ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-26 21:02:39
