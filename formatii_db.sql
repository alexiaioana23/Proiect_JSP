CREATE DATABASE  IF NOT EXISTS `formatii_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `formatii_db`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: formatii_db
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '2b3b113a-d2a3-11f0-af56-088fc3853646:1-98';

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `idcontract` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idformatie` bigint unsigned NOT NULL,
  `idmembru` bigint unsigned NOT NULL,
  `data_inceput` date DEFAULT NULL,
  `data_sfarsit` date DEFAULT NULL,
  `status_contract` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcontract`),
  KEY `FK1` (`idformatie`),
  KEY `FK2` (`idmembru`),
  CONSTRAINT `FK1` FOREIGN KEY (`idformatie`) REFERENCES `formatii` (`idformatie`) ON DELETE CASCADE,
  CONSTRAINT `FK2` FOREIGN KEY (`idmembru`) REFERENCES `membri` (`idmembru`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (20,5,3,'1996-01-01','0001-01-01','Activ'),(21,6,4,'1981-01-01','0001-01-01','Activ'),(22,7,6,'2008-01-01','0001-01-01','Activ'),(23,9,7,'1970-01-01','1991-11-24','Incheiat'),(24,9,8,'1970-01-01','0001-01-01','Activ'),(25,8,9,'2013-06-13','0001-01-01','Activ'),(26,8,10,'2013-06-13','0001-01-01','Activ'),(27,10,11,'1972-01-01','1982-12-31','Incheiat'),(28,10,12,'1972-01-01','1982-12-31','Incheiat');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatii`
--

DROP TABLE IF EXISTS `formatii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formatii` (
  `idformatie` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(100) NOT NULL,
  `gen_muzical` varchar(50) DEFAULT NULL,
  `an_infiintare` int DEFAULT NULL,
  `tara_origine` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idformatie`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatii`
--

LOCK TABLES `formatii` WRITE;
/*!40000 ALTER TABLE `formatii` DISABLE KEYS */;
INSERT INTO `formatii` VALUES (5,'Coldplay','Alternative Rock',1996,'Marea Britanie'),(6,'Metallica','Heavy Metal',1981,'SUA'),(7,'Imagine Dragons','Pop Rock',2008,'SUA'),(8,'BTS','K-Pop',2013,'Coreea de Sud'),(9,'Queen','Rock',1970,'Marea Britanie'),(10,'ABBA','Pop',1972,'Suedia');
/*!40000 ALTER TABLE `formatii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membri`
--

DROP TABLE IF EXISTS `membri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membri` (
  `idmembru` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(50) NOT NULL,
  `prenume` varchar(50) NOT NULL,
  `varsta` int DEFAULT NULL,
  `instrument` varchar(50) DEFAULT NULL,
  `nationalitate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmembru`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membri`
--

LOCK TABLES `membri` WRITE;
/*!40000 ALTER TABLE `membri` DISABLE KEYS */;
INSERT INTO `membri` VALUES (3,'Martin','Chris',47,'Voce / Pian','BritanicÄ'),(4,'Hetfield','James',61,'ChitarÄ','AmericanÄ'),(5,'Ulrich','Lars',60,'Tobe','DanezÄ'),(6,'Reynolds','Dan',36,'Voce','AmericanÄ'),(7,'Mercury','Freddie',45,'Voce','BritanicÄ'),(8,'May','Brian',76,'ChitarÄ','BritanicÄ'),(9,'Jimin','Park',29,'Voce','Sud-coreeanÄ'),(10,'Jungkook','Jeon',27,'Voce','Sud-coreeanÄ'),(11,'Andersson','Benny',77,'Pian','SuedezÄ'),(12,'Agnetha','FÃ¤ltskog',74,'Voce','SuedezÄ'),(13,'Nedelcu','Alexia',21,'Voce','Britanica');
/*!40000 ALTER TABLE `membri` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12 19:34:46
