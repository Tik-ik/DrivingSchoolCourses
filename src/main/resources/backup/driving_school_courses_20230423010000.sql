-- MySQL dump 10.13  Distrib 5.7.36, for Win64 (x86_64)
--
-- Host: localhost    Database: driving_school_courses
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
-- Table structure for table `ylrc_about_info`
--

DROP TABLE IF EXISTS `ylrc_about_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_about_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `content` varchar(6552) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_about_info`
--

LOCK TABLES `ylrc_about_info` WRITE;
/*!40000 ALTER TABLE `ylrc_about_info` DISABLE KEYS */;
INSERT INTO `ylrc_about_info` VALUES (1,'2023-04-03 11:48:21','2023-04-04 15:38:13','菜鸟驾校欢迎您11','<p>\r\n	<span style=\"color:#666666;font-family:\" font-size:15px;\"=\"\">新闻出版系统驾驶员培训部</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
/*!40000 ALTER TABLE `ylrc_about_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_account`
--

DROP TABLE IF EXISTS `ylrc_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_account`
--

LOCK TABLES `ylrc_account` WRITE;
/*!40000 ALTER TABLE `ylrc_account` DISABLE KEYS */;
INSERT INTO `ylrc_account` VALUES (1,'2023-04-03 11:56:12','2023-04-03 18:19:42','123456789@qq.com','20201117/1605594153469-7e77fe16-2787-4559-a996-1c47a16b9072.jpeg','18186000288','123456',2,1,'Change'),(3,'2023-04-03 15:27:57','2023-04-03 15:32:38','123456@qq.com','','18186000214','123456',1,1,'Cocos'),(6,'2023-04-03 10:02:36','2023-04-03 12:57:09','264561@qq.caom','20201202/1606884868788-d69648d7-7e5f-4f5a-b04e-c1d5cd0c9a80.jpg','13461115532','123456',0,1,'pdd');
/*!40000 ALTER TABLE `ylrc_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_achievement`
--

DROP TABLE IF EXISTS `ylrc_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_achievement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `awards` int(11) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_achievement`
--

LOCK TABLES `ylrc_achievement` WRITE;
/*!40000 ALTER TABLE `ylrc_achievement` DISABLE KEYS */;
INSERT INTO `ylrc_achievement` VALUES (1,'2023-04-03 11:54:14','2023-04-03 09:33:04',1200,50,'我们是一个有着50年经验的老牌驾校'),(3,'2023-04-03 09:33:25','2023-04-03 09:33:25',14,4,'安居客的你了， ');
/*!40000 ALTER TABLE `ylrc_achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_appointment`
--

DROP TABLE IF EXISTS `ylrc_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_appointment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_rate` int(11) DEFAULT NULL,
  `make_date` datetime NOT NULL,
  `make_time` varchar(26) NOT NULL,
  `overdue` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `courses_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK75107bb6knksdq2i66j22kcyl` (`account_id`),
  KEY `FKdxy2qiegfub1t8gi85bnq49o8` (`courses_id`),
  CONSTRAINT `FK75107bb6knksdq2i66j22kcyl` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`),
  CONSTRAINT `FKdxy2qiegfub1t8gi85bnq49o8` FOREIGN KEY (`courses_id`) REFERENCES `ylrc_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_appointment`
--

LOCK TABLES `ylrc_appointment` WRITE;
/*!40000 ALTER TABLE `ylrc_appointment` DISABLE KEYS */;
INSERT INTO `ylrc_appointment` VALUES (1,'2023-04-03 13:49:23','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','13:00-13:50','2023-11-18 13:00-13:50',0,1,1),(2,'2023-04-03 13:49:45','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','13:50-14:40','2023-11-18 13:50-14:40',0,1,1),(3,'2023-04-03 15:35:09','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','08:00-08:50','2023-11-18 08:00-08:50',0,3,1),(4,'2023-04-03 15:36:31','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','09:40-10:30','2023-11-18 09:40-10:30',0,3,1),(5,'2023-04-03 10:22:44','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','08:00-08:50','2023-11-18 08:00-08:50',0,6,1),(6,'2023-04-03 10:22:44','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','08:50-09:40','2023-11-18 08:50-09:40',0,6,1),(7,'2023-04-03 10:22:44','2023-04-03 01:00:00',1,'2023-04-03 00:00:00','09:40-10:30','2023-11-18 09:40-10:30',0,6,1);
/*!40000 ALTER TABLE `ylrc_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_clazz_schedule`
--

DROP TABLE IF EXISTS `ylrc_clazz_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_clazz_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `end_time` varchar(16) NOT NULL,
  `slot` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `start_time` varchar(16) NOT NULL,
  `courses_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgr97uv4abukoupl4jy3337unc` (`courses_id`),
  CONSTRAINT `FKgr97uv4abukoupl4jy3337unc` FOREIGN KEY (`courses_id`) REFERENCES `ylrc_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_clazz_schedule`
--

LOCK TABLES `ylrc_clazz_schedule` WRITE;
/*!40000 ALTER TABLE `ylrc_clazz_schedule` DISABLE KEYS */;
INSERT INTO `ylrc_clazz_schedule` VALUES (1,'2023-04-22 19:47:10','2023-04-22 19:55:53','2023-01-29 00:01:00','20:00',50,'2023-01-22 00:04:00','15:10',3),(2,'2023-04-22 19:57:25','2023-04-22 19:57:25','2023-04-28 00:00:00','20:00',50,'2023-04-22 00:00:00','15:10',2);
/*!40000 ALTER TABLE `ylrc_clazz_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_coach`
--

DROP TABLE IF EXISTS `ylrc_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_coach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `introduce` varchar(6553) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `coach_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3c7bma8qh5j5xfr8c166gqgm9` (`coach_type_id`),
  CONSTRAINT `FK3c7bma8qh5j5xfr8c166gqgm9` FOREIGN KEY (`coach_type_id`) REFERENCES `ylrc_coach_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_coach`
--

LOCK TABLES `ylrc_coach` WRITE;
/*!40000 ALTER TABLE `ylrc_coach` DISABLE KEYS */;
INSERT INTO `ylrc_coach` VALUES (1,'2023-04-03 11:43:40','2023-04-04 16:36:53','1111@163.com','20201117/1605584458825.jpg','1234567897894561231\r\n5115456465555222\r\n22222212121545454\r\n14141414141','Change','15139710060','永不言败',1),(2,'2023-04-03 11:47:41','2023-04-04 16:37:48','1111@163.com','20201117/1605584628584.jpg','111111111111111111111111\r\n111111111111111111111111\r\n111111111','Zr','15139710061','速度',2),(5,'2023-04-03 09:34:27','2023-04-04 16:38:12','2452845299@qq.com','','11111111111111111111111\r\n111112222222222222\r\n222222222222222','哈哈','13151856541','啥事',2);
/*!40000 ALTER TABLE `ylrc_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_coach_type`
--

DROP TABLE IF EXISTS `ylrc_coach_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_coach_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_coach_type`
--

LOCK TABLES `ylrc_coach_type` WRITE;
/*!40000 ALTER TABLE `ylrc_coach_type` DISABLE KEYS */;
INSERT INTO `ylrc_coach_type` VALUES (1,'2023-04-03 11:39:38','2023-04-03 13:28:09','总教员'),(2,'2023-04-03 11:40:03','2023-04-03 11:40:03','科目二教练'),(3,'2023-04-03 11:40:12','2023-04-03 11:40:12','科目三教练'),(5,'2023-04-03 14:29:47','2023-04-03 14:29:47','驾校讲师');
/*!40000 ALTER TABLE `ylrc_coach_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_comments`
--

DROP TABLE IF EXISTS `ylrc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `ancestor_comment_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `news_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKheh1ponx88p4sjwkd1359wo44` (`account_id`),
  KEY `FKb1736f2x6i9n08fwg21vsjv7q` (`news_id`),
  CONSTRAINT `FKb1736f2x6i9n08fwg21vsjv7q` FOREIGN KEY (`news_id`) REFERENCES `ylrc_news` (`id`),
  CONSTRAINT `FKheh1ponx88p4sjwkd1359wo44` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_comments`
--

LOCK TABLES `ylrc_comments` WRITE;
/*!40000 ALTER TABLE `ylrc_comments` DISABLE KEYS */;
INSERT INTO `ylrc_comments` VALUES (1,'2023-04-22 15:30:16','2023-04-22 15:30:16',-1,'你好',-1,6,2);
/*!40000 ALTER TABLE `ylrc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_courses`
--

DROP TABLE IF EXISTS `ylrc_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_courses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `address` varchar(64) NOT NULL,
  `content` varchar(6553) DEFAULT NULL,
  `cover_photo` varchar(64) DEFAULT NULL,
  `hits` bigint(20) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `rate` decimal(19,2) DEFAULT NULL,
  `skills` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(32) NOT NULL,
  `type` varchar(128) DEFAULT NULL,
  `video` varchar(64) DEFAULT NULL,
  `coach_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsive954ivr8ideaw9mqlxygsf` (`coach_id`),
  CONSTRAINT `FKsive954ivr8ideaw9mqlxygsf` FOREIGN KEY (`coach_id`) REFERENCES `ylrc_coach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_courses`
--

LOCK TABLES `ylrc_courses` WRITE;
/*!40000 ALTER TABLE `ylrc_courses` DISABLE KEYS */;
INSERT INTO `ylrc_courses` VALUES (1,'2023-04-03 13:02:12','2023-04-22 19:48:42','肇庆','12345611111111111111111111111111111111111111111111','20201117/1605589235981.jpg',NULL,999.00,0.00,'SKILLS_ONE,SKILLS_TOW,SKILLS_THREE,',2,'科目二倒车入库','DRIVER,GUIDEPOST,LANECHANGE,PARKING,','20201117/1605593843411.mp4',1),(2,'2023-04-03 14:25:48','2023-04-04 15:36:57','肇庆','<p style=\"color:#666666;font-family:\" background-color:#ffffff;\"=\"\">\r\n	&nbsp; &nbsp;山\r\n	</p>','20201117/1605594275139.jpg',NULL,50.00,0.00,'SKILLS_TOW,',1,'驾校简介','DRIVER,GUIDEPOST,','20201117/1605594280227.mp4',1),(3,'2023-04-03 14:29:20','2023-04-03 14:29:20','肇庆','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;倒车入库是2013年后考取小型汽车驾照必须进行的一个项目。考察驾驶人在场地操作汽车的能力。倒车入库是驾驶员考试中的一个考核点。即在运动中操纵车辆从两侧正确倒入车库。倒车入库在考试时有时间限制。<br />','20201117/1605594501327.jpg',NULL,10000000000.00,0.00,'SKILLS_TOW,',1,'倒车入库','DRIVER,','20201117/1605594506747.mp4',1),(5,'2023-04-03 09:27:13','2023-04-03 18:26:33','肇庆','哇giao，直接起飞！安会计师的纳斯达克就那是可简单纳斯卡技能的看尽可能 ','',NULL,7777.00,0.00,'SKILLS_ONE,SKILLS_TOW,SKILLS_THREE,SKILLS_FOUR,SKILLS_FIVE,SKILLS_SIX,SKILLS_SEVENT,SKILLS_NINE,SKILLS_TEN,',2,'侧方停车','DRIVER,GUIDEPOST,LANECHANGE,','',2);
/*!40000 ALTER TABLE `ylrc_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_database_bak`
--

DROP TABLE IF EXISTS `ylrc_database_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(50) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_database_bak`
--

LOCK TABLES `ylrc_database_bak` WRITE;
/*!40000 ALTER TABLE `ylrc_database_bak` DISABLE KEYS */;
INSERT INTO `ylrc_database_bak` VALUES (41,'2023-04-06 02:13:52','2023-04-06 02:13:52','driving_school_courses_20230406021351.sql','C:/asoft/DrivingSchoolCourses/src/main/resources/backup/'),(42,'2023-04-22 18:55:14','2023-04-22 18:55:14','driving_school_courses_20230422185514.sql','C:/asoft/DrivingSchoolCourses/src/main/resources/backup/'),(43,'2023-04-23 01:00:00','2023-04-23 01:00:00','driving_school_courses_20230423010000.sql','C:/asoft/DrivingSchoolCourses/src/main/resources/backup/');
/*!40000 ALTER TABLE `ylrc_database_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_laber`
--

DROP TABLE IF EXISTS `ylrc_laber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_laber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_laber`
--

LOCK TABLES `ylrc_laber` WRITE;
/*!40000 ALTER TABLE `ylrc_laber` DISABLE KEYS */;
INSERT INTO `ylrc_laber` VALUES (1,'2023-04-03 11:39:38','2023-04-03 09:39:26','科二项目11'),(2,'2023-04-03 11:39:59','2023-04-03 11:39:59','倒车入库'),(5,'2023-04-03 11:51:52','2023-04-03 11:51:52','学员');
/*!40000 ALTER TABLE `ylrc_laber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_leave_word`
--

DROP TABLE IF EXISTS `ylrc_leave_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_leave_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKshshjc2xotgh1r391kilsv44q` (`account_id`),
  CONSTRAINT `FKshshjc2xotgh1r391kilsv44q` FOREIGN KEY (`account_id`) REFERENCES `ylrc_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_leave_word`
--

LOCK TABLES `ylrc_leave_word` WRITE;
/*!40000 ALTER TABLE `ylrc_leave_word` DISABLE KEYS */;
INSERT INTO `ylrc_leave_word` VALUES (3,'2023-04-03 15:38:16','2023-04-03 15:38:16','asdf',3);
/*!40000 ALTER TABLE `ylrc_leave_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_menu`
--

DROP TABLE IF EXISTS `ylrc_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`),
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_menu`
--

LOCK TABLES `ylrc_menu` WRITE;
/*!40000 ALTER TABLE `ylrc_menu` DISABLE KEYS */;
INSERT INTO `ylrc_menu` VALUES (2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,_binary '\0',_binary ''),(3,'2020-03-14 16:58:55','2020-11-10 15:13:28','菜单管理','/admin/menu/list','mdi-view-list',1,2,_binary '\0',_binary ''),(5,'2020-03-14 17:04:44','2020-11-10 15:13:36','新增','/admin/menu/add','mdi-plus',2,3,_binary '\0',_binary ''),(7,'2020-03-14 17:07:43','2020-03-15 12:11:25','角色管理','/admin/role/list','mdi-account-settings-variant',5,2,_binary '\0',_binary ''),(8,'2020-03-14 18:28:48','2020-11-10 15:13:44','编辑','edit(\'/admin/menu/edit\')','mdi-grease-pencil',3,3,_binary '',_binary ''),(9,'2020-03-14 18:30:00','2020-11-10 15:13:52','删除','del(\'/admin/menu/delete\')','mdi-close',4,3,_binary '',_binary ''),(10,'2020-03-15 12:12:00','2020-03-15 12:12:00','添加','/admin/role/add','mdi-account-plus',6,7,_binary '\0',_binary ''),(11,'2020-03-15 12:12:36','2020-03-21 22:10:45','编辑','edit(\'/admin/role/edit\')','mdi-account-edit',7,7,_binary '',_binary ''),(12,'2020-03-15 12:13:19','2020-03-21 22:15:27','删除','del(\'/admin/role/delete\')','mdi-account-remove',8,7,_binary '',_binary ''),(13,'2020-03-15 12:14:52','2020-03-15 12:17:00','用户管理','/admin/user/list','mdi-account-multiple',9,2,_binary '\0',_binary ''),(14,'2020-03-15 12:15:22','2020-03-15 12:17:27','添加','/admin/user/add','mdi-account-plus',10,13,_binary '\0',_binary ''),(15,'2020-03-16 17:18:14','2020-03-21 22:11:19','编辑','edit(\'/admin/user/edit\')','mdi-account-edit',11,13,_binary '',_binary ''),(16,'2020-03-16 17:19:01','2020-03-21 22:15:36','删除','del(\'/admin/user/delete\')','mdi-account-remove',12,13,_binary '',_binary ''),(19,'2020-03-22 11:24:36','2020-03-22 11:26:00','上传图片','/upload/upload_photo','mdi-arrow-up-bold-circle',0,13,_binary '\0',_binary '\0'),(20,'2020-03-22 14:09:35','2020-03-22 14:09:47','日志管理','/system/operator_log_list','mdi-tag-multiple',13,2,_binary '\0',_binary ''),(21,'2020-03-22 14:11:39','2020-03-22 14:11:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',14,20,_binary '',_binary ''),(22,'2020-03-22 14:12:57','2020-03-22 14:46:55','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',15,20,_binary '',_binary ''),(23,'2020-03-22 14:46:40','2020-03-22 14:47:09','数据备份','/database_bak/list','mdi-database',16,2,_binary '\0',_binary ''),(24,'2020-03-22 14:48:07','2020-03-22 15:13:41','备份','add(\'/database_bak/add\')','mdi-database-plus',17,23,_binary '',_binary ''),(25,'2020-03-22 14:49:03','2020-03-22 14:49:03','删除','del(\'/database_bak/delete\')','mdi-database-minus',18,23,_binary '',_binary ''),(26,'2020-03-22 19:36:20','2020-03-22 19:36:20','还原','restore(\'/database_bak/restore\')','mdi-database-minus',19,23,_binary '',_binary ''),(28,'2020-11-10 15:32:45','2020-11-10 15:32:45','驾校管理','','mdi-steering',20,NULL,_binary '\0',_binary ''),(29,'2020-11-10 15:33:08','2020-11-10 15:33:08','课程列表','/admin/course/list','mdi-book-open-variant',21,28,_binary '\0',_binary ''),(30,'2020-11-10 15:35:58','2020-11-12 14:51:55','新闻列表','/admin/news/list','mdi-arrow-up-bold-circle',0,80,_binary '\0',_binary ''),(31,'2020-11-10 15:36:22','2020-11-10 15:36:22','添加','/admin/news/add','mdi-battery-charging',0,30,_binary '\0',_binary ''),(32,'2020-11-10 15:36:54','2020-11-10 15:36:54','修改','edit(\'/admin/news/edit\')','mdi-bio',0,30,_binary '',_binary ''),(33,'2020-11-10 15:37:16','2020-11-10 15:37:16','删除','del(\'/admin/news/delete\')','mdi-chart-scatterplot-hexbin',0,30,_binary '',_binary ''),(34,'2020-11-10 15:41:30','2020-11-12 14:48:03','用户留言','/admin/leave_word/list','mdi-apple-finder',0,67,_binary '\0',_binary ''),(35,'2020-11-10 15:41:54','2020-11-10 16:59:24','删除','del(\'/admin/leave_word/delete\')','mdi-arrow-right-thick',0,34,_binary '',_binary ''),(43,'2020-11-10 15:49:40','2020-11-12 14:52:43','标签列表','/admin/label/list','mdi-backburger',0,80,_binary '\0',_binary ''),(44,'2020-11-10 15:49:56','2020-11-10 17:48:10','添加','/admin/label/add','mdi-calendar-blank',0,43,_binary '\0',_binary ''),(45,'2020-11-10 15:50:09','2020-11-10 17:48:24','修改','edit(\'/admin/label/edit\')','mdi-backspace',0,43,_binary '',_binary ''),(46,'2020-11-10 15:50:28','2020-11-10 15:50:28','删除','del(\'/admin/label/delete\')','mdi-bell-off',0,43,_binary '',_binary ''),(47,'2020-11-10 16:09:21','2020-11-10 17:07:22','教练类型管理','/admin/coach_type/list','mdi-human-child',0,28,_binary '\0',_binary ''),(49,'2020-11-10 16:11:27','2020-11-10 16:11:27','添加','/admin/coach_type/add','mdi-library-plus',0,47,_binary '\0',_binary ''),(50,'2020-11-10 16:12:03','2020-11-10 16:12:03','编辑','edit(\'/admin/coach_type/edit\')','mdi-pencil',0,47,_binary '',_binary ''),(51,'2020-11-10 17:28:07','2020-11-10 17:28:07','教练管理','/admin/coach/list','mdi-snapchat',0,28,_binary '\0',_binary ''),(52,'2020-11-10 17:32:44','2020-11-10 17:40:29','添加','/admin/coach/add','mdi-download',0,51,_binary '\0',_binary ''),(53,'2020-11-10 17:33:20','2020-11-10 17:33:38','添加','/admin/course/add','mdi-plus',22,29,_binary '\0',_binary ''),(55,'2020-11-10 17:34:19','2020-11-10 17:34:19','编辑','edit(\'/admin/coach/edit\')','mdi-upload',0,51,_binary '',_binary ''),(56,'2020-11-10 17:34:55','2020-11-10 17:34:55','编辑','edit(\'/admin/course/edit\')','mdi-minus',23,29,_binary '',_binary ''),(57,'2020-11-10 17:36:08','2020-11-10 17:36:08','删除','del(\'/admin/course/delete\')','mdi-close',24,29,_binary '',_binary ''),(58,'2020-11-10 17:44:51','2020-11-10 17:44:51','图片上传','/upload/upload_photo','mdi-star',0,51,_binary '\0',_binary '\0'),(59,'2020-11-11 10:45:48','2020-11-12 14:52:24','推荐列表','/admin/recommend/list','mdi-tag-heart',0,80,_binary '\0',_binary ''),(60,'2020-11-11 10:46:25','2020-11-11 10:46:25','添加','/admin/recommend/add','mdi-eject',0,59,_binary '\0',_binary ''),(61,'2020-11-11 10:46:55','2020-11-11 10:46:55','编辑','edit(\'/admin/recommend/edit\')','mdi-eyedropper-variant',0,59,_binary '',_binary ''),(62,'2020-11-11 10:47:35','2020-11-11 10:58:14','删除','del(\'/admin/recommend/delete\')','mdi-window-close',0,59,_binary '',_binary ''),(63,'2020-11-11 13:22:22','2020-11-12 14:53:06','关于列表','/admin/about_info/list','mdi-webhook',0,80,_binary '\0',_binary ''),(64,'2020-11-11 13:22:51','2020-11-11 13:23:06','添加','/admin/about_info/add','mdi-clipboard-plus',0,63,_binary '\0',_binary ''),(65,'2020-11-11 13:23:37','2020-11-11 13:23:37','编辑','edit(\'/admin/about_info/edit\')','mdi-grease-pencil',0,63,_binary '',_binary ''),(66,'2020-11-11 13:25:08','2020-11-11 13:25:08','删除','del(\'/admin/about_info/delete\')','mdi-window-close',0,63,_binary '',_binary ''),(67,'2020-11-11 14:43:12','2020-11-11 14:43:38','用户管理','','mdi-format-list-numbers',0,NULL,_binary '\0',_binary ''),(68,'2020-11-11 14:44:16','2020-11-11 14:44:16','用户列表','/admin/account/list','mdi-vlc',0,67,_binary '\0',_binary ''),(69,'2020-11-11 14:46:09','2020-11-11 14:46:09','编辑','edit(\'/admin/account/edit\')','mdi-border-color',0,68,_binary '',_binary ''),(70,'2020-11-11 14:47:13','2020-11-11 14:47:13','删除','del(\'/admin/account/delete\')','mdi-flash-off',0,68,_binary '',_binary ''),(71,'2020-11-11 16:49:50','2020-11-11 18:11:26','增加','/admin/leave_word/add','mdi-approval',0,34,_binary '',_binary '\0'),(72,'2020-11-12 11:15:50','2020-11-12 11:15:50','成就管理','/admin/achievement/list','mdi-keyboard-variant',0,28,_binary '\0',_binary ''),(73,'2020-11-12 13:32:59','2020-11-12 13:32:59','添加','/admin/achievement/add','mdi-emoticon',0,72,_binary '\0',_binary ''),(74,'2020-11-12 13:33:26','2020-11-12 13:33:26','编辑','edit(\'/admin/achievement/edit\')','mdi-border-color',0,72,_binary '',_binary ''),(75,'2020-11-12 13:33:56','2020-11-12 13:33:56','删除','del(\'/admin/achievement/delete\')','mdi-delete-empty',0,72,_binary '',_binary ''),(76,'2020-11-12 14:41:06','2020-11-12 14:44:08','课程表列表','/admin/clazz_schedule/list','mdi-application',58,28,_binary '\0',_binary ''),(77,'2020-11-12 14:42:00','2020-11-12 14:44:18','添加','/admin/clazz_schedule/add','mdi-plus',0,76,_binary '\0',_binary ''),(78,'2020-11-12 14:43:13','2020-11-12 17:23:59','编辑','edit(\'/admin/clazz_schedule/edit\')','mdi-minus',0,76,_binary '',_binary ''),(79,'2020-11-12 14:43:14','2020-11-12 17:24:10','删除','del(\'/admin/clazz_schedule/delete\')','mdi-close',0,76,_binary '',_binary ''),(80,'2020-11-12 14:51:14','2020-11-12 14:51:14','新闻管理','','mdi-arrow-up-bold-circle-outline',0,NULL,_binary '\0',_binary ''),(81,'2020-11-16 10:19:23','2020-11-16 10:19:23','图片库','','mdi-creation',0,NULL,_binary '\0',_binary ''),(82,'2020-11-16 10:25:30','2020-11-16 10:25:30','图片管理','/admin/picture/list','mdi-format-indent-decrease',0,81,_binary '\0',_binary ''),(84,'2020-11-16 10:34:49','2020-11-16 10:34:49','添加','/admin/picture/add','mdi-magnify-plus-outline',0,82,_binary '\0',_binary ''),(86,'2020-11-16 11:41:37','2020-11-16 11:41:47','文件上传','/upload/home_upload_photo','mdi-xda',0,82,_binary '\0',_binary '\0'),(87,'2020-11-16 18:47:02','2020-11-16 18:47:02','用户评论','/admin/comments/list','mdi-arrow-collapse-right',0,67,_binary '\0',_binary ''),(88,'2020-11-16 18:47:26','2020-11-16 18:47:26','删除','del(\'/admin/comments/delete\')','mdi-airplane-takeoff',0,87,_binary '',_binary ''),(89,'2020-11-20 15:13:31','2020-11-20 15:13:31','删除','del(\'/admin/coach_type/delete\')','mdi-wrench',0,47,_binary '',_binary ''),(90,'2020-11-20 15:14:30','2020-11-20 15:14:30','删除','del(\'/admin/coach/delete\')','mdi-wrench',0,51,_binary '',_binary ''),(91,'2020-11-20 15:17:36','2020-11-20 15:22:10','删除','del(\'/admin/picture/delete\')','mdi-wrench',0,82,_binary '',_binary '');
/*!40000 ALTER TABLE `ylrc_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_news`
--

DROP TABLE IF EXISTS `ylrc_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(6552) NOT NULL,
  `hits` bigint(20) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `title` varchar(30) NOT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk5au2a7522u8ff5o4s4dhun09` (`label_id`),
  KEY `FKrcdii04n6c1vuhgtakpqynhg6` (`user_id`),
  CONSTRAINT `FKk5au2a7522u8ff5o4s4dhun09` FOREIGN KEY (`label_id`) REFERENCES `ylrc_laber` (`id`),
  CONSTRAINT `FKrcdii04n6c1vuhgtakpqynhg6` FOREIGN KEY (`user_id`) REFERENCES `ylrc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_news`
--

LOCK TABLES `ylrc_news` WRITE;
/*!40000 ALTER TABLE `ylrc_news` DISABLE KEYS */;
INSERT INTO `ylrc_news` VALUES (2,'2023-04-03 11:43:22','2023-04-22 20:06:51','zqs',25,'20201117/1605591184102.jpg','驾校培训',2,1),(13,'2023-04-03 09:38:55','2023-04-03 11:20:42','打撒啊<span>打撒啊</span><span>打撒啊</span><span>打撒啊</span>打撒啊<span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span>打撒啊<span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span><span>打撒啊</span>打撒啊<span>打撒啊</span><span>打撒啊</span><span>打撒啊</span>',6,'','少时诵诗书',5,1);
/*!40000 ALTER TABLE `ylrc_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_operater_log`
--

DROP TABLE IF EXISTS `ylrc_operater_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_operater_log`
--

LOCK TABLES `ylrc_operater_log` WRITE;
/*!40000 ALTER TABLE `ylrc_operater_log` DISABLE KEYS */;
INSERT INTO `ylrc_operater_log` VALUES (986,'2023-04-07 13:49:22','2023-04-07 13:49:22','用户【吴先生】于【2023-04-07 13:49:22】登录系统！','吴先生'),(987,'2023-04-16 15:25:15','2023-04-16 15:25:15','用户【吴先生】于【2023-04-16 15:25:15】登录系统！','吴先生'),(988,'2023-04-16 15:37:29','2023-04-16 15:37:29','用户【吴先生】于【2023-04-16 15:37:29】登录系统！','吴先生'),(990,'2023-04-16 16:19:23','2023-04-16 16:19:23','用户【吴先生】于【2023-04-16 16:19:22】登录系统！','吴先生'),(991,'2023-04-22 18:53:07','2023-04-22 18:53:07','用户【吴先生】于【2023-04-22 18:53:07】登录系统！','吴先生'),(992,'2023-04-22 18:55:14','2023-04-22 18:55:14','数据库成功备份，备份文件信息：DatabaseBak [filename=driving_school_courses_20230422185514.sql, filepath=C:/asoft/DrivingSchoolCourses/src/main/resources/backup/]','吴先生'),(993,'2023-04-22 19:46:01','2023-04-22 19:46:01','用户【吴先生】于【2023-04-22 19:46:01】登录系统！','吴先生'),(994,'2023-04-22 19:47:22','2023-04-22 19:47:22','删除课程，课程ID：7','吴先生'),(995,'2023-04-22 19:48:42','2023-04-22 19:48:42','编辑课程，课程标题：科目二倒车入库','吴先生'),(996,'2023-04-22 19:50:16','2023-04-22 19:50:16','用户【吴先生】于【2023-04-22 19:50:16】登录系统！','吴先生'),(997,'2023-04-22 19:51:10','2023-04-22 19:51:10','编辑课程表，课程标题：null','吴先生'),(998,'2023-04-22 19:52:13','2023-04-22 19:52:13','用户【吴先生】于【2023-04-22 19:52:13】登录系统！','吴先生'),(999,'2023-04-22 19:52:40','2023-04-22 19:52:40','编辑课程表，课程标题：null','吴先生'),(1000,'2023-04-22 19:53:35','2023-04-22 19:53:35','用户【吴先生】于【2023-04-22 19:53:35】登录系统！','吴先生'),(1001,'2023-04-22 19:53:52','2023-04-22 19:53:52','编辑课程表，课程标题：null','吴先生'),(1002,'2023-04-22 19:54:51','2023-04-22 19:54:51','编辑课程表，课程标题：null','吴先生'),(1003,'2023-04-22 19:55:08','2023-04-22 19:55:08','编辑课程表，课程标题：null','吴先生'),(1004,'2023-04-22 19:55:53','2023-04-22 19:55:53','编辑课程表，课程标题：null','吴先生'),(1005,'2023-04-22 20:04:39','2023-04-22 20:04:39','用户【吴先生】于【2023-04-22 20:04:39】登录系统！','吴先生'),(1006,'2023-04-23 01:00:00','2023-04-23 01:00:00','数据库成功备份，备份文件信息：DatabaseBak [filename=driving_school_courses_20230423010000.sql, filepath=C:/asoft/DrivingSchoolCourses/src/main/resources/backup/]','未知(获取登录用户失败)');
/*!40000 ALTER TABLE `ylrc_operater_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_order_auth`
--

DROP TABLE IF EXISTS `ylrc_order_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_order_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `order_sn` varchar(18) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_order_auth`
--

LOCK TABLES `ylrc_order_auth` WRITE;
/*!40000 ALTER TABLE `ylrc_order_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `ylrc_order_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_picture`
--

DROP TABLE IF EXISTS `ylrc_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `head_pic` varchar(6552) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpu10nict9nmhr0bimmyan5w3o` (`label_id`),
  CONSTRAINT `FKpu10nict9nmhr0bimmyan5w3o` FOREIGN KEY (`label_id`) REFERENCES `ylrc_laber` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_picture`
--

LOCK TABLES `ylrc_picture` WRITE;
/*!40000 ALTER TABLE `ylrc_picture` DISABLE KEYS */;
INSERT INTO `ylrc_picture` VALUES (4,'2023-04-03 14:37:51','2023-04-03 14:37:51','[\"20201117/1605595067362-27095867-5fd0-4dfd-9dd5-66d048ed9fa1.jpeg\",\"20201117/1605595067372-b7c4d6a7-7aa7-4d2f-9a0e-dc194b81e297.jpeg\",\"20201117/1605595067377-fd50cdbf-9ba8-48b6-bb1d-46320b078430.jpeg\",\"20201117/1605595067382-466255e7-b7ba-40b5-83b2-1135277c2903.jpeg\"]',5),(5,'2023-04-03 14:38:39','2023-04-03 14:38:39','[\"20201117/1605595116766-8273b6ee-44c8-4faa-92dd-3d3e467284b7.jpeg\",\"20201117/1605595116770-81d22bc9-1c37-48dd-9960-b51b2ab32234.jpg\",\"20201117/1605595116767-e997268d-6042-4adf-ba2b-9789eb3f4d7d.jpeg\"]',2);
/*!40000 ALTER TABLE `ylrc_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_rate`
--

DROP TABLE IF EXISTS `ylrc_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlo2mjn27awglg9oirwrjox41j` (`course_id`),
  CONSTRAINT `FKlo2mjn27awglg9oirwrjox41j` FOREIGN KEY (`course_id`) REFERENCES `ylrc_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_rate`
--

LOCK TABLES `ylrc_rate` WRITE;
/*!40000 ALTER TABLE `ylrc_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ylrc_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_recommend`
--

DROP TABLE IF EXISTS `ylrc_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqeu2s50jtjy87s1s3q3lpnx23` (`user_id`),
  CONSTRAINT `FKqeu2s50jtjy87s1s3q3lpnx23` FOREIGN KEY (`user_id`) REFERENCES `ylrc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_recommend`
--

LOCK TABLES `ylrc_recommend` WRITE;
/*!40000 ALTER TABLE `ylrc_recommend` DISABLE KEYS */;
INSERT INTO `ylrc_recommend` VALUES (2,'2023-04-03 11:49:24','2023-04-03 09:40:21','我们驾校最好的成绩，10天一位新学员从入门到拿证111',1),(3,'2023-04-03 11:50:06','2023-04-03 11:51:02','后悔过去,不如奋斗将来！',1),(4,'2023-04-03 11:50:41','2023-04-03 11:50:41','我校的Change讲师荣获8个国家级奖项',1);
/*!40000 ALTER TABLE `ylrc_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_reply`
--

DROP TABLE IF EXISTS `ylrc_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `account_id` tinyblob NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_reply`
--

LOCK TABLES `ylrc_reply` WRITE;
/*!40000 ALTER TABLE `ylrc_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ylrc_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role`
--

DROP TABLE IF EXISTS `ylrc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role`
--

LOCK TABLES `ylrc_role` WRITE;
/*!40000 ALTER TABLE `ylrc_role` DISABLE KEYS */;
INSERT INTO `ylrc_role` VALUES (1,'2023-04-03 13:16:38','2023-04-03 15:24:41','超级管理员','超级管理员拥有最高权限。',1),(2,'2023-04-03 13:18:57','2023-04-03 09:47:31','普通管理员','普通管理员只有部分权限',1),(4,'2023-04-03 20:11:00','2023-04-03 09:54:01','测试角色1111','sadsasss',1);
/*!40000 ALTER TABLE `ylrc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role_authorities`
--

DROP TABLE IF EXISTS `ylrc_role_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role_authorities`
--

LOCK TABLES `ylrc_role_authorities` WRITE;
/*!40000 ALTER TABLE `ylrc_role_authorities` DISABLE KEYS */;
INSERT INTO `ylrc_role_authorities` VALUES (2,2),(2,3),(2,5),(2,7),(2,11),(2,13),(2,16),(4,2),(4,13),(4,15),(1,2),(1,3),(1,5),(1,8),(1,9),(1,7),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,28),(1,29),(1,53),(1,56),(1,57),(1,47),(1,49),(1,50),(1,89),(1,51),(1,52),(1,55),(1,58),(1,90),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,67),(1,34),(1,35),(1,71),(1,68),(1,69),(1,70),(1,87),(1,88),(1,80),(1,30),(1,31),(1,32),(1,33),(1,43),(1,44),(1,45),(1,46),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,81),(1,82),(1,84),(1,86),(1,91);
/*!40000 ALTER TABLE `ylrc_role_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_user`
--

DROP TABLE IF EXISTS `ylrc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`),
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`),
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_user`
--

LOCK TABLES `ylrc_user` WRITE;
/*!40000 ALTER TABLE `ylrc_user` DISABLE KEYS */;
INSERT INTO `ylrc_user` VALUES (1,'2023-04-03 19:18:53','2023-04-03 12:43:54','ylrc@qq.com','20200322/1584850135123.jpg','13356565656','123456',1,1,'吴先生',1),(5,'2023-04-03 20:42:19','2023-04-03 10:35:38','yw12121','20200323/1584956702094.png','13356565656','123456',1,1,'小刘同志',4);
/*!40000 ALTER TABLE `ylrc_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23  1:00:00
