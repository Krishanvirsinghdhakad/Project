CREATE DATABASE  IF NOT EXISTS `db_alumni` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_alumni`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_alumni
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumni_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `mesage` varchar(150) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `alumni_id` (`alumni_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`alumni_id`) REFERENCES `tbl_registration` (`uni_id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`uni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatuser`
--

DROP TABLE IF EXISTS `chatuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumni` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatuser`
--

LOCK TABLES `chatuser` WRITE;
/*!40000 ALTER TABLE `chatuser` DISABLE KEYS */;
INSERT INTO `chatuser` VALUES (2,12345677,1234567,'scdc','2022-08-21 00:00:00'),(3,232323,1234567,'vfdvf','2022-08-21 00:00:00'),(4,232323,1234567,'svfdv','2022-08-21 00:00:00'),(5,1122334455,7654321,'svvfvf','2022-08-21 00:00:00'),(6,1122334455,7654321,'Happy','2022-08-21 00:00:00'),(7,1122334455,7654321,'Same','2022-08-21 00:00:00'),(8,1122334455,7654321,'Happy','2022-08-21 00:00:00'),(9,1122334455,7654321,'Hello','2022-08-22 00:00:00');
/*!40000 ALTER TABLE `chatuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Gaurang Sharma','shane@gmail.com','Gaurang'),(2,'Gaurang Sharma','shane@gmail.com','Gaurang'),(3,'Gaurang Sharma','sgaurang500@gmail.com','vv');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate`
--

DROP TABLE IF EXISTS `donate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `donate_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_registration` (`uni_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate`
--

LOCK TABLES `donate` WRITE;
/*!40000 ALTER TABLE `donate` DISABLE KEYS */;
INSERT INTO `donate` VALUES (1,1234567,'112233'),(2,1234567,'112233');
/*!40000 ALTER TABLE `donate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_batch`
--

DROP TABLE IF EXISTS `tbl_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_batch` (
  `batchId` int NOT NULL AUTO_INCREMENT,
  `departmentId` int DEFAULT NULL,
  `batchName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`batchId`),
  UNIQUE KEY `batchId` (`batchId`),
  KEY `departmentId` (`departmentId`),
  CONSTRAINT `tbl_batch_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `tbl_department` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_batch`
--

LOCK TABLES `tbl_batch` WRITE;
/*!40000 ALTER TABLE `tbl_batch` DISABLE KEYS */;
INSERT INTO `tbl_batch` VALUES (1,1,'BATCH1'),(5,5,'Batch3');
/*!40000 ALTER TABLE `tbl_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_department` (
  `departmentId` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`departmentId`),
  UNIQUE KEY `departmentId` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
INSERT INTO `tbl_department` VALUES (1,'ARTS'),(5,'COMMON');
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_education`
--

DROP TABLE IF EXISTS `tbl_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uni_id` int DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `course` varchar(20) DEFAULT NULL,
  `session` varchar(20) DEFAULT NULL,
  `college_name` varchar(150) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `resume` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_education`
--

LOCK TABLES `tbl_education` WRITE;
/*!40000 ALTER TABLE `tbl_education` DISABLE KEYS */;
INSERT INTO `tbl_education` VALUES (1,1234567,'Graduation','MCA','2022-23','Rajabalwant Singh management and technical campus','A',NULL);
/*!40000 ALTER TABLE `tbl_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_event`
--

DROP TABLE IF EXISTS `tbl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `venue` varchar(250) DEFAULT NULL,
  `para1` varchar(500) DEFAULT NULL,
  `para2` varchar(500) DEFAULT NULL,
  `para3` varchar(500) DEFAULT NULL,
  `google_map` varchar(150) DEFAULT NULL,
  `hashtag` varchar(150) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_event`
--

LOCK TABLES `tbl_event` WRITE;
/*!40000 ALTER TABLE `tbl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_news`
--

DROP TABLE IF EXISTS `tbl_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(250) DEFAULT NULL,
  `para1` varchar(250) DEFAULT NULL,
  `para2` varchar(250) DEFAULT NULL,
  `para3` varchar(250) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `views` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_news`
--

LOCK TABLES `tbl_news` WRITE;
/*!40000 ALTER TABLE `tbl_news` DISABLE KEYS */;
INSERT INTO `tbl_news` VALUES (1,'file.png','Para 1','Para 2',NULL,'2022-08-14 00:00:00',1,'Title','3'),(4,'demo.jpg','Para1','Para2','Para3','2022-08-14 00:00:00',1,'Title','1');
/*!40000 ALTER TABLE `tbl_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_profile`
--

DROP TABLE IF EXISTS `tbl_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` varchar(150) DEFAULT NULL,
  `uni_id` int DEFAULT NULL,
  `activity` varchar(150) DEFAULT NULL,
  `hometown` varchar(150) DEFAULT NULL,
  `current_city` varchar(150) DEFAULT NULL,
  `session` varchar(150) DEFAULT NULL,
  `year` year DEFAULT NULL,
  `semester` varchar(150) DEFAULT NULL,
  `present` varchar(150) DEFAULT NULL,
  `permanent` varchar(150) DEFAULT NULL,
  `blood` varchar(150) DEFAULT NULL,
  `school` varchar(150) DEFAULT NULL,
  `spy` varchar(150) DEFAULT NULL,
  `gender` varchar(150) DEFAULT NULL,
  `college` varchar(150) DEFAULT NULL,
  `hpy` varchar(150) DEFAULT NULL,
  `university` varchar(150) DEFAULT NULL,
  `bpy` varchar(150) DEFAULT NULL,
  `muni` varchar(150) DEFAULT NULL,
  `mpy` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `uni_id` (`uni_id`),
  CONSTRAINT `tbl_profile_ibfk_1` FOREIGN KEY (`uni_id`) REFERENCES `tbl_registration` (`uni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_profile`
--

LOCK TABLES `tbl_profile` WRITE;
/*!40000 ALTER TABLE `tbl_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_registration`
--

DROP TABLE IF EXISTS `tbl_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_registration` (
  `uni_id` int NOT NULL AUTO_INCREMENT,
  `departmentId` int DEFAULT NULL,
  `batchId` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `profession` varchar(150) DEFAULT NULL,
  `job` varchar(150) DEFAULT NULL,
  `dob` varchar(150) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `linkedin` varchar(150) DEFAULT NULL,
  `facebook` varchar(150) DEFAULT NULL,
  `twitter` varchar(150) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `power` varchar(50) DEFAULT NULL,
  `payment` int DEFAULT '0',
  `status` int DEFAULT '0',
  PRIMARY KEY (`uni_id`),
  UNIQUE KEY `uni_id` (`uni_id`),
  KEY `departmentId` (`departmentId`),
  KEY `batchId` (`batchId`),
  CONSTRAINT `tbl_registration_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `tbl_department` (`departmentId`),
  CONSTRAINT `tbl_registration_ibfk_2` FOREIGN KEY (`batchId`) REFERENCES `tbl_batch` (`batchId`)
) ENGINE=InnoDB AUTO_INCREMENT=1122334456 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_registration`
--

LOCK TABLES `tbl_registration` WRITE;
/*!40000 ALTER TABLE `tbl_registration` DISABLE KEYS */;
INSERT INTO `tbl_registration` VALUES (232323,1,1,'Gaurang Sharma','Gaurang@123','sgaurang500@gmail.com','9760020349','Student','POSITION','2022/08/01','Agra','','www.facebook.com','','','2022-08-21 00:00:00','STUDENT',0,0),(1234567,1,1,'Gaurang  Sharma                                                                             ','Gaurang@123','sgaurang500@gmail.com','9760020349','Air Steward','POSITION','26/01/19','Agra','','www.facebook.com','','','2022-08-13 00:00:00','ADMIN',0,1),(7654321,1,1,'Demo','Shane@123','shane@gmail.com','9897226480','Student','POSITION','2022/08/01','Agra','','www.facebook.com','','','2022-08-21 00:00:00','STUDENT',0,1),(12345677,1,1,'Shane Xavier','Shane@123','shane@gmail.com','9760020349','Student','POSITION','2000/02/01','Jaipur','','www.facebook.com','','','2022-08-14 00:00:00','ADMIN',1,0),(1122334455,1,1,'Shivam Sharma','Shane@123','shane@gmail.com','9760020349','Student','POSITION','2015/08/13','Agra','','www.facebook.com','','','2022-08-13 00:00:00','ALUMNI',1,1);
/*!40000 ALTER TABLE `tbl_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_slider`
--

DROP TABLE IF EXISTS `tbl_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_slider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `path` varchar(250) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_slider`
--

LOCK TABLES `tbl_slider` WRITE;
/*!40000 ALTER TABLE `tbl_slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_alumni'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-22 20:00:19
