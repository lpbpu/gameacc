-- MySQL dump 10.13  Distrib 5.1.71, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: game
-- ------------------------------------------------------
-- Server version	5.1.71

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `game_name_tbl`
--

DROP TABLE IF EXISTS `game_name_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_name_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `game_icon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_name_tbl`
--

LOCK TABLES `game_name_tbl` WRITE;
/*!40000 ALTER TABLE `game_name_tbl` DISABLE KEYS */;
INSERT INTO `game_name_tbl` VALUES (1,100,'¾ÅÒõÕæ¾­','http://www.abcd.com/1.jpg'),(2,101,'¾ÅÑôÉñ¹¦','http://www.abcd.com/2.jpg'),(3,102,'Ä§ÊÞÕù°Ô','http://www.abcd.com/3.jpg'),(4,103,'ÁÐÍõµÄ·×Õù','http://www.abcd.com/4.jpg');
/*!40000 ALTER TABLE `game_name_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_region_tbl`
--

DROP TABLE IF EXISTS `game_region_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_region_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameid` int(11) NOT NULL,
  `regionname` varchar(255) NOT NULL,
  `ispname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_region_tbl`
--

LOCK TABLES `game_region_tbl` WRITE;
/*!40000 ALTER TABLE `game_region_tbl` DISABLE KEYS */;
INSERT INTO `game_region_tbl` VALUES (1,100,'±±¾©','ÒÆ¶¯'),(2,100,'±±¾©','µçÐÅÍ¨'),(3,100,'ÉÏº£','µçÐÅ'),(4,100,'ÉÏº£','ÁªÍ¨'),(5,101,'ÉÏº£','ÒÆ¶¯'),(6,101,'¹ãÖÝ','ÁªÍ¨'),(7,101,'¹ãÖÝ','ÒÆ¶¯'),(8,102,'±±¾©','ÁªÍ¨');
/*!40000 ALTER TABLE `game_region_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_sdk_upload_tbl`
--

DROP TABLE IF EXISTS `game_sdk_upload_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_sdk_upload_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_sdk_upload_tbl`
--

LOCK TABLES `game_sdk_upload_tbl` WRITE;
/*!40000 ALTER TABLE `game_sdk_upload_tbl` DISABLE KEYS */;
INSERT INTO `game_sdk_upload_tbl` VALUES (1,'{\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485137505,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"time\":1485137505,\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(2,'{\"time\":1485335786,\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485335786,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(3,'{\"time\":1485335786,\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485335786,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(4,'{\"time\":1485335839,\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485335839,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(5,'{\"time\":1485335786,\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485335786,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(6,'{\"time\":1485335786,\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485335786,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(7,'{\"time\":1485335971,\"version\":\"0.1\",\"devicetype\":1101,\"usertype\":1,\"cmdid\":2,\"data\":{\"qos\":[{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10},{\"ip\":\"5.6.7.8\",\"ttl\":63,\"rtt\":24,\"lose\":10}],\"vpnstatus\":{\"starttime\":1485335971,\"rx\":10240,\"duration\":3600,\"tx\":20480,\"status\":1,\"ip\":\"1.2.3.4\"}},\"uid\":\"9465604284cd4f4df0952bb72362e1b0\"}'),(8,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487228989,\"uid\":\"cc\"}'),(9,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229019,\"uid\":\"cc\"}'),(10,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229049,\"uid\":\"cc\"}'),(11,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229079,\"uid\":\"cc\"}'),(12,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229109,\"uid\":\"cc\"}'),(13,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229139,\"uid\":\"cc\"}'),(14,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229170,\"uid\":\"cc\"}'),(15,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229200,\"uid\":\"cc\"}'),(16,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229227,\"uid\":\"cc\"}'),(17,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229231,\"uid\":\"cc\"}'),(18,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229257,\"uid\":\"cc\"}'),(19,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229261,\"uid\":\"cc\"}'),(20,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229288,\"uid\":\"cc\"}'),(21,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229291,\"uid\":\"cc\"}'),(22,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229318,\"uid\":\"cc\"}'),(23,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229320,\"uid\":\"cc\"}'),(24,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229321,\"uid\":\"cc\"}'),(25,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229348,\"uid\":\"cc\"}'),(26,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229350,\"uid\":\"cc\"}'),(27,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229351,\"uid\":\"cc\"}'),(28,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229378,\"uid\":\"cc\"}'),(29,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229380,\"uid\":\"cc\"}'),(30,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229381,\"uid\":\"cc\"}'),(31,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229408,\"uid\":\"cc\"}'),(32,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229410,\"uid\":\"cc\"}'),(33,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229411,\"uid\":\"cc\"}'),(34,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229438,\"uid\":\"cc\"}'),(35,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229440,\"uid\":\"cc\"}'),(36,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229441,\"uid\":\"cc\"}'),(37,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229468,\"uid\":\"cc\"}'),(38,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229470,\"uid\":\"cc\"}'),(39,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229471,\"uid\":\"cc\"}'),(40,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229498,\"uid\":\"cc\"}'),(41,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229500,\"uid\":\"cc\"}'),(42,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229501,\"uid\":\"cc\"}'),(43,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229528,\"uid\":\"cc\"}'),(44,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229530,\"uid\":\"cc\"}'),(45,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229531,\"uid\":\"cc\"}'),(46,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229558,\"uid\":\"cc\"}'),(47,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229561,\"uid\":\"cc\"}'),(48,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229561,\"uid\":\"cc\"}'),(49,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229588,\"uid\":\"cc\"}'),(50,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229591,\"uid\":\"cc\"}'),(51,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229591,\"uid\":\"cc\"}'),(52,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229618,\"uid\":\"cc\"}'),(53,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229621,\"uid\":\"cc\"}'),(54,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229621,\"uid\":\"cc\"}'),(55,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229648,\"uid\":\"cc\"}'),(56,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229651,\"uid\":\"cc\"}'),(57,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229651,\"uid\":\"cc\"}'),(58,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229678,\"uid\":\"cc\"}'),(59,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229681,\"uid\":\"cc\"}'),(60,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229681,\"uid\":\"cc\"}'),(61,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229708,\"uid\":\"cc\"}'),(62,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229711,\"uid\":\"cc\"}'),(63,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229711,\"uid\":\"cc\"}'),(64,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229738,\"uid\":\"cc\"}'),(65,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229741,\"uid\":\"cc\"}'),(66,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229741,\"uid\":\"cc\"}'),(67,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229768,\"uid\":\"cc\"}'),(68,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229771,\"uid\":\"cc\"}'),(69,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229772,\"uid\":\"cc\"}'),(70,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229798,\"uid\":\"cc\"}'),(71,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229801,\"uid\":\"cc\"}'),(72,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229802,\"uid\":\"cc\"}'),(73,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229828,\"uid\":\"cc\"}'),(74,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229831,\"uid\":\"cc\"}'),(75,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229832,\"uid\":\"cc\"}'),(76,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229858,\"uid\":\"cc\"}'),(77,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229861,\"uid\":\"cc\"}'),(78,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229862,\"uid\":\"cc\"}'),(79,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229888,\"uid\":\"cc\"}'),(80,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229891,\"uid\":\"cc\"}'),(81,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229892,\"uid\":\"cc\"}'),(82,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229918,\"uid\":\"cc\"}'),(83,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229921,\"uid\":\"cc\"}'),(84,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229922,\"uid\":\"cc\"}'),(85,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229948,\"uid\":\"cc\"}'),(86,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229951,\"uid\":\"cc\"}'),(87,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229952,\"uid\":\"cc\"}'),(88,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229978,\"uid\":\"cc\"}'),(89,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229981,\"uid\":\"cc\"}'),(90,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487229982,\"uid\":\"cc\"}'),(91,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230008,\"uid\":\"cc\"}'),(92,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230011,\"uid\":\"cc\"}'),(93,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230012,\"uid\":\"cc\"}'),(94,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230038,\"uid\":\"cc\"}'),(95,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230041,\"uid\":\"cc\"}'),(96,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230042,\"uid\":\"cc\"}'),(97,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230068,\"uid\":\"cc\"}'),(98,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230071,\"uid\":\"cc\"}'),(99,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230072,\"uid\":\"cc\"}'),(100,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230098,\"uid\":\"cc\"}'),(101,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230101,\"uid\":\"cc\"}'),(102,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230102,\"uid\":\"cc\"}'),(103,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230128,\"uid\":\"cc\"}'),(104,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230131,\"uid\":\"cc\"}'),(105,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230132,\"uid\":\"cc\"}'),(106,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230158,\"uid\":\"cc\"}'),(107,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230161,\"uid\":\"cc\"}'),(108,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230162,\"uid\":\"cc\"}'),(109,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230188,\"uid\":\"cc\"}'),(110,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230191,\"uid\":\"cc\"}'),(111,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230192,\"uid\":\"cc\"}'),(112,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230218,\"uid\":\"cc\"}'),(113,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230221,\"uid\":\"cc\"}'),(114,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230222,\"uid\":\"cc\"}'),(115,'{\"version\":\"0.1\",\"cmdid\":2,\"vpnstatus\":{},\"qos\":{},\"data\":{},\"devicetype\":\"1101\",\"usertype\":\"2\",\"time\":1487230248,\"uid\":\"cc\"}'),(116,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902656,\"rx\":\"228\",\"duration\":30,\"tx\":\"228\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487902686,\"uid\":\"cc\"}'),(117,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902656,\"rx\":\"368\",\"duration\":60,\"tx\":\"368\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487902716,\"uid\":\"cc\"}'),(118,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902656,\"rx\":\"508\",\"duration\":90,\"tx\":\"508\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487902746,\"uid\":\"cc\"}'),(119,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902656,\"rx\":\"648\",\"duration\":121,\"tx\":\"648\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487902777,\"uid\":\"cc\"}'),(120,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902656,\"rx\":\"788\",\"duration\":151,\"tx\":\"788\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487902807,\"uid\":\"cc\"}'),(121,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902656,\"rx\":\"928\",\"duration\":181,\"tx\":\"928\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487902837,\"uid\":\"cc\"}'),(122,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902991,\"rx\":\"228\",\"duration\":30,\"tx\":\"228\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903021,\"uid\":\"cc\"}'),(123,'{\"data\":{\"vpnstatus\":{\"starttime\":1487902991,\"rx\":\"368\",\"duration\":60,\"tx\":\"368\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903051,\"uid\":\"cc\"}'),(124,'{\"data\":{\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"368\",\"duration\":60,\"tx\":\"368\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903496,\"uid\":\"cc\"}'),(125,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"640\",\"duration\":120,\"tx\":\"640\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903556,\"uid\":\"cc\"}'),(126,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"920\",\"duration\":181,\"tx\":\"920\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903617,\"uid\":\"cc\"}'),(127,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"1200\",\"duration\":241,\"tx\":\"1200\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903677,\"uid\":\"cc\"}'),(128,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"1480\",\"duration\":301,\"tx\":\"1480\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903737,\"uid\":\"cc\"}'),(129,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"1760\",\"duration\":361,\"tx\":\"1760\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903797,\"uid\":\"cc\"}'),(130,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"2040\",\"duration\":421,\"tx\":\"2040\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903857,\"uid\":\"cc\"}'),(131,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"2320\",\"duration\":481,\"tx\":\"2320\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903917,\"uid\":\"cc\"}'),(132,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"2586\",\"duration\":542,\"tx\":\"2586\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487903978,\"uid\":\"cc\"}'),(133,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"2852\",\"duration\":602,\"tx\":\"2862\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487904038,\"uid\":\"cc\"}'),(134,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"3132\",\"duration\":662,\"tx\":\"3142\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487904098,\"uid\":\"cc\"}'),(135,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"3408\",\"duration\":722,\"tx\":\"3418\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487904158,\"uid\":\"cc\"}'),(136,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"3718\",\"duration\":792,\"tx\":\"3728\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487904228,\"uid\":\"cc\"}'),(137,'{\"data\":{\"qos\":{},\"vpnstatus\":{\"starttime\":1487903436,\"rx\":\"3994\",\"duration\":852,\"tx\":\"4004\",\"status\":1,\"ip\":\"10.11.0.10\"}},\"version\":\"0.1\",\"devicetype\":\"1101\",\"usertype\":\"2\",\"cmdid\":2,\"time\":1487904288,\"uid\":\"cc\"}');
/*!40000 ALTER TABLE `game_sdk_upload_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_server_brief_tbl`
--

DROP TABLE IF EXISTS `game_server_brief_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_server_brief_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameregionid` int(11) NOT NULL,
  `gameip` varchar(20) NOT NULL,
  `gamemask` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_server_brief_tbl`
--

LOCK TABLES `game_server_brief_tbl` WRITE;
/*!40000 ALTER TABLE `game_server_brief_tbl` DISABLE KEYS */;
INSERT INTO `game_server_brief_tbl` VALUES (1,2,'115.182.76.0',24),(2,3,'61.129.44.0',24),(3,3,'222.73.0.0',16),(4,4,'210.51.33.0',24),(5,6,'114.182.76.0',24);
/*!40000 ALTER TABLE `game_server_brief_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_server_tbl`
--

DROP TABLE IF EXISTS `game_server_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_server_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameregionid` int(11) NOT NULL,
  `gameip` varchar(20) NOT NULL,
  `gamemask` int(11) NOT NULL,
  `gameport` int(11) NOT NULL,
  `gamedetect` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_server_tbl`
--

LOCK TABLES `game_server_tbl` WRITE;
/*!40000 ALTER TABLE `game_server_tbl` DISABLE KEYS */;
INSERT INTO `game_server_tbl` VALUES (1,1,'65.129.44.198',32,7000,0),(2,2,'115.182.76.234',32,7000,1),(3,2,'115.182.76.219',32,7000,0),(4,2,'115.182.76.214',32,7000,0),(5,2,'115.182.76.234',32,7000,0),(6,2,'115.182.76.206',32,7000,0),(7,2,'115.182.76.168',32,7000,0),(8,2,'115.182.76.166',32,7000,0),(9,2,'115.182.76.156',32,7000,0),(10,2,'115.182.76.148',32,7000,0),(11,2,'115.182.76.141',32,7000,0),(12,3,'61.129.44.197',32,7000,1),(13,3,'61.129.44.191',32,7000,0),(14,3,'61.129.44.187',32,7000,0),(15,3,'61.129.44.184',32,7000,0),(16,3,'61.129.44.181',32,7000,0),(17,3,'61.129.44.150',32,7000,0),(18,3,'222.73.2.107',32,7000,0),(19,3,'222.73.2.106',32,7000,0),(20,3,'222.73.13.7',32,7000,0),(21,3,'222.73.13.124',32,7000,0),(22,3,'222.73.13.123',32,7000,0),(23,4,'210.51.33.187',32,7000,1),(24,4,'210.51.33.186',32,7000,0),(25,4,'210.51.33.184',32,7000,0),(26,4,'210.51.33.183',32,7000,0),(27,4,'210.51.33.181',32,7000,0),(28,4,'210.51.33.158',32,7000,0),(29,4,'210.51.33.157',32,7000,0),(30,4,'210.51.33.153',32,7000,0),(31,4,'210.51.33.151',32,7000,0),(32,4,'210.51.33.150',32,7000,0),(33,4,'210.51.33.148',32,7000,0),(34,5,'124.182.76.143',32,7000,0),(35,6,'114.182.76.142',32,7000,1),(36,6,'114.182.76.143',32,7000,0),(37,7,'146.182.75.142',32,7000,1),(38,7,'146.182.76.143',32,7000,0);
/*!40000 ALTER TABLE `game_server_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_user_history_tbl`
--

DROP TABLE IF EXISTS `game_user_history_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_user_history_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `starttime` datetime NOT NULL,
  `gameid` int(11) NOT NULL,
  `gameregionid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_user_history_tbl`
--

LOCK TABLES `game_user_history_tbl` WRITE;
/*!40000 ALTER TABLE `game_user_history_tbl` DISABLE KEYS */;
INSERT INTO `game_user_history_tbl` VALUES (1,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 11:40:51',100,1),(2,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 11:41:18',100,2),(3,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 13:22:13',100,0),(4,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 13:22:21',100,2),(5,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 13:22:37',101,0),(6,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 13:22:46',102,0),(7,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 13:50:02',100,0),(8,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 13:52:58',100,0),(9,'9465604284cd4f4df0952bb72362e1b0','2017-01-24 15:52:29',100,0),(10,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 10:02:52',100,0),(11,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:25:49',100,0),(12,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:34:23',100,0),(13,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:41:29',100,0),(14,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:41:36',100,1),(15,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:41:44',100,10),(16,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:45:39',100,1),(17,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:46:59',100,0),(18,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 16:52:13',100,0),(19,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:02:31',100,0),(20,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:04:42',100,0),(21,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:05:40',100,0),(22,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:08:15',100,0),(23,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:13:57',100,0),(24,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:15:25',100,1),(25,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:15:33',100,2),(26,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:15:39',100,3),(27,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:15:43',100,4),(28,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:15:50',100,5),(29,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:15:55',101,5),(30,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:16:07',103,5),(31,'9465604284cd4f4df0952bb72362e1b0','2017-01-25 17:16:12',104,5),(32,'9465604284cd4f4df0952bb72362e1b0','2017-01-26 10:28:47',100,0),(33,'9465604284cd4f4df0952bb72362e1b0','2017-01-26 11:05:24',100,0),(34,'9465604284cd4f4df0952bb72362e1b0','2017-01-26 11:06:05',100,0),(35,'9465604284cd4f4df0952bb72362e1b0','2017-01-26 11:09:13',100,0),(36,'cc','2017-02-08 10:11:06',1001,1),(37,'cc','2017-02-08 10:12:17',101,1),(38,'cc','2017-02-08 10:12:22',101,5),(39,'cc','2017-02-08 10:12:56',100,0),(40,'cc','2017-02-08 10:44:13',100,0),(41,'cc','2017-02-08 10:45:19',100,0),(42,'cc','2017-02-08 10:57:18',100,0),(43,'cc','2017-02-08 11:05:11',100,0),(44,'cc','2017-02-08 11:07:22',100,0),(45,'cc','2017-02-08 11:11:22',100,0),(46,'cc','2017-02-08 11:16:30',100,0),(47,'cc','2017-02-08 13:45:24',100,0),(48,'cc','2017-02-08 14:05:16',100,0),(49,'cc','2017-02-08 14:06:14',100,0),(50,'cc','2017-02-08 15:09:27',100,0),(51,'cc','2017-02-08 15:18:28',100,0),(52,'cc','2017-02-08 15:27:03',100,0),(53,'cc','2017-02-08 16:45:48',100,0),(54,'cc','2017-02-16 16:19:25',100,0),(55,'cc','2017-02-16 16:34:55',100,0),(56,'cc','2017-02-16 16:37:08',100,0),(57,'cc','2017-02-16 16:37:33',100,0),(58,'cc','2017-02-16 16:39:46',100,0),(59,'cc','2017-02-16 16:41:03',100,0),(60,'cc','2017-02-16 16:41:15',100,0),(61,'cc','2017-02-16 16:41:20',100,0),(62,'cc','2017-02-16 16:41:28',100,0),(63,'cc','2017-02-16 16:42:14',100,0),(64,'cc','2017-02-16 16:43:26',100,0),(65,'cc','2017-02-16 16:43:32',1000,0),(66,'cc','2017-02-16 16:43:53',1000,0),(67,'cc','2017-02-16 16:44:07',10000,0),(68,'cc','2017-02-16 16:44:52',10000,0),(69,'cc','2017-02-16 16:45:13',10000,2),(70,'cc','2017-02-16 16:51:06',100,0),(71,'cc','2017-02-16 16:59:31',100,0),(72,'cc','2017-02-16 17:12:29',100,0),(73,'cc','2017-02-16 17:39:00',100,0),(74,'cc','2017-02-24 10:32:29',100,0),(75,'cc','2017-02-24 10:32:35',1000,0),(76,'cc','2017-02-24 10:32:40',1001,0),(77,'cc','2017-02-24 10:32:48',100000,0),(78,'cc','2017-02-24 10:35:09',100000,0),(79,'cc','2017-02-24 10:44:13',100000,0),(80,'cc','2017-02-24 10:48:17',100,0),(81,'cc','2017-02-24 10:51:49',100,0),(82,'cc','2017-02-24 10:52:54',100,0),(83,'cc','2017-02-24 10:54:24',100,0),(84,'cc','2017-02-24 11:02:30',100,0),(85,'cc','2017-02-24 11:03:21',100,0),(86,'cc','2017-02-24 11:05:10',100,0),(87,'cc','2017-02-24 11:06:27',101,0),(88,'cc','2017-02-24 11:17:30',101,0),(89,'cc','2017-02-24 11:26:31',101,0),(90,'cc','2017-02-24 12:18:44',101,0),(91,'cc','2017-02-24 12:22:02',101,0),(92,'cc','2017-02-24 12:48:17',101,0),(93,'cc','2017-02-24 12:49:53',101,0),(94,'cc','2017-02-24 12:50:38',101,0),(95,'cc','2017-02-24 12:53:36',102,0);
/*!40000 ALTER TABLE `game_user_history_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_vpn_account_tbl`
--

DROP TABLE IF EXISTS `game_vpn_account_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_vpn_account_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientip` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `logintime` datetime NOT NULL,
  `teartime` datetime NOT NULL,
  `upload` bigint(20) NOT NULL,
  `download` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_vpn_account_tbl`
--

LOCK TABLES `game_vpn_account_tbl` WRITE;
/*!40000 ALTER TABLE `game_vpn_account_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_vpn_account_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-24 13:19:28
