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
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_seat`
--

LOCK TABLES `bus_seat` WRITE;
/*!40000 ALTER TABLE `bus_seat` DISABLE KEYS */;
INSERT INTO `bus_seat` VALUES (424,1,'\0',45,3),(425,2,'\0',45,3),(426,3,'\0',45,3),(427,4,'\0',45,3),(428,5,'\0',45,3),(429,6,'\0',45,3),(430,7,'',45,3),(431,8,'',45,3),(432,9,'',45,3),(433,10,'',45,3),(434,11,'\0',45,3),(435,12,'\0',45,3),(436,13,'',45,3),(437,14,'',45,3),(438,15,'\0',45,3),(439,16,'\0',45,3),(440,17,'',45,3),(441,18,'',45,3),(442,19,'\0',45,3),(443,20,'\0',45,3),(444,21,'\0',45,3),(445,22,'\0',45,3),(446,23,'\0',45,3),(447,24,'\0',45,3),(448,25,'\0',45,3),(449,26,'\0',45,3),(450,27,'',45,3),(451,28,'',45,3),(452,29,'',45,3),(453,30,'\0',45,3),(454,31,'',45,3),(455,32,'',45,3),(456,33,'',45,3),(457,34,'',45,3),(458,35,'\0',45,3),(459,36,'\0',45,3),(460,37,'\0',45,3),(461,38,'\0',45,3),(462,39,'\0',45,3),(463,40,'\0',45,3),(464,41,'\0',45,3),(465,42,'\0',45,3),(466,43,'',45,3),(467,44,'',45,3),(468,45,'\0',45,3),(469,46,'\0',45,3),(470,47,'\0',45,3),(471,48,'\0',45,3),(472,49,'',45,3),(473,50,'',45,3),(474,51,'\0',45,3),(475,52,'\0',45,3),(476,1,'\0',46,2),(477,2,'\0',46,2),(478,3,'\0',46,2),(479,4,'\0',46,2),(480,5,'\0',46,2),(481,6,'\0',46,2),(482,7,'\0',46,2),(483,8,'\0',46,2),(484,9,'\0',46,2),(485,10,'\0',46,2),(486,11,'\0',46,2),(487,12,'\0',46,2),(488,13,'',46,2),(489,14,'',46,2),(490,15,'\0',46,2),(491,16,'\0',46,2),(492,17,'',46,2),(493,18,'',46,2),(494,19,'\0',46,2),(495,20,'\0',46,2),(496,21,'\0',46,2),(497,22,'\0',46,2),(498,23,'\0',46,2),(499,24,'\0',46,2),(500,25,'\0',46,2),(501,26,'\0',46,2),(502,27,'\0',46,2),(503,28,'\0',46,2),(504,29,'\0',46,2),(505,30,'\0',46,2),(506,31,'\0',46,2),(507,32,'\0',46,2);
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

-- Dump completed on 2018-04-26 21:02:40
