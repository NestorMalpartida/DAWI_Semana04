CREATE DATABASE  IF NOT EXISTS `clinica_kvbe_2023_2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica_kvbe_2023_2`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica_kvbe_2023_2
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `tb_distrito`
--

DROP TABLE IF EXISTS `tb_distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_distrito` (
  `cod_dis` int NOT NULL AUTO_INCREMENT,
  `nom_dis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_dis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distrito`
--

LOCK TABLES `tb_distrito` WRITE;
/*!40000 ALTER TABLE `tb_distrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_especialidad`
--

DROP TABLE IF EXISTS `tb_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_especialidad` (
  `cod_espe` int NOT NULL AUTO_INCREMENT,
  `nom_espe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_espe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_especialidad`
--

LOCK TABLES `tb_especialidad` WRITE;
/*!40000 ALTER TABLE `tb_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicamento`
--

DROP TABLE IF EXISTS `tb_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medicamento` (
  `cod_med` int NOT NULL AUTO_INCREMENT,
  `nom_med` varchar(50) DEFAULT NULL,
  `des_med` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sto_med` int DEFAULT NULL,
  `pre_med` double DEFAULT NULL,
  `fec_fab_med` date DEFAULT NULL,
  `cod_tipo` int DEFAULT NULL,
  PRIMARY KEY (`cod_med`),
  KEY `fk_01` (`cod_tipo`),
  CONSTRAINT `fk_01` FOREIGN KEY (`cod_tipo`) REFERENCES `tb_tipo_medicamento` (`cod_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamento`
--

LOCK TABLES `tb_medicamento` WRITE;
/*!40000 ALTER TABLE `tb_medicamento` DISABLE KEYS */;
INSERT INTO `tb_medicamento` VALUES (1,'Paracetamol 500 mg','Paracetamol',20,5.6,'2022-01-01',2),(2,'Simvastatina','Se emplea para reducir el colesterol y los triglicéridos (tipo de grasa) en la sangre. Descubierta y desarrollada por Merck, se trata del primer medicamento con estatina que evidencia una disminución de la enfermedad cardiovascular y mortalidad. Está en la lista modelo de medicamentos esenciales de la Organización Mundial de la Salud, en la que se describen los más importantes y necesarios en el sistema sanitario básico.',1,22,'2021-03-01',3),(3,'Aspirina','También conocida como Ácido acetilsalicílico (ASA), reduce las sustancias en el cuerpo que producen dolor, fiebre e inflamación. Es el medicamento más usado en todo el mundo y se calcula que cada año se consumen unas 40.000 toneladas.',20,22,'2021-03-01',1),(4,'Omeprazol ','inhibe la bomba de protones (IBPS)y disminuye la producción de Ácido al bloquear la enzima de la pared del estomago que se encarga de producir esta sustancia. Este efecto reviene las ulceras y tiene un resultado curativo sobre las ulceras existentes en el esófago, estomago y duodeno. La OMS lo incluye como medicamento básico.',20,5,'2021-03-10',1),(5,'Lexotiroxina sódica','Se encarga de sustituir una hormona que se suele producir en nuestra glándula tiroidea para regular la energía y el metabolismo del cuerpo. Es una versión artificial de la hormona tiroxina, responsable de aumentar la tasa metabólica de las células de todos los tejidos del organismo y ayuda a mantener la función cerebral, la absorción de los alimentos y la temperatura corporal, entre otros efectos. También la lista de la OMS.',25,25.6,'2025-06-24',2);
/*!40000 ALTER TABLE `tb_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico`
--

DROP TABLE IF EXISTS `tb_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_medico` (
  `cod_med` int NOT NULL AUTO_INCREMENT,
  `nom_med` varchar(30) DEFAULT NULL,
  `ape_med` varchar(30) DEFAULT NULL,
  `fec_nac_med` date DEFAULT NULL,
  `sexo_med` varchar(15) DEFAULT NULL,
  `est_civ_med` varchar(15) DEFAULT NULL,
  `dni_med` char(8) DEFAULT NULL,
  `sue_med` double DEFAULT NULL,
  `cod_espe` int DEFAULT NULL,
  `cod_sede` int DEFAULT NULL,
  `dir_med` varchar(100) DEFAULT NULL,
  `cod_dis` int DEFAULT NULL,
  PRIMARY KEY (`cod_med`),
  KEY `FK_001` (`cod_espe`),
  KEY `FK_002` (`cod_sede`),
  KEY `FK_003` (`cod_dis`),
  CONSTRAINT `FK_001` FOREIGN KEY (`cod_espe`) REFERENCES `tb_especialidad` (`cod_espe`),
  CONSTRAINT `FK_002` FOREIGN KEY (`cod_sede`) REFERENCES `tb_sede` (`cod_sede`),
  CONSTRAINT `FK_003` FOREIGN KEY (`cod_dis`) REFERENCES `tb_distrito` (`cod_dis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico`
--

LOCK TABLES `tb_medico` WRITE;
/*!40000 ALTER TABLE `tb_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sede`
--

DROP TABLE IF EXISTS `tb_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sede` (
  `cod_sede` int NOT NULL AUTO_INCREMENT,
  `nom_sede` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sede`
--

LOCK TABLES `tb_sede` WRITE;
/*!40000 ALTER TABLE `tb_sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_medicamento`
--

DROP TABLE IF EXISTS `tb_tipo_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_medicamento` (
  `cod_tipo` int NOT NULL AUTO_INCREMENT,
  `nom_tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_medicamento`
--

LOCK TABLES `tb_tipo_medicamento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_medicamento` DISABLE KEYS */;
INSERT INTO `tb_tipo_medicamento` VALUES (1,'Analgesicos'),(2,'Ansioliticos e hipneticos'),(3,'Antiacidos'),(4,'Antibacticos'),(5,'Antidiarreicos'),(6,'Antigripales'),(7,'Antihistamanicos'),(8,'Antiinflamatorios'),(9,'Antimicaticos'),(10,'Antipirticos'),(11,'Anticepticos'),(12,'Antitusivos'),(13,'Broncodilatadores'),(14,'Expectorantes'),(15,'Laxantes'),(16,'Mucoliticos');
/*!40000 ALTER TABLE `tb_tipo_medicamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-15 15:25:17
