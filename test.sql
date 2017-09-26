CREATE DATABASE  IF NOT EXISTS `landing` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `landing`;
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: landing
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `system_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `docid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Created` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiration_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RFPCategory` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RFPDescription` text COLLATE utf8_unicode_ci,
  `ZipCode` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `City` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sourceurl` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Country` varchar(7) COLLATE utf8_unicode_ci DEFAULT 'Canada',
  `orgname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commodity` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datekey` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ItemID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ItemSourceName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_creator` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Mozenda',
  `system_load_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `system_extract_date` date DEFAULT NULL,
  `system_file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_process_stage` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'New',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-21  3:36:49
