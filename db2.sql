CREATE DATABASE  IF NOT EXISTS `db2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db2`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: db2
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.22.04.1

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
-- Table structure for table `afr`
--

DROP TABLE IF EXISTS `afr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afr` (
  `prm_id` int NOT NULL,
  `pos` int DEFAULT NULL,
  `r` double NOT NULL DEFAULT '0',
  `unit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`prm_id`),
  CONSTRAINT `fk_afr_prm_id` FOREIGN KEY (`prm_id`) REFERENCES `prm` (`prm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cub1`
--

DROP TABLE IF EXISTS `cub1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cub1` (
  `ts` datetime NOT NULL DEFAULT (utc_timestamp()),
  `prm_id` int NOT NULL,
  `scn_id` int NOT NULL,
  `yr` int NOT NULL,
  `u` double DEFAULT NULL,
  PRIMARY KEY (`ts`,`prm_id`,`scn_id`,`yr`),
  KEY `fk_cub1_scn_idx` (`scn_id`),
  KEY `fk_cub1_prm_idx` (`prm_id`),
  CONSTRAINT `fx_cub1_scn` FOREIGN KEY (`scn_id`) REFERENCES `scn` (`scn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cub1_AFTER_INSERT` AFTER INSERT ON `cub1` FOR EACH ROW BEGIN

    INSERT INTO cub1_last(ts, prm_id, scn_id, yr, u)
	VALUES (new.ts, new.prm_id, new.scn_id, new.yr, new.u)
	ON DUPLICATE KEY UPDATE ts = new.ts, u = new.u;
    
    CALL sp_afr_upd();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cub1_last`
--

DROP TABLE IF EXISTS `cub1_last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cub1_last` (
  `ts` datetime NOT NULL,
  `prm_id` int NOT NULL,
  `scn_id` int NOT NULL,
  `yr` int NOT NULL,
  `u` double DEFAULT NULL,
  PRIMARY KEY (`prm_id`,`scn_id`,`yr`),
  CONSTRAINT `fk_c1_last_prm` FOREIGN KEY (`prm_id`) REFERENCES `prm` (`prm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grd_bus1`
--

DROP TABLE IF EXISTS `grd_bus1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grd_bus1` (
  `bus_id` int NOT NULL,
  `bus_name` varchar(25) DEFAULT NULL,
  `AID` int DEFAULT NULL,
  `Swissgrid_NodeCode` varchar(8) DEFAULT NULL,
  `Type` int DEFAULT NULL,
  `Un` int DEFAULT NULL,
  `Va0` int DEFAULT NULL,
  `Vm0` int DEFAULT NULL,
  `Vmax` double DEFAULT NULL,
  `Vmin` double DEFAULT NULL,
  `ZID` int DEFAULT NULL,
  `x_pos` double DEFAULT NULL,
  `y_pos` double DEFAULT NULL,
  `class` enum('PN_Busbar') DEFAULT NULL,
  `idx` int DEFAULT NULL,
  `nuts2_id` varchar(4) DEFAULT NULL,
  `zone_name` varchar(2) DEFAULT NULL,
  `zone_name_tyndp` varchar(4) DEFAULT NULL,
  `bus_lbl` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grd_con1`
--

DROP TABLE IF EXISTS `grd_con1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grd_con1` (
  `con_uid` int NOT NULL,
  `bus1_id` int NOT NULL,
  `bus2_id` int NOT NULL,
  `con_name` varchar(50) DEFAULT NULL,
  `SR` int DEFAULT NULL,
  `Length` double DEFAULT NULL,
  `Smax` double DEFAULT NULL,
  `UN1` int DEFAULT NULL,
  `UN2` int DEFAULT NULL,
  `UR1` int DEFAULT NULL,
  `UR2` int DEFAULT NULL,
  `Usc` int DEFAULT NULL,
  `class` enum('PN_Line','PN_TR2') DEFAULT NULL,
  `numparlines` int DEFAULT NULL,
  `side1_on` int DEFAULT NULL,
  `side2_on` int DEFAULT NULL,
  `zone_name_tyndp` varchar(4) DEFAULT NULL,
  `x` double DEFAULT NULL,
  PRIMARY KEY (`con_uid`),
  KEY `fk_bus1_idx` (`bus1_id`),
  KEY `fk_bus2_idx` (`bus2_id`),
  CONSTRAINT `fk_bus1` FOREIGN KEY (`bus1_id`) REFERENCES `grd_bus1` (`bus_id`),
  CONSTRAINT `fk_bus2` FOREIGN KEY (`bus2_id`) REFERENCES `grd_bus1` (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_flex1`
--

DROP TABLE IF EXISTS `in_flex1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_flex1` (
  `scn_key` varchar(45) NOT NULL,
  `pathway` enum('SPS1','SPS2','SPS3','SPS4') NOT NULL,
  `shock` enum('None','FIN','HEA','COL','SOC','NUC') NOT NULL,
  `intensity` enum('None','Low','Mid','High') NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `year` int NOT NULL,
  `prm_id` int NOT NULL,
  `u` double NOT NULL,
  PRIMARY KEY (`year`,`prm_id`,`pathway`,`shock`,`intensity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_flex2`
--

DROP TABLE IF EXISTS `in_flex2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_flex2` (
  `scenario` varchar(45) NOT NULL,
  `pathway` enum('SPS1','SPS2','SPS3','SPS4') NOT NULL,
  `shock` enum('None','FIN','HEA','COL','SOC','NUC') NOT NULL,
  `intensity` enum('None','Low','Mid','High') NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `yr` int NOT NULL,
  `ele1` double NOT NULL,
  `ele2` double NOT NULL,
  `gas1` double NOT NULL,
  `gas2` double NOT NULL,
  PRIMARY KEY (`yr`,`pathway`,`shock`,`intensity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_gem1`
--

DROP TABLE IF EXISTS `in_gem1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_gem1` (
  `scn_code` varchar(9) NOT NULL,
  `grp_name` varchar(100) NOT NULL,
  `prm_name` varchar(100) NOT NULL,
  `yr` int NOT NULL,
  `u` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_ipw1`
--

DROP TABLE IF EXISTS `in_ipw1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_ipw1` (
  `scn_id` int NOT NULL,
  `sps_code` varchar(10) NOT NULL,
  `prm_id` int NOT NULL,
  `path` varchar(150) DEFAULT NULL,
  `u` double DEFAULT NULL,
  PRIMARY KEY (`scn_id`,`sps_code`,`prm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_mc1`
--

DROP TABLE IF EXISTS `in_mc1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_mc1` (
  `mc_id` int NOT NULL,
  `prm_id` int NOT NULL,
  `prm_name` varchar(100) DEFAULT NULL,
  `mc_grp` enum('Socio-Political','Environment','Economy','Resilience') DEFAULT NULL,
  `mc_code` varchar(4) DEFAULT NULL,
  `mc_sgn` double NOT NULL DEFAULT '1',
  `mc_pref` int NOT NULL DEFAULT '1',
  `mc_w0` double NOT NULL DEFAULT '1',
  `mc_w1` double NOT NULL DEFAULT '1',
  `mc_p` double DEFAULT NULL,
  `mc_q` double DEFAULT NULL,
  `prm_src` varchar(45) DEFAULT NULL,
  `prm_desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`mc_id`,`prm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_prem1`
--

DROP TABLE IF EXISTS `in_prem1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_prem1` (
  `sector` varchar(45) DEFAULT NULL,
  `variable` varchar(100) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `region` varchar(3) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `scenario` varchar(100) DEFAULT NULL,
  `impact` varchar(100) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_raw1`
--

DROP TABLE IF EXISTS `in_raw1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_raw1` (
  `prm_id` int NOT NULL,
  `scn_id` int NOT NULL,
  `yr` int NOT NULL,
  `u` double NOT NULL,
  PRIMARY KEY (`prm_id`,`scn_id`,`yr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_stem1`
--

DROP TABLE IF EXISTS `in_stem1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_stem1` (
  `prm_id` int NOT NULL,
  `scn_id` int NOT NULL,
  `prm_name` varchar(250) DEFAULT NULL,
  `prm_unit` varchar(100) DEFAULT NULL,
  `yr_2020` varchar(45) DEFAULT NULL,
  `yr_2022` varchar(45) DEFAULT NULL,
  `yr_2025` varchar(45) DEFAULT NULL,
  `yr_2030` varchar(45) DEFAULT NULL,
  `yr_2035` varchar(45) DEFAULT NULL,
  `yr_2040` varchar(45) DEFAULT NULL,
  `yr_2050` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`prm_id`,`scn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_stem2`
--

DROP TABLE IF EXISTS `in_stem2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_stem2` (
  `rpt_id` int NOT NULL,
  `scn_id` int NOT NULL,
  `yr` int NOT NULL,
  `qtr` varchar(5) NOT NULL,
  `wkd` varchar(5) NOT NULL,
  `day` varchar(5) NOT NULL,
  `io` varchar(5) NOT NULL,
  `reg` varchar(15) NOT NULL,
  `u` double DEFAULT NULL,
  PRIMARY KEY (`rpt_id`,`scn_id`,`yr`,`qtr`,`wkd`,`day`,`io`,`reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_stem3`
--

DROP TABLE IF EXISTS `in_stem3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_stem3` (
  `Model` text,
  `Scenario` text,
  `Shock` text,
  `Region` text,
  `Variable` text,
  `Unit` text,
  `2020` text,
  `2022` text,
  `2025` text,
  `2030` text,
  `2035` text,
  `2040` text,
  `2050` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `in_xpn1`
--

DROP TABLE IF EXISTS `in_xpn1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `in_xpn1` (
  `sps_code` varchar(4) NOT NULL,
  `shk_code` varchar(3) NOT NULL,
  `shk_lvl` int NOT NULL,
  `prm_id` int NOT NULL,
  `yr` int NOT NULL,
  `u` double DEFAULT NULL,
  PRIMARY KEY (`sps_code`,`shk_code`,`shk_lvl`,`prm_id`,`yr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ind`
--

DROP TABLE IF EXISTS `ind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ind` (
  `ind_id` int NOT NULL AUTO_INCREMENT,
  `ind_pos` int DEFAULT NULL,
  `ind_grp` enum('Socio-Political','Environment','Economy','Resilience') DEFAULT NULL,
  `ind_code` varchar(5) DEFAULT NULL,
  `prm_id` int DEFAULT NULL,
  `ind_name` varchar(45) DEFAULT NULL,
  `ind_unit` varchar(45) DEFAULT NULL,
  `ind_owner` varchar(45) DEFAULT NULL,
  `ind_pref` int DEFAULT '1',
  `ind_sca` double DEFAULT '1',
  `ind_w` double DEFAULT '1',
  PRIMARY KEY (`ind_id`),
  KEY `fk_ind_prm_idx` (`prm_id`),
  CONSTRAINT `fk_ind_prm` FOREIGN KEY (`prm_id`) REFERENCES `prm` (`prm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ind_scn`
--

DROP TABLE IF EXISTS `ind_scn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ind_scn` (
  `ind_id` int NOT NULL,
  `scn_id` int NOT NULL,
  PRIMARY KEY (`ind_id`,`scn_id`),
  UNIQUE KEY `ix_ind_scn` (`ind_id`,`scn_id`),
  KEY `fk_ind_idx` (`ind_id`),
  KEY `fk_scn` (`scn_id`),
  CONSTRAINT `fk_ind` FOREIGN KEY (`ind_id`) REFERENCES `ind` (`ind_id`),
  CONSTRAINT `fk_scn` FOREIGN KEY (`scn_id`) REFERENCES `scn` (`scn_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ind_yr`
--

DROP TABLE IF EXISTS `ind_yr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ind_yr` (
  `yr` int NOT NULL,
  PRIMARY KEY (`yr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itm`
--

DROP TABLE IF EXISTS `itm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itm` (
  `itm_id` int NOT NULL AUTO_INCREMENT,
  `itm_act` tinyint NOT NULL DEFAULT '1',
  `itm_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `itm_name` varchar(45) NOT NULL DEFAULT 'new',
  `itm_val1` int NOT NULL DEFAULT '0',
  `itm_val2` double NOT NULL DEFAULT '0',
  `itm_typ` enum('one','two','three') DEFAULT NULL,
  PRIMARY KEY (`itm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc`
--

DROP TABLE IF EXISTS `mc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc` (
  `mc_id` int NOT NULL AUTO_INCREMENT,
  `mc_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_prm`
--

DROP TABLE IF EXISTS `mc_prm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_prm` (
  `mc_id` int NOT NULL,
  `prm_id` int NOT NULL,
  `prm_name` varchar(100) DEFAULT NULL,
  `mc_grp` enum('Socio-Political','Environment','Economy','Resilience') DEFAULT NULL,
  `mc_code` varchar(4) DEFAULT NULL,
  `mc_sgn` double NOT NULL DEFAULT '1',
  `mc_pref` int NOT NULL DEFAULT '1',
  `mc_w0` double NOT NULL DEFAULT '1',
  `mc_w1` double NOT NULL DEFAULT '1',
  `mc_p` double DEFAULT NULL,
  `mc_q` double DEFAULT NULL,
  `prm_src` varchar(45) DEFAULT NULL,
  `prm_desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`mc_id`,`prm_id`),
  KEY `fk_mc_prm_prm_id_idx` (`prm_id`),
  CONSTRAINT `fk_mc_prm_mc_id` FOREIGN KEY (`mc_id`) REFERENCES `mc` (`mc_id`),
  CONSTRAINT `fk_mc_prm_prm_id` FOREIGN KEY (`prm_id`) REFERENCES `prm` (`prm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_scn`
--

DROP TABLE IF EXISTS `mc_scn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_scn` (
  `mc_id` int NOT NULL,
  `scn_id` int NOT NULL,
  PRIMARY KEY (`mc_id`,`scn_id`),
  KEY `fk_mc_scn_scn_id` (`scn_id`),
  CONSTRAINT `fk_mc_scn_mc_id` FOREIGN KEY (`mc_id`) REFERENCES `mc` (`mc_id`),
  CONSTRAINT `fk_mc_scn_scn_id` FOREIGN KEY (`scn_id`) REFERENCES `scn` (`scn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mc_yr`
--

DROP TABLE IF EXISTS `mc_yr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mc_yr` (
  `mc_id` int NOT NULL,
  `yr` int NOT NULL,
  PRIMARY KEY (`mc_id`,`yr`),
  CONSTRAINT `fk_mc_yr_mc_id` FOREIGN KEY (`mc_id`) REFERENCES `mc` (`mc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm`
--

DROP TABLE IF EXISTS `prm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm` (
  `prm_id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `lvl` int DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `leaf` int DEFAULT NULL,
  `calc` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `path` text,
  `old_name` varchar(200) DEFAULT NULL,
  `new_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`prm_id`),
  KEY `fk_id_pid_idx` (`pid`),
  CONSTRAINT `fk_pid_id` FOREIGN KEY (`pid`) REFERENCES `prm` (`prm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_bck1`
--

DROP TABLE IF EXISTS `prm_bck1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm_bck1` (
  `prm_id` int NOT NULL DEFAULT '0',
  `pid` int DEFAULT NULL,
  `lvl` int DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `leaf` int DEFAULT NULL,
  `calc` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `path` text,
  `old_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_bck2`
--

DROP TABLE IF EXISTS `prm_bck2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm_bck2` (
  `prm_id` int NOT NULL DEFAULT '0',
  `pid` int DEFAULT NULL,
  `lvl` int DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `leaf` int DEFAULT NULL,
  `calc` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `path` text,
  `old_name` varchar(200) DEFAULT NULL,
  `new_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_gem1`
--

DROP TABLE IF EXISTS `prm_gem1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm_gem1` (
  `file_typ` int NOT NULL DEFAULT '1',
  `prm_id` int NOT NULL,
  `grp_name` varchar(100) NOT NULL,
  `prm_name` varchar(100) NOT NULL,
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`prm_id`,`file_typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_prem1`
--

DROP TABLE IF EXISTS `prm_prem1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm_prem1` (
  `prm_id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `sec` enum('industry','residential','services','transport') DEFAULT NULL,
  `var` varchar(100) DEFAULT NULL,
  `imp` enum('climate change','minerals depletion','net use of fresh water','land occupation','ecosystem quality','human health') DEFAULT NULL,
  `loc` enum('CH','EU wo CH','RoW') DEFAULT NULL,
  `path1` varchar(100) DEFAULT NULL,
  `name1` varchar(45) DEFAULT NULL,
  `name2` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `var_old` varchar(100) DEFAULT NULL,
  `imp_old` int DEFAULT NULL,
  `imp_del` enum('climate change','minerals depletion','use of net fresh water','land occupation','ecosystem quality','human health') DEFAULT NULL,
  PRIMARY KEY (`prm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_stem1`
--

DROP TABLE IF EXISTS `prm_stem1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm_stem1` (
  `prm_id` int NOT NULL DEFAULT '0',
  `variable` varchar(150) NOT NULL,
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`prm_id`),
  UNIQUE KEY `variable_UNIQUE` (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prm_stem2`
--

DROP TABLE IF EXISTS `prm_stem2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prm_stem2` (
  `prm_id` int NOT NULL,
  `io` enum('Pd','Pg') NOT NULL,
  `reg` enum('AT','DE','FR','IT','nuke_bez','nuke_goe','nuke_lei','nuke_mue','region_1','region_2','region_3','region_4','region_5','region_6','region_7') NOT NULL,
  `qtr` enum('FAL','SPR','SUM','WIN') NOT NULL,
  `wkd` enum('SA','SU','WK') NOT NULL,
  `day` enum('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','D11','D12','D13','D14','D15','D16','D17','D18','D19','D20','D21','D22','D23','D24') NOT NULL,
  PRIMARY KEY (`prm_id`),
  UNIQUE KEY `uq_prm_stem1` (`io`,`reg`,`qtr`,`wkd`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt`
--

DROP TABLE IF EXISTS `rpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt` (
  `rpt_id` int NOT NULL AUTO_INCREMENT,
  `rpt_typ` int DEFAULT '1',
  `rpt_name` varchar(100) NOT NULL DEFAULT 'new',
  PRIMARY KEY (`rpt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_prm`
--

DROP TABLE IF EXISTS `rpt_prm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_prm` (
  `rpt_id` int NOT NULL,
  `prm_id` int NOT NULL,
  `pos` int DEFAULT NULL,
  PRIMARY KEY (`rpt_id`,`prm_id`),
  KEY `fk_rpt_prn_prm_id_idx` (`prm_id`),
  CONSTRAINT `fk_rpt_prm_rpt_id` FOREIGN KEY (`rpt_id`) REFERENCES `rpt` (`rpt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rpt_prn_prm_id` FOREIGN KEY (`prm_id`) REFERENCES `prm` (`prm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rpt_yr`
--

DROP TABLE IF EXISTS `rpt_yr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_yr` (
  `rpt_id` int NOT NULL,
  `yr` int NOT NULL,
  PRIMARY KEY (`rpt_id`,`yr`),
  CONSTRAINT `fk_rpt_yr` FOREIGN KEY (`rpt_id`) REFERENCES `rpt` (`rpt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scn`
--

DROP TABLE IF EXISTS `scn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scn` (
  `scn_id` int NOT NULL AUTO_INCREMENT,
  `sps_id` int NOT NULL,
  `shk_id` int DEFAULT NULL,
  `shk_lvl` int DEFAULT NULL,
  `shk_yr` int DEFAULT NULL,
  `shk_code` enum('bas','fin','hot','cld','soc','nuc') DEFAULT NULL,
  `sps_code` enum('SPS1','SPS2','SPS3','SPS4') GENERATED ALWAYS AS (`sps_id`) VIRTUAL,
  `scn_code` varchar(45) GENERATED ALWAYS AS (concat(`sps_code`,_utf8mb4'_',`shk_code`,`shk_lvl`)) VIRTUAL,
  `cod_prem1` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`scn_id`),
  UNIQUE KEY `uq_scn` (`sps_id`,`shk_id`,`shk_lvl`),
  KEY `fk_scn_shk_idx` (`shk_id`),
  KEY `fk_scn_sps_idx` (`sps_id`),
  CONSTRAINT `fk_scn_shk` FOREIGN KEY (`shk_id`) REFERENCES `shk` (`shk_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_scn_sps` FOREIGN KEY (`sps_id`) REFERENCES `sps` (`sps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shk`
--

DROP TABLE IF EXISTS `shk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shk` (
  `shk_id` int NOT NULL AUTO_INCREMENT,
  `shk_code` varchar(5) DEFAULT NULL,
  `shk_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sps`
--

DROP TABLE IF EXISTS `sps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sps` (
  `sps_id` int NOT NULL AUTO_INCREMENT,
  `sps_code` varchar(4) NOT NULL,
  `sps_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`sps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_afr_cal0`
--

DROP TABLE IF EXISTS `vw_afr_cal0`;
/*!50001 DROP VIEW IF EXISTS `vw_afr_cal0`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_afr_cal0` AS SELECT 
 1 AS `scn_id`,
 1 AS `yr`,
 1 AS `u_sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_afr_cal1`
--

DROP TABLE IF EXISTS `vw_afr_cal1`;
/*!50001 DROP VIEW IF EXISTS `vw_afr_cal1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_afr_cal1` AS SELECT 
 1 AS `prm_id`,
 1 AS `pos`,
 1 AS `r`,
 1 AS `r_unit`,
 1 AS `name`,
 1 AS `unit`,
 1 AS `scn_id`,
 1 AS `scn_code`,
 1 AS `yr`,
 1 AS `u`,
 1 AS `u_sum`,
 1 AS `w`,
 1 AS `wr_gweyr`,
 1 AS `wr_twh`,
 1 AS `u_twh`,
 1 AS `f`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_afr_cal2`
--

DROP TABLE IF EXISTS `vw_afr_cal2`;
/*!50001 DROP VIEW IF EXISTS `vw_afr_cal2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_afr_cal2` AS SELECT 
 1 AS `scn_id`,
 1 AS `yr`,
 1 AS `wr_twh`,
 1 AS `f`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_afr_prm`
--

DROP TABLE IF EXISTS `vw_afr_prm`;
/*!50001 DROP VIEW IF EXISTS `vw_afr_prm`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_afr_prm` AS SELECT 
 1 AS `prm_id`,
 1 AS `pos`,
 1 AS `name`,
 1 AS `unit`,
 1 AS `r`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cmp_shk1`
--

DROP TABLE IF EXISTS `vw_cmp_shk1`;
/*!50001 DROP VIEW IF EXISTS `vw_cmp_shk1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cmp_shk1` AS SELECT 
 1 AS `scn_id`,
 1 AS `sps_id`,
 1 AS `shk_id`,
 1 AS `sps_code`,
 1 AS `shk_code`,
 1 AS `shk_lvl`,
 1 AS `prm_id`,
 1 AS `yr`,
 1 AS `u`,
 1 AS `scn_id_bas`,
 1 AS `u_bas`,
 1 AS `u_rel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cmp_vlm1`
--

DROP TABLE IF EXISTS `vw_cmp_vlm1`;
/*!50001 DROP VIEW IF EXISTS `vw_cmp_vlm1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cmp_vlm1` AS SELECT 
 1 AS `prm_id`,
 1 AS `scn_id`,
 1 AS `mc_sgn`,
 1 AS `u`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mc1`
--

DROP TABLE IF EXISTS `vw_mc1`;
/*!50001 DROP VIEW IF EXISTS `vw_mc1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mc1` AS SELECT 
 1 AS `mc_id`,
 1 AS `prm_id`,
 1 AS `prm_name`,
 1 AS `mc_sgn`,
 1 AS `mc_pref`,
 1 AS `mc_w0`,
 1 AS `mc_w1`,
 1 AS `mc_p`,
 1 AS `mc_q`,
 1 AS `prm_src`,
 1 AS `yr`,
 1 AS `scn_id`,
 1 AS `u`,
 1 AS `u_avg`,
 1 AS `u_std`,
 1 AS `z`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mc2`
--

DROP TABLE IF EXISTS `vw_mc2`;
/*!50001 DROP VIEW IF EXISTS `vw_mc2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mc2` AS SELECT 
 1 AS `mc_id`,
 1 AS `prm_id`,
 1 AS `u_avg`,
 1 AS `u_std`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mc3`
--

DROP TABLE IF EXISTS `vw_mc3`;
/*!50001 DROP VIEW IF EXISTS `vw_mc3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mc3` AS SELECT 
 1 AS `mc_id`,
 1 AS `yr`,
 1 AS `prm_id`,
 1 AS `mc_w1`,
 1 AS `mc_pref`,
 1 AS `mc_p`,
 1 AS `mc_q`,
 1 AS `scn_id1`,
 1 AS `scn_id2`,
 1 AS `u_avg`,
 1 AS `u_std`,
 1 AS `u1`,
 1 AS `u2`,
 1 AS `z1`,
 1 AS `z2`,
 1 AS `d`,
 1 AS `p1`,
 1 AS `p2`,
 1 AS `phi`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mc4`
--

DROP TABLE IF EXISTS `vw_mc4`;
/*!50001 DROP VIEW IF EXISTS `vw_mc4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mc4` AS SELECT 
 1 AS `mc_id`,
 1 AS `yr`,
 1 AS `prm_id`,
 1 AS `mc_w1`,
 1 AS `scn_id`,
 1 AS `p1`,
 1 AS `p2`,
 1 AS `phi`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mc5`
--

DROP TABLE IF EXISTS `vw_mc5`;
/*!50001 DROP VIEW IF EXISTS `vw_mc5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mc5` AS SELECT 
 1 AS `mc_id`,
 1 AS `yr`,
 1 AS `scn_id`,
 1 AS `p1`,
 1 AS `p2`,
 1 AS `phi`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_prm_path`
--

DROP TABLE IF EXISTS `vw_prm_path`;
/*!50001 DROP VIEW IF EXISTS `vw_prm_path`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_prm_path` AS SELECT 
 1 AS `prm_id`,
 1 AS `lvl`,
 1 AS `leaf`,
 1 AS `name`,
 1 AS `path`,
 1 AS `prm_id0`,
 1 AS `prm_id1`,
 1 AS `prm_id2`,
 1 AS `prm_id3`,
 1 AS `prm_id4`,
 1 AS `prm_id5`,
 1 AS `prm_id6`,
 1 AS `prm_id7`,
 1 AS `prm_id8`,
 1 AS `prm_id9`,
 1 AS `prm_id10`,
 1 AS `name0`,
 1 AS `name1`,
 1 AS `name2`,
 1 AS `name3`,
 1 AS `name4`,
 1 AS `name5`,
 1 AS `name6`,
 1 AS `name7`,
 1 AS `name8`,
 1 AS `name9`,
 1 AS `name10`,
 1 AS `pos0`,
 1 AS `pos1`,
 1 AS `pos2`,
 1 AS `pos3`,
 1 AS `pos4`,
 1 AS `pos5`,
 1 AS `pos6`,
 1 AS `pos7`,
 1 AS `pos8`,
 1 AS `pos9`,
 1 AS `pos10`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db2'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_clamp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_clamp`(u DOUBLE, lo DOUBLE, hi DOUBLE) RETURNS double
    DETERMINISTIC
BEGIN

	RETURN GREATEST(LEAST(u, hi),lo);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_pref` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_pref`(d double, typ int, p double, q double) RETURNS double
    DETERMINISTIC
BEGIN

	


	DECLARE pref double;

	SET pref = 

	CASE
		WHEN typ = 0 THEN GREATEST(d,0)
		WHEN typ = 1 THEN (d>0)
		WHEN typ = 2 THEN (d>p)
		WHEN typ = 3 THEN IF(p>0,fn_clamp(d/p,0,1),0)
		WHEN typ = 4 THEN 0.5*((d>q)+(d>p))
		WHEN typ = 5 THEN IF(p>0,fn_clamp((d-q)/(p-q),0,1),0)
		ELSE 0
	END;

	RETURN pref;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_sci` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_sci`(u DOUBLE) RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN

	DECLARE e  INT;
    DECLARE m  DOUBLE;
    
    SET e = FLOOR(IF(u=0,0,LOG10(ABS(u))));
    SET m = u/pow(10,e);

	RETURN CONCAT(FORMAT(m,5),'E',e);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_tic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_tic`(rng DOUBLE) RETURNS double
    DETERMINISTIC
BEGIN

	RETURN POW( 10, CEIL(LOG10(rng / 20)));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_afr_upd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_afr_upd`()
BEGIN

	INSERT cub1_last (ts,prm_id,scn_id,yr,u)

	SELECT 

	utc_timestamp(),
	32499,
	scn_id,
	yr,
	wr_twh
	from vw_afr_cal2

	ON DUPLICATE KEY UPDATE ts = utc_timestamp(), u = wr_twh;


	INSERT cub1_last (ts,prm_id,scn_id,yr,u)

	SELECT 

	utc_timestamp(),
	32500,
	scn_id,
	yr,
	f
	from vw_afr_cal2

	ON DUPLICATE KEY UPDATE ts = utc_timestamp(), u = f;
    


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cmp_bas1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cmp_bas1`()
BEGIN

	SELECT  scn_id, sps_id, sps_code, shk_id, shk_code, shk_lvl, scn_code FROM scn WHERE shk_lvl IN (0,3)  ORDER BY shk_id, sps_id, shk_lvl;

	SELECT * FROM mc_prm WHERE mc_id = 2 ORDER BY mc_grp, mc_code;

	SELECT 

	s1.scn_id,
	s1.sps_id,
	s1.shk_id,
	s1.shk_lvl,

	v1.prm_id,
    v1.mc_sgn,
	(v1.u - v2.u)/v2.u as u,
    STD((v1.u - v2.u)/v2.u) OVER (PARTITION BY v1.prm_id) as u_std

	FROM vw_cmp_vlm1 AS v1

	JOIN scn AS s1
	ON s1.scn_id = v1.scn_id

	JOIN scn AS s2
	ON s2.shk_id = s1.shk_id
	AND s2.shk_lvl = s1.shk_lvl
	AND s2.sps_id = 4

	JOIN vw_cmp_vlm1 AS v2
	ON v2.prm_id = v1.prm_id
	AND v2.scn_id = s2.scn_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cmp_shk1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cmp_shk1`(prm_id INT)
BEGIN

	SELECT * FROM sps ORDER BY sps_id;
    
    SELECT * FROM shk where shk_id <> 1 ORDER BY shk_id;

	WITH t (shk_lvl) AS (VALUES ROW(1), ROW(2), ROW(3)) SELECT * FROM t;

    select distinct yr from vw_cmp_shk1 where vw_cmp_shk1.prm_id = prm_id and shk_lvl <> 0 ORDER BY yr;
    
    select MIN(u_rel) as rel_min, MAX(u_rel) as rel_max from vw_cmp_shk1 where vw_cmp_shk1.prm_id = prm_id and shk_lvl <> 0;
    
    select * from vw_cmp_shk1 where vw_cmp_shk1.prm_id = prm_id and shk_lvl <> 0 ORDER BY yr, sps_id, shk_id, shk_lvl;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cmp_shk2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cmp_shk2`()
BEGIN

	SELECT  scn_id, sps_id, sps_code, shk_id, shk_code, shk_lvl, scn_code FROM scn WHERE shk_lvl IN (0,3) ORDER BY  shk_id, sps_id, shk_lvl;

	SELECT * FROM mc_prm WHERE mc_id = 2 AND prm_id IN (19982,28693,28691,3450,19985,19984,3465,23360) ORDER BY mc_grp, mc_code;
    
    SELECT 

	s1.scn_id,
	s1.sps_id,
	s1.shk_id,
	s1.shk_lvl,

	v1.prm_id,
    v1.mc_sgn,
	(v1.u - v2.u)/v2.u as u,
	STD((v1.u - v2.u)/v2.u) OVER (PARTITION BY v1.prm_id) as u_std

	FROM vw_cmp_vlm1 AS v1

	JOIN scn AS s1
	ON s1.scn_id = v1.scn_id


	JOIN scn AS s2
	ON s2.sps_id = s1.sps_id
	AND s2.shk_id = 1
	AND s2.shk_lvl = 0

	JOIN  vw_cmp_vlm1 AS v2
	ON v1.prm_id = v2.prm_id
	AND v2.scn_id = s2.scn_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cmp_shk3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cmp_shk3`()
BEGIN

	SELECT  scn_id, sps_id, sps_code, shk_id, shk_code, shk_lvl, scn_code FROM scn WHERE shk_lvl IN (0,3)   ORDER BY shk_id, sps_id, shk_lvl;

	SELECT * FROM mc_prm WHERE mc_id = 2 AND prm_id IN (19982,28693,28691,3450,19985,19984,3465,23360) ORDER BY mc_grp, mc_code;
    
    SELECT 

	s1.scn_id,
	s1.sps_id,
	s1.shk_id,
	s1.shk_lvl,

	v1.prm_id,
    v1.mc_sgn,
	v1.u,
    STD(v1.u) OVER (PARTITION BY v1.prm_id) as u_std,
	AVG(v1.u) OVER (PARTITION BY v1.prm_id) as u_avg,
    (v1.u - AVG(v1.u) OVER (PARTITION BY v1.prm_id)) / STD(v1.u) OVER (PARTITION BY v1.prm_id) as z


	FROM vw_cmp_vlm1 AS v1

	JOIN scn AS s1
	ON s1.scn_id = v1.scn_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cmp_vlm1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cmp_vlm1`()
BEGIN

	SELECT  scn_id, sps_id, sps_code, shk_id, shk_code, shk_lvl, scn_code FROM scn ORDER BY  sps_id, shk_id, shk_lvl;

	SELECT * FROM mc_prm WHERE mc_id = 2 ORDER BY mc_grp, mc_code;
    
    SELECT prm_id, scn_id, fn_sci(u) AS u, mc_sgn,
    
	MAX(u) OVER (PARTITION BY prm_id) as u_max,
	MIN(u) OVER (PARTITION BY prm_id) as u_min
    
    FROM vw_cmp_vlm1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dsp_raw1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dsp_raw1`(rpt_id INT, scn_id INT)
BEGIN

	SELECT 

	rp1.rpt_id,
	rp1.prm_id,
	scn_id,
	ry1.yr,
	c1.u

	FROM rpt_prm rp1

	JOIN rpt_yr ry1
	ON ry1.rpt_id = rp1.rpt_id

	JOIN cub1_last c1
	ON c1.prm_id = rp1.prm_id
	AND c1.scn_id = scn_id
	AND c1.yr = ry1.yr

	WHERE rp1.rpt_id = rpt_id

	ORDER BY rp1.rpt_id, rp1.prm_id, scn_id, ry1.yr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dsp_rpt1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dsp_rpt1`(rpt_id INT, scn_id INT)
BEGIN

	set session group_concat_max_len = 2048;

	SET @sql1 = NULL;

	SELECT
	GROUP_CONCAT(DISTINCT CONCAT(' SUM(IF(yr = ', ry1.yr , ', u, NULL)) AS col_', ry1.yr)) INTO @sql1
	FROM rpt_yr ry1
	WHERE ry1.rpt_id = rpt_id;

	-- SELECT @sql1 as txt1;

	SET @sql2 = CONCAT('SELECT rp1.prm_id, s1.scn_id, rp1.pos, p1.path, p1.unit, ', @sql1);
	SET @sql2 = CONCAT(@sql2,' FROM rpt_prm rp1');
	SET @sql2 = CONCAT(@sql2,' JOIN scn s1 ON s1.scn_id = ', scn_id);
	SET @sql2 = CONCAT(@sql2,' JOIN prm p1 ON p1.prm_id = rp1.prm_id');
	SET @sql2 = CONCAT(@sql2,' LEFT JOIN cub1_last c1 ON c1.prm_id = rp1.prm_id AND c1.scn_id = s1.scn_id');
	SET @sql2 = CONCAT(@sql2,' WHERE rp1.rpt_id = ', rpt_id);
	SET @sql2 = CONCAT(@sql2,' GROUP BY rp1.prm_id, c1.scn_id, rp1.pos');
	SET @sql2 = CONCAT(@sql2,' ORDER BY rp1.pos');

	-- SELECT @sql2 as txt2;

	PREPARE stmt FROM @sql2;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grd_plt1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grd_plt1`()
BEGIN

	SET @sx = 274.89;
    SET @sy = 401.72;

	-- SELECT min(x_pos), min(y_pos), max(x_pos), max(y_pos)
	-- INTO @x_min, @y_min, @x_max, @y_max
	-- FROM grd_bus1;
    
    SET @x_min =  5.80;
    SET @x_max = 10.70;
    SET @y_min = 45.75;
    SET @y_max = 47.90;
    
    SELECT 
    @sx as sx,
    @sy as sy,
    @x_min as x_min, 
    @x_max as x_max, 
    @y_min as y_min, 
    @y_max as y_max,
    CONVERT(@sx * (@x_max - @x_min), DECIMAL(8,4)) as w,
    CONVERT(@sy * (@y_max - @y_min), DECIMAL(8,4)) as h;
    
    
    SELECT
    
	CONVERT(x_pos, DECIMAL(8,4)) as x_pos,
	CONVERT(y_pos, DECIMAL(8,4)) as y_pos,
    CONVERT(@sx * (x_pos - @x_min), DECIMAL(8,4)) as x,
    CONVERT(@sy * (@y_max - y_pos), DECIMAL(8,4)) as y,
	bus_id,
    bus_lbl,
    zone_name,
    un

    FROM grd_bus1
    
    ORDER BY x,y;


    SELECT 

    grd_con1.con_uid,
    grd_con1.bus1_id,
    grd_con1.bus2_id,
    grd_con1.con_name
    
    FROM grd_con1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ind_lst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ind_lst`()
BEGIN

	SELECT 

	*

	FROM ind;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ind_rpt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ind_rpt`(yr INT)
BEGIN

	SELECT * FROM ind ORDER BY ind_id;
    
    SELECT * FROM scn ORDER BY scn_id;
    
    SELECT 

	ind.ind_id,
	c1.* 

	FROM ind

	JOIN cub1_last c1
	ON ind.prm_id = c1.prm_id

	WHERE c1.yr = yr

	ORDER BY c1.scn_id, ind.ind_id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ind_rpt1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ind_rpt1`(yr INT)
BEGIN

	SELECT * FROM ind ORDER BY ind_id;
    
    SELECT * FROM scn ORDER BY scn_id;
    
    SELECT 

	ind.ind_id,
	c1.* 

	FROM ind

	JOIN cub1_last c1
	ON ind.prm_id = c1.prm_id

	WHERE c1.yr = yr

	ORDER BY c1.scn_id, ind.ind_id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ind_rpt2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ind_rpt2`(yr INT, shk_id INT, shk_lvl INT)
BEGIN

	SELECT ind_id, ind_name, prm_id FROM ind ORDER BY ind_id;
    
    select

	scn_id,
	sps_id,
	sps_code,
	shk_id,
	shk_code,
	shk_lvl,
    scn_code

	from scn 

	where scn.shk_id = shk_id
	and scn.shk_lvl = shk_lvl
    
    ORDER BY scn.sps_id;
    
    

   
	SELECT 
    
	ind.ind_id,
	c1.scn_id,
	c1.prm_id,
	c1.yr,
	fn_sci(c1.u) as u

	FROM ind

	JOIN cub1_last c1
	ON ind.prm_id = c1.prm_id

	WHERE c1.yr = yr
    
    AND c1.scn_id IN
    (
		select

		scn.scn_id
		
		from scn 

		where scn.shk_id = shk_id
		and scn.shk_lvl = shk_lvl
    )

	ORDER BY c1.scn_id, ind.ind_id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ind_scn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ind_scn`()
BEGIN

	SELECT 


	ind.ind_id 		as ind_id,
    ind.ind_grp 	as ind_grp,
    ind.prm_id 		as prm_id,
	ind.ind_name 	as ind_name,
	ind.ind_code	as ind_code,
	ind.ind_unit	as ind_unit,

	scn.scn_id,
	scn.sps_id,
    scn.sps_code,
	scn.shk_lvl,
	scn.shk_yr,

	shk.shk_id,
	shk.shk_code,
	shk.shk_name,
    
    CONCAT(scn.sps_code,'_',shk.shk_code,scn.shk_lvl) as scn_code

	FROM ind

	JOIN ind_scn
	ON ind.ind_id = ind_scn.ind_id

	JOIN scn
	ON scn.scn_id = ind_scn.scn_id

	JOIN shk
	ON shk.shk_id = scn.shk_id

	ORDER BY ind.ind_pos, scn.sps_id, scn.shk_id, scn.shk_lvl;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_flex1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_flex1`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u)

	SELECT 

	prm_id, 
	scn_id,
	year,
	u

	FROM db2.in_flex1

	JOIN scn
	ON  sps_id = pathway+0
	AND shk_id = shock+0
	AND shk_lvl = intensity-1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_flex2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_flex2`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u)
	SELECT 19982 as prm_id, scn_id, yr, ele1 as u
	FROM in_flex2
	JOIN scn
	ON  sps_id = pathway+0
	AND shk_id = shock+0
	AND shk_lvl = intensity-1;
    
	INSERT cub1 (prm_id, scn_id, yr, u)
	SELECT 19983 as prm_id, scn_id, yr, ele2 as u
	FROM in_flex2
	JOIN scn
	ON  sps_id = pathway+0
	AND shk_id = shock+0
	AND shk_lvl = intensity-1;

	INSERT cub1 (prm_id, scn_id, yr, u)
	SELECT 32502 as prm_id, scn_id, yr, gas1 as u
	FROM in_flex2
	JOIN scn
	ON  sps_id = pathway+0
	AND shk_id = shock+0
	AND shk_lvl = intensity-1;

	INSERT cub1 (prm_id, scn_id, yr, u)
	SELECT 32503 as prm_id, scn_id, yr, gas2 as u
	FROM in_flex2
	JOIN scn
	ON  sps_id = pathway+0
	AND shk_id = shock+0
	AND shk_lvl = intensity-1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_gem1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_gem1`()
BEGIN

	INSERT cub1
    
    (
		prm_id,
		scn_id,
        yr,
        u
    )

	SELECT 

	prm_gem1.prm_id,
    scn.scn_id, 
	in_gem1.yr,
	in_gem1.u

	FROM in_gem1

	JOIN prm_gem1
	ON  in_gem1.grp_name = prm_gem1.grp_name
	AND in_gem1.prm_name = prm_gem1.prm_name


	JOIN scn
	ON scn.scn_code = in_gem1.scn_code;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_ipw1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_ipw1`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u) select prm_id, scn_id, 2020 as yr, u from in_ipw1;
    INSERT cub1 (prm_id, scn_id, yr, u) select prm_id, scn_id, 2025 as yr, u from in_ipw1;
    INSERT cub1 (prm_id, scn_id, yr, u) select prm_id, scn_id, 2030 as yr, u from in_ipw1;
    INSERT cub1 (prm_id, scn_id, yr, u) select prm_id, scn_id, 2035 as yr, u from in_ipw1;
    INSERT cub1 (prm_id, scn_id, yr, u) select prm_id, scn_id, 2040 as yr, u from in_ipw1;
    INSERT cub1 (prm_id, scn_id, yr, u) select prm_id, scn_id, 2050 as yr, u from in_ipw1;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_mc1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_mc1`()
BEGIN

	DELETE FROM mc_prm WHERE mc_prm.mc_id = 3;
    
    INSERT mc_prm (mc_id,prm_id,prm_name,mc_grp,mc_code,mc_sgn,mc_pref,mc_w0,mc_w1,mc_p,mc_q,prm_src,prm_desc)
    
    SELECT 3,prm_id,prm_name,mc_grp,mc_code,mc_sgn,mc_pref,mc_w0,mc_w1,mc_p,mc_q,prm_src,prm_desc
    
    FROM in_mc1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_prem1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_prem1`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u)

	select 

	prm_prem1.prm_id,
	scn.scn_id,
	year as yr,
	value as u


	from prm_prem1

	join in_prem1
	ON prm_prem1.sec = in_prem1.sector
	AND prm_prem1.loc = in_prem1.location
	AND prm_prem1.var = in_prem1.variable
	AND prm_prem1.imp = in_prem1.impact

	JOIN scn
	on scn.cod_prem1 = in_prem1.scenario;
    
    -- aggregate
    call db2.sp_roll_lvl(6);
    call db2.sp_roll_lvl(5);
    call db2.sp_roll_lvl(4);
    call db2.sp_roll_lvl(3);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_raw1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_raw1`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u) 

	SELECT 

	prm_id, 
	scn_id, 
	yr, 
	u

	FROM in_raw1

	WHERE prm_id <> 0
	AND scn_id <> 0
	AND yr <> 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_stem1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_stem1`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2020, CONVERT(yr_2020, DOUBLE) FROM in_stem1;
    INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2022, CONVERT(yr_2022, DOUBLE) FROM in_stem1;
    INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2025, CONVERT(yr_2025, DOUBLE) FROM in_stem1;
    INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2030, CONVERT(yr_2030, DOUBLE) FROM in_stem1;
    INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2035, CONVERT(yr_2035, DOUBLE) FROM in_stem1;
    INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2040, CONVERT(yr_2040, DOUBLE) FROM in_stem1;
    INSERT cub1 (prm_id, scn_id, yr, u) SELECT prm_id, scn_id, 2050, CONVERT(yr_2050, DOUBLE) FROM in_stem1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_stem2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_stem2`()
BEGIN

	INSERT cub1 (prm_id, scn_id, yr, u)

	SELECT 

	prm_rpt2.prm_id,
	in_rpt2.scn_id,
	in_rpt2.yr,
	in_rpt2.u


	FROM in_rpt2

	JOIN prm_rpt2
	ON  prm_rpt2.qtr = in_rpt2.qtr
	AND prm_rpt2.wkd = in_rpt2.wkd
	AND prm_rpt2.day = in_rpt2.day
	AND prm_rpt2.io = in_rpt2.io
	AND prm_rpt2.reg = in_rpt2.reg;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ins_xpn1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_xpn1`()
BEGIN

	INSERT cub1
    
	(
		prm_id,
		scn_id,
        yr,
        u
    )

	SELECT

	in_xpn1.prm_id,
	scn.scn_id,
	in_xpn1.yr,
	in_xpn1.u

	FROM db2.in_xpn1

	JOIN scn
	ON  scn.sps_code = in_xpn1.sps_code
	AND scn.shk_code = in_xpn1.shk_code
	AND scn.shk_lvl  = in_xpn1.shk_lvl;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_itm_edt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_itm_edt`(itm_id INT)
BEGIN

	SELECT * FROM itm WHERE itm.itm_id = itm_id;
    
    SELECT itm.itm_id, itm.itm_name FROM itm;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_itm_lst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_itm_lst`()
BEGIN
	
	SELECT 
    
	itm.itm_id,
    itm.itm_act,
    itm.itm_date,
    itm.itm_name,
    itm.itm_val1,
    itm.itm_val2,
    fn_sci(itm.itm_val2) as itm_val3,
    itm.itm_typ
    
    
	FROM db2.itm
    
    ORDER BY itm_act DESC, itm_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_itm_tst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_itm_tst`()
BEGIN

	DECLARE lvl INT;
    
    SET lvl := (SELECT MAX(prm.lvl) FROM prm);

	SELECT lvl;

	REPEAT

		SET lvl = lvl - 1;

		SELECT lvl;

	UNTIL lvl <= 1 END REPEAT;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_itm_upd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_itm_upd`(itm_id INT, itm_act TINYINT, itm_name VARCHAR(45), itm_val1 INT, itm_val2 DOUBLE)
BEGIN

	UPDATE itm 
    
    SET 
    
    itm.itm_act  	= itm_act,
	itm.itm_date 	= NOW(), 
    itm.itm_name 	= itm_name, 
    itm.itm_val1 	= itm_val1, 
    itm.itm_val2 	= itm_val2
    
    WHERE itm.itm_id = itm_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_cal1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_cal1`(mc_id INT)
BEGIN

	SELECT * FROM vw_mc1 WHERE vw_mc1.mc_id = mc_id;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_cal2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_cal2`(mc_id INT)
BEGIN

	SELECT * FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
    SELECT mc_scn.mc_id, scn.scn_id, scn.scn_code FROM mc_scn JOIN scn ON mc_scn.scn_id = scn.scn_id WHERE mc_scn.mc_id = mc_id;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id;

	SELECT * FROM vw_mc2 WHERE vw_mc2.mc_id = mc_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_cal3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_cal3`(mc_id INT)
BEGIN

	SELECT * FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
    SELECT 

	scn.scn_id,
	scn.shk_id,
	
	scn.shk_id,
	scn.shk_lvl,

	scn.sps_code,
	scn.scn_code

	FROM mc_scn

	JOIN scn
	ON mc_scn.scn_id = scn.scn_id

	WHERE mc_scn.mc_id = mc_id;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id;
    
	SELECT * FROM vw_mc3 WHERE vw_mc3.mc_id = mc_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_cal4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_cal4`(mc_id INT)
BEGIN

	SELECT * FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
    SELECT 

	scn.scn_id,
	scn.shk_id,
	
	scn.shk_id,
	scn.shk_lvl,

	scn.sps_code,
	scn.scn_code

	FROM mc_scn

	JOIN scn
	ON mc_scn.scn_id = scn.scn_id

	WHERE mc_scn.mc_id = mc_id;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id;
    
	SELECT * FROM vw_mc4 WHERE vw_mc4.mc_id = mc_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_cal5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_cal5`(mc_id INT)
BEGIN

	SELECT * FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
    SELECT  scn.scn_id, scn.scn_code FROM mc_scn JOIN scn ON mc_scn.scn_id = scn.scn_id WHERE mc_scn.mc_id = mc_id;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id;
    
	SELECT * FROM vw_mc5 WHERE vw_mc5.mc_id = mc_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_dat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_dat`(mc_id INT)
BEGIN

	SELECT * FROM mc WHERE mc.mc_id = mc_id;

    SELECT DISTINCT
    
	-- scn.scn_id,
	-- scn.sps_id,
	-- scn.sps_code,
	scn.shk_id,
	scn.shk_lvl,
	scn.shk_code

	FROM scn ORDER BY shk_id, shk_lvl;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_prf1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_prf1`(mc_id INT, scn_id INT, yr INT)
BEGIN

	SET @x_rng = NULL;
	SET @u_min = NULL;
	SET @u_max = NULL;
	SET @u_rng = NULL;
	SET @u_tic = NULL;

	SET @eps = 1e-12;

	SELECT * FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
    SELECT scn_id, scn_code FROM scn WHERE scn.scn_id = scn_id;
    
	SELECT * FROM vw_mc4 WHERE vw_mc4.mc_id = mc_id AND vw_mc4.scn_id = scn_id AND vw_mc4.yr = yr ORDER BY phi DESC;

	SELECT COUNT(*), MAX(p1), -MAX(p2) INTO @x_rng, @u_max, @u_min FROM vw_mc4 WHERE vw_mc4.mc_id = mc_id AND vw_mc4.scn_id = scn_id AND vw_mc4.yr = yr;  -- p2 is calc positive but used as negative


	SET @u_rng = @u_max - @u_min;
	SET @u_rng = IF(@u_rng = 0, 1, @u_rng);	-- trap zero 
	-- SET @u_tic = fn_tic(@u_rng);
	-- SET @u_min = FLOOR((@u_min - @eps)/@u_tic)*@u_tic;	-- perturb for nonzero
	-- SET @u_max = CEIL((@u_max + @eps)/@u_tic)*@u_tic;
	-- SET @u_rng = @u_max - @u_min;

	SELECT 
    
	@x_rng AS x_rng, 
	@u_min AS u_min, 
	@u_max AS u_max, 
	@u_rng AS u_rng, 
	@u_tic AS u_tic; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_prm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_prm`(mc_id INT)
BEGIN

	SELECT * FROM mc WHERE mc.mc_id = mc_id;

	SELECT 
	mc_prm.*,
	prm.unit
	FROM mc_prm 
	JOIN prm
	ON mc_prm.prm_id = prm.prm_id
	WHERE mc_prm.mc_id = mc_id 
	ORDER BY mc_prm.mc_grp, mc_prm.mc_code;
    
    SELECT * FROM mc_scn WHERE mc_scn.mc_id = mc_id;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_rpt1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_rpt1`(mc_id INT, shk_id INT, shk_lvl INT, yr INT)
BEGIN

	SELECT mc_id, prm_id, yr, prm_name FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
    SELECT 
    
    scn.scn_id,
    scn.sps_id,
    scn.shk_id,
    scn.shk_lvl,
    scn.shk_code,
    scn.sps_code,
    scn.scn_code 
    
    FROM scn WHERE scn.shk_id = shk_id AND scn.shk_lvl = shk_lvl;
    
    SELECT
    
    mc_prm.mc_id, 
    mc_prm.prm_id,
	scn.scn_id,
    c1.yr,
    c1.u

    FROM mc_prm
    
    JOIN 	scn
	ON 		scn.shk_id	= shk_id
    AND 	scn.shk_lvl	= shk_lvl
    
	JOIN 	cub1_last c1
    ON 		c1.prm_id 	= mc_prm.prm_id
    AND 	c1.scn_id 	= scn.scn_id
    AND 	c1.yr 		= yr

    WHERE 	mc_prm.mc_id = mc_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_rpt2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_rpt2`(mc_id INT)
BEGIN

	SELECT mc_id, prm_id, prm_name, prm_src FROM mc_prm WHERE mc_prm.mc_id = mc_id ORDER BY prm_src;
    
	SELECT mc_scn.mc_id, mc_scn.scn_id, scn.scn_code  FROM mc_scn JOIN scn ON scn.scn_id = mc_scn.scn_id WHERE mc_scn.mc_id = mc_id;
    
    SELECT mc_yr.mc_id, mc_yr.yr FROM mc_yr WHERE mc_yr.mc_id = mc_id;
    
	SELECT
    
	c1.prm_id,
	c1.scn_id,
    c1.yr,
    fn_sci(c1.u) as u

    FROM cub1_last c1
    
    JOIN 	mc_prm
    ON 		c1.prm_id = mc_prm.prm_id
    AND 	mc_prm.mc_id = mc_id
    
    JOIN 	mc_scn
    ON		c1.scn_id = mc_scn.scn_id
    AND	 	mc_scn.mc_id = mc_id
    
	JOIN 	mc_yr
    ON 		c1.yr = mc_yr.yr
    AND 	mc_yr.mc_id = mc_id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mc_scn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mc_scn`(mc_id INT)
BEGIN

	SELECT * FROM mc WHERE mc.mc_id = mc_id;

	-- SELECT * FROM mc_prm WHERE mc_prm.mc_id = mc_id;
    
	SELECT * FROM  mc_scn WHERE mc_scn.mc_id = mc_id ORDER BY scn_id;
    
    SELECT * FROM mc_yr WHERE mc_yr.mc_id = mc_id ORDER BY yr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_plt_lin1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_plt_lin1`(prm_id INT)
BEGIN

	SET @t_min = NULL;
	SET @t_max = NULL;
	SET @t_rng = NULL;

	SET @u_min = NULL;
	SET @u_max = NULL;
	SET @u_rng = NULL;
	SET @u_tic = NULL;

	SET @eps = 1e-12;

	SELECT * FROM prm WHERE prm.prm_id = prm_id;

	SELECT DISTINCT s1.scn_id, s1.scn_code FROM cub1_last c1 JOIN scn s1 ON c1.scn_id = s1.scn_id WHERE c1.prm_id = prm_id ORDER BY s1.scn_id;

	SELECT DISTINCT yr FROM cub1_last c1 WHERE c1.prm_id = prm_id ORDER BY c1.yr;

	SELECT * FROM cub1_last c1 WHERE c1.prm_id = prm_id ORDER BY c1.scn_id, c1.yr;

	SELECT MIN(yr), MAX(yr), MIN(u), MAX(u) INTO @t_min, @t_max, @u_min, @u_max FROM cub1_last c1 WHERE c1.prm_id = prm_id;

	SET @t_rng = @t_max - @t_min;
	SET @u_rng = @u_max - @u_min;
	SET @u_rng = IF(@u_rng = 0, 1, @u_rng);	-- trap zero 
	SET @u_tic = fn_tic(@u_rng);
	SET @u_min = FLOOR((@u_min - @eps)/@u_tic)*@u_tic;	-- perturb for nonzero
	SET @u_max = CEIL((@u_max + @eps)/@u_tic)*@u_tic;
	SET @u_rng = @u_max - @u_min;

	SELECT 
	@t_min as t_min, 
	@t_max as t_max, 
	@t_rng AS t_rng, 
	@u_min AS u_min, 
	@u_max AS u_max, 
	@u_rng AS u_rng, 
	@u_tic AS u_tic; 

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_plt_lin2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_plt_lin2`(prm_id INT, scn_ids VARCHAR(100))
BEGIN

	SET @t_min = NULL;
	SET @t_max = NULL;
	SET @t_rng = NULL;

	SET @u_min = NULL;
	SET @u_max = NULL;
	SET @u_rng = NULL;
	SET @u_tic = NULL;

	SET @eps = 1e-12;

	SELECT * FROM prm WHERE prm.prm_id = prm_id;
    
    -- SELECT scn_ids as txt;

	SELECT scn_id, scn_code FROM scn WHERE FIND_IN_SET(scn_id, scn_ids) ORDER BY scn_id;

	-- SELECT DISTINCT s1.scn_id, s1.scn_code FROM cub1_last c1 JOIN scn s1 ON c1.scn_id = s1.scn_id WHERE c1.prm_id = prm_id ORDER BY s1.scn_id;

	SELECT DISTINCT yr FROM cub1_last c1 WHERE c1.prm_id = prm_id ORDER BY c1.yr; -- AND FIND_IN_SET(c1.scn_id, scn_ids) 

	SELECT * FROM cub1_last c1 WHERE c1.prm_id = prm_id AND FIND_IN_SET(c1.scn_id, scn_ids) ORDER BY c1.scn_id, c1.yr;

	SELECT MIN(yr), MAX(yr), MIN(u), MAX(u) INTO @t_min, @t_max, @u_min, @u_max FROM cub1_last c1 WHERE c1.prm_id = prm_id; -- AND FIND_IN_SET(c1.scn_id, scn_ids);

	SET @t_rng = @t_max - @t_min;
	SET @u_rng = @u_max - @u_min;
	SET @u_rng = IF(@u_rng = 0, 1, @u_rng);	-- trap zero 
	SET @u_tic = fn_tic(@u_rng);
	SET @u_min = FLOOR((@u_min - @eps)/@u_tic)*@u_tic;	-- perturb for nonzero
	SET @u_max = CEIL((@u_max + @eps)/@u_tic)*@u_tic;
	SET @u_rng = @u_max - @u_min;

	SELECT 
	@t_min as t_min, 
	@t_max as t_max, 
	@t_rng AS t_rng, 
	@u_min AS u_min, 
	@u_max AS u_max, 
	@u_rng AS u_rng, 
	@u_tic AS u_tic; 

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_prm_brw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prm_brw`(prm_id INT)
BEGIN

-- breadcrumbs
	WITH RECURSIVE t1(prm_id,pid,name,lvl,leaf)
	AS (
		SELECT 
		
		p1.prm_id,
		p1.pid,
		p1.name,
		p1.lvl,
        p1.leaf

		FROM  prm p1
		WHERE p1.prm_id = prm_id
		
		UNION
		
		select 
		
		p2.prm_id,
		p2.pid,
		p2.name,
		p2.lvl,
        p2.leaf
		
		FROM t1
		JOIN prm p2
		ON p2.prm_id = t1.pid  

	)
	SELECT * FROM t1 order by t1.lvl;
    
	-- children
    SELECT prm.prm_id, prm.lvl, prm.leaf, prm.name, prm.unit FROM prm WHERE prm.pid = prm_id ORDER BY prm.pos, prm.name;
    
	-- description
    SELECT * FROM prm WHERE prm.prm_id = prm_id;

	SELECT * FROM sps ORDER BY sps_id;
    
    SELECT * FROM shk where shk_id <> 1 ORDER BY shk_id;

	WITH t (shk_lvl) AS (VALUES ROW(1), ROW(2), ROW(3)) SELECT * FROM t;

	select distinct yr from cub1_last where cub1_last.prm_id = prm_id ORDER BY yr;
    
    select MIN(u_rel) as rel_min, MAX(u_rel) as rel_max from vw_cmp_shk1 where vw_cmp_shk1.prm_id = prm_id and shk_lvl <> 0;
    
    select prm_id, scn_id, sps_id, shk_id, shk_lvl, yr, u_rel from vw_cmp_shk1 where vw_cmp_shk1.prm_id = prm_id and shk_lvl <> 0 ORDER BY yr, sps_id, shk_id, shk_lvl;
    
    SELECT scn.scn_id, scn.sps_code, scn.shk_code, scn.shk_lvl from scn order by sps_code, shk_code, shk_lvl;
    
    SELECT prm_id, scn_id, yr, fn_sci(u) as u from cub1_last where cub1_last.prm_id = prm_id order by prm_id, scn_id, yr;

    -- uploads
    SELECT 
	ts,
    prm_id,
    count(*) as n
	from cub1
    WHERE cub1.prm_id = prm_id
    AND TIMESTAMPDIFF(day, ts, NOW()) < 30
	group by ts,prm_id
	order by ts DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_prm_leaf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prm_leaf`()
BEGIN

	UPDATE  prm s1
	
    LEFT JOIN prm s2
	ON s1.prm_id = s2.pid

	SET s1.leaf = CASE WHEN s2.pid IS NULL THEN 1 else 0 END;

	-- WHERE s2.pid IS NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_prm_lvl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prm_lvl`()
BEGIN


	WITH RECURSIVE t1(prm_id,lvl,pos,pth)
	AS (
		SELECT 
		
		s1.prm_id,
		0,
		s1.pos,
		s1.name

		FROM  prm s1
		WHERE pid IS NULL
		-- WHERE s1.prm_id in (38)
		
		UNION ALL
		
		select 
		
		s2.prm_id,
		t1.lvl + 1,
		s2.pos,
		s2.name
		
		FROM t1
		JOIN prm s2
		ON t1.prm_id = s2.pid  

	)
	-- SELECT * FROM t1;

	UPDATE prm 

	JOIN t1
	ON prm.prm_id = t1.prm_id

	SET prm.lvl = t1.lvl;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_prm_path` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prm_path`()
BEGIN

	update prm

	JOIN vw_prm_path
	ON prm.prm_id = vw_prm_path.prm_id

	SET prm.path = vw_prm_path.path;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_roll_lvl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_roll_lvl`(lvl INT)
BEGIN

	INSERT cub1_last
	(
		prm_id,
		scn_id,
		yr,
		u,
		ts
	)
	SELECT

	t1.prm_id,
	t1.scn_id,
	t1.yr,
	t1.u,
	t1.ts

	FROM
	(
		SELECT 

		p1.prm_id,
		c1.scn_id,
		c1.yr,
		SUM(c1.u) as u,
		MAX(c1.ts) as ts

		FROM prm p1

		JOIN prm p2
		ON p1.prm_id = p2.pid

		JOIN cub1_last c1
		ON c1.prm_id = p2.prm_id

		WHERE p1.calc = 1
		AND p1.lvl = lvl

		GROUP BY 
		p1.prm_id,
		c1.scn_id,
		c1.yr
	) AS t1

	ON DUPLICATE KEY UPDATE u = t1.u, ts = t1.ts;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_scn_lst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_scn_lst`()
BEGIN

	select 

	scn.scn_id,
    scn.scn_code,
	scn.sps_id,
    scn.sps_code,
	shk.shk_id,
	shk.shk_code,
	shk.shk_name,
	scn.shk_yr,
    scn.shk_lvl

	from scn

	join shk
	on scn.shk_id = shk.shk_id
    
    ORDER BY scn.sps_id, shk.shk_id, scn.shk_lvl;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_upl_hst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_upl_hst`()
BEGIN

	SELECT 

	ts,
	COUNT(*) as n 

	FROM cub1

	WHERE TIMESTAMPDIFF(DAY, ts, NOW()) < 7

	GROUP BY ts

	ORDER BY ts DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_afr_cal0`
--

/*!50001 DROP VIEW IF EXISTS `vw_afr_cal0`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afr_cal0` AS select `c1`.`scn_id` AS `scn_id`,`c1`.`yr` AS `yr`,sum(`c1`.`u`) AS `u_sum` from (`cub1_last` `c1` join `afr` on((`afr`.`prm_id` = `c1`.`prm_id`))) group by `c1`.`yr`,`c1`.`scn_id` order by `c1`.`yr`,`c1`.`scn_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_afr_cal1`
--

/*!50001 DROP VIEW IF EXISTS `vw_afr_cal1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afr_cal1` AS select `afr`.`prm_id` AS `prm_id`,`afr`.`pos` AS `pos`,`afr`.`r` AS `r`,`afr`.`unit` AS `r_unit`,`prm`.`name` AS `name`,`prm`.`unit` AS `unit`,`scn`.`scn_id` AS `scn_id`,`scn`.`scn_code` AS `scn_code`,`c1`.`yr` AS `yr`,`c1`.`u` AS `u`,`a0`.`u_sum` AS `u_sum`,(`c1`.`u` / `a0`.`u_sum`) AS `w`,((`afr`.`r` * `c1`.`u`) / `a0`.`u_sum`) AS `wr_gweyr`,(((8.76 * `afr`.`r`) * `c1`.`u`) / `a0`.`u_sum`) AS `wr_twh`,(0.277777777777777 * `c1`.`u`) AS `u_twh`,(((((0.277777777777777 * `c1`.`u`) * 8.76) * `afr`.`r`) * `c1`.`u`) / `a0`.`u_sum`) AS `f` from ((((`afr` join `cub1_last` `c1` on((`afr`.`prm_id` = `c1`.`prm_id`))) join `scn` on((`c1`.`scn_id` = `scn`.`scn_id`))) join `prm` on((`prm`.`prm_id` = `afr`.`prm_id`))) join `vw_afr_cal0` `a0` on(((`a0`.`scn_id` = `c1`.`scn_id`) and (`a0`.`yr` = `c1`.`yr`)))) order by `c1`.`yr`,`c1`.`scn_id`,`c1`.`prm_id`,`afr`.`pos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_afr_cal2`
--

/*!50001 DROP VIEW IF EXISTS `vw_afr_cal2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afr_cal2` AS select `t1`.`scn_id` AS `scn_id`,`t1`.`yr` AS `yr`,sum(`t1`.`wr_twh`) AS `wr_twh`,sum(`t1`.`f`) AS `f` from (select `afr`.`prm_id` AS `prm_id`,`c1`.`scn_id` AS `scn_id`,`c1`.`yr` AS `yr`,(((8.76 * `afr`.`r`) * `c1`.`u`) / `a0`.`u_sum`) AS `wr_twh`,(((((0.277777777777777 * `c1`.`u`) * 8.76) * `afr`.`r`) * `c1`.`u`) / `a0`.`u_sum`) AS `f` from ((`afr` join `cub1_last` `c1` on((`afr`.`prm_id` = `c1`.`prm_id`))) join `vw_afr_cal0` `a0` on(((`a0`.`scn_id` = `c1`.`scn_id`) and (`a0`.`yr` = `c1`.`yr`))))) `t1` group by `t1`.`scn_id`,`t1`.`yr` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_afr_prm`
--

/*!50001 DROP VIEW IF EXISTS `vw_afr_prm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_afr_prm` AS select `prm`.`prm_id` AS `prm_id`,`afr`.`pos` AS `pos`,`prm`.`name` AS `name`,`prm`.`unit` AS `unit`,`afr`.`r` AS `r` from (`afr` join `prm` on((`afr`.`prm_id` = `prm`.`prm_id`))) order by `afr`.`pos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cmp_shk1`
--

/*!50001 DROP VIEW IF EXISTS `vw_cmp_shk1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cmp_shk1` AS select `s1`.`scn_id` AS `scn_id`,`s1`.`sps_id` AS `sps_id`,`s1`.`shk_id` AS `shk_id`,`s1`.`sps_code` AS `sps_code`,`s1`.`shk_code` AS `shk_code`,`s1`.`shk_lvl` AS `shk_lvl`,`c1`.`prm_id` AS `prm_id`,`c1`.`yr` AS `yr`,`c1`.`u` AS `u`,`s2`.`scn_id` AS `scn_id_bas`,`c2`.`u` AS `u_bas`,((`c1`.`u` - `c2`.`u`) / `c2`.`u`) AS `u_rel` from (((`cub1_last` `c1` join `scn` `s1` on((`s1`.`scn_id` = `c1`.`scn_id`))) join `scn` `s2` on(((`s2`.`sps_id` = `s1`.`sps_id`) and (`s2`.`shk_id` = 1) and (`s2`.`shk_lvl` = 0) and (`s1`.`shk_lvl` <> 0)))) join `cub1_last` `c2` on(((`c2`.`prm_id` = `c1`.`prm_id`) and (`c2`.`yr` = `c1`.`yr`) and (`c2`.`scn_id` = `s2`.`scn_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cmp_vlm1`
--

/*!50001 DROP VIEW IF EXISTS `vw_cmp_vlm1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cmp_vlm1` AS select `t1`.`prm_id` AS `prm_id`,`t1`.`scn_id` AS `scn_id`,`t1`.`mc_sgn` AS `mc_sgn`,sum(((0.5 * (`t1`.`u1` + `t1`.`u0`)) * (`t1`.`yr1` - `t1`.`yr0`))) AS `u` from (select `cub1_last`.`prm_id` AS `prm_id`,`cub1_last`.`scn_id` AS `scn_id`,`mc_prm`.`mc_sgn` AS `mc_sgn`,lag(`cub1_last`.`yr`) OVER (PARTITION BY `cub1_last`.`prm_id`,`cub1_last`.`scn_id` ORDER BY `cub1_last`.`yr` )  AS `yr0`,`cub1_last`.`yr` AS `yr1`,lag(`cub1_last`.`u`) OVER (PARTITION BY `cub1_last`.`prm_id`,`cub1_last`.`scn_id` ORDER BY `cub1_last`.`yr` )  AS `u0`,`cub1_last`.`u` AS `u1` from ((`cub1_last` join `mc_prm` on(((`mc_prm`.`prm_id` = `cub1_last`.`prm_id`) and (`mc_prm`.`mc_id` = 2)))) join `mc_yr` on(((`mc_yr`.`yr` = `cub1_last`.`yr`) and (`mc_yr`.`mc_id` = 2))))) `t1` group by `t1`.`prm_id`,`t1`.`scn_id`,`t1`.`mc_sgn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mc1`
--

/*!50001 DROP VIEW IF EXISTS `vw_mc1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mc1` AS select `mc_prm`.`mc_id` AS `mc_id`,`mc_prm`.`prm_id` AS `prm_id`,`mc_prm`.`prm_name` AS `prm_name`,`mc_prm`.`mc_sgn` AS `mc_sgn`,`mc_prm`.`mc_pref` AS `mc_pref`,`mc_prm`.`mc_w0` AS `mc_w0`,`mc_prm`.`mc_w1` AS `mc_w1`,`mc_prm`.`mc_p` AS `mc_p`,`mc_prm`.`mc_q` AS `mc_q`,`mc_prm`.`prm_src` AS `prm_src`,`mc_yr`.`yr` AS `yr`,`mc_scn`.`scn_id` AS `scn_id`,(`mc_prm`.`mc_sgn` * `c1`.`u`) AS `u`,`vw_mc2`.`u_avg` AS `u_avg`,`vw_mc2`.`u_std` AS `u_std`,(`mc_prm`.`mc_sgn` * ((`c1`.`u` - `vw_mc2`.`u_avg`) / `vw_mc2`.`u_std`)) AS `z` from ((((`mc_prm` join `mc_scn` on((`mc_scn`.`mc_id` = `mc_prm`.`mc_id`))) join `mc_yr` on((`mc_yr`.`mc_id` = `mc_prm`.`mc_id`))) join `vw_mc2` on(((`vw_mc2`.`mc_id` = `mc_prm`.`mc_id`) and (`vw_mc2`.`prm_id` = `mc_prm`.`prm_id`)))) join `cub1_last` `c1` on(((`c1`.`prm_id` = `mc_prm`.`prm_id`) and (`c1`.`scn_id` = `mc_scn`.`scn_id`) and (`c1`.`yr` = `mc_yr`.`yr`)))) order by `mc_prm`.`mc_id`,`mc_prm`.`prm_id`,`mc_yr`.`yr`,`mc_scn`.`scn_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mc2`
--

/*!50001 DROP VIEW IF EXISTS `vw_mc2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mc2` AS select `mc_prm`.`mc_id` AS `mc_id`,`mc_prm`.`prm_id` AS `prm_id`,avg(`c1`.`u`) AS `u_avg`,std(`c1`.`u`) AS `u_std` from (((`mc_prm` join `mc_scn` on((`mc_scn`.`mc_id` = `mc_prm`.`mc_id`))) join `mc_yr` on((`mc_yr`.`mc_id` = `mc_prm`.`mc_id`))) join `cub1_last` `c1` on(((`c1`.`prm_id` = `mc_prm`.`prm_id`) and (`c1`.`scn_id` = `mc_scn`.`scn_id`) and (`c1`.`yr` = `mc_yr`.`yr`)))) group by `mc_prm`.`mc_id`,`mc_prm`.`prm_id` order by `mc_prm`.`mc_id`,`mc_prm`.`prm_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mc3`
--

/*!50001 DROP VIEW IF EXISTS `vw_mc3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mc3` AS select `v1`.`mc_id` AS `mc_id`,`v1`.`yr` AS `yr`,`v1`.`prm_id` AS `prm_id`,`v1`.`mc_w1` AS `mc_w1`,`v1`.`mc_pref` AS `mc_pref`,`v1`.`mc_p` AS `mc_p`,`v1`.`mc_q` AS `mc_q`,`v1`.`scn_id` AS `scn_id1`,`v2`.`scn_id` AS `scn_id2`,`v1`.`u_avg` AS `u_avg`,`v1`.`u_std` AS `u_std`,`v1`.`u` AS `u1`,`v2`.`u` AS `u2`,`v1`.`z` AS `z1`,`v2`.`z` AS `z2`,(`v1`.`z` - `v2`.`z`) AS `d`,`FN_PREF`((`v1`.`z` - `v2`.`z`),`v1`.`mc_pref`,`v1`.`mc_p`,`v1`.`mc_q`) AS `p1`,`FN_PREF`((`v2`.`z` - `v1`.`z`),`v1`.`mc_pref`,`v1`.`mc_p`,`v1`.`mc_q`) AS `p2`,(`FN_PREF`((`v1`.`z` - `v2`.`z`),`v1`.`mc_pref`,`v1`.`mc_p`,`v1`.`mc_q`) - `FN_PREF`((`v2`.`z` - `v1`.`z`),`v1`.`mc_pref`,`v1`.`mc_p`,`v1`.`mc_q`)) AS `phi` from (`vw_mc1` `v1` join `vw_mc1` `v2` on(((`v1`.`mc_id` = `v2`.`mc_id`) and (`v1`.`prm_id` = `v2`.`prm_id`) and (`v1`.`yr` = `v2`.`yr`)))) order by `v1`.`mc_id`,`v1`.`yr`,`v1`.`prm_id`,`v1`.`scn_id`,`v2`.`scn_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mc4`
--

/*!50001 DROP VIEW IF EXISTS `vw_mc4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mc4` AS select `vw_mc3`.`mc_id` AS `mc_id`,`vw_mc3`.`yr` AS `yr`,`vw_mc3`.`prm_id` AS `prm_id`,`vw_mc3`.`mc_w1` AS `mc_w1`,`vw_mc3`.`scn_id1` AS `scn_id`,avg(`vw_mc3`.`p1`) AS `p1`,avg(`vw_mc3`.`p2`) AS `p2`,avg(`vw_mc3`.`phi`) AS `phi` from `vw_mc3` where (`vw_mc3`.`scn_id1` <> `vw_mc3`.`scn_id2`) group by `vw_mc3`.`mc_id`,`vw_mc3`.`yr`,`vw_mc3`.`prm_id`,`vw_mc3`.`scn_id1` order by `vw_mc3`.`mc_id`,`vw_mc3`.`yr`,`vw_mc3`.`prm_id`,`vw_mc3`.`scn_id1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mc5`
--

/*!50001 DROP VIEW IF EXISTS `vw_mc5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mc5` AS select `vw_mc4`.`mc_id` AS `mc_id`,`vw_mc4`.`yr` AS `yr`,`vw_mc4`.`scn_id` AS `scn_id`,sum((`vw_mc4`.`mc_w1` * `vw_mc4`.`p1`)) AS `p1`,sum((`vw_mc4`.`mc_w1` * `vw_mc4`.`p2`)) AS `p2`,sum((`vw_mc4`.`mc_w1` * `vw_mc4`.`phi`)) AS `phi` from `vw_mc4` group by `vw_mc4`.`mc_id`,`vw_mc4`.`yr`,`vw_mc4`.`scn_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_prm_path`
--

/*!50001 DROP VIEW IF EXISTS `vw_prm_path`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_prm_path` AS select `p0`.`prm_id` AS `prm_id`,`p0`.`lvl` AS `lvl`,`p0`.`leaf` AS `leaf`,`p0`.`name` AS `name`,concat_ws('/',`p0`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,NULL AS `prm_id1`,NULL AS `prm_id2`,NULL AS `prm_id3`,NULL AS `prm_id4`,NULL AS `prm_id5`,NULL AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,NULL AS `name1`,NULL AS `name2`,NULL AS `name3`,NULL AS `name4`,NULL AS `name5`,NULL AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,NULL AS `pos1`,NULL AS `pos2`,NULL AS `pos3`,NULL AS `pos4`,NULL AS `pos5`,NULL AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from `prm` `p0` where (`p0`.`lvl` = 0) union select `p1`.`prm_id` AS `prm_id`,`p1`.`lvl` AS `lvl`,`p1`.`leaf` AS `leaf`,`p1`.`name` AS `name`,concat_ws('/',`p1`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,NULL AS `prm_id2`,NULL AS `prm_id3`,NULL AS `prm_id4`,NULL AS `prm_id5`,NULL AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,NULL AS `name2`,NULL AS `name3`,NULL AS `name4`,NULL AS `name5`,NULL AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,NULL AS `pos2`,NULL AS `pos3`,NULL AS `pos4`,NULL AS `pos5`,NULL AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from (`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) where (`p1`.`lvl` = 1) union select `p2`.`prm_id` AS `prm_id`,`p2`.`lvl` AS `lvl`,`p2`.`leaf` AS `leaf`,`p2`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,NULL AS `prm_id3`,NULL AS `prm_id4`,NULL AS `prm_id5`,NULL AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,NULL AS `name3`,NULL AS `name4`,NULL AS `name5`,NULL AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,NULL AS `pos3`,NULL AS `pos4`,NULL AS `pos5`,NULL AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from ((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) where (`p2`.`lvl` = 2) union select `p3`.`prm_id` AS `prm_id`,`p3`.`lvl` AS `lvl`,`p3`.`leaf` AS `leaf`,`p3`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,NULL AS `prm_id4`,NULL AS `prm_id5`,NULL AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,NULL AS `name4`,NULL AS `name5`,NULL AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,NULL AS `pos4`,NULL AS `pos5`,NULL AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from (((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) where (`p3`.`lvl` = 3) union select `p4`.`prm_id` AS `prm_id`,`p4`.`lvl` AS `lvl`,`p4`.`leaf` AS `leaf`,`p4`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,NULL AS `prm_id5`,NULL AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,NULL AS `name5`,NULL AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,NULL AS `pos5`,NULL AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from ((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) where (`p4`.`lvl` = 4) union select `p5`.`prm_id` AS `prm_id`,`p5`.`lvl` AS `lvl`,`p5`.`leaf` AS `leaf`,`p5`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`,`p5`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,`p5`.`prm_id` AS `prm_id5`,NULL AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,`p5`.`name` AS `name5`,NULL AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,`p5`.`pos` AS `pos5`,NULL AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from (((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) join `prm` `p5` on((`p5`.`pid` = `p4`.`prm_id`))) where (`p5`.`lvl` = 5) union select `p6`.`prm_id` AS `prm_id`,`p6`.`lvl` AS `lvl`,`p6`.`leaf` AS `leaf`,`p6`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`,`p5`.`name`,`p6`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,`p5`.`prm_id` AS `prm_id5`,`p6`.`prm_id` AS `prm_id6`,NULL AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,`p5`.`name` AS `name5`,`p6`.`name` AS `name6`,NULL AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,`p5`.`pos` AS `pos5`,`p6`.`pos` AS `pos6`,NULL AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from ((((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) join `prm` `p5` on((`p5`.`pid` = `p4`.`prm_id`))) join `prm` `p6` on((`p6`.`pid` = `p5`.`prm_id`))) where (`p6`.`lvl` = 6) union select `p7`.`prm_id` AS `prm_id`,`p7`.`lvl` AS `lvl`,`p7`.`leaf` AS `leaf`,`p7`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`,`p5`.`name`,`p6`.`name`,`p7`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,`p5`.`prm_id` AS `prm_id5`,`p6`.`prm_id` AS `prm_id6`,`p7`.`prm_id` AS `prm_id7`,NULL AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,`p5`.`name` AS `name5`,`p6`.`name` AS `name6`,`p7`.`name` AS `name7`,NULL AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,`p5`.`pos` AS `pos5`,`p6`.`pos` AS `pos6`,`p7`.`pos` AS `pos7`,NULL AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from (((((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) join `prm` `p5` on((`p5`.`pid` = `p4`.`prm_id`))) join `prm` `p6` on((`p6`.`pid` = `p5`.`prm_id`))) join `prm` `p7` on((`p7`.`pid` = `p6`.`prm_id`))) where (`p7`.`lvl` = 7) union select `p8`.`prm_id` AS `prm_id`,`p8`.`lvl` AS `lvl`,`p8`.`leaf` AS `leaf`,`p8`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`,`p5`.`name`,`p6`.`name`,`p7`.`name`,`p8`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,`p5`.`prm_id` AS `prm_id5`,`p6`.`prm_id` AS `prm_id6`,`p7`.`prm_id` AS `prm_id7`,`p8`.`prm_id` AS `prm_id8`,NULL AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,`p5`.`name` AS `name5`,`p6`.`name` AS `name6`,`p7`.`name` AS `name7`,`p8`.`name` AS `name8`,NULL AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,`p5`.`pos` AS `pos5`,`p6`.`pos` AS `pos6`,`p7`.`pos` AS `pos7`,`p8`.`pos` AS `pos8`,NULL AS `pos9`,NULL AS `pos10` from ((((((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) join `prm` `p5` on((`p5`.`pid` = `p4`.`prm_id`))) join `prm` `p6` on((`p6`.`pid` = `p5`.`prm_id`))) join `prm` `p7` on((`p7`.`pid` = `p6`.`prm_id`))) join `prm` `p8` on((`p8`.`pid` = `p7`.`prm_id`))) where (`p8`.`lvl` = 8) union select `p9`.`prm_id` AS `prm_id`,`p9`.`lvl` AS `lvl`,`p9`.`leaf` AS `leaf`,`p9`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`,`p5`.`name`,`p6`.`name`,`p7`.`name`,`p8`.`name`,`p9`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,`p5`.`prm_id` AS `prm_id5`,`p6`.`prm_id` AS `prm_id6`,`p7`.`prm_id` AS `prm_id7`,`p8`.`prm_id` AS `prm_id8`,`p9`.`prm_id` AS `prm_id9`,NULL AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,`p5`.`name` AS `name5`,`p6`.`name` AS `name6`,`p7`.`name` AS `name7`,`p8`.`name` AS `name8`,`p9`.`name` AS `name9`,NULL AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,`p5`.`pos` AS `pos5`,`p6`.`pos` AS `pos6`,`p7`.`pos` AS `pos7`,`p8`.`pos` AS `pos8`,`p9`.`pos` AS `pos9`,NULL AS `pos10` from (((((((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) join `prm` `p5` on((`p5`.`pid` = `p4`.`prm_id`))) join `prm` `p6` on((`p6`.`pid` = `p5`.`prm_id`))) join `prm` `p7` on((`p7`.`pid` = `p6`.`prm_id`))) join `prm` `p8` on((`p8`.`pid` = `p7`.`prm_id`))) join `prm` `p9` on((`p9`.`pid` = `p8`.`prm_id`))) where (`p9`.`lvl` = 9) union select `p10`.`prm_id` AS `prm_id`,`p10`.`lvl` AS `lvl`,`p10`.`leaf` AS `leaf`,`p10`.`name` AS `name`,concat_ws(' / ',`p1`.`name`,`p2`.`name`,`p3`.`name`,`p4`.`name`,`p5`.`name`,`p6`.`name`,`p7`.`name`,`p8`.`name`,`p9`.`name`,`p10`.`name`) AS `path`,`p0`.`prm_id` AS `prm_id0`,`p1`.`prm_id` AS `prm_id1`,`p2`.`prm_id` AS `prm_id2`,`p3`.`prm_id` AS `prm_id3`,`p4`.`prm_id` AS `prm_id4`,`p5`.`prm_id` AS `prm_id5`,`p6`.`prm_id` AS `prm_id6`,`p7`.`prm_id` AS `prm_id7`,`p8`.`prm_id` AS `prm_id8`,`p9`.`prm_id` AS `prm_id9`,`p10`.`prm_id` AS `prm_id10`,`p0`.`name` AS `name0`,`p1`.`name` AS `name1`,`p2`.`name` AS `name2`,`p3`.`name` AS `name3`,`p4`.`name` AS `name4`,`p5`.`name` AS `name5`,`p6`.`name` AS `name6`,`p7`.`name` AS `name7`,`p8`.`name` AS `name8`,`p9`.`name` AS `name9`,`p10`.`name` AS `name10`,`p0`.`pos` AS `pos0`,`p1`.`pos` AS `pos1`,`p2`.`pos` AS `pos2`,`p3`.`pos` AS `pos3`,`p4`.`pos` AS `pos4`,`p5`.`pos` AS `pos5`,`p6`.`pos` AS `pos6`,`p7`.`pos` AS `pos7`,`p8`.`pos` AS `pos8`,`p9`.`pos` AS `pos9`,`p10`.`pos` AS `pos10` from ((((((((((`prm` `p0` join `prm` `p1` on((`p1`.`pid` = `p0`.`prm_id`))) join `prm` `p2` on((`p2`.`pid` = `p1`.`prm_id`))) join `prm` `p3` on((`p3`.`pid` = `p2`.`prm_id`))) join `prm` `p4` on((`p4`.`pid` = `p3`.`prm_id`))) join `prm` `p5` on((`p5`.`pid` = `p4`.`prm_id`))) join `prm` `p6` on((`p6`.`pid` = `p5`.`prm_id`))) join `prm` `p7` on((`p7`.`pid` = `p6`.`prm_id`))) join `prm` `p8` on((`p8`.`pid` = `p7`.`prm_id`))) join `prm` `p9` on((`p9`.`pid` = `p8`.`prm_id`))) join `prm` `p10` on((`p10`.`pid` = `p9`.`prm_id`))) where (`p10`.`lvl` = 10) */;
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

-- Dump completed on 2026-03-23 14:16:15
