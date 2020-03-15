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
  `timeout80` varchar(10) DEFAULT NULL,
  `timeout443` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_journals_deleted_at` (`deleted_at`),
  KEY `journals_user_id_accounts_id_foreign` (`user_id`),
  KEY `journals_url_id_urls_id_foreign` (`url_id`),
  CONSTRAINT `journals_url_id_urls_id_foreign` FOREIGN KEY (`url_id`) REFERENCES `urls` (`id`),
  CONSTRAINT `journals_user_id_accounts_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'2020-03-11 21:09:24','2020-03-11 21:09:24',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'2','1'),(2,'2020-03-11 21:09:32','2020-03-11 21:09:32',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'2','1'),(3,'2020-03-11 21:11:51','2020-03-11 21:11:51',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(4,'2020-03-11 21:11:55','2020-03-11 21:11:55',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(5,'2020-03-11 21:11:57','2020-03-11 21:11:57',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(6,'2020-03-11 21:11:58','2020-03-11 21:11:58',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(7,'2020-03-11 21:11:59','2020-03-11 21:11:59',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(8,'2020-03-11 21:12:01','2020-03-11 21:12:01',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(9,'2020-03-11 21:12:17','2020-03-11 21:12:17',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(10,'2020-03-11 21:12:19','2020-03-11 21:12:19',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(11,'2020-03-11 21:12:21','2020-03-11 21:12:21',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(12,'2020-03-11 21:12:22','2020-03-11 21:12:22',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(13,'2020-03-11 21:12:23','2020-03-11 21:12:23',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(14,'2020-03-11 21:12:23','2020-03-11 21:12:23',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(15,'2020-03-11 21:12:24','2020-03-11 21:12:24',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(16,'2020-03-11 21:12:24','2020-03-11 21:12:24',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(17,'2020-03-11 21:12:25','2020-03-11 21:12:25',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(18,'2020-03-11 21:12:25','2020-03-11 21:12:25',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(19,'2020-03-11 21:12:26','2020-03-11 21:12:26',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(20,'2020-03-11 21:12:26','2020-03-11 21:12:26',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(21,'2020-03-11 21:12:27','2020-03-11 21:12:27',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(22,'2020-03-11 21:12:28','2020-03-11 21:12:28',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(23,'2020-03-11 21:12:29','2020-03-11 21:12:29',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(24,'2020-03-11 21:12:29','2020-03-11 21:12:29',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(25,'2020-03-11 21:12:29','2020-03-11 21:12:29',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(26,'2020-03-11 21:12:30','2020-03-11 21:12:30',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(27,'2020-03-11 21:12:30','2020-03-11 21:12:30',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(28,'2020-03-11 21:12:30','2020-03-11 21:12:30',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(29,'2020-03-11 21:12:30','2020-03-11 21:12:30',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(30,'2020-03-11 21:12:31','2020-03-11 21:12:31',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(31,'2020-03-11 21:12:31','2020-03-11 21:12:31',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(32,'2020-03-11 21:12:31','2020-03-11 21:12:31',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(33,'2020-03-11 21:12:32','2020-03-11 21:12:32',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(34,'2020-03-11 21:12:32','2020-03-11 21:12:32',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(35,'2020-03-11 21:12:32','2020-03-11 21:12:32',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(36,'2020-03-11 21:12:32','2020-03-11 21:12:32',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(37,'2020-03-11 21:12:33','2020-03-11 21:12:33',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(38,'2020-03-11 21:12:33','2020-03-11 21:12:33',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(39,'2020-03-11 21:12:33','2020-03-11 21:12:33',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(40,'2020-03-11 21:12:34','2020-03-11 21:12:34',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(41,'2020-03-11 21:12:34','2020-03-11 21:12:34',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(42,'2020-03-11 21:12:34','2020-03-11 21:12:34',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(43,'2020-03-11 21:12:34','2020-03-11 21:12:34',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(44,'2020-03-11 21:12:35','2020-03-11 21:12:35',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(45,'2020-03-11 21:12:35','2020-03-11 21:12:35',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(46,'2020-03-15 19:36:58','2020-03-15 19:36:58',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','0'),(47,'2020-03-15 19:45:24','2020-03-15 19:45:24',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','0'),(48,'2020-03-15 19:48:12','2020-03-15 19:48:12',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(49,'2020-03-15 19:54:06','2020-03-15 19:54:06',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'1','1'),(50,'2020-03-15 20:00:43','2020-03-15 20:00:43',NULL,'pprisn@mail.ru','gfacebook.com',NULL,3,5,'2','1'),(51,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','youtube.com',NULL,2,5,'1','-1'),(52,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','facebook.com',NULL,3,5,'-1','-1'),(53,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','baidu.com',NULL,4,5,'60','60'),(54,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','wikipedia.org',NULL,5,5,'60','60'),(55,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','qq.com',NULL,6,5,'60','60'),(56,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','taobao.com',NULL,7,5,'60','60'),(57,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','yahoo.com',NULL,8,5,'60','60'),(58,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','tmall.com',NULL,9,5,'60','60'),(59,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','amazon.com',NULL,10,5,'-1','0'),(60,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','google.co.in',NULL,11,5,'1','-1'),(61,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','twitter.com',NULL,12,5,'60','60'),(62,'2020-03-15 20:12:36','2020-03-15 20:12:36',NULL,'pprisn@mail.ru','sohu.com',NULL,13,5,'60','60'),(63,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','jd.com',NULL,14,5,'60','60'),(64,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','live.com',NULL,15,5,'60','60'),(65,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','instagram.com',NULL,16,5,'60','60'),(66,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','sina.com.cn',NULL,17,5,'60','60'),(67,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','weibo.com',NULL,18,5,'60','60'),(68,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','google.co.jp',NULL,19,5,'60','60'),(69,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','reddit.com',NULL,20,5,'60','60'),(70,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','vk.com',NULL,21,5,'60','60'),(71,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','360.cn',NULL,22,5,'60','60'),(72,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','login.tmall.com ',NULL,23,5,'60','60'),(73,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','blogspot.com',NULL,24,5,'60','60'),(74,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','yandex.ru',NULL,25,5,'60','60'),(75,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','google.com.hk',NULL,26,5,'1','-1'),(76,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','netflix.com',NULL,27,5,'2','-1'),(77,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','linkedin.com',NULL,28,5,'0','-1'),(78,'2020-03-15 20:12:37','2020-03-15 20:12:37',NULL,'pprisn@mail.ru','pornhub.com',NULL,29,5,'-1','-1'),(79,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','google.com.br',NULL,30,5,'0','-1'),(80,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','twitch.tv',NULL,31,5,'1','-1'),(81,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','pages.tmall.com',NULL,32,5,'2','0'),(82,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','csdn.net',NULL,33,5,'3','1'),(83,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','yahoo.co.jp',NULL,34,5,'2','-1'),(84,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','mail.ru',NULL,35,5,'0','0'),(85,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','aliexpress.com',NULL,36,5,'-1','-1'),(86,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','alipay.com',NULL,37,5,'2','60'),(87,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','office.com',NULL,38,5,'1','60'),(88,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','google.fr',NULL,39,5,'1','-1'),(89,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','google.ru',NULL,40,5,'0','-1'),(90,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','google.co.uk',NULL,41,5,'0','-1'),(91,'2020-03-15 20:12:38','2020-03-15 20:12:38',NULL,'pprisn@mail.ru','microsoftonline.com',NULL,42,5,'60','60');
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
  `timeout80` varchar(10) DEFAULT NULL,
  `timeout443` varchar(10) DEFAULT NULL,
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
INSERT INTO `urls` VALUES (1,NULL,'2020-03-15 20:13:31',NULL,'google.com','0','-1'),(2,NULL,'2020-03-15 20:13:31',NULL,'youtube.com','1','-1'),(3,NULL,'2020-03-15 20:13:31',NULL,'facebook.com','-1','-1'),(4,NULL,'2020-03-15 20:13:31',NULL,'baidu.com','-1','1'),(5,NULL,'2020-03-15 20:13:31',NULL,'wikipedia.org','1','-1'),(6,NULL,'2020-03-15 20:13:31',NULL,'qq.com','-1','1'),(7,NULL,'2020-03-15 20:13:31',NULL,'taobao.com','3','1'),(8,NULL,'2020-03-15 20:13:31',NULL,'yahoo.com','1','-1'),(9,NULL,'2020-03-15 20:13:31',NULL,'tmall.com','2','2'),(10,NULL,'2020-03-15 20:13:31',NULL,'amazon.com','60','60'),(11,NULL,'2020-03-15 20:13:31',NULL,'google.co.in','60','60'),(12,NULL,'2020-03-15 20:13:31',NULL,'twitter.com','60','60'),(13,NULL,'2020-03-15 20:13:31',NULL,'sohu.com','60','60'),(14,NULL,'2020-03-15 20:13:31',NULL,'jd.com','60','60'),(15,NULL,'2020-03-15 20:13:31',NULL,'live.com','5','60'),(16,NULL,'2020-03-15 20:13:31',NULL,'instagram.com','60','60'),(17,NULL,'2020-03-15 20:13:31',NULL,'sina.com.cn','60','60'),(18,NULL,'2020-03-15 20:13:31',NULL,'weibo.com','8','6'),(19,NULL,'2020-03-15 20:13:32',NULL,'google.co.jp','0','-1'),(20,NULL,'2020-03-15 20:13:32',NULL,'reddit.com','1','-1'),(21,NULL,'2020-03-15 20:13:32',NULL,'vk.com','1','0'),(22,NULL,'2020-03-15 20:13:32',NULL,'360.cn','2','0'),(23,NULL,'2020-03-15 20:13:32',NULL,'login.tmall.com','2','0'),(24,NULL,'2020-03-15 20:13:32',NULL,'blogspot.com','2','-1'),(25,NULL,'2020-03-15 20:13:32',NULL,'yandex.ru','0','0'),(26,NULL,'2020-03-15 20:13:32',NULL,'google.com.hk','0','-1'),(27,NULL,'2020-03-15 20:13:32',NULL,'netflix.com','2','-1'),(28,NULL,'2020-03-15 20:13:32',NULL,'linkedin.com','0','-1'),(29,NULL,'2020-03-15 20:13:32',NULL,'pornhub.com','-1','-1'),(30,NULL,'2020-03-15 20:13:32',NULL,'google.com.br','0','-1'),(31,NULL,'2020-03-15 20:13:32',NULL,'twitch.tv','1','-1'),(32,NULL,'2020-03-15 20:13:32',NULL,'pages.tmall.com','3','0'),(33,NULL,'2020-03-15 20:13:32',NULL,'csdn.net','2','1'),(34,NULL,'2020-03-15 20:13:32',NULL,'yahoo.co.jp','60','60'),(35,NULL,'2020-03-15 20:13:32',NULL,'mail.ru','0','0'),(36,NULL,'2020-03-15 20:13:32',NULL,'aliexpress.com','-1','-1'),(37,NULL,'2020-03-15 20:13:32',NULL,'alipay.com','2','60'),(38,NULL,'2020-03-15 20:13:32',NULL,'office.com','1','60'),(39,NULL,'2020-03-15 20:13:33',NULL,'google.fr','60','60'),(40,NULL,'2020-03-15 20:13:33',NULL,'google.ru','60','60'),(41,NULL,'2020-03-15 20:13:33',NULL,'google.co.uk','60','60'),(42,NULL,'2020-03-15 20:13:33',NULL,'microsoftonline.com','60','60'),(43,NULL,'2020-03-15 20:13:33',NULL,'google.de','0','-1'),(44,NULL,'2020-03-15 20:13:33',NULL,'ebay.com','1','-1'),(45,NULL,'2020-03-15 20:13:33',NULL,'microsoft.com','1','-1'),(46,NULL,'2020-03-15 20:13:33',NULL,'livejasmin.com','-1','0'),(47,NULL,'2020-03-15 20:13:33',NULL,'t.co','1','-1'),(48,NULL,'2020-03-15 20:13:33',NULL,'bing.com','60','60'),(49,NULL,'2020-03-15 20:13:33',NULL,'xvideos.com','60','60'),(50,NULL,'2020-03-15 20:13:33',NULL,'google.ca','0','-1');
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

-- Dump completed on 2020-03-15 23:14:29
