-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: scrapper
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `codvalid` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'2020-03-08 23:21:48',NULL,NULL,'pprisn','pprisn@yandex.ru',NULL,NULL,'admin'),(2,'2020-03-08 23:21:48',NULL,NULL,'user1','user1@yandex.ru',NULL,NULL,'user'),(3,'2020-03-08 23:21:48',NULL,NULL,'user2','user2@yandex.ru',NULL,NULL,'user'),(4,'2020-03-08 23:21:48',NULL,NULL,'user3','user3@yandex.ru',NULL,NULL,'user');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `cod_valid` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `request` varchar(250) NOT NULL COMMENT 'Строка запроса',
  `timeout` int(11) DEFAULT NULL COMMENT 'Timeout in seconds',
  `userid` int(10) unsigned NOT NULL,
  `urlid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`userid`,`urlid`,`request`),
  KEY `fk_journal_url` (`urlid`),
  CONSTRAINT `fk_journal_account` FOREIGN KEY (`userid`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_journal_url` FOREIGN KEY (`urlid`) REFERENCES `url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Журнал обращений';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_journals_deleted_at` (`deleted_at`)
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
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(250) NOT NULL COMMENT 'Url',
  `timeout` int(10) DEFAULT NULL COMMENT 'Timeout in seconds',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Список сайтов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` VALUES (1,NULL,NULL,NULL,'google.com',NULL),(2,NULL,NULL,NULL,'gyoutube.com',NULL),(3,NULL,NULL,NULL,'gfacebook.com',NULL),(4,NULL,NULL,NULL,'gbaidu.com',NULL),(5,NULL,NULL,NULL,'gwikipedia.org',NULL),(6,NULL,NULL,NULL,'gqq.com',NULL),(7,NULL,NULL,NULL,'gtaobao.com',NULL),(8,NULL,NULL,NULL,'gyahoo.com',NULL),(9,NULL,NULL,NULL,'gtmall.com',NULL),(10,NULL,NULL,NULL,'gamazon.com',NULL),(11,NULL,NULL,NULL,'ggoogle.co.in',NULL),(12,NULL,NULL,NULL,'gtwitter.com',NULL),(13,NULL,NULL,NULL,'gsohu.com',NULL),(14,NULL,NULL,NULL,'gjd.com',NULL),(15,NULL,NULL,NULL,'glive.com',NULL),(16,NULL,NULL,NULL,'ginstagram.com',NULL),(17,NULL,NULL,NULL,'gsina.com.cn',NULL),(18,NULL,NULL,NULL,'gweibo.com',NULL),(19,NULL,NULL,NULL,'ggoogle.co.jp',NULL),(20,NULL,NULL,NULL,'greddit.com',NULL),(21,NULL,NULL,NULL,'gvk.com',NULL),(22,NULL,NULL,NULL,'g360.cn',NULL),(23,NULL,NULL,NULL,'glogin.tmall.com',NULL),(24,NULL,NULL,NULL,'gblogspot.com',NULL),(25,NULL,NULL,NULL,'gyandex.ru',NULL),(26,NULL,NULL,NULL,'ggoogle.com.hk',NULL),(27,NULL,NULL,NULL,'gnetflix.com',NULL),(28,NULL,NULL,NULL,'glinkedin.com',NULL),(29,NULL,NULL,NULL,'gpornhub.com',NULL),(30,NULL,NULL,NULL,'ggoogle.com.br',NULL),(31,NULL,NULL,NULL,'gtwitch.tv',NULL),(32,NULL,NULL,NULL,'gpages.tmall.com',NULL),(33,NULL,NULL,NULL,'gcsdn.net',NULL),(34,NULL,NULL,NULL,'gyahoo.co.jp',NULL),(35,NULL,NULL,NULL,'gmail.ru',NULL),(36,NULL,NULL,NULL,'galiexpress.com',NULL),(37,NULL,NULL,NULL,'galipay.com',NULL),(38,NULL,NULL,NULL,'goffice.com',NULL),(39,NULL,NULL,NULL,'ggoogle.fr',NULL),(40,NULL,NULL,NULL,'ggoogle.ru',NULL),(41,NULL,NULL,NULL,'ggoogle.co.uk',NULL),(42,NULL,NULL,NULL,'gmicrosoftonline.com',NULL),(43,NULL,NULL,NULL,'ggoogle.de',NULL),(44,NULL,NULL,NULL,'gebay.com',NULL),(45,NULL,NULL,NULL,'gmicrosoft.com',NULL),(46,NULL,NULL,NULL,'glivejasmin.com',NULL),(47,NULL,NULL,NULL,'gt.co',NULL),(48,NULL,NULL,NULL,'gbing.com',NULL),(49,NULL,NULL,NULL,'gxvideos.com',NULL),(50,NULL,NULL,NULL,'ggoogle.ca',NULL);
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_urls_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
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

-- Dump completed on 2020-03-09 17:30:29
