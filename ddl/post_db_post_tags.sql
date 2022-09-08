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
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `post_tag_id` int NOT NULL AUTO_INCREMENT,
  `post_tag` varchar(45) NOT NULL,
  `post_no` int NOT NULL,
  PRIMARY KEY (`post_tag_id`),
  KEY `post_num_idx` (`post_no`),
  CONSTRAINT `post_no` FOREIGN KEY (`post_no`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (12,'해바라기',26),(13,'야호',28),(16,'주소',41),(17,'태그',46),(18,'태그',47),(19,'태그',47),(20,'태그',48),(21,'태그',48),(22,'태그',48),(23,'태그',49),(24,'태그',49),(25,'태그',49),(26,'태그',49),(27,'태그',50),(28,'태그',50),(29,'태그',50),(30,'태그',50),(31,'태그',50),(32,'태그',51),(33,'태그',51),(34,'태그',51),(35,'태그',51),(36,'태그',51),(37,'태그',51),(38,'태그',52),(39,'태그',52),(40,'태그',52),(41,'태그',52),(42,'태그',52),(43,'태그',52),(44,'태그',52),(47,'오리',57),(48,'슈퍼맨',57),(49,'연극',60),(50,'아름다운사람들',60),(51,'남서울대학교',60),(52,'lx',60),(53,'동물병원',62),(55,'lx아카데미',64),(56,'공간정보아카데미',65),(57,'공간정보아카데미',66),(59,'휴식',68);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
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
