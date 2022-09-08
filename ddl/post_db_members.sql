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
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `mem_id` varchar(20) NOT NULL,
  `mem_pw` varchar(45) NOT NULL,
  `mem_phone` varchar(45) NOT NULL,
  `mem_name` varchar(15) NOT NULL,
  `mem_email` varchar(100) NOT NULL,
  `mem_introduce` varchar(50) DEFAULT NULL,
  `mem_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('aa','aa','11','aa','aa',NULL,'resources/img/non-profile.png'),('ahs1','1234','01048590828','an','ahs1@naver.com',NULL,'resources/img/non-profile.png'),('asdf','asdf','asdf','asdf','asdf','resources/img/non-profile.png','resources/img/non-profile.png'),('banka','123123','01020002000','이준성','banka0909@naver.com','ㅋㅋㅋ','resources/img/non-profile.png'),('banka0909','111','01010001000','js','wnstjd099@naver.com',NULL,'resources/img/non-profile.png'),('bazzi15','12345','01039081345','리건우','bazzi15@naver.com','','resources/img/non-profile.png'),('bnb422','Song0301!','01074672942','송승환','bnb422@naver.com','안녕하세요','resources/img/non-profile.png'),('dasdf','asdf','asdf','asdf','asdf','','resources/img/non-profile.png'),('DD','D','DD','WJDDMSDMSWLS','DDD',NULL,'resources/img/non-profile.png'),('dddddddddddddddddddd','123','djawnstj','djawnstj','djawnstj','','resources/img/non-profile.png'),('djawnstj','123','0101010','djawnstj','42342314624534',NULL,'resources/img/non-profile.png'),('djawnstj1','123','01010101','djawnstj1','lx_dja@naver.com',NULL,'resources/img/non-profile.png'),('ds','ds','ds','ds','ds',NULL,'resources/img/non-profile.png'),('dsafasdf','ddddddd','dsfd2343234234234234324123423452','asdfasdfasd','42342314624534','','resources/img/non-profile.png'),('GIS_SUZY','dbrud2720','01052350326','수지','chldbrud2720@gmail.com','','resources/img/non-profile.png'),('hong','11','1111','홍길동1','1111',NULL,'resources/img/non-profile.png'),('jeb','jeb','jeb','정은빈','jeb@naver.com',NULL,'resources/img/non-profile.png'),('JESUS','1234','111111','예수님','jesusisking@heaven.com',NULL,'resources/img/non-profile.png'),('jjebjjeb','980516','010-1998-0516','','jjebjjeb@bae.gopa','','resources/img/non-profile.png'),('kimmeongmin','980602','010-1998-0602','도시과 아이유','kimmeongmin@urban.iu','','resources/img/non-profile.png'),('lx_djawnstj','123','010-1111-1111','엄준TJ','lx_dja@naver.com','엄준서소개','resources/profileImg/20210921160020_879317.png'),('qwer','qwer','qwer','qwer','qwer',NULL,'resources/img/non-profile.png'),('saeruming','123','0102222222','정새롬','saerom@naver.com',NULL,'resources/img/non-profile.png'),('soyoon','alswl0727@','0100000000','박소윤','soyoon@aaa',NULL,'resources/img/non-profile.png'),('youkyung26','dbrud2720','01052350326','','chldbrud2720@gmail.com','안녕안녕 나는 유경이','resources/img/non-profile.png'),('zz','zz','zz','zz','zz',NULL,'resources/img/non-profile.png'),('ㅁㄴㅇㄹ','ㅁsdf','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ','ㅁㄴㅇㄹ','','resources/img/non-profile.png');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
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
