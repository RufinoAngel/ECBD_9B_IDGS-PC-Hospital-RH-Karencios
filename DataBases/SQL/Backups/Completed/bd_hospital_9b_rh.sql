/*
 Navicat Premium Dump SQL

 Source Server         : Mi_Servidor_Local
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3308
 Source Schema         : bd_hospital_9b_rh

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 22/06/2026 19:45:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbb_hr_personal
-- ----------------------------
DROP TABLE IF EXISTS `tbb_hr_personal`;
CREATE TABLE `tbb_hr_personal`  (
  `ID` int UNSIGNED NOT NULL COMMENT 'Identificador unico del medio\r\nde contacto',
  `Departamento_ID` int UNSIGNED NOT NULL COMMENT 'Identificador del departamento\r\nasignado',
  `Puesto` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nombre del puesto laboral',
  `Tipo_Contrato` enum('BASE','EVENTUAL','HONORARIOS') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Tipo de contrato del empleado',
  `Fecha_Ingreso` date NOT NULL COMMENT 'Fecha de ingreso del empleado',
  `Fecha_Baja` date NULL DEFAULT NULL COMMENT 'Fecha de baja laboral',
  `Salario` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Salario asignado al empleado',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de registro del empleado',
  `Fecha_Actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualizacion del\r\nregistro',
  `Estatus` bit(1) NOT NULL COMMENT 'Estado actual del empleado',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `fk_personal_departamentos_idx`(`Departamento_ID` ASC) USING BTREE,
  CONSTRAINT `Persona_Fisica_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas_fisicas` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Entidad: Personal | Jerarquía: Sub Entidad | Percepción: Física' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbb_hr_personal_medico
-- ----------------------------
DROP TABLE IF EXISTS `tbb_hr_personal_medico`;
CREATE TABLE `tbb_hr_personal_medico`  (
  `ID` int UNSIGNED NOT NULL COMMENT 'Identificador unico del\r\npersonal medico',
  `Turno` enum('MATUTINO','VESPERTINO','NOCTURNO','MIXTO') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Turno asignado al personal\r\nmedico',
  `Area_ID` int UNSIGNED NOT NULL COMMENT 'Identificador del area asignada',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro del personal\r\nmedico',
  `Fecha_Actualizacion` datetime NULL DEFAULT NULL COMMENT 'Fecha de actualizacion del\r\nregistro',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado actual del personal\r\nmedico',
  `Cedula_Profesional` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Cedula profesional del medico',
  `Especialidad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Especialidad medica del\r\npersonal',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `celula_profecional_UNIQUE`(`Cedula_Profesional` ASC) USING BTREE,
  INDEX `PM_Area_Id_idx`(`Area_ID` ASC) USING BTREE,
  CONSTRAINT `Personal_Medico_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personal` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Entidad: Personal Medico | Jerarquía: Sub Entidad | Percepción: Física' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbb_hr_personas
-- ----------------------------
DROP TABLE IF EXISTS `tbb_hr_personas`;
CREATE TABLE `tbb_hr_personas`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de la\r\npersona',
  `Tipo` enum('Fisica','Moral') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Fisica' COMMENT 'Tipo de persona registrada',
  `Rfc` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Registro Federal de\r\nContribuyentes',
  `Pais_Origen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Pais de origen de la persona',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro de la persona',
  `Fecha_Actualizacion` datetime NULL DEFAULT NULL COMMENT 'Fecha de actualizacion del\r\nregistro',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado actual de la persona',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `rfc_UNIQUE`(`Rfc` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Entidad: Persona | Jerarquía: Super Entidad | Percepción: Física' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbb_hr_personas_fisicas
-- ----------------------------
DROP TABLE IF EXISTS `tbb_hr_personas_fisicas`;
CREATE TABLE `tbb_hr_personas_fisicas`  (
  `ID` int UNSIGNED NOT NULL COMMENT 'Identificador único de la persona física',
  `Titulo_Cortesia` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Titulo de cortesia de la persona',
  `Nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nombre de la persona',
  `Primer_Apellido` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Primer apellido de la persona',
  `Segundo_Apellido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Segundo apellido de la persona',
  `Genero` enum('M','H','N/B') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N/B' COMMENT 'Genero de la persona',
  `Fecha_Nacimiento` date NOT NULL COMMENT 'Fecha de nacimiento de la\r\npersona',
  `Curp` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Clave Unica de Registro de\r\nPoblacion',
  `Grupo_Sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Grupo sanguineo de la persona',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro de la persona',
  `Fecha_Actualizacion` datetime NULL DEFAULT NULL COMMENT 'Fecha de actualizacion del\r\nregistro',
  `Estatus` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado actual de la persona',
  `Edad` int NULL DEFAULT NULL COMMENT 'Edad actual de la persona',
  `Tipo_Edad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Clasificacion de la edad',
  PRIMARY KEY (`ID`) USING BTREE,
  CONSTRAINT `Personas_Fisicas_Id` FOREIGN KEY (`ID`) REFERENCES `tbb_hr_personas` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Entidad: Personas Físicas | Jerarquía: Sub Entidad | Percepción: Física' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbc_hr_departamentos
-- ----------------------------
DROP TABLE IF EXISTS `tbc_hr_departamentos`;
CREATE TABLE `tbc_hr_departamentos`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del\r\ndepartamento',
  `Nombre` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nombre del departamento',
  `Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Descripción general del departamento',
  `Area_Id` int UNSIGNED NOT NULL COMMENT 'Identificador de área correspondiente',
  `Responsable_Personal_ID` int UNSIGNED NOT NULL COMMENT 'Identificador del responsable del departamento',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de registro del departamento',
  `Fecha_Actualizacion` datetime NULL DEFAULT NULL COMMENT 'Fecha de actualización del registro',
  `Estatus` bit(1) NOT NULL COMMENT 'Estado actual del registro',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Responsable_Personal_Id_idx`(`Responsable_Personal_ID` ASC) USING BTREE,
  CONSTRAINT `Responsable_Personal_Id` FOREIGN KEY (`Responsable_Personal_ID`) REFERENCES `tbb_hr_personal` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Entidad: Departamentos | Jerarquía: Generica | Percepción: Conceptual | Aprobado: Sí' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Triggers structure for table tbb_hr_personas
-- ----------------------------
DROP TRIGGER IF EXISTS `tbb_personas_BEFORE_UPDATE`;
delimiter ;;
CREATE TRIGGER `tbb_personas_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_hr_personas` FOR EACH ROW BEGIN
    SET NEW.fecha_actualizacion = NOW();
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
