-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: lib
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_name` varchar(100) NOT NULL,
  `bio` text,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'J.K.Rowling','Author of the Harry Potter series'),(2,'Issac Asimov','Science fiction author and professor  of biochemistry'),(3,'Yuval Naoh Harari','Historian and author of Saoiens'),(4,'Walter Isaacson','Biographer of famous personalities'),(5,'Dan Brown','Author of thriller novels like The Da Vinci Code');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `b_author`
--

DROP TABLE IF EXISTS `b_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `b_author` (
  `b_id` int NOT NULL,
  `a_id` int NOT NULL,
  PRIMARY KEY (`b_id`,`a_id`),
  KEY `a_id` (`a_id`),
  CONSTRAINT `b_author_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `book` (`b_id`),
  CONSTRAINT `b_author_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `author` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `b_author`
--

LOCK TABLES `b_author` WRITE;
/*!40000 ALTER TABLE `b_author` DISABLE KEYS */;
INSERT INTO `b_author` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `b_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `p_id` int DEFAULT NULL,
  `year` year DEFAULT NULL,
  `c_id` int DEFAULT NULL,
  `copies` int DEFAULT '1',
  PRIMARY KEY (`b_id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `p_id` (`p_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `publisher` (`p_id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Harry Potter and the Philosopher\'s Stone','9780747532743',1,1997,1,5),(2,'Foundation','9785486287569',2,1951,2,3),(3,'Sapiens:ABrief History of Humankind','9854632175982',3,1987,3,4),(4,'Steve Jobs','9578124536987',4,1999,4,2),(5,'The Da Vinci Code','9271365417892',5,2003,5,5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `m_id` int DEFAULT NULL,
  `dt_borrow` date NOT NULL,
  `dt_due` date DEFAULT NULL,
  `dt_return` date DEFAULT NULL,
  `fine` decimal(8,2) DEFAULT '0.00',
  PRIMARY KEY (`b_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `members` (`m_id`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `book` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,1,'2024-03-22','2024-04-22','2024-04-21',0.00),(2,2,'2024-08-10','2024-09-10','2024-09-20',100.00);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `c_name` (`c_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,'biography'),(1,'fiction'),(3,'history'),(2,'science'),(4,'technology');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_name` varbinary(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `j_dt` date DEFAULT NULL,
  `e_dt` date DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,_binary 'Alice Johnson','123 Main St','alice@gmail.com','2023-01-15','2026-01-15'),(2,_binary 'Bob','789 Sub St','bob@gmail.com','2020-02-02','2024-02-02'),(3,_binary 'Caroline','675 Park St','caroline22@gmail.com','2023-01-09','2027-01-09'),(4,_binary 'David','345 Silver St','david@gmail.com','2021-12-23','2025-12-23'),(5,_binary 'Elsa','224 Castle St','elsa@gmail.com','2022-11-24','2027-11-24');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Bloomsbuey Publishing'),(2,'Penguin Random House'),(3,'HarperCollins'),(4,'Oxford University Press'),(5,'Simon & Schuster');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) NOT NULL,
  `s_role` varchar(100) DEFAULT NULL,
  `h_dt` date DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Aura','Librarian','2020-01-01'),(2,'Harry','Assistant Librarian','2020-03-12');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-14 13:40:47
