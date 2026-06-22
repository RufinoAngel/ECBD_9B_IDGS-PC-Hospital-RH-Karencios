-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_hospital_9b_rh
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Current Database: `bd_hospital_9b_rh`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bd_hospital_9b_rh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bd_hospital_9b_rh`;

--
-- Table structure for table `tbb_hr_medios_de_contacto`
--

DROP TABLE IF EXISTS `tbb_hr_medios_de_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_hr_medios_de_contacto` (
  `ID` int unsigned NOT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Telefono_Casa` varchar(20) DEFAULT NULL,
  `Movil` varchar(20) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Persona_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Medios de contacto\nJerarquía: Sub Entidad\nPercepción: Conceptual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_medios_de_contacto`
--

LOCK TABLES `tbb_hr_medios_de_contacto` WRITE;
/*!40000 ALTER TABLE `tbb_hr_medios_de_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_medios_de_contacto` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `fk_personal_departamentos_idx` (`Departamento_ID`),
  CONSTRAINT `Persona_Fisica_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personal\nJerarquía: Sub Entidad\n Percepción: Física';
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
  KEY `PM_Area_Id_idx` (`Area_ID`),
  CONSTRAINT `Personal_Medico_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personal` (`ID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Persona\nJerarquía: Super Entidad\nPercepción: Física';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_hr_personas`
--

LOCK TABLES `tbb_hr_personas` WRITE;
/*!40000 ALTER TABLE `tbb_hr_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_hr_personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_INSERT` AFTER INSERT ON `tbb_hr_personas` FOR EACH ROW BEGIN
         INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Insert",
         CONCAT_WS(" ", "Se ha insertado una nueva 
         persona con el ID:", new.id), default );
END */;;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
    -- Actualiza automáticamente la fecha de modificación
    SET NEW.fecha_actualizacion = NOW();
END */;;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_UPDATE` AFTER UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
   INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Update",
         CONCAT_WS(" ", "Se han actualizado los datos de la 
         persona con  ID:", new.id), default );
END */;;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbb_personas_AFTER_DELETE` AFTER DELETE ON `tbb_hr_personas` FOR EACH ROW BEGIN
   INSERT INTO tbi_bitacora VALUES (DEFAULT, 
         "tbb_personas", SESSION_USER(), "Delete",
         CONCAT_WS(" ", "Se borrado la persona con ID:", old.id), default );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  PRIMARY KEY (`ID`),
  CONSTRAINT `Personas_Fisicas_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Personas Físicas\nJerarquía: Sub Entidad\nPercepción: Física ';
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
  KEY `Responsable_Personal_Id_idx` (`Responsable_Personal_ID`),
  CONSTRAINT `Responsable_Personal_Id` FOREIGN KEY (`Responsable_Personal_ID`) REFERENCES `tbb_hr_personal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad: Departamentos\r\nJerarquía: Generica\r\nPercepción: Conceptual\r\nAprobado: Sí';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_hr_departamentos`
--

LOCK TABLES `tbc_hr_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_hr_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_hr_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_hr_horarios`
--

DROP TABLE IF EXISTS `tbd_hr_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_hr_horarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico y llave primaria del registro.',
  `Personal_ID` int unsigned NOT NULL COMMENT 'Clave foranea del empleado asignado.',
  `Area_ID` int unsigned NOT NULL COMMENT 'Clave foranea del area o departamento.',
  `Dia_Semana` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO') NOT NULL COMMENT 'Dia especifico de la jornada laboral.',
  `Hora_Inicio` time NOT NULL COMMENT 'Hora exacta de entrada.',
  `Hora_Fin` time NOT NULL COMMENT 'Hora exacta de salida.',
  `Tipo_Turno` enum('MATUTINO','VESPERTINO','NOCTURNO','GUARDIA') DEFAULT NULL COMMENT 'Clasificacion del horario establecido.',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora de configuracion en el sistema.',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Disponibilidad: 1 = Activo, 0 = Inactivo',
  PRIMARY KEY (`ID`),
  KEY `Personal_Id_idx` (`Personal_ID`),
  KEY `Horario_Area_Id_idx` (`Area_ID`),
  CONSTRAINT `Personal_Id` FOREIGN KEY (`Personal_ID`) REFERENCES `tbb_hr_personal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad operativa que gestiona la agenda y la planeacion de horarios del personal.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_hr_horarios`
--

LOCK TABLES `tbd_hr_horarios` WRITE;
/*!40000 ALTER TABLE `tbd_hr_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_hr_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_monitoreo_final`
--

DROP TABLE IF EXISTS `vw_monitoreo_final`;
/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_final`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monitoreo_final` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `tipo_percepcion`,
 1 AS `aprobado`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomenclatura`,
 1 AS `duenio`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sin_acceso`,
 1 AS `total_triggers`,
 1 AS `total_registros`,
 1 AS `numero_columnas`,
 1 AS `tamano_mb`,
 1 AS `tamanio_aproximado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_muestra_triggers`
--

DROP TABLE IF EXISTS `vw_muestra_triggers`;
/*!50001 DROP VIEW IF EXISTS `vw_muestra_triggers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_muestra_triggers` AS SELECT 
 1 AS `TRIGGER_NAME`,
 1 AS `EVENT_MANIPULATION`,
 1 AS `EVENT_OBJECT_TABLE`,
 1 AS `ACTION_TIMING`,
 1 AS `ACTION_STATEMENT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reporte_privilegios`
--

DROP TABLE IF EXISTS `vw_reporte_privilegios`;
/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reporte_privilegios` AS SELECT 
 1 AS `mensaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_roles_usuarios`
--

DROP TABLE IF EXISTS `vw_roles_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vista_tablas`
--

DROP TABLE IF EXISTS `vw_vista_tablas`;
/*!50001 DROP VIEW IF EXISTS `vw_vista_tablas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vista_tablas` AS SELECT 
 1 AS `entidad`,
 1 AS `tabla`,
 1 AS `tipo_jerarquia`,
 1 AS `percepcion`,
 1 AS `tipo_dependencia`,
 1 AS `tipo_nomenclatura`,
 1 AS `total_columnas`,
 1 AS `aprobado`,
 1 AS `dueño`,
 1 AS `editor`,
 1 AS `lector`,
 1 AS `sin_acceso`,
 1 AS `total_registros`,
 1 AS `tamanio_aproximado_MB`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bd_hospital_9b_rh'
--

--
-- Dumping routines for database 'bd_hospital_9b_rh'
--

--
-- Current Database: `bd_hospital_9b_rh`
--

USE `bd_hospital_9b_rh`;

--
-- Final view structure for view `vw_monitoreo_final`
--

/*!50001 DROP VIEW IF EXISTS `vw_monitoreo_final`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monitoreo_final` AS with `comentarios` as (select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_NAME` AS `TABLE_NAME`,regexp_replace(replace(replace(`information_schema`.`tables`.`TABLE_COMMENT`,'\n',' '),'\r',' '),'\\s+',' ') AS `comentario` from `information_schema`.`TABLES` where (`information_schema`.`tables`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh')), `extraido` as (select `comentarios`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`comentarios`.`TABLE_NAME` AS `TABLE_NAME`,trim(regexp_replace(regexp_substr(`comentarios`.`comentario`,'Entidad:[^;]*'),'Entidad:','')) AS `entidad`,trim(regexp_replace(regexp_substr(`comentarios`.`comentario`,'Jerarqu[^:]*:[^;]*'),'Jerarqu[^:]*:','')) AS `jerarquia`,trim(regexp_replace(regexp_substr(`comentarios`.`comentario`,'Percep[^:]*:[^;]*'),'Percep[^:]*:','')) AS `percepcion`,trim(regexp_replace(regexp_substr(`comentarios`.`comentario`,'Aprobado:[^;]*'),'Aprobado:','')) AS `aprobado` from `comentarios`), `fk` as (select distinct `information_schema`.`key_column_usage`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`key_column_usage`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`KEY_COLUMN_USAGE` where ((`information_schema`.`key_column_usage`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`information_schema`.`key_column_usage`.`REFERENCED_TABLE_NAME` is not null))), `columnas` as (select `information_schema`.`columns`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME` AS `TABLE_NAME`,count(0) AS `numero_columnas` from `information_schema`.`COLUMNS` where (`information_schema`.`columns`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') group by `information_schema`.`columns`.`TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME`), `triggers_count` as (select `information_schema`.`triggers`.`EVENT_OBJECT_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`triggers`.`EVENT_OBJECT_TABLE` AS `TABLE_NAME`,count(0) AS `total_triggers` from `information_schema`.`TRIGGERS` where (`information_schema`.`triggers`.`EVENT_OBJECT_SCHEMA` = 'bd_hospital_9b_rh') group by `information_schema`.`triggers`.`EVENT_OBJECT_SCHEMA`,`information_schema`.`triggers`.`EVENT_OBJECT_TABLE`), `privs_union` as (select `information_schema`.`table_privileges`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`information_schema`.`table_privileges`.`GRANTEE`,'@',1),'\'','') AS `usuario`,`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` where (`information_schema`.`table_privileges`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') union all select `sp`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`t`.`TABLE_NAME` AS `TABLE_NAME`,replace(substring_index(`sp`.`GRANTEE`,'@',1),'\'','') AS `usuario`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from (`information_schema`.`SCHEMA_PRIVILEGES` `sp` join `information_schema`.`TABLES` `t` on((`information_schema`.`t`.`TABLE_SCHEMA` = `sp`.`TABLE_SCHEMA`))) where (`sp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh')), `duenios` as (select `privs_union`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs_union`.`TABLE_NAME` AS `TABLE_NAME`,substring_index(group_concat(distinct `privs_union`.`usuario` order by field(`privs_union`.`usuario`,'ge_user','hr_user','md_user','mr_user','ms_user','ph_user') ASC separator ','),',',1) AS `duenio` from `privs_union` where (`privs_union`.`PRIVILEGE_TYPE` in ('ALTER','DELETE','DROP','ALL PRIVILEGES')) group by `privs_union`.`TABLE_SCHEMA`,`privs_union`.`TABLE_NAME`), `editores` as (select `privs_union`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs_union`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `privs_union`.`usuario` separator ',') AS `editor` from `privs_union` where (`privs_union`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE','ALL PRIVILEGES')) group by `privs_union`.`TABLE_SCHEMA`,`privs_union`.`TABLE_NAME`), `lectores` as (select `privs_union`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`privs_union`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(distinct `privs_union`.`usuario` separator ',') AS `lector` from `privs_union` where (`privs_union`.`PRIVILEGE_TYPE` in ('SELECT','ALL PRIVILEGES')) group by `privs_union`.`TABLE_SCHEMA`,`privs_union`.`TABLE_NAME`) select coalesce(nullif(`e`.`entidad`,''),'Sin definir') AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,(case when (lower(`e`.`jerarquia`) like '%super%') then 'Super Entidad' when (lower(`e`.`jerarquia`) like '%sub%') then 'Sub Entidad' when (lower(`e`.`jerarquia`) like '%gener%') then 'Generica' else 'Sin definir' end) AS `tipo_jerarquia`,(case when (lower(`e`.`percepcion`) like '%fisic%') then 'Fisica' when (lower(`e`.`percepcion`) like '%concept%') then 'Conceptual' when (lower(`e`.`percepcion`) like '%mixt%') then 'Mixta' else 'Sin definir' end) AS `tipo_percepcion`,(case when (lower(`e`.`aprobado`) like '%si%') then 'Si' when (lower(`e`.`aprobado`) like '%no%') then 'No' else 'Sin definir' end) AS `aprobado`,(case when (`fk`.`TABLE_NAME` is not null) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc\\_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd\\_%') then 'Derivada' when (`information_schema`.`t`.`TABLE_NAME` like 'tbb\\_%') then 'Base' else 'Base' end) AS `tipo_nomenclatura`,coalesce(`d`.`duenio`,'N/A') AS `duenio`,coalesce(`ed`.`editor`,'N/A') AS `editor`,coalesce(`l`.`lector`,'N/A') AS `lector`,concat_ws(',',if((locate('ge_user',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'ge_user',NULL),if((locate('hr_user',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'hr_user',NULL),if((locate('md_user',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'md_user',NULL),if((locate('mr_user',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'mr_user',NULL),if((locate('ms_user',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'ms_user',NULL),if((locate('ph_user',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'ph_user',NULL),if((locate('medic',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'medic',NULL),if((locate('nurse',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'nurse',NULL),if((locate('patient',concat(',',coalesce(`d`.`duenio`,''),',',coalesce(`ed`.`editor`,''),',',coalesce(`l`.`lector`,''),',')) = 0),'patient',NULL)) AS `sin_acceso`,coalesce(`tc`.`total_triggers`,0) AS `total_triggers`,coalesce(`information_schema`.`t`.`TABLE_ROWS`,0) AS `total_registros`,coalesce(`c`.`numero_columnas`,0) AS `numero_columnas`,round((((coalesce(`information_schema`.`t`.`DATA_LENGTH`,0) + coalesce(`information_schema`.`t`.`INDEX_LENGTH`,0)) / 1024) / 1024),2) AS `tamano_mb`,concat(round((((coalesce(`information_schema`.`t`.`DATA_LENGTH`,0) + coalesce(`information_schema`.`t`.`INDEX_LENGTH`,0)) / 1024) / 1024),2),' MB') AS `tamanio_aproximado` from (((((((`information_schema`.`TABLES` `t` left join `extraido` `e` on(((`e`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`e`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `fk` on(((`fk`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`fk`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `columnas` `c` on(((`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `duenios` `d` on(((`d`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`d`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `editores` `ed` on(((`ed`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`ed`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `lectores` `l` on(((`l`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`l`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) left join `triggers_count` `tc` on(((`tc`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tc`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`)))) where ((`information_schema`.`t`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`information_schema`.`t`.`TABLE_TYPE` = 'BASE TABLE')) order by coalesce(nullif(`e`.`entidad`,''),'Sin definir'),`information_schema`.`t`.`TABLE_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_muestra_triggers`
--

/*!50001 DROP VIEW IF EXISTS `vw_muestra_triggers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_muestra_triggers` AS select `information_schema`.`triggers`.`TRIGGER_NAME` AS `TRIGGER_NAME`,`information_schema`.`triggers`.`EVENT_MANIPULATION` AS `EVENT_MANIPULATION`,`information_schema`.`triggers`.`EVENT_OBJECT_TABLE` AS `EVENT_OBJECT_TABLE`,`information_schema`.`triggers`.`ACTION_TIMING` AS `ACTION_TIMING`,`information_schema`.`triggers`.`ACTION_STATEMENT` AS `ACTION_STATEMENT` from `information_schema`.`TRIGGERS` where (`information_schema`.`triggers`.`TRIGGER_SCHEMA` = 'bd_hospital_9b_rh') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reporte_privilegios`
--

/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reporte_privilegios` AS select `reporte`.`mensaje` AS `mensaje` from (select '-- GERENCIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`tp`.`GRANTEE` like '\'ge_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS HUMANOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`tp`.`GRANTEE` like '\'hr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS MATERIALES --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`tp`.`GRANTEE` like '\'mr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- REGISTROS MEDICOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`tp`.`GRANTEE` like '\'md_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- SERVICIOS MEDICOS --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`tp`.`GRANTEE` like '\'ms_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- FARMACIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`tp`.`GRANTEE` like '\'ph_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- DEVELOPER --' AS `mensaje` union all select concat('GRANT ',group_concat(`sp`.`PRIVILEGE_TYPE` order by `sp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`sp`.`TABLE_SCHEMA`,'.* TO ',`sp`.`GRANTEE`,';') AS `mensaje` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where ((`sp`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`sp`.`GRANTEE` like '\'developer\'@%')) group by `sp`.`GRANTEE`,`sp`.`TABLE_SCHEMA`) `reporte` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_roles_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios` AS select `u`.`User` AS `usuario`,`u`.`Host` AS `host`,ifnull(group_concat(concat(`r`.`TO_USER`,'@',convert(`r`.`TO_HOST` using utf8mb3)) order by `r`.`TO_USER` ASC separator ', '),'SIN ROLES') AS `roles_asignados` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on(((`u`.`User` = `r`.`FROM_USER`) and (`u`.`Host` = `r`.`FROM_HOST`)))) group by `u`.`User`,`u`.`Host` having ((`usuario` like '%user%') or (`usuario` = 'developer_9b')) order by `usuario`,`u`.`Host` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vista_tablas`
--

/*!50001 DROP VIEW IF EXISTS `vw_vista_tablas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vista_tablas` AS select coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `entidad`,`information_schema`.`t`.`TABLE_NAME` AS `tabla`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Jerarquía:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `tipo_jerarquia`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Percepción:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `percepcion`,(case when exists(select 1 from (`information_schema`.`KEY_COLUMN_USAGE` `k` join `information_schema`.`COLUMNS` `c` on(((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`k`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`k`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_NAME` = `information_schema`.`k`.`COLUMN_NAME`)))) where ((`information_schema`.`k`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`k`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`) and (`information_schema`.`c`.`COLUMN_KEY` = 'PRI') and (`information_schema`.`k`.`REFERENCED_TABLE_NAME` is not null))) then 'Debil' else 'Fuerte' end) AS `tipo_dependencia`,(case when (`information_schema`.`t`.`TABLE_NAME` like 'tbc_%') then 'Catalogo' when (`information_schema`.`t`.`TABLE_NAME` like 'tbd_%') then 'Derivada' when (`information_schema`.`t`.`TABLE_NAME` like 'tbb_%') then 'Base' when (`information_schema`.`t`.`TABLE_NAME` like 'tbi_%') then 'Isla' else 'Base' end) AS `tipo_nomenclatura`,(select count(0) from `information_schema`.`COLUMNS` `c` where ((`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) AS `total_columnas`,coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Aprobado:',-(1)),'\n',1)),'') using utf8mb4),'N/A') AS `aprobado`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('ALTER','DROP','DELETE')))),'N/A') AS `dueño`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('INSERT','UPDATE')))),'N/A') AS `editor`,coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` = 'SELECT'))),'N/A') AS `lector`,coalesce((select group_concat(`r`.`role_name` separator ',') from (select '\'ge_user\'@\'%\'' AS `role_grantee`,'ge_user' AS `role_name` union select '\'hr_user\'@\'%\'' AS `'hr_user'@'%'`,'hr_user' AS `hr_user` union select '\'md_user\'@\'%\'' AS `'md_user'@'%'`,'md_user' AS `md_user` union select '\'mr_user\'@\'%\'' AS `'mr_user'@'%'`,'mr_user' AS `mr_user` union select '\'ms_user\'@\'%\'' AS `'ms_user'@'%'`,'ms_user' AS `ms_user` union select '\'ph_user\'@\'%\'' AS `'ph_user'@'%'`,'ph_user' AS `ph_user` union select '\'medic\'@\'%\'' AS `'medic'@'%'`,'medic' AS `medic` union select '\'nurse\'@\'%\'' AS `'nurse'@'%'`,'nurse' AS `nurse` union select '\'patient\'@\'%\'' AS `'patient'@'%'`,'patient' AS `patient`) `r` where exists(select 1 from (select `sp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where (`p`.`GRANTEE` = `r`.`role_grantee`)) is false),'N/A') AS `sin_acceso`,`information_schema`.`t`.`TABLE_ROWS` AS `total_registros`,round((((`information_schema`.`t`.`DATA_LENGTH` + `information_schema`.`t`.`INDEX_LENGTH`) / 1024) / 1024),2) AS `tamanio_aproximado_MB` from `information_schema`.`TABLES` `t` where ((`information_schema`.`t`.`TABLE_SCHEMA` = 'bd_hospital_9b_rh') and (`information_schema`.`t`.`TABLE_NAME` like 'tb%_%_%')) order by coalesce((select group_concat(distinct replace(substring_index(`p`.`GRANTEE`,'@',1),'\'','') separator ',') from (select `sp`.`GRANTEE` AS `GRANTEE`,`sp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where (`sp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) union select `tp`.`GRANTEE` AS `GRANTEE`,`tp`.`PRIVILEGE_TYPE` AS `PRIVILEGE_TYPE` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = `information_schema`.`t`.`TABLE_SCHEMA`) and (`tp`.`TABLE_NAME` = `information_schema`.`t`.`TABLE_NAME`))) `p` where ((not((`p`.`GRANTEE` like '\'developer\'%'))) and (`p`.`PRIVILEGE_TYPE` in ('ALTER','DROP','DELETE')))),'N/A'),coalesce(convert(nullif(trim(substring_index(substring_index(`information_schema`.`t`.`TABLE_COMMENT`,'Entidad:',-(1)),'\n',1)),'') using utf8mb4),'N/A') */;
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

-- Dump completed on 2026-05-25 20:03:58
