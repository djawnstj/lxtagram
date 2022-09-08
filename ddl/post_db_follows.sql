-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: post_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `fol_id` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(45) NOT NULL,
  `following` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fol_id`),
  KEY `mem_id_idx` (`mem_id`),
  KEY `following_idx` (`following`),
  CONSTRAINT `fol_id` FOREIGN KEY (`mem_id`) REFERENCES `members` (`mem_id`),
  CONSTRAINT `following` FOREIGN KEY (`following`) REFERENCES `members` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (5,'bnb422','youkyung26'),(17,'bnb422','kimmeongmin'),(24,'bnb422','jjebjjeb'),(195,'lx_djawnstj','youkyung26'),(196,'bnb422','banka'),(200,'bnb422','bazzi15'),(201,'bazzi15','asdf'),(202,'bazzi15','kimmeongmin'),(203,'banka','dsafasdf'),(204,'banka','djawnstj1'),(206,'youkyung26','lx_djawnstj'),(207,'banka','dddddddddddddddddddd'),(208,'banka','dasdf'),(209,'banka','kimmeongmin'),(213,'bnb422','lx_djawnstj'),(214,'jjebjjeb','banka'),(217,'jjebjjeb','lx_djawnstj'),(218,'bazzi15','dddddddddddddddddddd'),(220,'banka','jjebjjeb'),(221,'banka','GIS_SUZY'),(222,'banka','youkyung26'),(223,'youkyung26','bnb422'),(226,'bazzi15','banka'),(227,'bazzi15','GIS_SUZY'),(228,'youkyung26','djawnstj1'),(229,'lx_djawnstj','dddddddddddddddddddd'),(233,'ahs1','lx_djawnstj'),(234,'saeruming','bnb422'),(235,'saeruming','banka0909'),(236,'saeruming','djawnstj'),(237,'JESUS','banka0909'),(243,'ds','bnb422'),(244,'ahs1','kimmeongmin'),(245,'ds','dddddddddddddddddddd'),(246,'JESUS','djawnstj1'),(247,'ahs1','bnb422'),(248,'jeb','kimmeongmin'),(249,'bnb422','ahs1');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24  6:28:22
