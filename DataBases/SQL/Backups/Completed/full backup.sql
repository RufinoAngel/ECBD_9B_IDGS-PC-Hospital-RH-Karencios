CREATE DATABASE  IF NOT EXISTS `bd_hospital_9b_hr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_hospital_9b_hr`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_hospital_9b_hr
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `tbb_hr_personal`
--

DROP TABLE IF EXISTS `tbb_hr_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Departamento_ID` int unsigned NOT NULL,
  `Puesto` varchar(80) NOT NULL,
  `Tipo_Contrato` enum('BASE','EVENTUAL','HONORARIOS') NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  `Fecha_Baja` date DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_personal_departamentos_idx` (`Departamento_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal\nJerarquía: Sub Entidad\n Percepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personal`
--

LOCK TABLES `tbb_hr_personal` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personal_medico`
--

DROP TABLE IF EXISTS `tbb_hr_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Turno` enum('MATUTINO','VESPERTINO','NOCTURNO','MIXTO') DEFAULT NULL,
  `Area_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Cedula_Profesional` varchar(30) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `celula_profecional_UNIQUE` (`Cedula_Profesional`),
  KEY `PM_Area_Id_idx` (`Area_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal Medico\nJerarquía: Sub Entidad\nPercepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personal_medico`
--

LOCK TABLES `tbb_hr_personal_medico` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personal_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personas`
--

DROP TABLE IF EXISTS `tbb_hr_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` enum('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
  `Rfc` varchar(14) DEFAULT NULL,
  `Pais_Origen` varchar(50) DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rfc_UNIQUE` (`Rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Persona\nJerarquía: Super Entidad\nPercepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personas`
--

LOCK TABLES `tbb_hr_personas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_hr_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_hr_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_personas_fisicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Titulo_Cortesia` varchar(40) DEFAULT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Primer_Apellido` varchar(45) NOT NULL,
  `Segundo_Apellido` varchar(60) DEFAULT NULL,
  `Genero` enum('M','H','N/B') NOT NULL DEFAULT 'N/B',
  `Fecha_Nacimiento` date NOT NULL,
  `Curp` varchar(18) DEFAULT NULL,
  `Grupo_Sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Edad` int DEFAULT NULL,
  `Tipo_Edad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personas Físicas\nJerarquía: Sub Entidad\nPercepción: Física ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personas_fisicas`
--

LOCK TABLES `tbb_hr_personas_fisicas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas_fisicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personas_fisicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_hr_departamentos`
--

DROP TABLE IF EXISTS `tbc_hr_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_hr_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Area_Id` int unsigned NOT NULL,
  `Responsable_Personal_ID` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Responsable_Personal_Id_idx` (`Responsable_Personal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Departamentos\r\nJerarquía: Generica\r\nPercepción: Conceptual\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_hr_departamentos`
--

LOCK TABLES `tbc_hr_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_hr_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_hr_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_hospital_9b_hr'
--

--
-- Dumping routines for database 'bd_hospital_9b_hr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-21 23:12:39
