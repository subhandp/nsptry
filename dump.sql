-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

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
-- Table structure for table `duty_off`
--

DROP TABLE IF EXISTS `duty_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duty_off` (
  `duty_off_id` int(11) NOT NULL AUTO_INCREMENT,
  `duty_off_name_kind` varchar(15) NOT NULL,
  PRIMARY KEY (`duty_off_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duty_off`
--

LOCK TABLES `duty_off` WRITE;
/*!40000 ALTER TABLE `duty_off` DISABLE KEYS */;
INSERT INTO `duty_off` VALUES (1,'libur'),(2,'cuti-pribadi'),(3,'cuti-hamil'),(4,'cuti-melahirkan');
/*!40000 ALTER TABLE `duty_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `nurse_id` int(11) NOT NULL AUTO_INCREMENT,
  `nurse_name` varchar(25) NOT NULL,
  `nurse_officer_id` int(11) NOT NULL,
  PRIMARY KEY (`nurse_id`),
  KEY `nurse_officer_id` (`nurse_officer_id`),
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`nurse_officer_id`) REFERENCES `nurse_officer` (`nurse_officer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (41,'asna',1),(42,'sang ayu',2),(43,'helphin',3),(44,'tendri',3),(45,'novianti',4),(46,'rina',4),(47,'rebecca',4),(48,'eka nurzam',4),(49,'musdalifa',4),(50,'suriani',4),(51,'yuliani',3),(52,'ni nyoman',2),(53,'oktavia',3),(54,'indah rahmiya',3),(55,'linda',3),(56,'ervina',3),(57,'nurlela',4),(58,'dian sari',4),(59,'nurhaya',4),(60,'susi nurhayati',4),(61,'zenab',3),(62,'ervita',4),(63,'imas',4),(64,'ni ketut purnama',4),(65,'novianti',3);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_officer`
--

DROP TABLE IF EXISTS `nurse_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse_officer` (
  `nurse_officer_id` int(11) NOT NULL AUTO_INCREMENT,
  `nurse_officer_kind` varchar(20) NOT NULL,
  PRIMARY KEY (`nurse_officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_officer`
--

LOCK TABLES `nurse_officer` WRITE;
/*!40000 ALTER TABLE `nurse_officer` DISABLE KEYS */;
INSERT INTO `nurse_officer` VALUES (1,'kepala-ruangan'),(2,'ketua-tim'),(3,'senior'),(4,'junior'),(5,'exe');
/*!40000 ALTER TABLE `nurse_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_kind` varchar(20) NOT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'pagi(p)'),(2,'sore(s)'),(3,'malam(m)');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-12 22:42:39
