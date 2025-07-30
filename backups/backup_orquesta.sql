-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: orquesta
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
-- Table structure for table `concerts`
--

DROP TABLE IF EXISTS `concerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(64) NOT NULL,
  `country` varchar(32) NOT NULL,
  `year` int DEFAULT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `orchesta_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orchesta_id` (`orchesta_id`),
  CONSTRAINT `concerts_ibfk_1` FOREIGN KEY (`orchesta_id`) REFERENCES `orchesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concerts`
--

LOCK TABLES `concerts` WRITE;
/*!40000 ALTER TABLE `concerts` DISABLE KEYS */;
INSERT INTO `concerts` VALUES (1,'Lima','Peru',2016,8,3),(2,'Quito','Ecuador',2022,8,2),(3,'Caracas','Venezuela',2015,5,1),(4,'Machala','Ecuador',2010,9,4),(5,'Guayaquil','Ecuador',2009,7,5);
/*!40000 ALTER TABLE `concerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `wage` double DEFAULT NULL,
  `orchesta_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orchesta_id` (`orchesta_id`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`orchesta_id`) REFERENCES `orchesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Juan','Violinista',10,1500,1),(2,'Medardo','Cantor',20,2000,2),(3,'Luis','Guitarrista',15,1000,5),(4,'Pedro','Tamborista',15,1100,4),(5,'Sofia','Flautista',17,1300,3);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orchesta`
--

DROP TABLE IF EXISTS `orchesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orchesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `city_origin` varchar(32) NOT NULL,
  `country_origin` varchar(32) NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orchesta`
--

LOCK TABLES `orchesta` WRITE;
/*!40000 ALTER TABLE `orchesta` DISABLE KEYS */;
INSERT INTO `orchesta` VALUES (1,'Simon Bolivar',50,'Caracas','Venezuela',1970),(2,'Los Dukes',30,'Quito','Ecuador',1982),(3,'Grupo_5',35,'Lima','Peru',1995),(4,'Bufalos',20,'Machala','Ecuador',1999),(5,'Guayacan',43,'Guayaquil','Ecuador',1980);
/*!40000 ALTER TABLE `orchesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_miguel_position`
--

DROP TABLE IF EXISTS `vista_miguel_position`;
/*!50001 DROP VIEW IF EXISTS `vista_miguel_position`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_miguel_position` AS SELECT 
 1 AS `name`,
 1 AS `position`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_miguel_position`
--

/*!50001 DROP VIEW IF EXISTS `vista_miguel_position`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_miguel_position` AS select `members`.`name` AS `name`,`members`.`position` AS `position` from `members` where (`members`.`experience` > 10) */;
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

-- Dump completed on 2025-07-29 21:11:29
