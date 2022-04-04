CREATE DATABASE  IF NOT EXISTS `cupcake` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cupcake`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: cupcake
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `bottom`
--

DROP TABLE IF EXISTS `bottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bottom` (
                          `Bottom_ID` int NOT NULL AUTO_INCREMENT,
                          `Bottom_Name` varchar(45) NOT NULL,
                          `Pricing` int NOT NULL,
                          PRIMARY KEY (`Bottom_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bottom`
--

LOCK TABLES `bottom` WRITE;
/*!40000 ALTER TABLE `bottom` DISABLE KEYS */;
INSERT INTO `bottom` VALUES (1,'chocolate',5),(2,'vanilla',5),(3,'nutmeg',5),(4,'pistacio',6),(5,'almond',7);
/*!40000 ALTER TABLE `bottom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordre`
--

DROP TABLE IF EXISTS `ordre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordre` (
                         `Ordre_ID` int NOT NULL AUTO_INCREMENT,
                         `User_ID` int NOT NULL,
                         `Total_Price` int NOT NULL,
                         `Ordrelinje_ID` int NOT NULL,
                         PRIMARY KEY (`Ordre_ID`),
                         KEY `fk_Ordre_User1_idx` (`User_ID`),
                         CONSTRAINT `fk_Ordre_User1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordre`
--

LOCK TABLES `ordre` WRITE;
/*!40000 ALTER TABLE `ordre` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordrelinje`
--

DROP TABLE IF EXISTS `ordrelinje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordrelinje` (
                              `Ordrelinje_ID` int NOT NULL AUTO_INCREMENT,
                              `Bottom_ID` int NOT NULL,
                              `Top_ID` int NOT NULL,
                              `Quantity` int NOT NULL,
                              `Order_ID` int NOT NULL,
                              PRIMARY KEY (`Ordrelinje_ID`),
                              KEY `fk_Ordrelinje_Ordre1_idx` (`Order_ID`),
                              CONSTRAINT `fk_Ordrelinje_Ordre1` FOREIGN KEY (`Order_ID`) REFERENCES `ordre` (`Ordre_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordrelinje`
--

LOCK TABLES `ordrelinje` WRITE;
/*!40000 ALTER TABLE `ordrelinje` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordrelinje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top`
--

DROP TABLE IF EXISTS `top`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top` (
                       `Top_ID` int NOT NULL AUTO_INCREMENT,
                       `Top_Name` varchar(45) NOT NULL,
                       `Pricing` int NOT NULL,
                       PRIMARY KEY (`Top_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top`
--

LOCK TABLES `top` WRITE;
/*!40000 ALTER TABLE `top` DISABLE KEYS */;
INSERT INTO `top` VALUES (1,'chocolate',5),(2,'blueberry',5),(3,'raspberry',5),(4,'crispy',6),(5,'strawberry',6),(6,'rum/rasin',7),(7,'orange',8),(8,'lemon',8),(9,'blue cheese',9);
/*!40000 ALTER TABLE `top` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `User_ID` int NOT NULL AUTO_INCREMENT,
                        `username` varchar(45) NOT NULL,
                        `password` varchar(45) NOT NULL,
                        `role` varchar(45) NOT NULL,
                        `saldo` int NOT NULL,
                        PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'anders','1234','admin',10000);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 12:13:38
