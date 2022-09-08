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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(200) NOT NULL,
  `post_id` int NOT NULL,
  `com_mem` varchar(45) NOT NULL,
  `com_time` varchar(45) NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `com_id_idx` (`com_mem`),
  KEY `post_id_idx` (`post_id`),
  CONSTRAINT `com_mem` FOREIGN KEY (`com_mem`) REFERENCES `members` (`mem_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 16시 54분 08초'),(2,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 16시 58분 56초'),(3,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 03분 49초'),(4,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 06분 22초'),(5,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 07분 43초'),(6,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 10분 07초'),(7,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 11분 07초'),(8,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 12분 22초'),(9,'루피야 너무 귀엽다',26,'lx_djawnstj','2021년 09월 16일 17시 12분 29초'),(10,'4조 화이팅!',26,'lx_djawnstj','2021년 09월 16일 23시 27분 49초'),(13,'댓글 테스트',28,'lx_djawnstj','2021년 09월 17일 11시 14분 05초'),(14,'테스트',28,'lx_djawnstj','2021년 09월 17일 11시 14분 51초'),(15,'댓글',27,'lx_djawnstj','2021년 09월 17일 11시 15분 09초'),(16,'댓글 테스트',27,'lx_djawnstj','2021년 09월 17일 11시 19분 28초'),(17,'댓글',27,'lx_djawnstj','2021년 09월 17일 11시 23분 19초'),(18,'댓글',27,'lx_djawnstj','2021년 09월 17일 11시 26분 00초'),(19,'댓글',27,'lx_djawnstj','2021년 09월 17일 11시 27분 49초'),(20,'테스트',27,'lx_djawnstj','2021년 09월 17일 11시 33분 46초'),(21,'',27,'lx_djawnstj','2021년 09월 17일 11시 37분 17초'),(22,'댓글',26,'lx_djawnstj','2021년 09월 17일 12시 05분 03초'),(23,'와 루피야 ~~ ',26,'youkyung26','2021년 09월 17일 15시 01분 08초'),(24,'유경아 뭐해',28,'jjebjjeb','2021년 09월 17일 15시 01분 21초'),(27,'루피야..사랑해...',26,'jjebjjeb','2021년 09월 17일 22시 34분 43초'),(28,'화이팅',41,'bnb422','2021년 09월 18일 08시 55분 15초'),(29,'테스트',41,'lx_djawnstj','2021년 09월 18일 11시 44분 41초'),(30,'테스트',41,'lx_djawnstj','2021년 09월 18일 11시 46분 37초'),(31,'댓글',32,'lx_djawnstj','2021년 09월 19일 12시 51분 44초'),(33,'공정아',66,'lx_djawnstj','2021년 09월 23일 16시 23분 32초'),(34,'머리부터 발끝까지 다 사랑스러워~ ',30,'bazzi15','2021년 09월 23일 16시 29분 00초'),(35,'ddd',60,'youkyung26','2021년 09월 23일 22시 41분 19초'),(36,'무뚝뚝하던 내가 종일 싱글벙글 웃잖아 ',59,'bazzi15','2021년 09월 23일 22시 55분 49초'),(37,'대체 내게 무슨 짓을 한거야~',62,'bazzi15','2021년 09월 23일 22시 56분 15초'),(38,'퍼가요~♥',78,'ahs1','2021년 09월 24일 05시 37분 47초'),(39,'퍼가요~♥',78,'ahs1','2021년 09월 24일 05시 37분 53초'),(40,'좋아요~♥',78,'ahs1','2021년 09월 24일 05시 38분 00초'),(41,'좋아요~♥',78,'ahs1','2021년 09월 24일 05시 38분 05초'),(42,'좋아요',70,'JESUS','2021년 09월 24일 05시 39분 54초'),(43,'하이',66,'saeruming','2021년 09월 24일 05시 40분 07초'),(44,'하이',66,'saeruming','2021년 09월 24일 05시 40분 10초'),(45,'하이',66,'saeruming','2021년 09월 24일 05시 40분 12초'),(46,'하이',66,'saeruming','2021년 09월 24일 05시 40분 12초'),(47,'하이',66,'saeruming','2021년 09월 24일 05시 40분 12초'),(48,'하이',66,'saeruming','2021년 09월 24일 05시 40분 13초'),(49,'소통해요',65,'saeruming','2021년 09월 24일 05시 40분 49초'),(50,'댓글 테스트',60,'lx_djawnstj','2021년 10월 14일 17시 11분 13초'),(51,'댓글 테스트',60,'lx_djawnstj','2021년 10월 14일 17시 11분 15초'),(52,'오랜만~',60,'hong','2022년 03월 01일 12시 46분 06초'),(53,'퍼가요~',78,'soyoon','2022년 03월 01일 12시 46분 39초'),(54,'퍼가요~',78,'soyoon','2022년 03월 01일 12시 46분 41초');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
