-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: discos
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
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `idCancion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idCancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantante`
--

DROP TABLE IF EXISTS `cantante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantante` (
  `idCantante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `pais` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idCantante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantante`
--

LOCK TABLES `cantante` WRITE;
/*!40000 ALTER TABLE `cantante` DISABLE KEYS */;
/*!40000 ALTER TABLE `cantante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disco`
--

DROP TABLE IF EXISTS `disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco` (
  `idDisco` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(25) NOT NULL,
  `precio` double DEFAULT NULL,
  `idCantante_cantante` int NOT NULL,
  `idGenero_genero` int NOT NULL,
  PRIMARY KEY (`idDisco`),
  KEY `idCantante_cantante` (`idCantante_cantante`),
  KEY `idGenero_genero` (`idGenero_genero`),
  CONSTRAINT `disco_ibfk_1` FOREIGN KEY (`idCantante_cantante`) REFERENCES `cantante` (`idCantante`),
  CONSTRAINT `disco_ibfk_2` FOREIGN KEY (`idGenero_genero`) REFERENCES `generoMusica` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disco`
--

LOCK TABLES `disco` WRITE;
/*!40000 ALTER TABLE `disco` DISABLE KEYS */;
/*!40000 ALTER TABLE `disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generoMusica`
--

DROP TABLE IF EXISTS `generoMusica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generoMusica` (
  `idGenero` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generoMusica`
--

LOCK TABLES `generoMusica` WRITE;
/*!40000 ALTER TABLE `generoMusica` DISABLE KEYS */;
/*!40000 ALTER TABLE `generoMusica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:07:09
