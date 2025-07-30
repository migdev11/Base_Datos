-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: Universidad
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_semester`
--

DROP TABLE IF EXISTS `academic_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calendar_year` int NOT NULL,
  `term` varchar(128) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_semester`
--

LOCK TABLES `academic_semester` WRITE;
/*!40000 ALTER TABLE `academic_semester` DISABLE KEYS */;
INSERT INTO `academic_semester` VALUES (1,2024,'Marzo-Septiembre','2024-03-08','2024-09-28'),(2,2025,'Abril-Agosto','2025-04-08','2025-08-04'),(3,2018,'Primavera','2018-01-08','2018-06-28'),(4,2022,'Otoño','2022-08-11','2022-12-19'),(5,2020,'Invierno','2020-01-13','2020-06-26'),(6,2023,'Agosto-Diciembre','2023-08-14','2023-12-22');
/*!40000 ALTER TABLE `academic_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `learning_path` varchar(128) NOT NULL,
  `short_descripcion` varchar(1200) DEFAULT NULL,
  `lecture_hours` int DEFAULT NULL,
  `tutorial_hours` int DEFAULT NULL,
  `ects_points` int DEFAULT NULL,
  `has_exam` tinyint(1) DEFAULT NULL,
  `has_project` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Base de Datos','Ingenieria','Fundamentos de Bases de Datos',240,20,10,1,1),(2,'ProgramacionOO','Ingenieria','Fundamentos de ProgramacionOO',220,30,10,1,1),(3,'Electricidad','Ingenieria','Fundamentos de Electricidad',210,40,10,1,1),(4,'Ingles','Idiomas','Ingles Orientada a Ingenieria',220,40,10,1,0),(5,'Algebra','Ciencias','Matematicas orientado a Ingenieria',240,50,10,1,0),(6,'Estructura de Datos','Ingenieria','Fundamentos de ProgramacionOO',240,30,10,1,1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_edition`
--

DROP TABLE IF EXISTS `course_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_edition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `academic_semester_id` int DEFAULT NULL,
  `lecturer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `academic_semester_id` (`academic_semester_id`),
  KEY `lecturer_id` (`lecturer_id`),
  CONSTRAINT `course_edition_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `course_edition_ibfk_2` FOREIGN KEY (`academic_semester_id`) REFERENCES `academic_semester` (`id`),
  CONSTRAINT `course_edition_ibfk_3` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_edition`
--

LOCK TABLES `course_edition` WRITE;
/*!40000 ALTER TABLE `course_edition` DISABLE KEYS */;
INSERT INTO `course_edition` VALUES (1,2,1,1),(2,3,1,3),(3,4,6,4),(4,2,1,2),(5,5,4,5),(6,6,5,6);
/*!40000 ALTER TABLE `course_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enrollment`
--

DROP TABLE IF EXISTS `course_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enrollment` (
  `course_edition_id` int NOT NULL,
  `student_id` int NOT NULL,
  `midterm_grade` decimal(5,2) DEFAULT NULL,
  `final_grade` decimal(5,2) DEFAULT NULL,
  `course_letter_grade` varchar(3) DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`course_edition_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `course_enrollment_ibfk_1` FOREIGN KEY (`course_edition_id`) REFERENCES `course_edition` (`id`),
  CONSTRAINT `course_enrollment_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enrollment`
--

LOCK TABLES `course_enrollment` WRITE;
/*!40000 ALTER TABLE `course_enrollment` DISABLE KEYS */;
INSERT INTO `course_enrollment` VALUES (1,1,7.80,8.50,'A',1),(2,3,3.00,4.50,'F',0),(3,1,9.00,9.50,'A',1),(4,2,4.50,3.50,'F',0),(5,6,7.20,6.80,'C',1),(6,1,9.50,10.00,'A',1);
/*!40000 ALTER TABLE `course_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `degree` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'Rene','Guaman','BD','renegua@gmail.com'),(2,'Carlos','Lopez','POO','carlopez@gmail.com'),(3,'Cesar','Diaz','ELEC','cesard@gmail.com'),(4,'William','Ludeña','IG','willud@gmail.com'),(5,'Andres','Navas','AL','andres@gmail.com'),(6,'Jorge','Torres','ED','jorge@gmail.com');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Ana','Juarez','anajuarez@gmail.com','2000-05-12','2018-09-04'),(2,'Miguel','Veintimilla','migvein@gmail.com','2004-05-12','2022-10-04'),(3,'Juan','Perez','juanpe@gmail.com','1999-08-16','2017-10-04'),(4,'Ariana','Cordova','aricor@gmail.com','2005-04-02','2023-03-04'),(5,'Lucio','Ramirez','luciora@gmail.com','1985-04-02','2005-03-04'),(6,'Pedro','Gonza','pedrogo@gmail.com','1995-04-02','2013-03-04');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:06:34
