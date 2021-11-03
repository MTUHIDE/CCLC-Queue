-- MySQL dump 10.16  Distrib 10.3.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: webta
-- ------------------------------------------------------
-- Server version	10.3.10-MariaDB

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
-- Table structure for table `queue_answer`
--

DROP TABLE IF EXISTS `queue_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  `last_updated` datetime NOT NULL,
  `deleted_by_id` bigint(20) DEFAULT NULL,
  `answer_text` longtext NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `email_sent` bit(1) NOT NULL,
  `ipaddress` varchar(256) NOT NULL,
  `hostname` varchar(256) NOT NULL,
  `is_accepted` bit(1) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj5jaa345br1e6xo35s3i2ea4w` (`deleted_by_id`),
  KEY `FK691v8k96v7f6xxda71xqv0f3t` (`person_id`),
  KEY `FKt47q9ssg76t7d8liwwbst0e58` (`question_id`),
  CONSTRAINT `FK691v8k96v7f6xxda71xqv0f3t` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FKj5jaa345br1e6xo35s3i2ea4w` FOREIGN KEY (`deleted_by_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FKt47q9ssg76t7d8liwwbst0e58` FOREIGN KEY (`question_id`) REFERENCES `queue_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_answer`
--

LOCK TABLES `queue_answer` WRITE;
/*!40000 ALTER TABLE `queue_answer` DISABLE KEYS */;
INSERT INTO `queue_answer` VALUES (1,0,'2019-06-02 23:10:12','\0','2019-06-02 23:10:12',NULL,'The Entry.java file provided to you should begin with the following package statement:\r\npackage net.datastructures;\r\n\r\nAt the top of your code, you should then import the Entry class:\r\nimport net.datastructures.Entry;',1,'','141.219.92.148','ureels-macbook-pro.sabu.mtu.edu','\0',1);
/*!40000 ALTER TABLE `queue_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_question`
--

DROP TABLE IF EXISTS `queue_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `course_name` varchar(256) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  `assignment_name` varchar(256) NOT NULL,
  `last_updated` datetime NOT NULL,
  `deleted_by_id` bigint(20) DEFAULT NULL,
  `language` varchar(256) NOT NULL,
  `message` longtext NOT NULL,
  `is_answered` bit(1) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `ipaddress` varchar(256) NOT NULL,
  `hostname` varchar(256) NOT NULL,
  `course` varchar(256) NOT NULL,
  `is_hand_raised` bit(1) NOT NULL,
  `assignment` varchar(256) NOT NULL,
  `subject` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3t6na5ismvo4j6wu99it7ncrs` (`deleted_by_id`),
  KEY `FKl9qf23bu6vi17tiq5wm0a1s6j` (`person_id`),
  CONSTRAINT `FK3t6na5ismvo4j6wu99it7ncrs` FOREIGN KEY (`deleted_by_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FKl9qf23bu6vi17tiq5wm0a1s6j` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_question`
--

LOCK TABLES `queue_question` WRITE;
/*!40000 ALTER TABLE `queue_question` DISABLE KEYS */;
INSERT INTO `queue_question` VALUES (1,1,'CS2321 R01 Summer 2019','2019-06-02 23:07:03','\0','Week 3 Program : Hash Table','2019-06-02 23:10:08',NULL,'Java','I am getting a weird error from CanvasTA:\r\n\r\nERROR: compiler.err.cant.resolve.location\r\nStatus: Failed (-)	\r\nLine: 6, Column: 23\r\ncannot find symbol\r\n  symbol:   class Entry\r\n  location: class HashTable<K,V>','',2,'141.219.92.148','ureels-macbook-pro.sabu.mtu.edu','1262122','\0','7543844','Cannot find symbol: Entry'),(2,1,'CS2321 R01 Summer 2019','2019-06-03 15:33:34','','Week 3 Program : Hash Table','2019-06-04 00:03:01',1,'Java','I keep getting a generic raw types exception.','\0',2,'141.219.204.77','rover-204-77.rovernet.mtu.edu','1262122','\0','7543844','How do I create a generic array of ArrayList?'),(3,1,'CS2321 R01 Summer 2019','2019-06-16 19:21:39','','Week 5 Program Binary Search Tree','2019-06-16 19:22:04',312,'Java','The code that I have developed can modify a node but does not show that the change was carried over into the array generated by the provided tests. Essentially, how do you remove the node itself and not the reference to the node and then un-link the node that takes its place?','\0',312,'199.247.45.103','199.247.45.103','1262122','','7524412','Deletion of nodes'),(4,1,'CS2321 R01 Summer 2019','2019-06-16 19:21:49','','Week 5 Program Binary Search Tree','2019-06-17 21:21:05',312,'Java','The code that I have developed can modify a node but does not show that the change was carried over into the array generated by the provided tests. Essentially, how do you remove the node itself and not the reference to the node and then un-link the node that takes its place?','\0',312,'199.247.45.103','199.247.45.103','1262122','','7524412','Deletion of nodes');
/*!40000 ALTER TABLE `queue_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_question_file`
--

DROP TABLE IF EXISTS `queue_question_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_question_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `file_data` longblob DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(256) NOT NULL,
  `file_mime_type` varchar(256) NOT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKljls0xafv4ldart4bn7x8qjia` (`answer_id`),
  KEY `FKx6laffr4htpbm7qi3bww73kl` (`question_id`),
  CONSTRAINT `FKljls0xafv4ldart4bn7x8qjia` FOREIGN KEY (`answer_id`) REFERENCES `queue_answer` (`id`),
  CONSTRAINT `FKx6laffr4htpbm7qi3bww73kl` FOREIGN KEY (`question_id`) REFERENCES `queue_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_question_file`
--

LOCK TABLES `queue_question_file` WRITE;
/*!40000 ALTER TABLE `queue_question_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_question_file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-16 17:43:31
