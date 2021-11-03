-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: webta
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `ltiid` varchar(256) DEFAULT NULL,
  `userid` varchar(256) NOT NULL,
  `canvasid` varchar(256) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `last_updated` datetime NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `image_path` longtext,
  `full_name` varchar(256) NOT NULL,
  `e_mail` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,0,'d45c7015b5c302997fad008b3ba3eb068a089185','ureel','515445','2018-11-17 13:04:38','Leo','2018-11-17 13:04:38','Ureel','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','Leo Ureel','ureel@mtu.edu'),(2,0,'38cf2630bf11294ac2ee589e9b4c08c8fc5f169c','ureel-test','3930998','2018-11-17 13:46:27','Ureel','2018-11-17 13:46:27','Test','https://canvas.instructure.com/images/messages/avatar-50.png','Ureel Test','ureel-test@mtu.edu'),(3,0,'8db878c4d634c121fe0ba27c4201e7e3553b53e3','ureel-coach','3978804','2019-06-02 23:14:06','ureel','2019-06-02 23:14:06','coach','https://canvas.instructure.com/images/messages/avatar-50.png','ureel coach','ureel-coach@mtu.edu');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_client`
--

DROP TABLE IF EXISTS `lti_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `app_environment` varchar(256) DEFAULT NULL,
  `client_domain` varchar(256) DEFAULT NULL,
  `kind` varchar(256) NOT NULL,
  `client_secret` varchar(256) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `client_id` varchar(256) NOT NULL,
  `lms_domain` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_client`
--


--
-- Table structure for table `lti_session`
--

DROP TABLE IF EXISTS `lti_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `context_id` varchar(256) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `lti_token_required` bit(1) DEFAULT NULL,
  `course_id` varchar(256) DEFAULT NULL,
  `resource_link_title` varchar(256) DEFAULT NULL,
  `custom_canvas_enrollment_state` longtext,
  `roles` varchar(256) DEFAULT NULL,
  `resource_link_id` varchar(256) DEFAULT NULL,
  `lis_person_name_family` varchar(256) DEFAULT NULL,
  `user_image` longtext,
  `assignment_id` varchar(256) DEFAULT NULL,
  `custom_canvas_workflow_state` longtext,
  `person_id` bigint(20) NOT NULL,
  `custom_canvas_user_login_id` varchar(256) DEFAULT NULL,
  `lis_person_name_full` varchar(256) DEFAULT NULL,
  `ext_outcome_data_values_accepted` longtext,
  `custom_mtu_client_id` varchar(256) DEFAULT NULL,
  `ext_outcomes_tool_placement_url` longtext,
  `lti_version` varchar(256) DEFAULT NULL,
  `application_name` varchar(256) DEFAULT NULL,
  `custom_mtu_page_name` varchar(256) DEFAULT NULL,
  `launch_presentation_document_target` longtext,
  `ext_outcome_result_total_score_accepted` varchar(256) DEFAULT NULL,
  `expiration_date` datetime NOT NULL,
  `ext_ims_lis_basic_outcome_url` longtext,
  `custom_canvas_assignment_points_possible` varchar(256) DEFAULT NULL,
  `custom_canvas_api_domain` varchar(256) DEFAULT NULL,
  `lis_person_name_given` varchar(256) DEFAULT NULL,
  `tool_consumer_instance_guid` longtext,
  `launch_presentation_locale` longtext,
  `custom_mtu_controller_name` varchar(256) DEFAULT NULL,
  `controller_name` varchar(256) DEFAULT NULL,
  `launch_presentation_height` varchar(256) DEFAULT NULL,
  `lis_person_sourcedid` varchar(256) DEFAULT NULL,
  `lis_result_sourcedid` varchar(256) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `custom_canvas_course_id` varchar(256) DEFAULT NULL,
  `tool_consumer_info_version` varchar(256) DEFAULT NULL,
  `custom_mtu_application_name` varchar(256) DEFAULT NULL,
  `action_name` varchar(256) DEFAULT NULL,
  `tool_consumer_instance_name` varchar(256) DEFAULT NULL,
  `custom_canvas_assignment_id` varchar(256) DEFAULT NULL,
  `launch_presentation_return_url` longtext,
  `custom_canvas_assignment_title` varchar(256) DEFAULT NULL,
  `user_id` varchar(256) DEFAULT NULL,
  `lti_refreshable_token` varchar(256) DEFAULT NULL,
  `lti_message_type` varchar(256) DEFAULT NULL,
  `ext_outcome_submission_submitted_at_accepted` varchar(256) DEFAULT NULL,
  `custom_mtu_lti_token_required` bit(1) DEFAULT NULL,
  `lis_outcome_service_url` longtext,
  `context_label` varchar(256) DEFAULT NULL,
  `ext_roles` varchar(256) DEFAULT NULL,
  `lti_access_token` varchar(256) DEFAULT NULL,
  `custom_canvas_user_id` varchar(256) DEFAULT NULL,
  `ext_lti_assignment_id` varchar(256) DEFAULT NULL,
  `tool_consumer_instance_contact_email` varchar(256) DEFAULT NULL,
  `launch_presentation_width` varchar(256) DEFAULT NULL,
  `context_title` varchar(256) DEFAULT NULL,
  `lti_token_request_state` varchar(256) DEFAULT NULL,
  `custom_mtu_canvas_role` varchar(256) DEFAULT NULL,
  `lis_person_contact_email_primary` varchar(256) DEFAULT NULL,
  `lti_token` varchar(256) DEFAULT NULL,
  `tool_consumer_info_product_family_code` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8b77pp1vp024kfrr9okigiu9v` (`person_id`),
  CONSTRAINT `FK8b77pp1vp024kfrr9okigiu9v` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_session`
--

LOCK TABLES `lti_session` WRITE;
/*!40000 ALTER TABLE `lti_session` DISABLE KEYS */;
INSERT INTO `lti_session` VALUES (186,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Learner','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Student','https://secure.gravatar.com/avatar/000?s=50&d=https%3A%2F%2Fcanvas.instructure.com%2Fimages%2Fmessages%2Favatar-50.png','4307157',NULL,2,'1e1b3b5dc267821c72061b5a84828ff729ed8d8f','Test Student','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Test','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,NULL,'25607-1001159-4307157-3687254-a10173e4ae263cf2db54c5bc1fa850937f73d44d','2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/modules','Week 1 Lab','21dbcfe942847ad06877d41daaa4f828672a941f',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:role:ims/lis/Learner,urn:lti:sysrole:ims/lis/User',NULL,'3687254',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'',NULL,'canvas'),(187,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Learner','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Student','https://secure.gravatar.com/avatar/000?s=50&d=https%3A%2F%2Fcanvas.instructure.com%2Fimages%2Fmessages%2Favatar-50.png','4307157',NULL,2,'1e1b3b5dc267821c72061b5a84828ff729ed8d8f','Test Student','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Test','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,NULL,'25607-1001159-4307157-3687254-a10173e4ae263cf2db54c5bc1fa850937f73d44d','2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/assignments','Week 1 Lab','21dbcfe942847ad06877d41daaa4f828672a941f',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:role:ims/lis/Learner,urn:lti:sysrole:ims/lis/User',NULL,'3687254',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'',NULL,'canvas'),(188,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Learner','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Student','https://secure.gravatar.com/avatar/000?s=50&d=https%3A%2F%2Fcanvas.instructure.com%2Fimages%2Fmessages%2Favatar-50.png','4307157',NULL,2,'1e1b3b5dc267821c72061b5a84828ff729ed8d8f','Test Student','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Test','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,NULL,'25607-1001159-4307157-3687254-a10173e4ae263cf2db54c5bc1fa850937f73d44d','2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/assignments','Week 1 Lab','21dbcfe942847ad06877d41daaa4f828672a941f',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:role:ims/lis/Learner,urn:lti:sysrole:ims/lis/User',NULL,'3687254',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'',NULL,'canvas'),(189,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Learner','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Student','https://secure.gravatar.com/avatar/000?s=50&d=https%3A%2F%2Fcanvas.instructure.com%2Fimages%2Fmessages%2Favatar-50.png','4307157',NULL,2,'1e1b3b5dc267821c72061b5a84828ff729ed8d8f','Test Student','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Test','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,NULL,'25607-1001159-4307157-3687254-a10173e4ae263cf2db54c5bc1fa850937f73d44d','2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/assignments','Week 1 Lab','21dbcfe942847ad06877d41daaa4f828672a941f',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:role:ims/lis/Learner,urn:lti:sysrole:ims/lis/User',NULL,'3687254',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'',NULL,'canvas'),(266,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Instructor','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307157',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/assignments','Week 1 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(267,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Instructor','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307157',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/modules','Week 1 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(268,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Instructor','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307157',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/assignments','Week 1 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(269,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 1 Lab','active','Instructor','2952e2c386c79c8b3f8a28d0c079eea9a15c9a72','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307157',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:15','1001159','cloud',NULL,NULL,'Michigan Technological University','4307157','https://mtu.instructure.com/courses/1001159/assignments','Week 1 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(498,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(499,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(500,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(501,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(502,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(503,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(504,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(505,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(506,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(507,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(508,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas'),(509,0,'067a1b5d443f774b29b402879fe5beb00578b4d7','1969-12-31 19:00:00','\0','1001159','Week 2 Lab','active','Instructor','61157bfca337ff4556449be16bc27f6f14e39f55','Ureel II','https://mtu.instructure.com/images/thumbnails/41722521/C5GOGr7OazIJD2YDnJn6F1JKhECWAM02gB6CSmA7','4307158',NULL,1,'ureel','Leo Ureel II','url,text',NULL,NULL,'LTI-1p0',NULL,NULL,'iframe',NULL,'1969-12-31 19:30:00','https://mtu.instructure.com/api/lti/v1/tools/25607/ext_grade_passback','5','mtu.instructure.com','Leo','e2ed8d3f54b19f3aa6aac0f791564b18192d4f2a.canvas.instructure.com','en',NULL,NULL,NULL,'ureel',NULL,'2019-08-16 21:45:39','1001159','cloud',NULL,NULL,'Michigan Technological University','4307158','https://mtu.instructure.com/courses/1001159/assignments','Week 2 Lab','d45c7015b5c302997fad008b3ba3eb068a089185',NULL,'basic-lti-launch-request',NULL,'\0','https://mtu.instructure.com/api/lti/v1/tools/25607/grade_passback','CS1121 Spring 2015 - Combined Section','urn:lti:instrole:ims/lis/Instructor,urn:lti:instrole:ims/lis/Student,urn:lti:role:ims/lis/Instructor,urn:lti:sysrole:ims/lis/User',NULL,'515445',NULL,'notifications@instructure.com',NULL,'CS1121 Spring 2015 - Combined Section',NULL,NULL,'ureel@mtu.edu',NULL,'canvas');
/*!40000 ALTER TABLE `lti_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lti_session_params`
--

DROP TABLE IF EXISTS `lti_session_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_session_params` (
  `lti_session_id` bigint(20) NOT NULL,
  `params_object` varchar(256) DEFAULT NULL,
  `params_idx` varchar(256) DEFAULT NULL,
  `params_elt` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_session_params`
--


--
-- Table structure for table `lti_token`
--

DROP TABLE IF EXISTS `lti_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lti_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `lti_token_required` bit(1) NOT NULL,
  `lti_access_token` varchar(256) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `lti_token_request_state` varchar(256) DEFAULT NULL,
  `lti_version` varchar(256) DEFAULT NULL,
  `lti_token` varchar(256) DEFAULT NULL,
  `lti_refreshable_token` varchar(256) DEFAULT NULL,
  `application_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkir12iw33x1d10iw0yfr3bgu` (`person_id`),
  CONSTRAINT `FKkir12iw33x1d10iw0yfr3bgu` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lti_token`
--

LOCK TABLES `lti_token` WRITE;
/*!40000 ALTER TABLE `lti_token` DISABLE KEYS */;
INSERT INTO `lti_token` VALUES (1,1,2,'2018-12-29 18:22:17','','8~IQUV8N5rxyM058UDztZaU3QlK18NZikT6Zx5TJAKkVnr2wp0wcnBPRUitaFewoiZ','2018-12-29 18:22:21','6114','LTI-1p0','8~QIgkqJ9kDhzZAKwTXNVV9Ce9cAu9G3eROGQ9MV9und8vnlDpFPLzHiBDNTGMk3YS',NULL,'WebTA'),(310,1,2,'2019-06-02 22:44:39','','8~ZkOVn3Txm1VPzURJfQekHs4KfgXcRp2yAUdU6OXxBfNXTiojsdr4HSpubgBYtePz','2019-06-02 22:44:42','6216','LTI-1p0','8~zQBzEPgMvrRVdh57d67y7xjKLXX3UGRO0ZY63qJo4wKiOaa2k2inJniBkcSWs4oR',NULL,'Queue');
/*!40000 ALTER TABLE `lti_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_file`
--

DROP TABLE IF EXISTS `queue_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `file_data` longblob,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(256) NOT NULL,
  `file_mime_type` varchar(256) NOT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlcy3r11jx9ktjjuqofl2u67qe` (`answer_id`),
  KEY `FKko7jrat9ctbww2ojx3k7bsdat` (`question_id`),
  CONSTRAINT `FKko7jrat9ctbww2ojx3k7bsdat` FOREIGN KEY (`question_id`) REFERENCES `queue_question` (`id`),
  CONSTRAINT `FKlcy3r11jx9ktjjuqofl2u67qe` FOREIGN KEY (`answer_id`) REFERENCES `queue_answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_file`
--

LOCK TABLES `queue_file` WRITE;
/*!40000 ALTER TABLE `queue_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_file` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=dynamic;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_question`
--

LOCK TABLES `queue_question` WRITE;
/*!40000 ALTER TABLE `queue_question` DISABLE KEYS */;
INSERT INTO `queue_question` VALUES (1,1,'CS2321 R01 Summer 2019','2019-06-02 23:07:03','\0','Week 3 Program : Hash Table','2019-06-02 23:10:08',NULL,'Java','I am getting a weird error from CanvasTA:\r\n\r\nERROR: compiler.err.cant.resolve.location\r\nStatus: Failed (-)	\r\nLine: 6, Column: 23\r\ncannot find symbol\r\n  symbol:   class Entry\r\n  location: class HashTable<K,V>','',2,'141.219.92.148','ureels-macbook-pro.sabu.mtu.edu','1262122','\0','7543844','Cannot find symbol: Entry'),(2,1,'CS2321 R01 Summer 2019','2019-06-03 15:33:34','','Week 3 Program : Hash Table','2019-06-04 00:03:01',1,'Java','I keep getting a generic raw types exception.','\0',2,'141.219.204.77','rover-204-77.rovernet.mtu.edu','1262122','\0','7543844','How do I create a generic array of ArrayList?'),(3,1,'CS2321 R01 Summer 2019','2019-06-16 19:21:39','','Week 5 Program Binary Search Tree','2019-06-16 19:22:04',312,'Java','The code that I have developed can modify a node but does not show that the change was carried over into the array generated by the provided tests. Essentially, how do you remove the node itself and not the reference to the node and then un-link the node that takes its place?','\0',312,'199.247.45.103','199.247.45.103','1262122','','7524412','Deletion of nodes'),(4,1,'CS2321 R01 Summer 2019','2019-06-16 19:21:49','','Week 5 Program Binary Search Tree','2019-06-17 21:21:05',312,'Java','The code that I have developed can modify a node but does not show that the change was carried over into the array generated by the provided tests. Essentially, how do you remove the node itself and not the reference to the node and then un-link the node that takes its place?','\0',312,'199.247.45.103','199.247.45.103','1262122','','7524412','Deletion of nodes'),(5,0,'CS1121 Spring 2015 - Combined Section','2019-10-15 17:53:14','\0','Week 3 Program : Hash Table','2019-10-15 17:53:14',NULL,'Java','This is a test -10-15-2019','\0',2,'0:0:0:0:0:0:0:1','localhost','1001159','','7543844','This is a test -10-15-2019');
/*!40000 ALTER TABLE `queue_question` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-15 18:54:02
