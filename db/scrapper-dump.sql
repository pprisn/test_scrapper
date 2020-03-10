-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: scrapper
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `cod_valid` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_role` varchar(100) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_accounts_deleted_at` (`deleted_at`),
  KEY `username` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'2020-03-09 19:59:08','2020-03-09 21:38:52',NULL,'pprisn@yandex.ru','$2a$10$PHLPttQ4yfE9jVBJUni30OKApCRtVakQNmK8GrTPC97pgzY2EN2MW',NULL,'977267','pprisn','admin'),(2,'2020-03-09 19:59:08',NULL,NULL,'user1@yandex.ru',NULL,NULL,NULL,'user1','user'),(3,'2020-03-09 19:59:08',NULL,NULL,'user2@yandex.ru',NULL,NULL,NULL,'user2','user'),(4,'2020-03-09 19:59:08',NULL,NULL,'user3@yandex.ru',NULL,NULL,NULL,'user3','user'),(5,'2020-03-09 20:51:53','2020-03-09 20:51:53',NULL,'pprisn@mail.ru','$2a$10$PHLPttQ4yfE9jVBJUni30OKApCRtVakQNmK8GrTPC97pgzY2EN2MW','','660375','','user');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request` varchar(250) NOT NULL,
  `timeout` int(11) DEFAULT NULL,
  `url_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_journals_deleted_at` (`deleted_at`),
  KEY `journals_user_id_accounts_id_foreign` (`user_id`),
  KEY `journals_url_id_urls_id_foreign` (`url_id`),
  CONSTRAINT `journals_url_id_urls_id_foreign` FOREIGN KEY (`url_id`) REFERENCES `urls` (`id`),
  CONSTRAINT `journals_user_id_accounts_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timeout80` varchar(255) DEFAULT NULL,
  `timeout443` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_urls_deleted_at` (`deleted_at`),
  KEY `url_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (1,NULL,'2020-03-10 16:48:40',NULL,'google.com','0','-1'),(2,NULL,'2020-03-10 16:48:40',NULL,'gyoutube.com','0','-1'),(3,NULL,'2020-03-10 16:48:40',NULL,'gfacebook.com','1','0'),(4,NULL,'2020-03-10 16:48:40',NULL,'gbaidu.com','60','-1'),(5,NULL,'2020-03-10 16:48:40',NULL,'gwikipedia.org','60','60'),(6,NULL,'2020-03-10 16:48:40',NULL,'gqq.com','1','-1'),(7,NULL,'2020-03-10 16:48:40',NULL,'gtaobao.com','1','60'),(8,NULL,'2020-03-10 16:48:40',NULL,'gyahoo.com','60','60'),(9,NULL,'2020-03-10 16:48:40',NULL,'gtmall.com','0','-1'),(10,NULL,'2020-03-10 16:48:40',NULL,'gamazon.com','1','-1'),(11,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.co.in','0','60'),(12,NULL,'2020-03-10 16:48:40',NULL,'gtwitter.com','1','-1'),(13,NULL,'2020-03-10 16:48:40',NULL,'gsohu.com','1','-1'),(14,NULL,'2020-03-10 16:48:40',NULL,'gjd.com','1','60'),(15,NULL,'2020-03-10 16:48:40',NULL,'glive.com','0','60'),(16,NULL,'2020-03-10 16:48:40',NULL,'ginstagram.com','1','-1'),(17,NULL,'2020-03-10 16:48:40',NULL,'gsina.com.cn','1','60'),(18,NULL,'2020-03-10 16:48:40',NULL,'gweibo.com','7','-1'),(19,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.co.jp','-1','-1'),(20,NULL,'2020-03-10 16:48:40',NULL,'greddit.com','-1','-1'),(21,NULL,'2020-03-10 16:48:40',NULL,'gvk.com','1','60'),(22,NULL,'2020-03-10 16:48:40',NULL,'g360.cn','60','3'),(23,NULL,'2020-03-10 16:48:40',NULL,'glogin.tmall.com','60','60'),(24,NULL,'2020-03-10 16:48:40',NULL,'gblogspot.com','1','-1'),(25,NULL,'2020-03-10 16:48:40',NULL,'gyandex.ru','0','-1'),(26,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.com.hk','-1','-1'),(27,NULL,'2020-03-10 16:48:40',NULL,'gnetflix.com','0','-1'),(28,NULL,'2020-03-10 16:48:40',NULL,'glinkedin.com','0','60'),(29,NULL,'2020-03-10 16:48:40',NULL,'gpornhub.com','0','-1'),(30,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.com.br','0','60'),(31,NULL,'2020-03-10 16:48:40',NULL,'gtwitch.tv','-1','60'),(32,NULL,'2020-03-10 16:48:40',NULL,'gpages.tmall.com','60','60'),(33,NULL,'2020-03-10 16:48:40',NULL,'gcsdn.net','-1','-1'),(34,NULL,'2020-03-10 16:48:40',NULL,'gyahoo.co.jp','-1','-1'),(35,NULL,'2020-03-10 16:48:40',NULL,'gmail.ru','-1','-1'),(36,NULL,'2020-03-10 16:48:40',NULL,'galiexpress.com','0','-1'),(37,NULL,'2020-03-10 16:48:40',NULL,'galipay.com','60','60'),(38,NULL,'2020-03-10 16:48:40',NULL,'goffice.com','1','1'),(39,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.fr','0','-1'),(40,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.ru','-1','-1'),(41,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.co.uk','60','-1'),(42,NULL,'2020-03-10 16:48:40',NULL,'gmicrosoftonline.com','-1','-1'),(43,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.de','0','-1'),(44,NULL,'2020-03-10 16:48:40',NULL,'gebay.com','1','-1'),(45,NULL,'2020-03-10 16:48:40',NULL,'gmicrosoft.com','-1','-1'),(46,NULL,'2020-03-10 16:48:40',NULL,'glivejasmin.com','-1','60'),(47,NULL,'2020-03-10 16:48:40',NULL,'gt.co','1','0'),(48,NULL,'2020-03-10 16:48:40',NULL,'gbing.com','1','60'),(49,NULL,'2020-03-10 16:48:40',NULL,'gxvideos.com','1','-1'),(50,NULL,'2020-03-10 16:48:40',NULL,'ggoogle.ca','1','-1');
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-10 16:50:10
