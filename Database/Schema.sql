CREATE DATABASE  IF NOT EXISTS `c@rgonautica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `c@rgonautica`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: c@rgonautica
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew` (
  `crew_id` int NOT NULL AUTO_INCREMENT,
  `passport_num` varchar(9) DEFAULT NULL,
  `passport_end_date` date DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`crew_id`),
  UNIQUE KEY `passport_num_UNIQUE` (`passport_num`),
  KEY `FK9->Employee_idx` (`emp_id`),
  CONSTRAINT `FK9->Employee` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crew_posts`
--

DROP TABLE IF EXISTS `crew_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_posts` (
  `crew_post_id` int NOT NULL AUTO_INCREMENT,
  `crew_post_st_date` date DEFAULT NULL,
  `crew_post_end_date` date DEFAULT NULL,
  `crew_post_crew_id` int DEFAULT NULL,
  `crew_post_post_id` int DEFAULT NULL,
  PRIMARY KEY (`crew_post_id`),
  KEY `FK10->Crew_idx` (`crew_post_crew_id`),
  KEY `FK11->Post_idx` (`crew_post_post_id`),
  CONSTRAINT `FK10->Crew` FOREIGN KEY (`crew_post_crew_id`) REFERENCES `crew` (`crew_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK11->Post` FOREIGN KEY (`crew_post_post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crew_trips`
--

DROP TABLE IF EXISTS `crew_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_trips` (
  `crew_trip_id` int NOT NULL AUTO_INCREMENT,
  `crew_trip_crew_id` int DEFAULT NULL,
  `crew_trip_trip_id` int DEFAULT NULL,
  PRIMARY KEY (`crew_trip_id`),
  KEY `FK16->Crew_idx` (`crew_trip_crew_id`),
  KEY `FK17->Trips_idx` (`crew_trip_trip_id`),
  CONSTRAINT `FK16->Crew` FOREIGN KEY (`crew_trip_crew_id`) REFERENCES `crew` (`crew_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK17->Trips` FOREIGN KEY (`crew_trip_trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dpr_id` int NOT NULL AUTO_INCREMENT,
  `dpr_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_hirings`
--

DROP TABLE IF EXISTS `departments_hirings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_hirings` (
  `dpr_hiring_id` int NOT NULL AUTO_INCREMENT,
  `dpr_hiring_st_date` date DEFAULT NULL,
  `dpr_hiring_end_date` date DEFAULT NULL,
  `dpr_hiring_emp_id` int DEFAULT NULL,
  `dpr_hiring_dpr_id` int DEFAULT NULL,
  PRIMARY KEY (`dpr_hiring_id`),
  KEY `FK->Employees_idx` (`dpr_hiring_emp_id`),
  KEY `FK->Departments_idx` (`dpr_hiring_dpr_id`),
  CONSTRAINT `FK->Departments` FOREIGN KEY (`dpr_hiring_dpr_id`) REFERENCES `departments` (`dpr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK->Employees` FOREIGN KEY (`dpr_hiring_emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_managers`
--

DROP TABLE IF EXISTS `departments_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_managers` (
  `dpr_manager_id` int NOT NULL AUTO_INCREMENT,
  `dpr_manager_st_date` date DEFAULT NULL,
  `dpr_manager_end_date` date DEFAULT NULL,
  `dpr_manager_emp_id` int DEFAULT NULL,
  `dpr_manager_dpr_id` int DEFAULT NULL,
  PRIMARY KEY (`dpr_manager_id`),
  KEY `FK->Employees_idx` (`dpr_manager_emp_id`),
  KEY `FK->Departments_idx` (`dpr_manager_dpr_id`),
  CONSTRAINT `FK3->Employees` FOREIGN KEY (`dpr_manager_emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK4->Departments` FOREIGN KEY (`dpr_manager_dpr_id`) REFERENCES `departments` (`dpr_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_family`
--

DROP TABLE IF EXISTS `employee_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_family` (
  `family_id` int NOT NULL AUTO_INCREMENT,
  `family_emp_id` int DEFAULT NULL,
  `family_member_id` int DEFAULT NULL,
  PRIMARY KEY (`family_id`),
  KEY `FK7->Employee_idx` (`family_emp_id`),
  KEY `FK8->Members_idx` (`family_member_id`),
  CONSTRAINT `FK7->Employee` FOREIGN KEY (`family_emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK8->Members` FOREIGN KEY (`family_member_id`) REFERENCES `members` (`member_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_first_name` varchar(45) NOT NULL,
  `emp_last_name` varchar(45) NOT NULL,
  `emp_father_name` varchar(45) DEFAULT NULL,
  `emp_afm` varchar(12) NOT NULL,
  `emp_reg_num` bigint DEFAULT NULL,
  `emp_birth_date` date DEFAULT NULL,
  `emp_adress` varchar(45) DEFAULT NULL,
  `emp_adress_num` varchar(45) DEFAULT NULL,
  `emp_postal_code` varchar(45) DEFAULT NULL,
  `emp_town` varchar(45) DEFAULT NULL,
  `emp_country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_tin_UNIQUE` (`emp_afm`),
  UNIQUE KEY `emp_reg_num_UNIQUE` (`emp_reg_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `malfunctions`
--

DROP TABLE IF EXISTS `malfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malfunctions` (
  `malf_id` int NOT NULL AUTO_INCREMENT,
  `malf_level` int DEFAULT NULL,
  `malf_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`malf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(45) DEFAULT NULL,
  `member_gender` varchar(45) DEFAULT NULL,
  `member_emp_id` int DEFAULT NULL,
  `member_member_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `FK5->Employees_idx` (`member_emp_id`),
  KEY `FK6->Members_Category_idx` (`member_member_cat_id`),
  CONSTRAINT `FK5->Employees` FOREIGN KEY (`member_emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK6->Members_Category` FOREIGN KEY (`member_member_cat_id`) REFERENCES `members_category` (`member_cat_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members_category`
--

DROP TABLE IF EXISTS `members_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_category` (
  `member_cat_id` int NOT NULL AUTO_INCREMENT,
  `member_desc` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`member_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `post_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ship_malfunctions`
--

DROP TABLE IF EXISTS `ship_malfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_malfunctions` (
  `ship_mal_id` int NOT NULL AUTO_INCREMENT,
  `ship_mal_date` date DEFAULT NULL,
  `ship_mal_rpr_st_date` date DEFAULT NULL,
  `ship_mal_rpr_end_date` date DEFAULT NULL,
  `ship_mal_ship_id` int DEFAULT NULL,
  `ship_mal_malf_id` int DEFAULT NULL,
  PRIMARY KEY (`ship_mal_id`),
  KEY `FK12->Ships_idx` (`ship_mal_ship_id`),
  KEY `FK13->Malfunctions_idx` (`ship_mal_malf_id`),
  CONSTRAINT `FK12->Ships` FOREIGN KEY (`ship_mal_ship_id`) REFERENCES `ships` (`ship_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK13->Malfunctions` FOREIGN KEY (`ship_mal_malf_id`) REFERENCES `malfunctions` (`malf_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ship_trips`
--

DROP TABLE IF EXISTS `ship_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_trips` (
  `ship_trip_id` int NOT NULL AUTO_INCREMENT,
  `dep_date` date DEFAULT NULL,
  `dep_time` time DEFAULT NULL,
  `eta_arr_date` date DEFAULT NULL,
  `eta_arr_time` time DEFAULT NULL,
  `real_arr_date` date DEFAULT NULL,
  `real_arr_time` time DEFAULT NULL,
  `ship_trip_trip_id` int DEFAULT NULL,
  `ship_trip_ship_id` int DEFAULT NULL,
  PRIMARY KEY (`ship_trip_id`),
  KEY `FK14->Trips_idx` (`ship_trip_trip_id`),
  KEY `FK15->Ships_idx` (`ship_trip_ship_id`),
  CONSTRAINT `FK14->Trips` FOREIGN KEY (`ship_trip_trip_id`) REFERENCES `trips` (`trip_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK15->Ships` FOREIGN KEY (`ship_trip_ship_id`) REFERENCES `ships` (`ship_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ship_types`
--

DROP TABLE IF EXISTS `ship_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_types` (
  `ship_type_id` int NOT NULL AUTO_INCREMENT,
  `ship_type_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ships` (
  `ship_id` int NOT NULL AUTO_INCREMENT,
  `ship_imo` bigint DEFAULT NULL,
  `ship_name` varchar(45) DEFAULT NULL,
  `ship_const_date` date DEFAULT NULL,
  `ship_ship_type_id` int DEFAULT NULL,
  PRIMARY KEY (`ship_id`),
  UNIQUE KEY `ship_imo_UNIQUE` (`ship_imo`),
  KEY `FK11->Ship_types_idx` (`ship_ship_type_id`),
  CONSTRAINT `FK11->Ship_types` FOREIGN KEY (`ship_ship_type_id`) REFERENCES `ship_types` (`ship_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `dep_port` varchar(45) DEFAULT NULL,
  `arr_port` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-15 17:09:20
