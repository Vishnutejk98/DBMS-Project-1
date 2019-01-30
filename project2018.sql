CREATE DATABASE  IF NOT EXISTS `database_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `database_project`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: database_project
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `eid` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin','admin'),(2,'admin1','admin1','admin1'),(3,'admin2','admin2','admin2'),(4,'admin3','admin3','admin3');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `cid` int(3) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(300) DEFAULT NULL,
  `credits` int(3) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `course_name` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'cs',4,500);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseoffering`
--

DROP TABLE IF EXISTS `courseoffering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courseoffering` (
  `course_id` int(3) DEFAULT NULL,
  `section_id` int(3) NOT NULL AUTO_INCREMENT,
  `no_of_students_enrolled` int(3) DEFAULT NULL,
  `no_of_students_waitlist` int(3) DEFAULT NULL,
  `building_num` int(3) DEFAULT NULL,
  `room` int(3) DEFAULT NULL,
  `enrollementlastdate` date DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `course_id` (`course_id`),
  KEY `building_num` (`building_num`,`room`),
  CONSTRAINT `courseoffering_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`cid`) ON DELETE CASCADE,
  CONSTRAINT `courseoffering_ibfk_3` FOREIGN KEY (`building_num`, `room`) REFERENCES `location` (`building_num`, `room`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseoffering`
--

LOCK TABLES `courseoffering` WRITE;
/*!40000 ALTER TABLE `courseoffering` DISABLE KEYS */;
INSERT INTO `courseoffering` VALUES (1,1,0,4,1,1,'2018-07-04');
/*!40000 ALTER TABLE `courseoffering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `enroll` (
  `student_id` int(3) DEFAULT NULL,
  `course_id` int(3) DEFAULT NULL,
  `section_id` int(3) DEFAULT NULL,
  `credits` int(3) DEFAULT NULL,
  `grade` varchar(3) DEFAULT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`cid`) ON DELETE CASCADE,
  CONSTRAINT `enroll_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `courseoffering` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (4,1,1,NULL,NULL),(6,1,1,NULL,NULL),(7,1,1,6,'5'),(2,1,1,NULL,NULL);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `graderesult`
--

DROP TABLE IF EXISTS `graderesult`;
/*!50001 DROP VIEW IF EXISTS `graderesult`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `graderesult` AS SELECT 
 1 AS `username`,
 1 AS `gpa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `building_num` int(3) NOT NULL,
  `room` int(3) NOT NULL,
  PRIMARY KEY (`building_num`,`room`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `student_id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gpa` int(3) DEFAULT NULL,
  `balance` int(3) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `phone` int(40) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'vishnu','vishnu',0,0,'Computer Science',12345,'vishnu'),(2,'vivechan','vivechan',0,0,'Computer Science',1234,'vivechan'),(3,'varun','varun',0,0,'E and C',123456,'varun'),(4,'varuns','varuns',0,0,'Computer Science',9009,'varuns'),(5,'varunss','varunss',0,0,'E and E',12345,'varunss'),(6,'varunj','varunj',0,0,'E and C',12346,'varunj'),(7,'pramod ','pramod',6,0,'Computer Science',9787656,'pramod'),(8,'vishnus','vishnus',0,0,'Computer Science',123456,'vishnus');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlist`
--

DROP TABLE IF EXISTS `waitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `waitlist` (
  `student_id` int(3) DEFAULT NULL,
  `course_id` int(3) DEFAULT NULL,
  `section_id` int(3) DEFAULT NULL,
  `wait_status` int(3) DEFAULT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `waitlist_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `waitlist_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`cid`) ON DELETE CASCADE,
  CONSTRAINT `waitlist_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `courseoffering` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlist`
--

LOCK TABLES `waitlist` WRITE;
/*!40000 ALTER TABLE `waitlist` DISABLE KEYS */;
INSERT INTO `waitlist` VALUES (8,1,1,0);
/*!40000 ALTER TABLE `waitlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `waitlist` BEFORE INSERT ON `waitlist` FOR EACH ROW begin
if new.wait_status=0 then
update courseoffering set no_of_students_waitlist=no_of_students_waitlist+1 where course_id = new.course_id;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enroll` BEFORE UPDATE ON `waitlist` FOR EACH ROW begin
if new.wait_status=1 then
insert into enroll(student_id,course_id,section_id) values(old.student_id,old.course_id,old.section_id);
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'database_project'
--

--
-- Dumping routines for database 'database_project'
--
/*!50003 DROP PROCEDURE IF EXISTS `gpa_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gpa_procedure`(in grade int,in credits int,out newgpa double)
begin 
declare sumcredits int;
declare sumgrade int;
set sumcredits=credits;
set sumgrade=grade*credits;
set newgpa = sumgrade/sumcredits;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `graderesult`
--

/*!50001 DROP VIEW IF EXISTS `graderesult`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `graderesult` AS select 1 AS `username`,1 AS `gpa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02  3:50:45
