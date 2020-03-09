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

INSERT INTO urls (name) values ('google.com');
INSERT INTO urls (name) values ('gyoutube.com');
INSERT INTO urls (name) values ('gfacebook.com');
INSERT INTO urls (name) values ('gbaidu.com');
INSERT INTO urls (name) values ('gwikipedia.org');
INSERT INTO urls (name) values ('gqq.com');
INSERT INTO urls (name) values ('gtaobao.com');
INSERT INTO urls (name) values ('gyahoo.com');
INSERT INTO urls (name) values ('gtmall.com');
INSERT INTO urls (name) values ('gamazon.com');
INSERT INTO urls (name) values ('ggoogle.co.in');
INSERT INTO urls (name) values ('gtwitter.com');
INSERT INTO urls (name) values ('gsohu.com');
INSERT INTO urls (name) values ('gjd.com');
INSERT INTO urls (name) values ('glive.com');
INSERT INTO urls (name) values ('ginstagram.com');
INSERT INTO urls (name) values ('gsina.com.cn');
INSERT INTO urls (name) values ('gweibo.com');
INSERT INTO urls (name) values ('ggoogle.co.jp');
INSERT INTO urls (name) values ('greddit.com');
INSERT INTO urls (name) values ('gvk.com');
INSERT INTO urls (name) values ('g360.cn');
INSERT INTO urls (name) values ('glogin.tmall.com');
INSERT INTO urls (name) values ('gblogspot.com');
INSERT INTO urls (name) values ('gyandex.ru');
INSERT INTO urls (name) values ('ggoogle.com.hk');
INSERT INTO urls (name) values ('gnetflix.com');
INSERT INTO urls (name) values ('glinkedin.com');
INSERT INTO urls (name) values ('gpornhub.com');
INSERT INTO urls (name) values ('ggoogle.com.br');
INSERT INTO urls (name) values ('gtwitch.tv');
INSERT INTO urls (name) values ('gpages.tmall.com');
INSERT INTO urls (name) values ('gcsdn.net');
INSERT INTO urls (name) values ('gyahoo.co.jp');
INSERT INTO urls (name) values ('gmail.ru');
INSERT INTO urls (name) values ('galiexpress.com');
INSERT INTO urls (name) values ('galipay.com');
INSERT INTO urls (name) values ('goffice.com');
INSERT INTO urls (name) values ('ggoogle.fr');
INSERT INTO urls (name) values ('ggoogle.ru');
INSERT INTO urls (name) values ('ggoogle.co.uk');
INSERT INTO urls (name) values ('gmicrosoftonline.com');
INSERT INTO urls (name) values ('ggoogle.de');
INSERT INTO urls (name) values ('gebay.com');
INSERT INTO urls (name) values ('gmicrosoft.com');
INSERT INTO urls (name) values ('glivejasmin.com');
INSERT INTO urls (name) values ('gt.co');
INSERT INTO urls (name) values ('gbing.com');
INSERT INTO urls (name) values ('gxvideos.com');
INSERT INTO urls (name) values ('ggoogle.ca');
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
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `codvalid` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `username` (`username`)
) COMMENT 'Пользователи';

INSERT INTO accounts (created_at,username,email,role) values (NOW(),'pprisn','pprisn@yandex.ru','admin');
INSERT INTO accounts (created_at,username,email,role) values (NOW(),'user1','user1@yandex.ru','user');
INSERT INTO accounts (created_at,username,email,role) values (NOW(),'user2','user2@yandex.ru','user');
INSERT INTO accounts (created_at,username,email,role) values (NOW(),'user3','user3@yandex.ru','user');

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
   userid     int unsigned  NOT NULL,
   urlid      int unsigned NOT NULL,
   primary key (id),
  KEY user_id (userid,urlid,request)
) COMMENT 'Журнал обращений';

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

alter table journal add constraint fk_journal_account FOREIGN KEY (userid) 
      REFERENCES accounts (id) on delete restrict on update restrict;

alter table journal add  constraint fk_journal_url FOREIGN KEY (urlid) 
      REFERENCES urls (id)  on delete restrict on update restrict;

