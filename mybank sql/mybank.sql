-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mybank
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='''//info related to admin of banks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'test@gmail.com','passssword'),(6,'test@gmail.com','passssword'),(8,'hello','1233'),(9,'Hello@gmail.conm','123mybank'),(1395,'finaltest@gmail.com','123mybank'),(2059,'wsws@g.c','sdsdsfdcsmybank'),(2282,'twst2@g.b','123mybank'),(3552,'Hello@gmail.comuga','1213mybank'),(4040,'kavya@gmail.com','123mybank'),(4199,'finaltest@gmail.com','1231mybank'),(4607,'Hello@gmail.conm','133mybank'),(4635,'pibecak398@ailiking.com','wdwdmybank'),(4639,'finaltest@gmail.com','123mybank'),(50000,'bansalpushkar6@gmail.com','hello@123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `account_number` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `pincode` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `balance` int NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1512,'ALEXANDER AGRANOV','t@gmail.com','123mybank','1836838309732350','323 North ,Eastern Ave.','Fall River','112876','Maine','male','2021-05-25','7749556494',5100),(1962,'test1 2','test1@g.c','123mybank','1836838309732350','addresss ,','shamli','247776','ulk','male','2021-05-09','9927868262',5000),(3176,'ALEXANDER AGRANOV','pibecak398@ailiking.com','123mybank','1836838309732351','323 North ,Eastern Ave.','Fall River','112234','Maine','male','2021-05-19','7749556494',13050),(6106,'test test','Hello@gmail.com','123mybank','1836838309732348','test ,','test','123456','test','male','2021-05-06','1234567899',14400),(6178,'pushkar bansal','email@gmail.cm','123mybank','1836838309732349','anand bhawan ,','shamli','247778','uk','male','2021-05-05','99273937833',9000);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleterecords`
--

DROP TABLE IF EXISTS `deleterecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleterecords` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `customer_id` varchar(45) DEFAULT NULL,
  `account_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `record_id_UNIQUE` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleterecords`
--

LOCK TABLES `deleterecords` WRITE;
/*!40000 ALTER TABLE `deleterecords` DISABLE KEYS */;
INSERT INTO `deleterecords` VALUES (1,'hello','email','d','d','d'),(2,'e','e','2021/06/31 00:53:29','e','e'),(3,'pushkar bansal','test@gmail.com','2021/05/30 00:53:29','3150','1836838309732347'),(4,'kavya agrawal','kavya@gmail.com','2021/05/31 00:11:43','4001','1836838309732350');
/*!40000 ALTER TABLE `deleterecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `senderID` varchar(45) NOT NULL,
  `senderAnumber` varchar(45) NOT NULL,
  `RecAnumber` varchar(45) NOT NULL,
  `recieverID` varchar(45) NOT NULL,
  `Bamount` varchar(45) NOT NULL,
  `Aamount` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,'eed','','wew','wdw','wedw','wdw','wd','wdd'),(2,'egheg','','weg','wwe','twt','twt','wt3t','3tw3'),(3,'2021/05/30 02:43:38','sent','6178','1836838309732349','1836838309732351','3176','11000','9000'),(4,'2021/05/30 02:43:38','recieved','3176','1836838309732351','1836838309732349','6178','5000','7000'),(5,'2021/05/30 02:48:13','sent','6178','1836838309732349','1836838309732351','3176','9000','6000'),(6,'2021/06/30 02:48:13','recieved','3176','1836838309732351','1836838309732349','6178','7000','10000'),(7,'2021/05/30 02:51:22','sent','3176','1836838309732351','1836838309732348','6106','10000','5000'),(8,'2021/05/30 02:51:22','recieved','6106','1836838309732348','1836838309732351','3176','9000','14000'),(9,'2021/05/30 18:46:28','sent','6178','1836838309732349','1836838309732351','3176','10000','9000'),(10,'2021/05/30 18:49:52','sent','6178','1836838309732349','1836838309732351','3176','10000','9000'),(11,'2021/05/30 18:49:52','recieved','3176','1836838309732351','1836838309732349','6178','12200','13200'),(12,'2021/05/30 19:09:24','sent','1512','1836838309732350','1836838309732351','3176','5200','5100'),(13,'2021/05/30 19:09:24','recieved','3176','1836838309732351','1836838309732350','1512','13200','13300'),(14,'2021/05/30 23:54:46','sent','3176','1836838309732351','1836838309732348','6106','13300','13150'),(15,'2021/05/30 23:54:46','recieved','6106','1836838309732348','1836838309732351','3176','14000','14150'),(16,'2021/05/30 23:55:09','sent','3176','1836838309732351','1836838309732348','6106','13300','13150'),(17,'2021/05/30 23:55:09','recieved','6106','1836838309732348','1836838309732351','3176','14150','14300'),(18,'2021/05/30 23:59:35','sent','3176','1836838309732351','1836838309732348','6106','13150','13050'),(19,'2021/05/30 23:59:35','recieved','6106','1836838309732348','1836838309732351','3176','14300','14400');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 22:55:53
