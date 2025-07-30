-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: veintimilla_articulos
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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `codA` varchar(100) NOT NULL,
  `ANombre` varchar(35) NOT NULL,
  `Ciudad` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`codA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES ('T1','Clasificadora','Chiquisaca'),('T2','Perforadora','Cochabamba'),('T3','Lectora','Santa Cruz'),('T4','Consola','Santa Cruz'),('T5','Mezcladora','La Paz'),('T6','Terminal','Tarija'),('T7','Cinta','La Paz');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente`
--

DROP TABLE IF EXISTS `componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente` (
  `CodC` varchar(100) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Color` varchar(25) DEFAULT NULL,
  `Ciudad` varchar(25) NOT NULL,
  `Peso` double NOT NULL,
  PRIMARY KEY (`CodC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente`
--

LOCK TABLES `componente` WRITE;
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
INSERT INTO `componente` VALUES ('C1','X3A','Rojo','La Paz',12),('C2','BB5','Verde','Chiquisaca',17),('C3','C4B','Azul','Cochabamba',17),('C4','C4B','Rojo','La Paz',14),('C5','VT8','Azul','Chiquisaca',12),('C6','C30','Rojo','La Paz',19);
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `CodA` varchar(100) NOT NULL,
  `CodC` varchar(100) NOT NULL,
  `CodP` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `CodA` (`CodA`),
  KEY `CodC` (`CodC`),
  KEY `CodP` (`CodP`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`CodA`) REFERENCES `articulos` (`codA`),
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`CodC`) REFERENCES `componente` (`CodC`),
  CONSTRAINT `envio_ibfk_3` FOREIGN KEY (`CodP`) REFERENCES `proveedor` (`CodP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `CodP` varchar(100) NOT NULL,
  `PNombre` varchar(25) NOT NULL,
  `Categoria` int NOT NULL,
  `Ciudad` varchar(25) NOT NULL,
  PRIMARY KEY (`CodP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('P1','Carlos',20,'La Paz'),('P2','Juan',10,'Chiquisaca'),('P3','José',30,'La Paz'),('P4','Lucy',20,'La Paz'),('P5','Eva',30,'Santa Cruz');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:13:10
