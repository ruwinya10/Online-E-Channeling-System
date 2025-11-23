CREATE DATABASE  IF NOT EXISTS `echannelling` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `echannelling`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: echannelling
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `appointmentbooking`
--

DROP TABLE IF EXISTS `appointmentbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentbooking` (
  `bookingID` int NOT NULL AUTO_INCREMENT,
  `appointmentID` int DEFAULT NULL,
  `methodID` int DEFAULT NULL,
  `doctorName` varchar(45) DEFAULT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  `hospital` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentbooking`
--

LOCK TABLES `appointmentbooking` WRITE;
/*!40000 ALTER TABLE `appointmentbooking` DISABLE KEYS */;
INSERT INTO `appointmentbooking` VALUES (2,69,36,'J.Jagath Pathirana','General Practitioner','Nawinna Hospital','2025-05-15','07:00 PM'),(4,73,39,'M.Charith Wijesinghe','Cardiologist','City Hospital','2025-05-15','10:00 AM'),(6,74,40,'M.Charith Wijesinghe','Cardiologist','City Hospital','2025-05-15','10:00 AM'),(8,78,45,'M.Charith Wijesinghe','Cardiologist','City Hospital','2025-05-15','10:00 AM');
/*!40000 ALTER TABLE `appointmentbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentdetails`
--

DROP TABLE IF EXISTS `appointmentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentdetails` (
  `appointmentID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`appointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentdetails`
--

LOCK TABLES `appointmentdetails` WRITE;
/*!40000 ALTER TABLE `appointmentdetails` DISABLE KEYS */;
INSERT INTO `appointmentdetails` VALUES (1,'Razna Nazar','23','Female','raznanazar09@gmail.com','0771323928'),(29,'Razna Nazar','27','Female','raznanazar09@gamail.com','0771333333'),(30,'Razna Nazar','27','Female','raznanazar09@gmail.com','1234567892'),(31,'Razna Nazar','27','Female','raznanazar09@gmail.com','0771333333'),(32,'Razna Nazar','27','Female','raznanazar09@gmail.com','1234567892'),(33,'Razna Nazar','27','Female','raznanazar09@gmail.com','0771333333'),(34,'hausbhbda','35','Female','wdefdscdc@gamail.com','0771333333'),(35,'sdsjbdsjcbs x','27','Female','amanskjasbdjj@gmail.com','0777777777'),(36,'sdsjbdsjcbs x','27','Female','amanskjasbdjj@gmail.com','0771323928'),(37,'sdsjbdsjcbs x','27','Female','amanskjasbdjj@gmail.com','0771323928'),(38,'hausbhbda','27','Female','amanskjasbdjj@gmail','1234567892'),(39,'gjhvhbkjbjv','26','Female','reeznazar@gmail.com','0777777777'),(40,'sdsjbdsjcbs x','27','Male','egsrgswbtwetwe@gmail.com','0777777777'),(41,'Razna Nazar','27','Female','raznanazar09@gmail.com','0777733333'),(42,'Razna Nazar','27','Female','raznanazar09@gmail.com','0777733333'),(43,'Razna Nazar','27','Female','raznanazar09@gmail.com','0771323928'),(44,'sdsjbdsjcbs x','27','Female','raznanazar09@gamail.com','0777777777'),(45,'hausbhbda','27','Male','raznanazar09@gamail.com','1234567892'),(46,'hausbhbda','27','Female','raznanazar09@gamail.com','0777733333'),(47,'sdsjbdsjcbs x','27','Male','amanskjasbdjj@gmail.com','0777733333'),(48,'sdsjbdsjcbs x','27','Female','amanskjasbdjj@gmail.com','0777733333'),(49,'hausbhbda','27','Female','mohamednabeelthalif@gmail.com','0777733333'),(50,'sdsjbdsjcbs x','27','Male','amanskjasbdjj@gmail.com','0777733333'),(51,'Razna Nazar','18','Female','raznanazar09@gmail.com','0777777777'),(52,'Razna Nazar','25','Female','amanskjasbdjj@gmail','0777733311'),(53,'Lewis Hamilton','40','Male','LewiHamilton@gamil.com','0777777755'),(54,'Lewis Hamilton','25','Male','LewiHamilton@gamil.com','1234567567'),(55,'Vimagi Jayapathi','26','Female','Vimaki123@gmail.com','3535353555'),(56,'hausbhbda','26','Female','amanskjasbdjj@gmail.com','0777777777'),(57,'sdsjbdsjcbs x','23','Male','amanskjasbdjj@gmail.com','1234567892'),(58,'sdsjbdsjcbs x','23','Male','amanskjasbdjj@gmail','0777733333'),(59,'hausbhbda','27','Male','amanskjasbdjj@gmail.com','0777733355'),(60,'hausbhbda','26','Female','reeznazar@gmail.com','0771333333'),(61,'hausbhbda','40','Male','raznanazar09@gamail.com','1234567892'),(62,'sdsjbdsjcbs x','26','Male','amanskjasbdjj@gmail.com','0771323333'),(63,'Razna Nazar','26','Female','amanskjasbdjj@gmail.com','0771333333'),(64,'hausbhbda','40','Male','amanskjasbdjj@gmail.com','0771323666'),(65,'Vimagi Jayapathi','25','Female','Vimagi321@gmail.com','2324353535'),(66,'Vimagi Jayapathi','34','Male','amanskjasbdjj@gmail','0771323928'),(67,'Akash Vihanga','23','Male','Akash123@gmail.com','0772771232'),(69,'Vimagi Jayapathi','26','Female','Vimagi321@gmail.com','0777733333'),(70,'uhasabk','19','Female','qwewewe@sasd.csic','1213142434'),(72,'Razna Nazar','21','Female','raznanazar09@gmail.com','1213131313'),(74,'Vimagi Jayapathi','27','Female','amanskjasbdjj@gmail.v','0777733333'),(76,'Razna Nazar','21','Female','amanskjasbdjj@gmail.com','3565363436'),(77,'Razna Nazar','23','Female','raznanazar09@gmail.com','0777733333');
/*!40000 ALTER TABLE `appointmentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentpayment`
--

DROP TABLE IF EXISTS `appointmentpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentpayment` (
  `methodID` int NOT NULL AUTO_INCREMENT,
  `cardHolder` varchar(50) DEFAULT NULL,
  `cardNo` varchar(12) DEFAULT NULL,
  `expMonth` varchar(7) DEFAULT NULL,
  `cvv` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`methodID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentpayment`
--

LOCK TABLES `appointmentpayment` WRITE;
/*!40000 ALTER TABLE `appointmentpayment` DISABLE KEYS */;
INSERT INTO `appointmentpayment` VALUES (1,'wrgrhtehyjyrjyjhyjmfhnbnfbnhmhmhmfhjh','234354765767','2025-11','123'),(2,'vghvhbhj','124557847677','2025-11','124'),(3,'vghvhbhj','123456789077','2025-10','123'),(4,'fewfef','121652763281','2025-11','121'),(5,'fewfef','121652763281','2025-11','121'),(6,'fewfef','121652763281','2025-11','121'),(7,'fewfef','121652763281','2025-11','121'),(8,'afdagtsd','132453632263','2025-11','536'),(9,'rrfr4rqar4','123243434342','2025-11','123'),(10,'vghvhbhj','242354535235','2025-11','123'),(11,'fewfef','132435464646','2025-12','456'),(12,'wrgrhtehyjyrj','255644565875','2025-11','345'),(13,'vghvhbhj','357545534476','2025-11','457'),(14,'fewfef','131243535353','2025-12','789'),(15,'fewfef','131318313627','2025-11','123'),(16,'vghvhbhj','696565656565','2025-11','457'),(17,'rrfr4rqar4','243543546565','2025-11','121'),(18,'fewfef','374545453424','2025-11','457'),(19,'vghvhbhj','242546464646','2025-12','324'),(20,'vvbjbkb','232435454545','2025-12','234'),(21,'rrfr4rqar4','132543535353','2025-12','000'),(22,'sfgsfgfghfh','353535353535','2025-11','565'),(23,'rrfr4rqar4','757687576568','2025-12','567'),(24,'rrfr4rqar4','343535353535','2025-12','456'),(25,'rrfr4rqar4','343546464646','2025-11','456'),(26,'fyiegf','354653434634','2025-11','888'),(27,'eydfgeeyuugfiy','456876654444','2025-12','665'),(28,'eydfgeeyuugfiy','456876654444','2025-12','111'),(29,'geeydfgeeyuugfiy','467764574545','2025-12','468'),(30,'geeydfgeeyuugfiy','467764574545','2025-12','111'),(31,'dfgeeyuug','468764545454','2025-11','467'),(32,'Viamgi','232323232323','2025-11','365'),(33,'rrfr4rqar4','587565434234','2025-11','755'),(34,'Akash Vihanga','243636353535','2025-11','111'),(36,'Vimagi','223242424242','2025-11','345'),(38,'qqsdqs','131313131313','2025-10','121'),(40,'fewfef','486456534232','2025-11','467'),(42,'rrfr4rqar4','456453436532','2025-11','567'),(43,'vghvhbhj','476453453453','2025-11','457'),(44,'fewfef','586564563543','2025-11','568');
/*!40000 ALTER TABLE `appointmentpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availability` (
  `availability_id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `day` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `max_patients` int DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`availability_id`),
  KEY `fk_doctor_id_idx` (`doctor_id`),
  CONSTRAINT `fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO `availability` VALUES (50,47,'Nawaloka','Colombo','Tue','2025-07-22 16:30:00',100,2500.00),(51,47,'Asiri','Kandy','Thu','2025-07-24 17:00:00',80,2500.00),(52,48,'Lanka Hospitals','Colombo','Wed','2025-07-23 18:00:00',50,2000.00),(53,48,'Seth Sevana Hospitals','Kurunegala','Mon','2025-07-28 07:30:00',50,2000.00),(54,49,'Asiri','Matara','Sat','2025-07-26 15:00:00',60,3000.00),(55,50,'Hemas','Colombo','Fri','2025-08-01 16:00:00',80,3500.00),(56,50,'Durdans','Colombo','Sun','2025-08-03 17:00:00',60,2500.00),(57,51,'Cooperative Hospital','Kurunegala','Mon','2025-07-14 10:00:00',90,5000.00),(58,52,'Kings Hospital','Colombo','Wed','2025-09-10 18:00:00',40,2000.00),(59,52,'Navinne','Kurunegala','Thu','2025-08-21 18:30:00',20,2000.00),(60,53,'Leessons','Ragama','Mon','2025-06-30 15:30:00',75,1500.00),(61,54,'Asiri','Kandy','Tue','2025-07-29 16:30:00',50,2500.00),(62,54,'Seth Sevana Hospitals','Kurunegala','Fri','2025-06-27 08:00:00',60,3000.00),(63,54,'Nawaloka','Colombo','Sun','2025-07-13 18:00:00',100,2500.00);
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `inquiry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'amila silva','0712673546','amila@gmail.com','how contact'),(2,'amila silva','0712673546','amila@gmail.com','how contact doctors'),(3,'amila silva','0712673546','amila@gmail.com','jmshklj'),(4,'manu','71689897','amila@gmail.com','mnasbkaj,'),(5,'manu','0171689897','amila@gmail.com','hjasbjka,'),(6,'amila silva','0712673546','amila@gmail.com','bnvmj,'),(7,'amila silva','0712673546','amila@gmail.com','how to contact doctors'),(8,'manesha','0675676735','manesha@gmail.com','can i get a refund'),(9,'manesha','0767345623','manesha@gmail.com','fgj,gjk,'),(10,'manesha','0715676789','manesha@gmail.com','how can i cancel apoointment');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `qualifications` varchar(255) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (47,'Ajith Dissanayake','Consult','Cardiologist','MBBS - University of Colombo, MD - Michigan State University College of Osteopathic Medicine, USA',15,'Male','0718578354','ajithd@gmail.com','uploads/doctor8.jpg'),(48,'Rohini Tennakoon','Dr','Psychologist','PhD in Clinical Psychology from University of Colombo, MSc in Mental Health, University of Peradeniya',12,'Female','0761234567','rohini123@gmail.com','uploads/doctor2.jpg'),(49,'Anil Perera','Prof','Neurologist','DM (Doctorate of Medicine) in Neurology (AIIMS, New Delhi)',10,'Male','0762223333','anilP@gmail.com','uploads/doctor1.jpg'),(50,'Anuradha Gamage','Consult','Pediatrician','MBBS (University of Colombo), MD (Pediatrics) from PGIM Sri Lanka, PhD (University of Melbourne, Australia)',20,'Female','0773456789','anuradha@gmail.com','uploads/doctor26.avif'),(51,'Tharindi Wanninayaka','Dr','Cardiologist','MBBS (University of Peradeniya), MS (Surgery) - PGIM Sri Lanka',5,'Female','0709994444','tharindi@gmail.com','uploads/doctor4.jpg'),(52,'Malith Fernando','Consult','Dermatologist','MBBS - University of Cape Town, South Africa, MD in Dermatology (PGIM, Sri Lanka)',8,'Male','0788889012','malithf123@gmail.com','uploads/doctor7.jpg'),(53,'Nadeesha Kariyawasam','Dr','Physician','MBBS (University of Ruhuna)',2,'Female','0724567890','nadee@gmail.com','uploads/doctor5.jpg'),(54,'Upali Jayawardana','Prof','Haematologist','MBBS (Kazan State Medical University, Russia), MD in Clinical Hematology (PGIM, Sri Lanka)',30,'Male','0702345678','upalijaya@gmail.com','uploads/doctor12.jpg');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctoravailable`
--

DROP TABLE IF EXISTS `doctoravailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctoravailable` (
  `doc_ID` int NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(45) DEFAULT NULL,
  `doc_specialization` varchar(45) DEFAULT NULL,
  `available_hospital` varchar(45) DEFAULT NULL,
  `available_date` date DEFAULT NULL,
  `available_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doc_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctoravailable`
--

LOCK TABLES `doctoravailable` WRITE;
/*!40000 ALTER TABLE `doctoravailable` DISABLE KEYS */;
INSERT INTO `doctoravailable` VALUES (1,'M.Charith Wijesinghe','Cardiologist','City Hospital','2025-05-23','10:00 AM'),(2,'W.Thusil Wanninayaka','Neurologist','Town Clinic','2025-05-23','11:00 AM'),(3,'J.Jagath Pathirana','General Practitioner','Nawinna Hospital','2025-05-23','07:00 PM'),(4,'N.Ashoka Subasinghe','Dermatologist','CO-OP Hospital','2025-05-23','06:30 PM'),(5,'R.Vimarsha Hemamali','Psychiatrist','SethSevana Hospital','2025-05-23','08:00 AM'),(6,'P.Thusitha Gunawardena','Dentist','Med Clinic','2025-05-23','01:00 PM'),(7,'K.Jayoda Sadagoda','ENT Specialist','Town Clinic','2025-05-24','10:00 AM'),(8,'C.Hasini Ishuwara','General Practitioner','Med Clinic','2025-05-25','09:00 PM'),(9,'A.Akmal Azam','Psychiatrist','City Hospital','2025-05-25','06:00 PM'),(10,'Y.Yapa Jayasinghe','Dermatologist','Town Clinic','2025-05-24','11:00 AM'),(11,'K.Ashok Selvanagavan','General Practitioner','CO-OP Hospital','2025-05-26','11:00 AM'),(12,'P.Lewis Hamilton','Neurologist','City Hospital','2025-05-23','11:00 AM'),(13,'L.Charles Leclerc','Dentist','SethSevana Hospital','2025-05-24','11:00 AM');
/*!40000 ALTER TABLE `doctoravailable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `rating` varchar(15) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'manesha','hana@gmail.com','3','yjgkjhnlicxz'),(2,'amila silva','amila@gmail.com','4','kjhKNDM, X'),(3,'harry','harry@gmail.com','5','jh,BJKX>A'),(4,'harry','harry@gmail.com','3','excellent'),(5,'harry','harry@gmail.com','3','excellent'),(6,'manu dahanayake','mane@gmail.com','4','it was a great experience'),(7,'manu dahanayake','mane@gmail.com','5','tfyjhbkjn'),(8,'manu dahanayake','mane@gmail.com','2','very good service\r\n');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_appointments`
--

DROP TABLE IF EXISTS `lab_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `test_name` varchar(600) DEFAULT NULL,
  `test_price` double DEFAULT NULL,
  `patient_name` varchar(260) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `hospital` varchar(300) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_appointments`
--

LOCK TABLES `lab_appointments` WRITE;
/*!40000 ALTER TABLE `lab_appointments` DISABLE KEYS */;
INSERT INTO `lab_appointments` VALUES (1,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:30:00','Asiri Hospital',NULL,NULL,NULL),(2,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:03:00','Nawaloka Hospital','Pending',NULL,0),(3,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:03:00','Nawaloka Hospital','Pending',NULL,0),(4,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:03:00','Nawaloka Hospital','Pending',NULL,0),(5,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:52:00','Nawaloka Hospital','Pending',NULL,0),(6,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:12:00','Asiri Hospital','Pending',NULL,0),(7,4,'ABC test',5999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-06-12','14:12:00','Asiri Hospital','Pending',NULL,0),(8,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'Completed','2025-05-11',100),(9,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'Completed','2025-05-11',100),(10,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'Completed','2025-05-11',100),(11,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'Pending',NULL,0),(12,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'Completed','2025-05-11',100),(13,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','08:30:00','Asiri Hospital','Completed','2025-05-11',100),(14,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:00:00','Asiri Hospital','Completed','2025-05-11',4000),(15,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:00:00','Asiri Hospital','Completed','2025-05-11',4000),(16,6,'Rapid Antigen Test',2000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:30:00','Durdans Hospital','Completed','2025-05-12',100),(17,6,'Rapid Antigen Test',2000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:30:00','Durdans Hospital','Pending',NULL,0),(18,6,'Rapid Antigen Test',2000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','08:55:00','Asiri Hospital','Pending',NULL,0),(19,6,'Rapid Antigen Test',2000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','08:55:00','Asiri Hospital','Completed','2025-05-12',2000),(20,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:15:00','Asiri Hospital','Pending',NULL,0),(21,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:15:00','Asiri Hospital','Pending',NULL,0),(22,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:15:00','Asiri Hospital','Pending',NULL,0),(23,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:15:00','Asiri Hospital','Pending',NULL,0),(24,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','03:05:00','Asiri Hospital','Pending',NULL,0),(25,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','03:04:00','Asiri Hospital','Pending',NULL,0),(26,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','03:04:00','Asiri Hospital','Pending',NULL,0),(27,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','03:04:00','Asiri Hospital','Pending',NULL,0),(28,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','03:04:00','Asiri Hospital','Pending',NULL,0),(29,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','03:04:00','Asiri Hospital','Completed','2025-05-12',2000),(30,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:05:00','Asiri Hospital','Completed','2025-05-12',4000),(31,7,'Blood Test',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','15:56:00','Nawaloka Hospital','Completed','2025-05-12',1500.01),(32,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','12:30:00','Asiri Hospital','Completed','2025-05-13',4000),(33,8,'Urine Test',3000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:30:00','Asiri Hospital','Pending',NULL,0),(34,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:20:00','Asiri Hospital','Completed','2025-05-13',4000),(35,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-09-09','14:30:00','Asiri Hospital','Pending',NULL,0),(36,5,'CCC test',4000,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','10:09:00','Asiri Hospital','Pending',NULL,0),(37,15,'Urine Analysis ',3500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','11:38:00','Asiri Hospital','Completed','2025-05-13',3500.01),(38,15,'Urine Analysis ',3500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','00:00:00','Asiri Hospital','Completed','2025-05-13',3500.01),(39,15,'Urine Analysis ',3500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','23:10:00','Asiri Hospital','Completed','2025-05-13',3500.01),(40,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(41,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(42,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:00:00','Asiri Hospital','Pending',NULL,0),(43,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:00:00','Asiri Hospital','Pending',NULL,0),(44,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:10:00','Asiri Hospital','Pending',NULL,0),(45,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:20:00','Asiri Hospital','Completed','2025-05-14',1500.01),(46,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:00:00','Nawaloka Hospital','Completed','2025-05-14',1500.01),(47,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:30:00','Asiri Hospital','Pending',NULL,0),(48,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:40:00','Asiri Hospital','Pending',NULL,0),(49,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(50,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','00:40:00','Asiri Hospital','Completed','2025-05-14',1500.01),(51,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','00:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(52,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','14:30:00','Asiri Hospital','Completed','2025-05-14',1500.01),(53,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-13','09:20:00','Asiri Hospital','Completed','2025-05-14',1500.01),(54,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(55,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(56,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(57,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(58,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:00:00','Asiri Hospital','Completed','2025-05-14',1500.01),(59,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:10:00','Asiri Hospital','Completed','2025-05-14',1500.01),(60,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:20:00','Asiri Hospital','Completed','2025-05-14',1500.01),(61,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:30:00','Asiri Hospital','Completed','2025-05-14',1500.01),(62,18,'Magnetic Resonance Imaging (MRI)',7999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:40:00','Asiri Hospital','Pending',NULL,0),(63,18,'Magnetic Resonance Imaging (MRI)',7999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:50:00','Asiri Hospital','Pending',NULL,0),(64,18,'Magnetic Resonance Imaging (MRI)',7999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','09:00:00','Asiri Hospital','Pending',NULL,0),(65,18,'Magnetic Resonance Imaging (MRI)',7999.99,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','09:10:00','Asiri Hospital','Completed','2025-05-15',7999.99),(66,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','08:00:00','Lanka Hospital','Completed','2025-05-15',1500.01),(67,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','09:20:00','Asiri Hospital','Pending',NULL,0),(68,9,'Complete Blood Count ',1500.01,'kavya kahandawala','kavyakahandawala0611@gmail.com','2025-05-14','09:30:00','Asiri Hospital','Completed','2025-05-15',1500.01),(69,9,'Complete Blood Count ',1500.01,'harry','harry@gmail.com','2025-05-16','08:00:00','Asiri Hospital','Completed','2025-05-15',1500.01),(70,9,'Complete Blood Count ',1500.01,'harry','harry@gmail.com','2025-05-17','08:00:00','Asiri Hospital','Completed','2025-05-16',1500.01),(71,10,'Blood Sugar Test',1200.01,'amila silva','harry@gmail.com','2025-05-21','08:00:00','Asiri Hospital','Completed','2025-05-20',1200.01),(72,9,'Complete Blood Count ',1500.01,'amila silva','harry@gmail.com','2025-05-21','08:10:00','Asiri Hospital','Completed','2025-05-21',1500.01);
/*!40000 ALTER TABLE `lab_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_test`
--

DROP TABLE IF EXISTS `lab_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_test` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_test`
--

LOCK TABLES `lab_test` WRITE;
/*!40000 ALTER TABLE `lab_test` DISABLE KEYS */;
INSERT INTO `lab_test` VALUES (9,'Complete Blood Count ','Measures various components of blood including red and white blood cells, platelets, hemoglobin, and hematocrit.','1500.01'),(10,'Blood Sugar Test','Checks blood glucose levels to diagnose and monitor diabetes.','1200.01'),(11,'Lipid Profile','Measures cholesterol and triglyceride levels to assess heart health.','2000.01'),(12,'Thyroid Function Test','Measures thyroid hormones (T3, T4, TSH) to assess thyroid health.','3500.01'),(13,'Liver Function Test (LFT)','Evaluates liver enzymes, proteins, and bilirubin to monitor liver health.','2500.01'),(14,'Kidney Function Test (KFT)','Measures levels of urea, creatinine, and electrolytes for kidney health.','2200.01'),(15,'Urine Analysis ','Tests urine for abnormalities such as infection, pH, protein, glucose, and ketones.','3500.01'),(17,'COVID-19 PCR Test','Detects the presence of the COVID-19 virus through genetic analysis.','3500.01'),(18,'Magnetic Resonance Imaging (MRI)','Uses strong magnetic fields and radio waves for detailed imaging of organs.','7999.99');
/*!40000 ALTER TABLE `lab_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `registered_date` date DEFAULT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'Mr.','Amila','De Silva','amila@gmail.com','0712673544','200372610124','Amila@123','dharmapala mawatha, wanduragala, kurunegala','patient','2025-05-22','Upload/user_4_1747890725509.jpg'),(5,'Ms.','System','Admin','admin@gmail.com','0712345678','200012345678','Admin@123','Admin Address','admin','2025-05-08',NULL),(19,'Ms.','lihini','prabodha','lihini@gmail.com','0718909023','200372610129','Lihini@123','No.12,Lake Road, Kandy','patient','2025-05-21','Upload/user_19_1747891245912.jpg'),(25,'Miss.','natasha','de silva','natti@gmail.com','0715372645','200320480v','Natti@123','45A, Temple Lane, Matara','patient','2025-05-21','Upload/user_25_1747891258558.jpg'),(32,'Mr.','Kalana','Ranathunga','kalana@gmail.com','0712673546','200245628792','Kalana@123','No.7, Main Street, Gampaha','patient','2025-05-21','Upload/user_32_1747891287292.jpg'),(36,'Mrs.','madara','mandakini','madara@gmail.com','0712673546','032738295v','Madara@123','no.23, Kubuk Lane, Kurunegala','patient','2025-05-21','Upload/user_36_1747891333765.jpg'),(40,'Mr.','Danush','Hemantha','danush@gmail.com','0764524793','189956348297','H456dfg@','10/2, Hilltop Road, NuwaraEliya','patient','2025-05-21','Upload/user_40_1747891317568.jpg');
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

-- Dump completed on 2025-05-23  0:56:32
