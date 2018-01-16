-- MySQL dump 10.13  Distrib 5.7.19, for osx10.12 (x86_64)
--
-- Host: localhost    Database: instagramDB
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Current Database: `instagramDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `instagramDB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `instagramDB`;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_comment__photo` (`photo`),
  KEY `idx_comment__user` (`user`),
  CONSTRAINT `fk_comment__photo` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  CONSTRAINT `fk_comment__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,3,'2010-10-10 12:12:12','that\'s super cool'),(2,1,2,'2017-12-12 14:12:59','wicked!'),(3,1,1,'2009-08-01 08:56:58','special photo!'),(4,3,0,'2014-09-16 09:59:59','dope:)'),(5,1,3,'2010-10-10 10:10:10','hello!');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_mentioned`
--

DROP TABLE IF EXISTS `comment_mentioned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_mentioned` (
  `user` int(11) NOT NULL,
  `comment` int(11) NOT NULL,
  PRIMARY KEY (`user`,`comment`),
  KEY `idx_comment_mentioned` (`comment`),
  CONSTRAINT `fk_comment_mentioned__comment` FOREIGN KEY (`comment`) REFERENCES `comment` (`id`),
  CONSTRAINT `fk_comment_mentioned__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_mentioned`
--

LOCK TABLES `comment_mentioned` WRITE;
/*!40000 ALTER TABLE `comment_mentioned` DISABLE KEYS */;
INSERT INTO `comment_mentioned` VALUES (2,1),(0,2),(3,2),(1,3);
/*!40000 ALTER TABLE `comment_mentioned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `follower` int(11) NOT NULL,
  `followee` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`follower`,`followee`),
  KEY `idx_following__followee` (`followee`),
  CONSTRAINT `fk_following__followee` FOREIGN KEY (`followee`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_following__follower` FOREIGN KEY (`follower`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
INSERT INTO `following` VALUES (0,2,'2017-02-02 16:16:54'),(0,3,'2010-03-11 05:34:25'),(1,0,'2016-05-05 20:15:50'),(1,3,'2016-03-22 04:34:56'),(2,0,'2015-08-14 17:18:19'),(3,0,'2010-07-09 02:02:02');
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `user` int(11) NOT NULL,
  `photo` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`user`,`photo`),
  KEY `idx_like__photo` (`photo`),
  CONSTRAINT `fk_like__photo` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  CONSTRAINT `fk_like__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (0,1,'2010-09-09 10:10:10'),(0,3,'2017-12-20 13:13:59'),(1,2,'2011-11-11 12:12:12'),(2,3,'2009-08-07 08:07:09');
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` longblob NOT NULL,
  `dt` datetime NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photo__user` (`user`),
  CONSTRAINT `fk_photo__user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'121212','2010-10-12 03:23:23',2),(2,'090909','2017-05-26 05:59:59',3),(3,'232345','2016-09-28 11:00:00',3),(4,'453216','2013-02-02 15:15:15',0),(5,'789654','2017-10-05 08:59:58',2),(6,'101212','2009-10-10 23:45:59',1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_tags`
--

DROP TABLE IF EXISTS `photo_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_tags` (
  `photo` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`photo`,`tag`),
  KEY `idx_photo_tags` (`tag`),
  CONSTRAINT `fk_photo_tags__photo` FOREIGN KEY (`photo`) REFERENCES `photo` (`id`),
  CONSTRAINT `fk_photo_tags__tag` FOREIGN KEY (`tag`) REFERENCES `tag` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_tags`
--

LOCK TABLES `photo_tags` WRITE;
/*!40000 ALTER TABLE `photo_tags` DISABLE KEYS */;
INSERT INTO `photo_tags` VALUES (4,'dog'),(2,'family'),(5,'family'),(1,'fruit'),(3,'heat');
/*!40000 ALTER TABLE `photo_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES ('apple'),('dog'),('family'),('fire'),('fruit'),('heat'),('home');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'mikeevans','god','rightmanmike2@hotmail.com','2016-05-05 12:59:59'),(1,'ashleymoore','password','fielder1711@live.com','2017-06-19 17:34:56'),(2,'meganstewart','abc123','stewartwuz@gmail.com','2010-09-04 04:04:04'),(3,'miltonhertz','default','miltoncurry23@gmail.com','2008-01-01 01:01:59');
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

-- Dump completed on 2017-12-09 23:16:36
