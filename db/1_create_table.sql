DROP TABLE IF EXISTS urls;
CREATE TABLE urls (
   `id` int unsigned NOT NULL AUTO_INCREMENT, 
   `created_at` datetime DEFAULT NULL,
   `updated_at` datetime DEFAULT NULL,
   `deleted_at` datetime DEFAULT NULL,
   `name`	VARCHAR(250) NOT NULL COMMENT 'Url',
   `timeout` int(10) COMMENT 'Timeout in seconds',
   primary key (id)
) COMMENT 'Список сайтов';

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `cod_valid` varchar(100) DEFAULT NULL,
  `user_role` varchar(100) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `username` (`username`)
) COMMENT 'Пользователи';

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS journal;
CREATE TABLE journal (
   id int unsigned NOT NULL AUTO_INCREMENT, 
   created_at datetime DEFAULT NULL,
   updated_at datetime DEFAULT NULL,
   deleted_at datetime DEFAULT NULL,
   request	VARCHAR(250) NOT NULL COMMENT 'Строка запроса',
   timeout    int COMMENT 'Timeout in seconds',
   user_id     int unsigned  NOT NULL,
   url_id      int unsigned NOT NULL,
   primary key (id),
  KEY user_id (userid,urlid,request)
) COMMENT 'Журнал обращений';

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

alter table journal add constraint fk_journal_account FOREIGN KEY (user_id) 
      REFERENCES accounts (id) on delete restrict on update restrict;

alter table journal add  constraint fk_journal_url FOREIGN KEY (url_id) 
      REFERENCES urls (id)  on delete restrict on update restrict;

