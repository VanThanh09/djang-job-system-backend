-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: jobdjango
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add job posting fee',7,'add_jobpostingfee'),(26,'Can change job posting fee',7,'change_jobpostingfee'),(27,'Can delete job posting fee',7,'delete_jobpostingfee'),(28,'Can view job posting fee',7,'view_jobpostingfee'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add candidate info',9,'add_candidateinfo'),(34,'Can change candidate info',9,'change_candidateinfo'),(35,'Can delete candidate info',9,'delete_candidateinfo'),(36,'Can view candidate info',9,'view_candidateinfo'),(37,'Can add candidate vector',10,'add_candidatevector'),(38,'Can change candidate vector',10,'change_candidatevector'),(39,'Can delete candidate vector',10,'delete_candidatevector'),(40,'Can view candidate vector',10,'view_candidatevector'),(41,'Can add company',11,'add_company'),(42,'Can change company',11,'change_company'),(43,'Can delete company',11,'delete_company'),(44,'Can view company',11,'view_company'),(45,'Can add company images',12,'add_companyimages'),(46,'Can change company images',12,'change_companyimages'),(47,'Can delete company images',12,'delete_companyimages'),(48,'Can view company images',12,'view_companyimages'),(49,'Can add follow',13,'add_follow'),(50,'Can change follow',13,'change_follow'),(51,'Can delete follow',13,'delete_follow'),(52,'Can view follow',13,'view_follow'),(53,'Can add job posting',14,'add_jobposting'),(54,'Can change job posting',14,'change_jobposting'),(55,'Can delete job posting',14,'delete_jobposting'),(56,'Can view job posting',14,'view_jobposting'),(57,'Can add job application',15,'add_jobapplication'),(58,'Can change job application',15,'change_jobapplication'),(59,'Can delete job application',15,'delete_jobapplication'),(60,'Can view job application',15,'view_jobapplication'),(61,'Can add notification',16,'add_notification'),(62,'Can change notification',16,'change_notification'),(63,'Can delete notification',16,'delete_notification'),(64,'Can view notification',16,'view_notification'),(65,'Can add posting vector',17,'add_postingvector'),(66,'Can change posting vector',17,'change_postingvector'),(67,'Can delete posting vector',17,'delete_postingvector'),(68,'Can view posting vector',17,'view_postingvector'),(69,'Can add rating company',18,'add_ratingcompany'),(70,'Can change rating company',18,'change_ratingcompany'),(71,'Can delete rating company',18,'delete_ratingcompany'),(72,'Can view rating company',18,'view_ratingcompany'),(73,'Can add rating user',19,'add_ratinguser'),(74,'Can change rating user',19,'change_ratinguser'),(75,'Can delete rating user',19,'delete_ratinguser'),(76,'Can view rating user',19,'view_ratinguser'),(77,'Can add invoice',20,'add_invoice'),(78,'Can change invoice',20,'change_invoice'),(79,'Can delete invoice',20,'delete_invoice'),(80,'Can view invoice',20,'view_invoice'),(81,'Can add conversation',21,'add_conversation'),(82,'Can change conversation',21,'change_conversation'),(83,'Can delete conversation',21,'delete_conversation'),(84,'Can view conversation',21,'view_conversation'),(85,'Can add message',22,'add_message'),(86,'Can change message',22,'change_message'),(87,'Can delete message',22,'delete_message'),(88,'Can view message',22,'view_message'),(89,'Can add interview session',23,'add_interviewsession'),(90,'Can change interview session',23,'change_interviewsession'),(91,'Can delete interview session',23,'delete_interviewsession'),(92,'Can view interview session',23,'view_interviewsession'),(93,'Can add interview participant',24,'add_interviewparticipant'),(94,'Can change interview participant',24,'change_interviewparticipant'),(95,'Can delete interview participant',24,'delete_interviewparticipant'),(96,'Can view interview participant',24,'view_interviewparticipant'),(97,'Can add interview participant log',25,'add_interviewparticipantlog'),(98,'Can change interview participant log',25,'change_interviewparticipantlog'),(99,'Can delete interview participant log',25,'delete_interviewparticipantlog'),(100,'Can view interview participant log',25,'view_interviewparticipantlog'),(101,'Can add application',26,'add_application'),(102,'Can change application',26,'change_application'),(103,'Can delete application',26,'delete_application'),(104,'Can view application',26,'view_application'),(105,'Can add access token',27,'add_accesstoken'),(106,'Can change access token',27,'change_accesstoken'),(107,'Can delete access token',27,'delete_accesstoken'),(108,'Can view access token',27,'view_accesstoken'),(109,'Can add grant',28,'add_grant'),(110,'Can change grant',28,'change_grant'),(111,'Can delete grant',28,'delete_grant'),(112,'Can view grant',28,'view_grant'),(113,'Can add refresh token',29,'add_refreshtoken'),(114,'Can change refresh token',29,'change_refreshtoken'),(115,'Can delete refresh token',29,'delete_refreshtoken'),(116,'Can view refresh token',29,'view_refreshtoken'),(117,'Can add id token',30,'add_idtoken'),(118,'Can change id token',30,'change_idtoken'),(119,'Can delete id token',30,'delete_idtoken'),(120,'Can view id token',30,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'jobapis','candidateinfo'),(10,'jobapis','candidatevector'),(6,'jobapis','category'),(11,'jobapis','company'),(12,'jobapis','companyimages'),(21,'jobapis','conversation'),(13,'jobapis','follow'),(24,'jobapis','interviewparticipant'),(25,'jobapis','interviewparticipantlog'),(23,'jobapis','interviewsession'),(20,'jobapis','invoice'),(15,'jobapis','jobapplication'),(14,'jobapis','jobposting'),(7,'jobapis','jobpostingfee'),(22,'jobapis','message'),(16,'jobapis','notification'),(17,'jobapis','postingvector'),(18,'jobapis','ratingcompany'),(19,'jobapis','ratinguser'),(8,'jobapis','user'),(27,'oauth2_provider','accesstoken'),(26,'oauth2_provider','application'),(28,'oauth2_provider','grant'),(30,'oauth2_provider','idtoken'),(29,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-05-10 06:24:48.326781'),(2,'contenttypes','0002_remove_content_type_name','2026-05-10 06:24:48.561973'),(3,'auth','0001_initial','2026-05-10 06:24:49.388917'),(4,'auth','0002_alter_permission_name_max_length','2026-05-10 06:24:49.638307'),(5,'auth','0003_alter_user_email_max_length','2026-05-10 06:24:49.649317'),(6,'auth','0004_alter_user_username_opts','2026-05-10 06:24:49.661546'),(7,'auth','0005_alter_user_last_login_null','2026-05-10 06:24:49.673289'),(8,'auth','0006_require_contenttypes_0002','2026-05-10 06:24:49.681732'),(9,'auth','0007_alter_validators_add_error_messages','2026-05-10 06:24:49.693739'),(10,'auth','0008_alter_user_username_max_length','2026-05-10 06:24:49.703977'),(11,'auth','0009_alter_user_last_name_max_length','2026-05-10 06:24:49.716698'),(12,'auth','0010_alter_group_name_max_length','2026-05-10 06:24:49.746155'),(13,'auth','0011_update_proxy_permissions','2026-05-10 06:24:49.759120'),(14,'auth','0012_alter_user_first_name_max_length','2026-05-10 06:24:49.771906'),(15,'jobapis','0001_initial','2026-05-10 06:24:54.863256'),(16,'admin','0001_initial','2026-05-10 06:24:55.265820'),(17,'admin','0002_logentry_remove_auto_add','2026-05-10 06:24:55.284844'),(18,'admin','0003_logentry_add_action_flag_choices','2026-05-10 06:24:55.301591'),(19,'jobapis','0002_remove_invoice_job_remove_invoice_user_and_more','2026-05-10 06:24:55.687968'),(20,'jobapis','0003_invoice','2026-05-10 06:24:56.063709'),(21,'jobapis','0004_invoicestatus_delete_invoice','2026-05-10 06:24:56.496868'),(22,'jobapis','0005_rename_job_invoicestatus_posting_and_more','2026-05-10 06:24:57.082121'),(23,'jobapis','0006_rename_invoicestatus_invoice','2026-05-10 06:24:57.146863'),(24,'jobapis','0007_invoice_user','2026-05-10 06:24:57.369549'),(25,'jobapis','0008_alter_invoice_status','2026-05-10 06:24:57.389617'),(26,'jobapis','0009_conversation_message','2026-05-10 06:24:58.225175'),(27,'jobapis','0010_remove_jobposting_category_jobposting_category','2026-05-10 06:24:58.465211'),(28,'jobapis','0011_remove_conversation_created_at_and_more','2026-05-10 06:24:58.761634'),(29,'jobapis','0012_remove_conversation_participants_and_more','2026-05-10 06:24:59.212014'),(30,'jobapis','0013_remove_conversation_receiver_and_more','2026-05-10 06:24:59.964780'),(31,'jobapis','0014_interviewsession_interviewparticipant','2026-05-10 06:25:00.613611'),(32,'jobapis','0015_remove_interviewsession_end_time_and_more','2026-05-10 06:25:01.307967'),(33,'jobapis','0016_interviewsession_status','2026-05-10 06:25:01.481019'),(34,'jobapis','0017_alter_interviewparticipant_unique_together_and_more','2026-05-10 06:25:03.272009'),(35,'jobapis','0018_remove_interviewsession_conversation_and_more','2026-05-10 06:25:03.696309'),(36,'jobapis','0019_remove_interviewsession_job_posting','2026-05-10 06:25:03.880747'),(37,'oauth2_provider','0001_initial','2026-05-10 06:25:05.896581'),(38,'oauth2_provider','0002_auto_20190406_1805','2026-05-10 06:25:06.314015'),(39,'oauth2_provider','0003_auto_20201211_1314','2026-05-10 06:25:06.509371'),(40,'oauth2_provider','0004_auto_20200902_2022','2026-05-10 06:25:07.721179'),(41,'oauth2_provider','0005_auto_20211222_2352','2026-05-10 06:25:07.841853'),(42,'oauth2_provider','0006_alter_application_client_secret','2026-05-10 06:25:07.886377'),(43,'oauth2_provider','0007_application_post_logout_redirect_uris','2026-05-10 06:25:08.060238'),(44,'oauth2_provider','0008_alter_accesstoken_token','2026-05-10 06:25:08.085213'),(45,'oauth2_provider','0009_add_hash_client_secret','2026-05-10 06:25:08.335824'),(46,'oauth2_provider','0010_application_allowed_origins','2026-05-10 06:25:08.500754'),(47,'oauth2_provider','0011_refreshtoken_token_family','2026-05-10 06:25:08.684354'),(48,'oauth2_provider','0012_add_token_checksum','2026-05-10 06:25:09.447030'),(49,'sessions','0001_initial','2026-05-10 06:25:09.564202');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jc2soxg25b9en3i4xfakvj3bsxleubnh','.eJxVjEsOAiEQBe_C2hD-gkv3noE0dCOjBpJhZmW8uyGZhW5fVb03i7BvNe6D1rgguzDNTr9bgvykNgE-oN07z71t65L4VPhBB791pNf1cP8OKow6a48ioHYSk_PauKwkiDOByTYAqhKKg6yC8sYlEsYLKSBLWwRaT2QM-3wB5AE3zA:1wLyAJ:UVQNnLUf3KLJMMKXgSNppCmQFdik7cNFekxXeE4YGVo','2026-05-24 07:01:27.883685');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_candidateinfo`
--

DROP TABLE IF EXISTS `jobapis_candidateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_candidateinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cv` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `jobapis_candidateinfo_user_id_636fb8b3_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_candidateinfo`
--

LOCK TABLES `jobapis_candidateinfo` WRITE;
/*!40000 ALTER TABLE `jobapis_candidateinfo` DISABLE KEYS */;
INSERT INTO `jobapis_candidateinfo` VALUES (1,'image/upload/v1778398184/nlduwobtldandv00csj2.pdf','2026-05-10 07:29:45.281667',6),(2,'image/upload/v1778398156/d1gfj68e2grooj1mkphi.pdf','2026-05-10 07:29:17.344041',16),(3,'image/upload/v1778398288/d8odekf9diy3w88yp6fp.pdf','2026-05-10 07:31:29.072704',7),(4,'image/upload/v1778398416/jguzih9eupvdppyrujwh.pdf','2026-05-10 07:33:37.699472',8),(5,'image/upload/v1778398486/rzamk4tskz1awvkjjoli.pdf','2026-05-10 07:34:47.605936',10),(6,'image/upload/v1778398583/k8pjhdu7jaxlwrgzydya.pdf','2026-05-10 07:36:24.966379',11),(7,'image/upload/v1778398642/d1tjcp3e7aqgenmr7p4y.pdf','2026-05-10 07:37:23.101769',9),(8,'image/upload/v1778398702/zyrlynsampgcgf0c9chx.pdf','2026-05-10 07:38:22.903473',12),(9,'image/upload/v1778398764/mxdl98lkkab8j39fctp1.pdf','2026-05-10 07:39:25.619290',13),(10,'image/upload/v1778398811/viylkboeemalswcpwzab.pdf','2026-05-10 07:40:12.659225',14),(11,'image/upload/v1778398898/gyvibslv1acnue9o1iik.pdf','2026-05-10 07:41:39.201023',15);
/*!40000 ALTER TABLE `jobapis_candidateinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_candidatevector`
--

DROP TABLE IF EXISTS `jobapis_candidatevector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_candidatevector` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dim` int NOT NULL,
  `vector` longblob,
  `candidate_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `jobapis_candidatevector_candidate_id_ecc09e51_fk_jobapis_user_id` FOREIGN KEY (`candidate_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_candidatevector`
--

LOCK TABLES `jobapis_candidatevector` WRITE;
/*!40000 ALTER TABLE `jobapis_candidatevector` DISABLE KEYS */;
INSERT INTO `jobapis_candidatevector` VALUES (1,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n��\�:����\\��0 �;�⏻&R{9�\Z�<\�=nt#<��*��q<\�g\�<\�\'j�	��<D\��<�<<sМ<F��8d���\�$K=,Mֻ4\�+<\�5\r=q�=�=&\�,ǻ<y̼�\�>ȼ+6�O\�<\����\�&=P�\�<@Ɗ��!\�<�,<E���|e�v�g��Q<\�\�<P\�<[^�a=y]Ǽ�b)=:u�=\�h��I_�;�\�<\r���\���6+�%G�<נ_�\����\�8<\���\�&=/�=��\��\�U��Q6;D\�=\�!Q�w�:J�)�\�ø<H\�<f\'\�<(��ɏ=\�4\0��\r;Q:\�<\����&\�<\�߼\�b\�<�5�5�;?=��$^6�g\Z,=x$߼�.=��~�6�:=\�j$�?�\����\�a0=\�%\0�\�,�\�W;�<b��:\�\n�I�\�<\���<X���J1���;[�YL)�ő6=�Dk<\�j��T�:�\n\'<.�9S\�6�\�%I</\�Q=I\�Լ�\�<{Z��脻O�º��<A�<�C;�\�d=�^ټ��	=�>\�;\�3�<4\�;�(���\'<\�Y7=Ұj<�+,�\�(��\r\�[L&��	�<nU^=Qv$=\'\�<\�(=��n=%\�\\�߼]�����\�\����m=G�\�<C�\���=;\�3�<��\�;\�犻�~T<(Ӛ<2U\0<�S\0=N\�\�<|\�<\�һ^\�|�\�޼(;<��b=�\�=\"4�=\�r8�\�\�һ�t��r\Z�U��<��Y��\�3<�A��\��=-��Zm\�<ǁ`=���\�F9Ȧ��\�>=$<���<da<D%\�<�\���ˊ��\�#<<:=K<�;�A=\\���eL��}\�<\��\�<3:�<f���l�;r�7��\������X����B�jň��\\6<�ڊ<7^�;\�1�t���)k�<\0��R���\�S\�<\�Ҽx�@<\�F��n\�I튼\�a<o\�˼�u�\�\���pV�Ʉ���\�<O7N<�\�<�`��ݚ�2\�=�1��r<;R��8o=t_�=�zM=5���j��k*�=Ē\�:�谽׷4�T\�\�<\' $=ބ�;�7\�<�-<3o��{N��OZ�<&/x<��\�<��=�9j= ̼�)\�\�;�U�<\�\0j;\���ܘ<����ў��%\�<�\�ܼ�\�8�\�\�8=Wנ��\��e�e��\�%�l�c;5������<��ռޣ�<Iz\��\��<N\r=���:r\�Z<\�\�z\�_�Y-�<;s�A!�g�=�\�\Z�����\"@��\�\�:=\�A<.\�\'�5S\�;��H�P�<�d��lL�<.a=\�<\�4�iд��\���*�;+\�+�c=+=(\�<\�q=q�<�0;��\�;!D�=\�9=\�2\'��\�F�\Z�;_\�\�<_\"�<�Q<=��m=�\'��\�[;>(�*��<\\\��\�\��av��\�?t<�e��\�N;�\\=�\�<$q=f\���>��\�2g;\�\�.Ɓ;i�<Q*<wmY�|<\�-\�:I\�<\�<�A<\�C<vgi�z��J���/�-�\���\�<wv=PĻR\r$;\�\Z\�<Y�\�<т��/6��A�]1\�:��i��q\��sy\�;BV�<L�9=�|F=P\��\�\�ϼ\�\�6=Ԧ��#r\�<�M�`\\=I���.$=?\�=ͮ<R��=i�]����ʮ�<$��<��O�P�\�<�j\�<��\�\�]\�<!\�ļ���;��\Z�Z.!<\�?P<�8�\\��<�2=DM�0��^t.<=�\r=%�]<\�/���=\0_)<͉M�\�߼\�.ӻU\�\�;k\�%=�ݟ<R�e�w�\�<S9h=�n�h\�7=!7<�\r�=z\�{<\�y<�5\�k���H�!��\�!=�\�\�<O�����<>�,�J���}��=\�\��]U�ɽ\�;�7B�V\�^<\0Q���Ӽ4y�=}P=����4\�=��漏��\�o\�;�;=f�<7 S�F\�Ѽ�m!=�\�=gC\�*\�\�<d���\��E�&=Y<���;\�g����1\��\�)�\�ȹ�4��;c���+���\�\�4=\�W8�\'\�^�n=����봻;�W{=K\�J�fg\n��3\�:YÂ�F�\�<%0�_m��\�9\'\���j\�f=\��u<BR�<a{<.\�!=\�\�=u�߻&	\n�ظu�7\� =C\���4\�F�\�U<\�\�/�*��x}_=Bq��*��\��\�೻��z�\�W{={���k�����gN��Xr<6������;1a\�<�\�6��-=��\�<\�e<]\�b=^u��\�@���̼\�ü�rM��\�W�\��H\�<A�=�\����=�E<�蔼\�[<�\�,=@r�<�E�=�\�[�\\�<9�=8�=MWμ�=<�\�$=����ui\�<#T*<�\�j<�\�;=�0��\�V=$\�=�A(�6F�<ae��\�0�+.<D�;<;\�����<�\�\�:<�<�V5<qӼd��<[\�<�\�#�ͻ\�<B)\�<\��4��\r���܊=\�V;�3��!�v�V��<;¨����< \�f��eD��B���\�\0=���=Cz�Wu�=\�\�:3k&=\�=�t<X\�\��r=���\�+d�\����u׼��(�ȸ=�U;��Q;Ֆ\�<\\	=W\Z��m=�,|�Ɣ�<��;�XW��R6<��e<����r�3;}�� \\@;MBj��=\\#�\�O%�\\l�o\�\Z=E�<�	=�n�<�c�z9����\�����LM�+=\�\�-�D!=\�\�<����f7�\�\�Z<�l�ȧ;�u�<\�g~=[\�h=\�.��@=ƒ��z����p<܍λ����\�J�BU\�;u\�;\"���\�E=\�\�]�Nkݼ:\�g�тJ<P��埼�_2�\�\�m<�y\r�#�Q<�\�7=4\�;\r8�<�N��rj��:V,�\�`��|+ܼ$v��R2��6M�\n�\�7�<*`�5V�<�X?=��3<�g\�<��\�<$�=\�\�x�\�\�n=#��&W6�\�|��]�R�\�݌���b=�\r\�<\�͟:\\�\����<�#�<�\�a=\�\�$=q\�5�\�<��\�<oü.\Z0�b;�R�=�s\r��OG=*c=`>�<h:t�\�(û{ѻ�Zb<|Sy�\'\0���	={ K�҃��נ</\�=PT��_D=$W<�\�;\��;\�\�\��\�<\�S�\�=�oAԻ\�U��\�[���V=n�A�*�\�,�<F\���߻X�,��\0���%�gE�\�O\'��?��J�!=An<�h=\�=�Y��� �\�\�S�\�y�<�\�<)\'G�-���7;\Z:L����;\�\�r=֠�<\\���[\�<[\�\�<gfs<MwǼ7��\�\���苣���J<\�H�Ώ	=\�\�;d�\�\��\r=��<���<1�޼\�V<�5\�\�\�\�<ԕ�<:]�\�={:�:\�!=4s��#�rA=a�F<\�6<�b�<�f_����<�\07��\0��\r�1=:��<\�lƼ\0�==N\�	�|�ֺ�T\�<ys<�!Q���:�j��\����\��t�L�\�Z�=���A\�뼛}��L=7�\�:�L\�;=���\�~f<��\�<{;�;D\�8�\�Y�`;=�J\�<�em���l<	K3�\�%�<Q�S�\�\�;\���\�M=r9�ۙ�=\�C�$Ov=�\�j��j��\�K;P���;ٻI\�\"=�ԫ<:�Ҽ\�\�M��f=_�<�`��.z\�:Æ��u�+=�@W�}\�=\�2\�;�\\$=�vO<\�v-:Ԭ\Z�sf�<\�Q<#b<st4<,d=\� <\�Ң��½<U�2;\ZB�\�\\ۼ6nļ��d=\�\r�;���\�\�<��&;+�\�{���4=ͽa;Okr���\�;/\Z2�\035<\�\���:��<\�\�\�<\�L*�2.E�A������\�B޻;\��k�\�<)0p<q��v!���\�\�\���<1ݝ<\n�.=\'��;����Ҥ��@�4\�\�;�\�\�<\nr<;1+=\'\���+�ƻ��D�\�F�����\�\'��!`ϼ\�J@��\\<@\����\�\\��\�\�][<��`���=H�f�!���U�!<k�J�\�&<2���\�L��\'\�;\�5@<,Ҍ�NӪ<\�Z��\�r\�<3a\�<��<\�\�*=V�J�\�N!�a>�9\�<Α\�<x\0�;��<P��<nd=�/�)=\�����\�;\�Ċ<��<\�_�\�\Z�91m�3���\�-<���HB<ǙQ��9̻��z�u��\�#�)�E=��:l�\"�/Ŷ�զý\�\�&<z��<��\����\�z��D�<�����\r<\�q�;\�\�/=�\�=a�t;=�\'=\�D=�\�,=P���7\�a�U�\�<x<ܸ��\�\�g<�\�S��e��ظM�}\Z��\�<���S>��\�\�q=��2;P,=]*\�;n\�M=&/\�d	/<d\r\�;\�]�<ՍS��\�\�<\�h�4\�p;yd�<Nc�=\�A�����*�o��\�:\�][<\�<��ExS�&\r=\�x�=#Ć:�\�|�',6),(2,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \nb{�\��m$&=\�Cf�f4Q�,\��ꨔ��1<�(�=�\�:`G\�<\"���[��b\��;.\�O<?\�\�<���<\�߾<�)��xP�r�;���\�\���Z��<�rɼ�\'{<h?��:JI�=�6l�\�\�s�xO������&�\�<�%r�fY=�V�Xܷ���\�6==�/�)ۂ<\�3F���D�\'n��w�=:�ؼ&�⼡\�\��i�+=~4��\�\�<�+I�H6�\�\�.;/�;\�Ul�\�\�<\�v��	v�:N���K\�+�\r^</\�\�\�ƼC;�:\�\�B��Gμ:\�8=\�\�\�<�~\�=\�1-�u%<MT8����<L����\0;jʼQ졼�ޜ��\'\�{Ǹ�JhA=I!+=�;=:��}�Ǽ\�\0=�<\�<��<�\�4=8v\�<��8<愄�7$ڼ�A��9f\n�Z9�=��,2���<F=sCJ�P\�漇:X<�;��S�渾<Ү��%;Ȼ\�/=\�f�<T�n�a���\\�3=�FA=WR�<�J;�q]q��\"\��a�<���o�\�<v�\�<1���@\n=.7컣����\�\�<�=/3��7I<��i;^�:�eּi\�b<j\0W<	�\�\���\�=N\�<\�\�\'�:�]�\���nT=�\�=c\��=ļٍi��\�C=�^\�og�\�=^\���\0\'\�@3\�jeo�7�<�5R<��9���Kq<L(\�<(\�=\�Ō=\�W=*>=�\�+��\�e=6�輪��ӦO�\�]<y�\�<3��4��4��F\�\�;/s˼\�\"_�*\�<�ó�\�d%=h5�\�\n��\�=�\r��\�\�$�\�Fj\"��ͦ<��<4b�\n\�<D�*��\�ؼM�\�\"a�\�d�\�<R5=� <DV��\���m\r�\�����߻x��\���=<�=���=\�O<`\�<LGջ&<�t�\�[}�%v=\�!<�M�\�U4��{�\�~H�{\�\�Q��<i9��R6�<X�ռ��]�\\m�<�)T�b�w<���<\�[@�.N<:*=�9�\�\�h��\�<�N� ���B�\�<!z�\�\�L����;�\�8�\�<$���\�؅�H!�<4�<\'\�=ѩ\\����=[?�<\�\�=�\�;}P?�^�N�C\�e��\�F\�a�\Zo��\�s	�ز���U �K:	�\�\"��=�~�eX\Z��3��\�\�\�<�\�<�Q\�h=mૻ8��&$<\�1\�<\�N\�\��@<<�=�8�<&0<\�6�\�\�z<�A=\�)>��=��=L�\�:����=���(�*�K\0����XjE��&?=��<T?`�j\�/<�n��\�ͦ��x�;gy�=�wU:�\�\r�,7u�+\'j=()�=��\�<��\�<�\����H<��=XE�\��<�\�Ǽ~�\�:��\�<\�\�=���H=#��=��ڻ\'Ȑ<I�A;\�C\�<\'\�N;@�\�<�S=$\�G=�\�Ἠt�<r��=L\��of�<�\�<:\�<\�\�:�\�*�T�D�\�\��\\�<�烼��-<\�c�<Z�<��`<D\�<\"Gϼ6�8��:\�\�<I�=�\�=\��;`\�<��\n�<G=����	��\�]�W9��\�\�t&μ|���\���:��E�l�k�\���\�R�<(���\�e\�<��D��Du��~�<Oho=\�=�*\\=��\Z���a=ȷ��:}T<Hڜ=H�|=K@ϼ7��Jϖ�H�\�\�r��\�\�=&*B�C�:\��Y�̼�d��?N�����<\�\�<\�#�\r<u��=�\�=\�S]<��~����<\�+.=\�jZ�ce^<\�\�<P$�<�1j��z=i��<\�\�ǻ�cy=X=Ac�<\�\�Y�8\�l�\�\�l�j.��[F!<r:\0=�\��bJ\�<�<�	��&�0��\�h=\�<F=rl�<�\�мnQ�Y�M�\�k.;]���]P\�;b\�h�EGҼ\�	�<�����~=Y_�<JѦ�w9$=kX\�<\�\�<�y�|\�=J`\�<C��<��4�����D\�h�Eށ�����\"\�+�mر������.\�\�<\r�G�wЈ=���<¿5<�򤼄q��H57<��\�\�iO< \\��&�<�x�<M)����1=���Uм\�Ų�̀��5\�\Z=�<�\�Ļ6���{-�\n�B�\��<�Ҹ�\�V;<X\�\�\�\�<\��:���<߅�<�\�<i�<�5n;}5��ł�)\�x;\\[�<\�H�<\\ؓ�������C�<CP>�\�1\0=�\�Ƽ�;G=\�+�<L=`<Lf=2�̺\�؅�\�e=:q=(\�\�ļb����;=2ܚ<\�9�<��YV��}\�!��\�]�\�A�V}O;�~ۼ,��\�Q�<\�̱��\n<j\�W<QHq;;/=U��;��5�\n<l�V�\�?��9\nL�e\�����<�ܼ(>�ǽ\\<ݗм?�L=^\Z��\r(=�NY=�K.<\�3�<�\�\�;�:%�\�aZ=\�\�\�-ȼ�\�ػ>a\0=\�\�\�\�I2�F��!�<[�b�\�\�\'��W\�<\�T\�<m��;ӣJ�\�];;\�i<S�λb\�\�<\�\�D�\�	�_�5=��ӼZ\�;&�\�<�\Z��\�\�޼\�=\�M.�\�{张�ƻ\�\��O~��q\�<�����G�=\"�	<ʋU�}G��\'�<*\�(<\�\��.�R��I\�<�\�<$��9,\��tʎ�1��l\�l;*OY�\�g�;H\�)<=��M<^㧻U\�<-\Z��d�o�B�r�L���bm������\r�p�\�<�^��>mo<(f�<Du�;\�)�\��{��R�E=��=�\�;rr�<QWa=]\����WR��\'��\�\"��i<BcM<z�\�\��:Z���{�0�\�8%��a\�_���\�<���y�<np��\�T��޷;��=\�\�N�=Cܞ�5Z\�<%��\ny@=I�A;�(��\�ͼ�h�;\'d�<\�\�)��%O=���;�ռ	\�\�<5�;�~\0=���<5��<K\r=�\�\r;�6��\�3�s��<����T��;Q$=Uq1<l\�=z�t<�\��Fۙ��\�=\�fH=I�L<e�m=�|�\�ּ\�wX=\�eP�\�\�q=�\�%���\�<~�,�6�G�\�r(���\��x��<�@�<���;\�\ZM;\��=J�f<\�G<\r��;�ʊ�c:o<�W ��\�=J��<``\�<��\�<\�G\��,;\�:�{Y<[e��b�;Ө��\�$=����f\�=)\Z?�缑;�\�=��S�����P3U;m*�<���<\�;���}&�\����(b�h�H=\�`��Ь���\�l<\�\�\�<���<\�x�Q��;��U�O{=6\�(=��K�;��Td����\�<\�<�K=:���T\�#�~\�\�a�\�Q<�0��\\y8<�逽�r\�<o~��px=�\��<\�4<�3��0;TG��݋Z<Q+J<�\�};g�=\�7+<\��Ӽ�����\Z=�\�<�e\��<\�\�\�;7\r����.=i/=-\�ս\�\�.�\�ϐ;g6@;�;̼�Y6=\�<zeI=\�쿼F6g���N=U��=\�\�<����ݓV�*�� $=�H�ސ��\����_�%;3-<�<�\����C3��L\'�ď�&*&=Q̗<��\�<�ͥ�\\.=\�RN�H\0��=��=8���ߗ�<\��<�\�\�;�,<P Z�uu��+��<0qk��߼E9�\\��\�=��<\�$U<C<�T\�;�\�;<���>\�<Zk�����8��<�/(=�<W���K[��2?Ž��%�Z�=������\��\�\"�<\0X�\��P�Y=��D�y��3r:��ּ\�R=�W��\���$\�켍e<�X<\�ٽ;\�(\��B\�ʼ\�\�߻Kـ����=\�Q<k}O=JAU=�9A<w�y=��\�<{\��L\��;`�z�ʁʼ(�\�;d�~=Ԟ9=����\'��������q���ah<;\�<N\�ҼK0��H���Ѽ��<�\�\�<Zv�ӌ$=���:W\�R�L�:\�9<Y>m�9N�pI�;Gԓ�~t\�)�=�\�5�\��<%\"(����;��B;\"0�;+�\�Q�=�\�\\<��q��3������_=Fz�<3\�!=%�\\=E[=�?!�./�a\�+;h\�=\�	����F�<�=�<;�\�<]ڼ<\�6<^\�\�<�J�<\�Q��\�8�Wk��4Ѽ1\�8Y\0=D\�\�TT�|\�%�+�<�R<\���<\�.��\�.�4lL�Y��^��=�\�g=\�0��[��3\�N�{%\�\�i.�	Ň<\�\�-��\�\�;��j=.\�\�;c�D�h������=�\�:�\�;L�<d�{=�烼��<�H��Sݻ�Ǽ2\�\'=���;>A\�;�.��\"�o�r��<#\���`�W�\�\��\��$=�\�;2�;�r��D�&�\�\�<Sj\"���q��)=\�g=��ܺQ��\�\��\�<R�=@\�[���<��M<l�=������=v\���ަD=\��<�<O������=',16),(3,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n2=\�0�<��j��\�Ǽ\��-\�\�<\�\�<��d:R�a<kZJ�K~s<\�\�<C��;l;\�y��)�M=�\�.�$�L;�V��?����\�\'=0;o;�<���i�\'��I\0=E\�W��\�λ\�=R��<R\�l<�I\�<x����h�\Z����\�\�;V\�,<FN�D���F��<�#=k=\�b��~\�<\�`弽�=,4p<;�Z�\�<R\��0dD�\�H>=?����)��pw<�C���;\\W\�<3�*�\�p�-���\�(����ҁ\�<D��<I=� ��\�l=pڐ����:��^=f\�;�f�.7#�<T/;\�=4=Y\0<<.\�⺮W�<��j\�<\r\�<\�ͷ<<��=\�2Ϻ�\Z�<�\�=y\�\\��\��<���	�\�<\�\�h;ࢀ=L��#=\'Ӄ<.�7n=\�R<\�A\"=�\�\�:e�\�j�s�><\�e\n�|�V<\�h���D��\� :��n�<6�\�����7B��v�<\'yb��v=��W\�(��9��\�D�&�G=��)�;$<���<\������;�n\�;d\�\�<�(�]��<\�*=RH�\�\�G=\Zm�=&3�\�0��$S����\�;ն\�<(��\�\�d=}\�m=/�<l���:<�\�rf<\�[=Sڻ\�\n ;G��G[�<�S����\"\�<Kk�xgb����\r�=�턻�k�=\�3���;;d=\�s�<\�\�h<�q�=\�m��Y>y�\�V�<���� D\�<�2�^k��,X\�;�\�(;�\�<�;GdD�j\ro�Z=\�<3�`W4�\�ś;�)<\�\�p��\���c�;K\�!�2\�\";�������\�jn�֥�;5d�\0s��\"�6�2�\��<6�\�<\�*#���\�\�n��2X4������r��|@��*k=��=\�\�мٺ/:\�D=�\�<0#��nR=�)�\�\�$�Ǝ��fk�;Hn2�Sky=��=�\�g�\0˼x�@\�j<y\n=oX��\�$=ÈM��\�j�\�X��7S(��̲�\�ؼ��<�H�E>M�t�<�\�<�Q62=\�{��d��b\�<N\�����Lr��_��:\���<;�Y軄������<�N;\�#�\�\�`=4	\�<w=I\�\'<�r�2$?�h=\r=��.�Ε��s=��<pq�<��\�ӣƻ�P��o���>\0�e#9ݾ�H\�<$�S;E\�<�+,�Z\�\����<\��=�\�;=\�\�K�\�l\�=����O><wM/=\0�=�\�<Q\�1<ь)��P�<\�\�\��8\�.=\�z��HY���\�<\�J=�u�D�;7\��٫�<����:\�\"=�\�z��.ϼ[A/=\�r��%�6���E��\�L<�K�=��t��	<$���O�n=�\��<<P�\�\�/\��=}0<\ZI�;2(�:�`\�<cַ<l��:39�;�J\�:\Z�\�<ȉ�<\�bq�bzH=p~S=G\��|\�F<z�޻\"���l<<8M<l P<Bs\r� {$=�$�\�\�n���<Q͜;@:��\�����=�\��;�\�\�<ݻ��\�Ѐ�v\�\�<\�\�Ի�\\���\���mt<U`��c�A����<\�,Q��s�~�<��<T\�\�<�����\�8�8cg�K\�F=\�\�	=\��\na��R�)�\�\"[=10;\"��:\�\�;K���M^<\��̺�?��U��)^&�zc˼\�u<�M�<ʮ�<{n\\<!�\Z��\�;ԭx�ܸ�;�:	<v�K��.��\�3�:e��<\�|�����l\Z%=\�w�:\��K\�л\�\�\�=¯�<�?�+<;�L�Z�1=H!\��\�=K\�k�\�h�;\\\�˼@2\�<��:9�k<\'R=Q��<4��\�\�溚\��*�ݻ2ڙ����;p��<U\�V�`\�\�;�X��\'�?�\�ļ{f\�<\�\�;�g�=K�5�4�a�i�/;z�\n<}[0;��<\�3�X\00;�1�2��;~�Q=BZ\�;E}\�<�Fʼ_\�S<G�(�:�%;�p\�;\�\�<ǭ,�\n^p<\�\�_�A<|:}�f9Ӻ;:]=O��;\�w�:Y\�<X��<�(<�y��<�\�<c/�=.7=q)~�U:\�\�<v\�\�\��\��\�w(=v@�<� B�Y\"=~��/M�\�\�@�R\�ټ\���\�!�7ҟ<T�=�\Z�\�^\�;��#<�����<�\�����=f����7\"=a��<1D�<t\�<�Jټl�n�7\r�k��ptǼ�\�%�{\�|<I�;�\�l�\�~t<�O�3\�\�9n\�3�1=Y9O<��C=��\�<$\�.<|̓:�\�=:ͻp�O�)�\0\�\�<\0\�^�H8�����\�V=\�ɻ_(s;$��\05<%xܺ`�)<xf4��Yj<80T���R��)�=�4�D\n<�|s<�+\�;Ʃ���3�OW+�`�`<e}\��v������DlV<RQ=�֘�����\�Q�)\�\�9>=~K3�K\�\�<\"\�m=�:,�P��\�b�\�J�	5)�\�\�#�����8+<z�=J��<�漄Q��*\�%�N�;\0���\�Q=K��;k\�;\�&\�z-g��\�~=\�\�;�Cx=jF �_-¼\�\��}$=�ht<%������<��}�&4�;\�r��\�<gB���Ʊ;�ί;]f�D\�<Ǽ\��mx==\\T6�R\�<n�C<�%=\�\�\�G+\�\�Ӝ��,�<@+ڼ\�3�_黀\�<�\\ռL��\�4�Q\�n��\�\0=w6_<Y����g��\�d�t�=��=�\�\�<�\�7<\�2���T��Hb��3j�<\�>ü0nѽ\�A\�\"��<�Տ<?�\�<C55=B\�\�<�\�߼\��;m��:r�N;\�g\�<cA\'�~=�ɺ���;�\���\��p0���\�:�<|9�����;/M=*i\Z�\�\�<�\�N<ű~=:\�\�=����7%�\�\������r\�\�<8v.�OS=cH�\0\'�<\�\��\�B\"=85;k\n�;ql[<+۝:\�Pռ\�=\�m)=G���\��� \�\�{�<�\�A<\�%1=򸖼�\'G=\�\�\�;ƨ����5\����<��%=\�\�.�y�h=�#��\�6˼\�C:��t6=��<M\�<P\��<e�[���;@��s�%=\ZHr�k\�;j���\�y<-)=�Ȗ;XX�<\Z\�=\�\�=\n$;�?�<��\�ϻ=<�=��ggJ<N�ͼ\�뉽RK<q7\�Mt<��\�<�\� ;g=����-��l+=\n�=��˽\�xƼ�#�<\���Dޞ<8mE�L�����\�;j	a<jCP����<;	��\Z<$\�\�<)\�<H\\;;^��<����\"5=\�2Q=G�;\�\�\�3޻ݤ�?�=\�rH=(�)<!\���\�}��nh�\��:\�J$��H3�����ɷ-���/��\�\�:\�.1<\�\�;���\Z\�:-�;�A��=�-K�\�V<\�no;T�%�%j��]jc���k=�\��\�\�-��\\���3=w\�U<r\'<��>��fw<���<�)�<�9�\�G=��\�<\�\�\"=@���\�5��\�ݼnH	=i\�?;�ɗ��\�;\'�<+\�\Z=ٷ�\�,��c#1���=�\�~\�<P\�:K�#�Y\"E��\����Y⻌\�\�;�0<\�)��8Վ=�|�ͯ�<0\� ;�@=:Ҝ<��;G�\�<K;Z;\�\�;�F]�nY�<�\�\�<��\r4�����<ǽF�mm<�l��\�a���� �w��<nE1<gk2=sg<�@��\�j=Hݮ�\'�+�@�=bC�<\�oB�\Z,��\�\�>�2\�\�lH8�Yaa<�5�ߏb�N�\�<\�v�<�z�;\�;��<�#6=Es<b/J=�\�\�<\�8<Nn=i\���5ۼG\�꼪��\�\�*<yp1<\�\�<[ �\rD4=�Q<\�\�<�c����=\� ��N��~ ��y~;���<5<\�)<�kB=CG\�9\�ѻ�0\�<���\�`�;n=\�|��\�\��Đ��\�ܷ�\���\�\�<~��<�\�p:\�\��<\\n$��r�<\�FS�Q�t=���\�a\��B\"*=\�cv�}\�=\n\�:�@�5�\0N�KRw���T=����\�~�%?3�Am����\�ɼ\�;�-�^:\�%�<�����x\�;�b��\�6=�������\�\�<w����A�;~企\�<�\n\0��X=�L<�\�\�)=�>ļ\�\�;*�Y�3-.��݅�J����\�0�\��,��J~��\�\Z=\�/��ޔ�<\����<������\�<C��<�\�P=O@g�v>�Na\�<<[��\�<�\"GD<.Q\�<\�J(=\�\�K�Q4���\�G=�౽U���ӛ<���6w=n�;f��Ȫ0<a>���J4<�*<\�\�A�$:���\"�\�\�<\�\�\�)<\���^�����=\�\�<��;)��\�&\�1\'�<9\�����<j���\��\�\�<\�xt�62/���%=%�H=�b�� ���\��;�a�0\�\�<\�8Լk�\�<�U`�1&�<Z\�V�^\nk<~��=\��\�<j��<',7),(4,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n\�%�<\�|,<\�\�A=�\�d��>\�<\�C<�������;���=\�<�|���\�\�;�@\�<�E\��.\�=Y\�	=��5=�#�<\�̢;�\0E���`��_2=e�<@#�L�1�E�޼\'yA�\�J;\�z�\�N����<@��Is<���z�+=qΉ�\\ۼy\��\�4Լg6���� =�h�{�\��E�?��;�(=\�%=����;\�u=\�+;<̗�<`#5<ew��\�;w� <W~�����\�a�<\�ˮ:\�h=\�W;��伂s\�\�Lz;m0��4\�5=JJ���g\�<�&\�;,!\0<v;�����ߍ��$�:q���a���=�D�\�\�G�<}Ӄ�\�#=�Q�<i\Z\�<N��=Ѓ�]\�\n<Eҽ:I�=T��;2�w;r:���B\�\�N<\�3�\�\�<�\�H=AJ�U`��\�<�v��\�\��\Zk\�/;}\�o�Q�:\��w ���:=I|�<\ZN��by\�<\�?n=\'�<\�)�;\�\��<mq��]����2\�<&v���^(=F\�>�0\�<\�T\�<\�r<���vc��zb�\���=tǍ�\�\�[��(R<!YX<{�)��ʇ��\�<�TϻC%%����=h��<�\r�f��qy@����E�B=��\�t\�ռ��<P\�U<������A�-�=)w\�<W�8��\�,�zG=R�\�\�\�<����s\�\�<QL-<DB�<	&D=�5�<d\�W<\�\"�������\�<�\"=\��%\�;\�\0�<\�\�=S\\!<\�R5=�\�<[�\�<CE<R\�x���\�;�;�\�\�;;\��<I;K�B������y���\�z=e\�9��x=��i�X쫽&�=//<\������\�.S`;%~��\��;+�-�\rV�l<HǼG҄<I�\�\�\�&�gn����=��\�<�\�\��\�<%�ټ\�8\�<c���\n=��\�;|�5<�s\'�(���_-D�\�\�\�:��CQ^=q\��̕	�^=M��J�sT=qv�����d\n��T\r��\�1=]�\�\�\":���ؼ��\�<j\�G�0���	\�\�;+ṻ/���Iׇ�n!�\\6:�v\�Ѽ%-��\�\�:��\�==\�\�\�<®<\�x�<\'\�/�VW �\�\���Px�����+���\�$��`!���<Q�+�\�m8=@P��E]@�{4\�;�r\�:\�\�\�<�7������\\�d\�V�����\�<.\'^=/\�X<}\r<d`�<��<nl����I<�j{����)¼�;\\���<S<UM|�]_;\�\�{=q�}�z\�@=k͔�\�\�\Z=\��=\�-�=�$W������t��\�V<�B\r��I:\�Q\�<�k4<\�v\n9ݤ=g\�<�*=Ŧ\�<\�`�\�%\��\�.	=�d�<�\�>=�([�-ӆ<C\�f�r>\�<�׻��f:}~==Zˋ�hً�]\�M�ms��&����\�\�9RB	=\�â<\�y<�\�i[�P\�=��\�<%�`�\�E=����\�7<r\�\'�pK�;\��<0X8=h�L<�JҼ܉��DG��\� �K\�M=\�c�/#�\�h��9�\�0û\�T)=�H9�k\�1�<֧�cΜ;w\�\�<�\�\'�1=\�u!=e\�\�<5\�!;�Qƻ=\�c��:<u3��I3:�s�强�-�;g�\�\�<�T\��\�7ŗ<��5�[M=7�;\��\�;\�\��<�\�(�a�:<>\��=\��<~G\�<鑢<\���xh�<U��\�\�W<��ѹ�����x<b\��\�Ҫ�\�\��\�<�9Ļ\���\'�\�<��g<�\��揯�{%<\�\��=���n���ؐ<\":=\�;=Q4H�\��=.P�<�#�\�U��俻\�K��)g�=�(�����Jm-�L�s�\�\�=\�\�,�Ű�;Q��w*�JR��\�z=\�Qܻ\"8\�<\�)�|\�\�~\�<k$=��[�}�<J�G�\�\Z0�5T�\\�\�<�IF=3d5�V{��Լ�;������;\�4��Џ	��\�@<\�M��\�J\�<D\r\�<X\�Zպ�A~�\�����\�;(\���/=�I\�{��\�:��_�\�;�\�{>�<Q\�=�X<�^W=�;�;��i�W\�任tD���;4\��\��\�\��������2U��\Z��\�\�C=��\�<\�Q\�<\�ü\\�n��\�=��.=\�3\�;�6��\��\�_\�dw��\r\�=c\�\��bҦ<#\�ż\�\�\�\�[ʼ\�P\�8���,\�Fa�<\�\�+�%��N�\�<ȱ���`�<\�v�Rj=���=}G�;ʽ\n<�\�;=�\�ʼ@�~1	�{���$�(�\�ԟ<X\�\��)V�Q ��2y5=�:�=~�E�C�]�\�)��\��=>z;\�\�s�۝<�\�I�F \�<�&=D\n�D0W���8��YF�\�\r=�f\��}\�=y\�ռ!�`\�<;\�/�6x=�\�ۼ+���Th�Af�<�G�<\�ɑ��\rL�\�s�[\�\�<\�\�.;\�T�<���-1M���<̽�<\�R\�;�ܤ:hhx<T-\�<5�ʼ0O<\�ȷ��d=\�=�<�F��R�ļ9\��˴�2��j��<ux\�<�\�=u\�:St=�\�\�<�����-��h>=\\\�\n���\�!/T<U����%�\�5Լ�����\�|=���=\�J9=\����\�G|�\�������o�0<`x\��$ %=���<v�μi�����*�M�1�\�;9\��;H��\�\�:����\�=�~;��=���;5���{�c�����\�<<#�ېb=\�N��G�=�!<\��\�<�iE���=ӎt�\�\�\�<q+=\�I�<�H�\�3�<\��f<0�\'�DS�z5S�\�=W\�\��\0�׺8�Y<,�żyI��\�\�<\�ŕ������i=;���<��\����v͂;��v<ɪֻf�d�\�\r=�̭:E̟<\�\�\��:�<+Ƣ<l�G�n�{���g�\�\�\�;�\�;z��4㼙�\0��<L�%=\�`\0�\�yg<ZnJ;.v\�<�+߼ଟ�ѴG�Ic�\�\�j�!ܼ\��a<\�g׼尓�Y�<�d�;dc%=\�^==F\�<O��<��%=\�@B�(`9�h��<)4\���<,�P<_<\�檽�A�v-�\�\�F�G�;�Co�<+�#=.�]���V=u�<`%�=}r!=A.</��<\�N=\�\�]�~0�<Gy\�;\�H~�\�}\0��7\��4\�ֻV1�< 8ϼ�\�����_�<ԧ�n�\�<u�z����<\�\�c;íѼ\�K<Fs�;yuк�C\�<��b�X/�< 4��\�<��<\�:�\0\�<(l�	�q��~�9r	<A%=6x]�\�\�r=\�\�\�<Mъ�qƼ\�\�<��{<\�vA<\�\Zd=\�Hѻ\0��j�<�fh!�=F�<6\�<m\���B�\��;g\�\�;�7=^^���n\�<C��<a���fd=�\�x=jc<�B<��x���=N\Z==AM=E\�<\Z���[$�\�T-�\���\"��\�V�=~Ǐ�\�R<O\�<�\�W��C:�I\�<P�L�=�\�`�!�:\�Ӽ\�=^��<�\��g�E9kY��8%�=�_��A\�.��\���\�\�;�G<)�d<N����d��+`�J��\�;i༢��<)�]<�\�<)8W<����� =��<DG9�\r��\�񀽕z�\��R=䐏<Ǜ=�W�Q;��\�J\n<\���9ڼEQ�<��D<t�:������\�=ӹ���D�;$�(<Ӆ5�\�K�<\�rμ\�\�\�<�O}�\�ϸ�$D\���T��n����;.-ຒ&�;UK<Lց���=x�3��zp<�$�;vg��#W�0Żx���%;{��\0�\�9��NZ�<\�zB�1���:+7;\�\����\��U�0=2#\\;2�p=�,\�<F\�,=OÈ<\�2\�<>d��3�a\�<��<�\�\��i\�A�֞�\�9�<�\�\�<4\�&�\�>h<\�\�\�<�h\"�xkm<d\�\�<#*����\�s9=�������<\�=^o\�<u5%:\�(*<$\n<�$�����yG��S�<�ج<\�`��<+\�;<\�s\�<g�o=\�9�\Z����P�\�;��\r�4ܘ�\�g<\��=\�Z���=<=��B\'<O�=u\�V��j=Np��n౼��~=.T[�tb;#v\�<rη<����5\�\�<�㫺\�Bi=�p	=�z=I9e��Y�th\��_\�ĻR\�ʺ�\�\�<�=e<�\���\�\Z/<T��<(м<\�U<�i�ZS\�k\��;\�h�j=%\�;]���mc<fTa�\���<\�i;=y\�<\�\�;��T�5\�]=H��IO�\�\�\�&=@��:k\��<V��}ļY��)�s<����¼���Oֻ�&	�Dͷ<K���N^>��\�\���\�;�5=�¼�c\�<$�\���jYi<�9�I�=\�.=S\�U=T�m�S�<��Z<\�@�>\�<\�\�<�\�ʸ\�\�|<}\���ӊ=�c��\nuO�\�<:�<Kڔ�Q���\�E|7Ӭ�<\�_�:',8),(5,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n\���,\�*<\�=�K��O<�:\rV����\�w�\�<�!=;�\��t<�p<8x`<\�vo<sX��\�Ss;\�������J��,\���HC;\�H=\�t?<㬔:\�FD�\�^�:\�r^�\�ӆ�\�,<\�r<\� \�<�<V<�63<[�ջ�\�<�J�<E\�<i��<\�M-��\�<& \�<\0�\�s�ǐ����]<w&\�<�WR�M��<y\Z���i\�\�Q �\��=�\�\�K�O�\�&�\�X\�:��I��Yм�+=� �<6P��\�u����;\�\�8<\�D�\�o=�r7��\�,v=��\�a\�;\�br=\�5=v��<k3��\�=t�=Y=\�\�<;\�i\0=�m�;N�Y;\�\�ܻS�5<ۤ�;���=\�\'�<*E�>�Q���=��<6\�E=\�\�;\�\�=W\�<�m��[꼧N;y�=z�8�G)ټ���0�;�\�A�X;J\0T�nl,=�`�<\��hI�}e!=�zb�\�i����0�gnL<k\�&ʹK�i������p<\�;�=\�\��F��4\�»^i7<���A��;~\�\�=�����C�\rq=\�t\0�;T˼\\)=-\��3x�E��<�i\0=mC<w#\r<��=\�\'=ǹ �\� ��}�M<)\Z<:ꂼ;L\�<�Ec���<�h�\�\0<�.=\�w�:�V�~\���?�<yb׼\�=�\\;\n����\�;�!��*R�<�/<\�\�<���?��\�Dͼ1Ƒ;�\���\�Z���|,��q\�;\�#�E+w=�Ԑ;�؁<��Ļ	\�V�|�_�\�<� \Z����jD=U��ؾ�<@֢< 寮\�\�B<&\"=\�M<\�cԼF\�ȼ$��<8N_=N>꼇�\�:\�d;3\�Z�ʆ;�Iͼw\n�z\��l�.��42<\��R\�:=�>5=:\�\�;�H2�v!����\n;2TƼ\�3Ҽ\�N��\'߼a�\�<\�\�4�\�\�\�<\�`��_�]<�\�<n�v<\�\0��/<4m��@|��\Zd\"<�!��R\r\0��\�<\�Þ�\�m<K&;##=7�<pM=q!ٻ\nr���S\r=5r��j��\'\�:��!<�O��6=����w<=\\ۼ\�&Y<5u���&=�\��\�=�L �\�x�5=\�5ջ������9�]@=\�JӼy��;���RC\"���;���`I<(\�-�,\�=�E\�:�\�������t��此<R��<\�\�`<;\�[=�3�\"<ƺ���U*<,\�\n�\�P\�;\�k�<y�ʼ�o/=��;\�\�%�a�ȼΡ\������)�s<�Ż\�l>=\��\�<�=�\�k;�9=Ub;��=}�!:g\�@<\�W���\�;\�_μ���\�׻5\�\\<�i>��\�B<M�\\��J\"=:e\'=�漰k8<\��]<�\�<\0\�;W�#=\"�_�9\�v=w�b���:V�<2Q༲Z��Vc{=S�T��7?=��<�[�<�\�<���������Q=�\�<#�\�\�:�qȏ<\�=�m\�<l��u�<K\�<<�7��j9\"=��\�<NwQ�\�.��T�;�\"���4O���̼l���\�G�;�\�qռｂ=� �- Z<d+<�\�.=	B�=VB=�1�:�J\"<�^=�D=�d=.��:_�R��\�\�<\�\�@�%%�<\�-;[�\�<��K�=~\�-<�ǻ\�\n�n\Z\�\�v:��\�;�%=5\�\�<��\0<�\�M=x��<\�\�(��v�<t�\�<Z.�:%�I=�G;�\�μ\�u{��\�<���9����\�\�w�H9=,\�<\�Gr<\�f\n��%���q�<Y0?<\�K\�;��C�n\���\�\�%<G \�<j\�ϼ!��+\�Y�	xE�L\r�<\�N��#u	=nL\�h)�=\�\�_=��;����e<q,�<�i	�Q輏��<��\�<G�==�=���=Lm=s4%=\�K<2*\��\�#���\�;�()<��\���;�Ax=Y�;\�W;5\�\';Ԧ鼠4G��!�;\�Y<攆;�ޑ���N�I�ye\Z;\�U@�S\�^=��<Y\�һ\�.�<ʷ�\�x_��\��(r]=�6�\���<Щ~��>�R0l=�\ra<\�\��+�6\�<by�<\�S}�\��<�\n��\�?�\�; \�༹\�=y#=\�\�M���H=�@�<w\�:��:���\�L�G\�\����)���S�\�<\�G��\�\����2��}��\�P!�R\\\�;����w\\j:\�\'\�<@��l�<�x=�Ι<\�<\�<\�;����,0=�\�O<�\�r<s\�U;|���%��\�s=!\�J;m\���\�҃�\�z=t#X<�]h�q\",��<a\�\�<<v�2L�f���M���C=\�;ѻ�\0�;��_=���\�\"7=�+v�ci��[Q\��C��<r\�B;O6��NJ�r-=:F@u;΅\�4���{�Z=\����<U\�?=��I;�Wy��\�\0�z\�\�:!�׹\�\�<�!><u\�<�2<aL;�%~�?�,=P\�<��Q=\�\�b=ӹ=�2і�����+͊=9�<1=:���M1=\�#\�<\�6=\�%�<�;�ٙ\�<f\�2<��@��y<\�\�<ò��G@�<x^z=N��:H\�!<\�\\����\�<\�\�</\�=<%�9<\"��\0e�<\�7��X�<L��頻��ڼ��\�\�9?\��<�$;�d�߈�\�-a�Zj:�h8=U\��<\Z��鱘9������9=�ii�c�<G\�G��\�<�<.��<VD׻�V&=AS��\�\�=\�\Z:=ms	����;\�~����<�/\\=�\�\�<\�(ӻ\�*u=[h$�Qv =N{�;�&!=\�4�,\�(=\�\�<\�+Ѽ]\�M=6c�<\�����{\�ҼJ�ҼL�\�\�<g`7=$L@�۹!<z9Y�\�\n��3Ļ\�)Y=�舻\�\�m���<\r���\�\�<C\�ջJ�߻9ڼ-�!={v=S���ؕB=\��H$<,y2�\�T��O�\Z�3)=(��t�����\�:,\�q=ܱF=���<���=G�\�m��X\Z��<�\�g.=ž�<�̊<gV\n�\rλL�-=q4�<�L\��,\�H<&�;�1����=�sR�,��<\'z7<F�2=��\�=�=��<\�3\�<� ,�Z2:=`k@<\�=nd����=�զ<[�\'�<e\Z9\\�\�:ɡ\�<\�{N=Dn\�;o\��<\�I=����\��<@�\�<?�A=�\n\�<Q	S=5Շ�z&x���!=V\�j���<8({�%Z\�<KQ9�\�z�<�\�\�:j��ؒ��vSJ<\��Z=\����\n\�B<v�\�<d+S�\�\�8�zU\�<�F�\�~T:\�B=YI/����W5��\�;8\�=\�g=��\r�ϡ=�����rM�Q\�,�PA\r<L�`��Eػ@\�F<\�޼\�I�<�#h<���<%c�<�B��\�iм�\0/=\�;@T:\� a�]\�\�n\�X�(1\�<�$�=L��H	=N�<��l\0\�<�\�<��?��F\�<Tk*=\��\�<\"\��\�\�<\r!_=aD=ڑ�;\��\Z�\��<�W=ὂ=qz@�&��=2W=�=����v�����8��<Y\�<�[�ۢJ�\n`��s�����= 2C=��ϼ\�GA����,�=(=�<\�\�;v<�ך�\�2�L��;	�ϒ=IU�<(\�=�]%i=Rp�<\�C\�<��=�}$Z�M�=<jz�;��B��OU;��=\�\\��\�8��j-49$Ҷ<� (=\�I=?ւ�\�ǻ\�r=:�A�0���\�pf�2\�T�:<�N-0�����0ϻ6ck9BP��#�;�\�\����ü��\�;\�}\�;˥|�|.�<7==\�X\�<|�(�ӣ�=Ə<��	=\�e�<:Y���N\�<\�K��\�\�?=1c8=���<\�o�<Y\��0\�>�e\�=��Q<����f�=\�<d�\"<AuT<�H�q�<\�\�=bG<�\�N<v\�s=�I��O-��\�\�\���Xټ	�,=\�z;�мk\�c=΂��7���	=\"~=�,J�F\�l\�/�\��<\�l��A۹@cV<;\�<:�\�<\\y<=���<B�V�\�T��\�\�<���={u<M�U=\�S\'��\Z���z�����\�N9��,�;E\�\�<�!�P\��@?\�\�ܔ;\�`��J��\�\�;]a�<x��o�;#\�<b�=����%�\�bI�\���|VӼ\�w<F%\�\���m2�<\�3< Kd��|\��/�\�\�O��\�\�<�\�<����5 �%���\�B�[�%<A�>=A��<mi�;��<�Q�<y�|<l<$�\�Ǟ<�\�\�<* =)�zT\�<�kh=_vW<`/��:\�;v#�<#ļ{�; \�Z:�k̼\�\�B<zC<\"�^;%,	=�`���\�=7ڼ\�=\�䤽\�S�<��<\�\�8�\�/[<\�\�ȼڙ+<=k<W��<��\�/,�$]x�2�/;�\�<�\�<J\�ļ�}�=:K2�\��\�;�I<h\�L=f\���\�/�%&=HU(��.Z=',10),(6,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n��V<H\"h=\�<a\�,�\�t=�\�n;����\�@\n=E>=��\�;\�n\�<�\��;�h\�<7�<\\\��J1��#\�<)?U=�\0;�P�z<\n\�D��b�;L�<<��:#J����\n�V\�:\��B=,\�O�p=\�θ�\�*�<\�\nE����\Zu=م\Z=�|�<\��\�8Lu<\�t�<\�\�=�8O�j<\��<}O^9`*��\�j���)�N\�\0=m�j<n\�m<X�c���(��ݼW7B=̥�\��<S_����\�<\"X缹����g:<B<�z��`c�<�\'غt�A�\"p=\�!=\�,\�=�+���\�{9v<��9\�<\�A���h\�<�\�̼����Х<\��ͼ\Zle<Ů=\�Ih;e#|=fƣ��2��\�\�	=a�D�K ��q<\�D=;Q�<d��\�g[��\�\���\�\�9\���=#t���\�W:�b\�T�e�W�̎;^\�;�W\�;\��[��;`\�><=\�ܻc�\�1�>05�x(�<�M��\�\�<Ǚ=�}-��\�K�J�<��2=FN#�f\�=0�<�	�\�z<�\�<\0^������槱<3B�<�y�vmy���#<�G�\��5�q\�\�%\�<\ZU�鳦�M׬=k#=؆��)eԼFC��\��<\'����\�;����\�﫼=Z�:\r\Z��b\n�dS�<J\�<l\�H�\�ҋ��\�\�<F�\0=�^��W���\��:\�<\�i\�<=�\�<]\�=\�ك=�b�XO�<w\�;��<\'\�h�\�*�g��<@N�;7\Z��l��<<4�Z�6<{�?�\�w��\�\�\�L���z���CǼ�E\'��6̼zܠ<\�\�7=A���\�;���=c\nټ\�ΐ<�u\�<B�=�\�<\�F�m\�m<\�\�<U-=���\�\Z\�<DK�A\���\����Ծ;{Y2�����#�<ݍ�=79�<��a=�\�\"=\�Ȩ��P}׼r?=,\�<\�NJ<�ɛ����\�D��a�1�[�V^��\�=<c��M���.L<�ʄ��>�����\�:;�&=\�刻E&H�q�Y=�\����Ax�`{<�\���7��\�L�<%Ƃ=	\�<\�I\��\�b��\��(�[�R<�̼=�?��k��=��\��\�\�<\�2ۼ��/\";\����\0��1<\"� m\�:��\�\�kp;L#+<k���=u|<8\���N8�d\�4:�\�8<=T\n�G=���;\�Ƈ�o\�c;v\�=\�\��<\�vV���d;u@\�\�L\�\�$[�\rK\"=\�/=D{��k�\�<Lo=`�A�<\�4	=^\�S�+�\�h\�<<\�l\0=�`���\r<J�s<yNf�\�ၼ\�N�㸲��ʖ��=�(��������A�Gw4�\�\�\�=��\�<6\�,�\�7������\0X=5eU���~;��`\�t�3G<��<�r��Q\�=.�\"=B���	�ٌT=Ʉ:�>=JW~=\�)-=<M�=A\�\�<\�NL=O=9f漟1l��_<\�M���nǼ]*~;�<c����bo<\��I�-�=�ʼD8]<CX%�ql\r��o������:\�\���\�~<�z,=EuP<X\'S<�_`;\�ļ��\�;\��\�ǧ\�<5�9=�T\�;�F\�<P \'<�Ǽn˫<\�\�\Z;��c�\�a���-���\�㼹�=��\��A|Ӽ[�<�,l=��K=�{���.�<�A�<�%��\��?=�E�=\�A<�׈<\���\�l�;qq���5;\�\�];\�\�5�6Ъ�J�;�鼿wﺀܕ��\n(<���<\�\���\�w�w^A=�����\�\"�����bμKOr=\�+S<M��<\�\�\Z>u=��\\�\�R�=�5�;\�a=4\�\�<�\��<\� +<\�\�:\�\�;R�\\�{�(:]ڄ�.Zb=qu�;�b�:3\�+=\������k�\�\�.=\�Sf=C�X=I#!��\0�1P\�O\���`��н;�\�ļ�r������/X=�\�:R��=�A�<$�U���)<r$��(\�{�s���G�<:唽T[7�\��<�uh;�근S+/�\�\�\r��\�\�;ƭ�<&~B�*h<\�18<�9_<�\��=�V\n�e�\�<���<@���Q\��<�V����0=��<�=8�9�Z,=\�K�|\��\�;�uI�Ơ=\�\n���T�\�o;jL��/\�;2��E��5]*=8\���\�c<��\�\��;;�=\��<̶b�?�\�;2\�6�\��TH�;\�e%;�z;<\�4�+e:&�\�T$=N�ŋ^<C$g<\�\�6=/-=J�&=R�c<\�|N:�u���\�<���S	��	�ٻ\�,�;\Z7�<hٟ<\��<�\�\�<䍳;�a]� �E���\�<p���3pź\�ε�\�\�(=¦\Z���\�<X�\�<k\�h=��<�\�Q�2\�ܼ#vϼ#���\Z5��\���\�J\�;4�e.\�<;\�2<S\r�<\�~R=3�=�x~e<�́<\�#\'<�vh�:�B��><\�X(�\�*�<�=�<��I;\\�$�[$�\��G\�V<[,J�\����O����^=\�P\�<\�<#;�\�W���<[�\�;`h\�<X\�<\�&�\�\�\�<��H�r;��[�-�yU\�;ezڼ���<�&\r�\�ݔ���8:�N\�K�<�iҼ\�bH��v-=�ƚ�nF�0�j�5�K����Bϗ�C=鼄\'��*�(;$�\Z�	�\�)�yw˼\�Gv��bI�c�<\����Z+����\������<1f=����O�5\�<B\�\�\�k�<38b<U&=I\�<�1����\�:��<Th<\�\�8�*$M�\�\�=S\�=\��<�8�<�=\�jк9���\�Vм\�z<Il<n\�j�6^��vK<ᮎ�妧<\�N��\������\�!=\'\�\�\�\�<&�\�<\�P=\�\r\"<1=^���\�\�f=\'/컨���O�C�c�\�;s\�W=R\�\�<�����S\Z�U���[�\�<r_=\�pC=/�\�<�O�\�k̻���<�ǻ\�\�=�T\r�\�\��;\��^�\�\r��\�\�A�_\�-�Æ<\�KD=eO\�<X�$=\���li��\�\�<\�tF=6=�D�;M�̻8Lӷ\�\�=�=Nּ8O;{�=%��Y�Ȼ�\�Z\�\�<�dI�)B<ھs�p\�q<\�¼j�s\�!<\�z5=�\�k<N\��.�\�;�݃�J[c=�ZL=\'\n\�<�\�\"<l\�4�v%�<i�;=���F�/u{<�j\�<�;�~�\"=�\�<�W�<\�������\��\�\"1�/�����=إ���E��\���<��?\�\�;ã7<n\�\������\0�R��;?ʼ�H;��2�\\M\�;l�+=f��\�\�)�y��Y\��<�=\'�=e��<_μ}Ѽ�\n;�m\�q=m�vw)<*�E�\'�8=*/X�~��<�6�?6\�<��h�p\�d=����x�=\�YR=Di���\�\n=�\�=�޼�\�V!�\�==�1-<=,/�ۨ��q��<P(:h�#=���x��s\��;��;Sa\�<\�\�\�<��\0�\'eQ=2ӻT|�=\�;<7�Q=\0���\�1;?\�<�;<\\R<=�n�\�\�:�\'��\�+R=j=\�j��>\����\�\0=9���=w=�<\�`=6G��0�\�<{򇼡��@*\�<�C/=\�\�.�\�|\�<t\�=\�K\r=�\�#=\�1��t\�Z=�\�i\�j�\�/ϼ��<�}�\�,W= n\�\�w-=���<QCb=E�a<̨g=�\�K<�2��\�=\�\�\�\�:�\�\�<p84;\�/��s�\�ɦ��\�\�ӻ�������\��\�n\�<L=v���&�\r<g�i�X)��\�\�\�\�+=�R=\�\�<k^=>\�컁��\�\�;=~���\�\�*\�=hL\�\�S�=T\�	=J40=c��=s!\�<�`\�=p�[<�`;n\�n=%\�[=͗��3�*=A\�<y\��<�׼�A\�<G�\"�G�<\�×<\�K=�\�J�\�\�w�nhɺN骼�\�8=��\r=:\��A��<\��q�ߢ$�9Ƽ�=R����B�&9�\�N�\�\�\Z��\Z%<�\�c�ێ\�<\�w\�1(�<`\�)�$D\�;�y6N[�<\�\��=����\�3_<\�$<9\�<:��<ҏ��\nq=�w=*\0�<I\"Լ8��<.J;�׼%O#���8�\�e\�<\�\�/<B�;V%\�;h=�e�<6M3��c�{�>�vA��M\\��\�K=�*\�<A\��\�6�FE��;Hۑ�AX����L<3\�<���;�\�=��D�\�:=\��<\�⩼�<�+\�<іX=��\"�yg9�\��=\�\�=\�t��\�t��ы(=��\Z��;YvR�A;q=�\�¼�\�\�<`f�<\�\�;�\�D^A=�:��h\�}:��C\�ɼ\�h,�^�\"�n�F=\�\��.\�V=�4�:f�*�Rv��\���\�.:\�G�<4>b;⣵<�\�<ΐX�yk\�;?�.<k\Z\�*��;<��<Q\�<g䄼�6��o������\���I\\��)p=u\�\�<}7�:$�=',11),(7,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n485�\Z�=\�`<\����u*O��^��Djk��\�\�M=$<�[�<\����#b��U����4��<�᰻�N\�;����8V=��\�C�=h/�<1;�v<\�\�\"=O��^|1�\�ə=\�\�;\�\"�;\�Ă=>|��Ax\�<}\�ڼjޮ<.M�BT\�;>;I�\�(\�<	\�\\�75G<C.��s�\�\���.$<&�c=�s�<�l¼�e�]���h\�\0���\�<1�\n=\�2p<A\��\�B�d�:;4\'<	\�\�;`\0�ޓx� 4��\�A;�\�\��O�;�\�)�r}Y=0\�.�.\Z&=�|�=P/<\�\�༏K=u?K�\�T=\�\�;b\�\�<?(\�<�\nj<y\�	�=\��IڼUun=FK�=Ij��-��<U���l\�<��<G\�=s��M&V<\�?�\��<\�\������\�\�\�<\�`U<�\�6��\�E�A��<\�\��/\�9�OM�������=\�ZO��\�<\�\�<>*�\�)<z���}=)/μ\'7\�N���ս]:<�f��%<(�\�<��U�\�}\�\�Զ�НG��]=\���;�\�<6\�\�N\r=�\�=���h<�\�\\�+�缬��z\��<�ڏ�\�Z<�\���\�\�8=lm=b��=x绂�\0��\Z\�\�1r={\��;k���\�\�|���\�<�0t��1�;߅O=(\�<�\���?g\�;\�S�=��\�yԃ=g\���^��MS=�p0=A��:��\�<�AC�یK=A�<\�P�\0\n\�:F¼��z�B$+<�D@�v\�<}��<\�V�<�\�\��{�ke+:���L\�;Z\�\�;�\�M�\�}\��\0=d�{�:�\�9\�d�k�\"�\�\�@<�Y7�7\�޼��\�;��ļ*\�+�\�\�<}���\�K;��=I3U�gh���<��B�:7���(\�<na/��\��\�k�� �=\�I�<\\o:���\�2\��>m<�����\ZD=�A=\�Vi<�\��<\�,5� PԻCgS<D)�<\�-t=4r+�殪�j�:�3��2�[=k\�.=ټ��\"�1\�=87h�&��H�+\��xt=_\��<ɨx����ĭ�;d\r�<ۣK;�!v�Y���{\r�\�3<=O\�ϼ-�#<^�9	�f<䒆=2�m�\'�/��p`��\�6������\�H��\�a�<\�\�p=�b�*\0=nC��ݪ<b�E��jd����:/8\�<y��\��Ujֻ\�\�w=�\"�\�Ѽ������==>L#=�h-�zt<\�\�i�d��\�G=��^=�\�<:I���P�\�<\�\�ڼ\���\�{=�~\�;��<ܮE��.\�>=��+<O\�\��>���C\�<�+�<�A;F\�+� �\�\���=F[��u��<\�%�<i\�K=+����R&�\�!=�C<zn�;\�����e�*0\�<\��<6\�\�;�F�{<&\�O�\�b�:�\�\0�����1\Z<E��<ogǼuh�<�\�����\�=���quf����=\�c\�<\Z�Ƽ\r��\'\���x��K\�<\��\�<����/�����2�A�<tq�ʙx<�\�m�޼**=V\�,��6&��\n\'�V��<B=����Q=g&��\�Tk<\�;\�<L��$��;%~=\�m���&�\�:=Q><\�@�<43<?I��]�<-8�:2�	=\�߿��/��!a���o��\Z�?��\�ȼ\�\�ͼ\�t����<3e~=\�Mc=�V�<\�~��]�\�<\�\�t��Q&<��<pnn=�\��q�<\0W<;zK:\�\�\�=�u1�G��\�\\��\�J=>!˼\�];^���J�	=\��<\�\�<��U;\��U�\�\�x<;\�\�\�\�\�<R\�;/\�T<	�S�\�C�<T�B;�yY;�+��X8�<�q\�9��<?��<N�\�\���<�H��!#`<LjA�MM�;�3==�<�\"[�\�/�\n\�A<Gڻ±x�C�=���<c�`<\�]f���;[1=p6�<.�\�)�L�9\�N�%1$�R\�(�4����ڼ\�b��0	p���\�<��*��\n��������=o-μY\"�;s�;���q\�s��<���<W?|�5�b�>媻9I2�D���Fμ�\���Z=<��<6S\���ϙ<~�����5<6!\�7;���\�������\�=�\r<eNH=7\�\�ig<�L{<)v+<�<9u\�<�\�	=\�\�\�<\�E<\�=�\�\"�\"8_:\�xh<-�V=ճ����<�Z<`�μ�;\�<*=���Í=w6��q˃<a\�=(�<�yJ��\�;�q2��=\�g�<�\�<;���Ū\�:����{;仛*(=ݵ�=~];Վ1=\�D\'��u#�vK�J�m=L����\�\n=h\�V<Ȁ1�\�S�<����E\�;M�7�0�.�e�<ՙ���F8<Ȯ;�H\�;g}\�;��Q��9e=L �<��f<���;\�D=�\�<e�$��\�*����;\�WU=\0�\�;���X��\�\�<\�����\�;<1\�=LG�<��\����z��e��<\'x^<jw�<\�<z�P<\��;\�\�L6�<K\�A��`H�D\�[<\04�;U�ü؛\�<$����t�܆���\�/<Q\�;\�\�<��\�<\�>N��\�;y\�< ���:\��;\�\�I��\�\�׃�����;���<PB���2U�e\�%<Xs�<���<��Q��\� �\�<\�c�����<�˼(~�<E\�C�9\�R=!�d�t���M�<E<`��\"\�\��<E\�=\�`��\�\�f�\\;4���~=\�EY-=}fV�,��M\�=����-=W\�\��\� \�;i\�\�<wu��\�(\�\�\����=Bo��o�<\��<\�Qټ9;-���R�Ո̼\�\�<\�@;pâ�&\�\'�L�9��v=�D=�󀼡z\�<K��<8r��Ӿ�\�ƽ��K\�<9�#�7Ԗ��۶�q] �y=\�<�\�<Cy�<\�0�\r�\�<�\�j;|%��t\�:A�/:�\�/�\�\���\�\0��\�B�T��;X�=oC��Ds�[\�Z�ˉ�\�f/=[}��Ƽ�;�\�\�<5R\�:?\�g<X{,<����\�w\�<$\'�<&\�-�\Z\�\n=��[;��\�<�P\�\�\�<��$=\�\�.�k��<\�N\�;;�L=gM�H��<�-�\�L\�<��2�l\��<\�t��\�*=\�\�<\�>	��}��\�<|�\�;5K\�=k�<\�d�+�\0;�\Z6<Wt=\� ���k\�<	ݻ�5\�<C߀�o˝=���<�vR��C�p�\n=�\��\�r���@�e=>\�\��|�\�<��O��I}=i楼�\"缗|W;_�_�M�h<ފF=�3սk\�\�;\�\�<�n�Y{_;{�<Ֆ�==߄=Ô\�<lz=�J�tl\Z�3h��_������\�@b�0>��V��Vr��Ѽ�X=\�X�<\���<p9�ܼ\�<\"=sV滟\�\�<\�\�ἽT��:��ɢ9=k\�;;�=��ἈKt=�p\'�[�{�1\�#�[X*=qB2;\�rӼW\�<,�;�\"���!;��\'<{\�<�\�y���\�<r-=]�\\��ݑ�\�L�<�@�;W\�ۻd�8�V��9�a\�=\�!{���佤\�\�;\����-�DL\0<�\�\n�\�¼~_<\��\�<��uu<\�\\�<\n�����q�\�\�<-u��1��<�\�#=���<�ݻ$u)=\�2�\�\�<�!�<8ю<u\��h�\�<��U�l!b�\\Z;\���A�.<qMU=1\�|=\�L.�Dp*�l\'�<\��#=�/��Q?�<�\���r3�\�\�s<��\�p\�<h=\�ܧ�\�<+0�;����\�g2�\�\�;0!=L���\�=�j=�5޼�\�\�<�\�6�H���2F��YE=C>��\�M:\�K=�b��m1���K=\�׸<�6\�;4S\\<�\�Z<L\�#��kG=��<\�P\�<��d<MC\�<Ԭ�<\�>e<iP(���=1��:���p<Uo�*\�%���a�o�=!Ru<(��u\�P��\���_����_=퀼��;! I�k��㣴<\�\��\�R�⿛�\�\�ʼ�Lt=\r��ң�=z\�=��ֺŅ�<&�]<\"��<������Ƽ\�/\\�z\�\���]�����KM=M\�\�<���;�C����<ZA�<�I=\���]�\�<~S#=��<n6�<\�\�<����<1ظ�8J<\�d�\�d����A9	3��ټ������4���={Q<ƒ���<)TT�\�\�d�\�D�;�8Z��\�,=q%��X\�;\�\�<�\�ڻ==\nmY��)N�݂�<y[q���\�9\�&!;�\\���~C=�笹s\���~\��<��:\�(\�;[&����\�<n}n<yM��BĦ<q��<���E�b=��x���=�$�=\�=\�O��\�w�9Gmt�H\��,\�6::���{�2=\�g<t0�<G硼uͯ�D\�\�;_�\0��<�Q�<m(:=3\�K�(��l\�Q=�\�q;��\n��@:=���=\�WO��\�\�<',9),(8,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n\�K�<�0\�<x��N;�)��\'/=�\�)�\�5м��9;�_��|4ټQ;żF\��;��ϼ��ϼ\�s\�<\��e��ͽk�mej�e��Uۡ<��P=�\��;ƨg=hZ�a���\�=(O�a=8�=����N<4��@��;�[�<�܅��*T<*��<s���\�ƺx\"\�RF	�\�6\�<��=\�\�;8�<S���-`�=�#=x��=yS-=��<=�ڏ;S=<\��d��\�\Z=\�Y\�;\�<eő<\�����\�<��\�_\Z<�\�!������\�;p6<)\0�<2\�)=\��(Aj=�>s�s�,=\���<*-;\�\n]��\�\��:\�e���j=4�=\�\�ȼ��\�<��=$\���\�\�ƻxB=dp7=V\���\��<Ƃ���=�z<]r-=wf�<\�K<�T=33�W&�<i�-=\�\�*=6���-==\"��8=X\��<R��<u�=\��m<|u�<Ⓚ�L~h;\��<:\��Ε@=a�����;A\�\�<B�ļn�a�\�L8��ؼd]w�\�	�e\����H=�:=\�\�<\�^��a^=�@%�L��<�<�\ZQ��tWμ\�v;	�\�<���<j%-��@=�\�\�<�M=\�b�Rn��A<��O=�\�<g���#L����j�D��:z�<�|�=\�p	��\�x��o\�</� =�\��\"��ބ��\��}$���F*��\�;h���H,���Ż\���}&=�R��ٓ��?B���$��<��\�<�\�\�;�\�T�~@��Ww�\n���\Z\0=K����\�ۻ#��bT;;c�<*\�0�<\�¼n�PO(�	\�<�K\0�*�ɻi�:�\�;\�\�=�O=َϻ���;�\�ݼ�\�d�zW\�;\�7��\0�e�\�\�\�<\'0��a\�ûGn\�<��U��\n��ե;\�b�\"�\�:�\�4=�e9�T�\�\�a\�V�߼��W;ݭ%<�\�=7�<��=���<ɖ�<\��_<�\��\�\�\�;2[���q�</h?�W�=\��\�n\�H�\�l\n<eI.<\�N�<J\n��\�#�<ת���D~�\�<\�JD�$��o�Z�(\n��\�nU�>�ʼ\�\�\\<�r�=�(��$Z�=�3=�r<?����o\�;U\�<�\�;\�\�\�<\�ػ�U��\�`<\n��=�\���aф;\�C=X���Xyq��o<\�[�<\�N��j<<\�N�<o�;P-\�<\�V\�:>c�])%=��ƻ�\�H=V��;]\�T�\�;�<�\r<J�5����<\�\�\�;�(v�d\�¼3�<�@\�<����+YM=�\��\��9�fp\"��ꖼ\�@\Z<\�\� =28�{!\r����I�=��ȼ�\�\�<΋�H6\�<G�=;[0=\�ȼ:�ּ��_�Z`s��Yh�f[<\�\�<m(�\�7V;�|5=�p@�u���\�\�<p\�\�<c�<@�\�7lݲ��ᦼ\�v���\��=�[&=N:�<�w<\�\�4;�S׼\�,�<��]�Z>!=\�N�<���\�7�<#�!�5No=\�\�<?�\�<�c.;�������\'��\�\�6�ܸA;\'\�0�\0����\�KL��-/=٢<hΡ<?���o�<e�<�\�\��yS�<���*M\'<��H=�\��<%<K�<6�*=s�=\"8�9\rx����\�<5 -=��\�Q�j�;<��S<sX�0!\�i��� �\�w¼\�\�\"�\��nݡ;\�6�<I�<\�F��\��#Eg�\�\�7=\�=\��<x��;b�=1c�<v\�1<tc\Z�\�<2\��<q\�C\�D=&\n�<�|����a=\�7�<x\�=\�s\�:K�.\��\�%�\��\r`\\��><#�y=�\����V=ټ�;:��<�֘<;��hD�<r�B=v�@=\�l�\\ϝ<�jY=J���M^�\�\\�Ro@=z\'=f	��\�d�����<u��<n9�\�[�����\�#=�\�ļ���:�U:;#�M+=\���;��=�l��\�g<,��h�ȼ�\�4=�_G:@\�� \�M�^����ȼ\�.\�<˂�<\��L쭻�8��x#�;;\nݼ\��μ\��;ݬ&�\�S;�<\�*�=f���v˼w��E=\�F{9�i<\���{\�!��#�մ%=>U�a��=\�E*=\�Ҕ;\�i�=\\r�CB\�<r\�j�<n�=\�t�y\�U<�\�h=a\�<\�\�!=E\�<A9I=�ü\�\�\�9vD�-�\�;\�i\�;��Ļ�i<\n\�#;@�\r�b����,��\�C<֙v��\�V=\�rһ�L)=\n\�;u*�\��;\�\�/=�\�\Z�;O������3=��n�\'\�<�N\0=�b��5���˚\�\'V�<�=�\Z=�B�Zp�<D\' =\'N�<\n]e;f\�t��@�:(��_?��)�=FVڹ4?\\���M<]\��\"pͼ�ڮ��:�tU<=�\��<Ff��a\�G=8X+��E,�����u�����;\�S�<�Tb<��:�j�0��\�x\'�Y�@<��Ǻ�\��\��f�\�[=q?\�;\Z��\�)\�<:�`<�-\�;\�|=ʝ����\�;<�X���=��=�xK=Z9��To��\�ay<��<�qO���<`\���\�g5;\�*i<\�\\(�?\���;\�M\Z=C�A=\�A,=y%\�<\�T�4�n�l:*�:$\�n:���<,\�<[O]<�߼K��>\�ۼ����[y����;\�\�O���,;\�\'\�<Ub\�<�\�\�>3K=\�\�9=\���ѹ><��.�\� N<P�\�uh={*P<N\�:��\�<\�}��\�\�<I[������L�,qǼ]�м�V�\\�^<\�D�=\�\�Ż��<\�T��\�ߠ<\�U*���\�<s���\��<J��=q\�4<��0�𕼻��/\�=i\�=\�Y;\�g�<o�,��\�\�\�X\�>w=�V��\���,9�zԭ�!J�zs\�;��u<��e���\r�\�?=\��<9�v�\�\0\�<\�=\�\�k;:���]�<b�\�<�5��O$��|�4X\0<丟�\�\�<k�U�S@�����<\�\n��w��䱼cCN<ҳ<�M`=aG��)�;�S5<�;(<���<�\�+<��&<�\�;\�3^�\�,<C����\�==�l]�i�F=�\�;c�I=tPW=)\��Pu\�;~k�<^�\�<\�H<@M�<��0=(E��s\�\�<�/<�2^<O���\�=?��=��S\�b�+\�\0=r�C��]�\�:#=8��s��Y�<c3<� ��Q�\�hj<�����~o;Ϯi<F2���2�<\�\���\Za�\�ӌ�Mg =KX=��;=/<V�����\�~�\�kӼOB�<���<l\�S=p��<\nX=\�ݚ=\�4�\�缂\Z;w��)�R� ��<�\�.;\Z|�{q.<�\�R;� �<\�<�[<$/o�Z4i=QL/<�*�����<D=\�\���OB�b6�\�~��m\��+�OV=9+��>\� =d�\\=\���x޼\n\�\"�\�<P�\r<Zrú\�r��\�;%\��* \�=uUh=�j�!M�<\�N�;�\�\�;o/�/r���C��!\�=�0�\�}J<y\rм\��<��=E\r�w}��}l*��yn���)<�4���47�\�=��{<WY<q[����<\�ڣ<.�<q��D</ɘ��؂�}��<A\��\�\�=(\�\�I\�.<��\�<\�D%=n�\��\�\0��3=\�\�<a\\�<g\�\�:\��}�\r!=�����_]�5�ͻ\� ��|]��  P<�>�<�\�\�;R��x\�l;�)\��䤷<����j\'<X\�ؼ_ҧ=H,�<yR<u!=\�4~�4�,=,���+\�=\� ^;W�3=E�j=�T9_\�;�z#���\�<�~<杼>��P1;s\�==dJX;��\���\Z=\��(=��Ӽ^�g:_\�ȹ^P<ĥ�<��&=0�|<Y��<�q���&ּ1\��%�9�R�<�e\�<!�=[\�;�sK�F��d����V<A�;\�h���W9����/Gd�عQ<�\�ּ4���m޻0$R�\'j5;\��<g���dԻ<`[=α��\�\�9��푼\�%�e\�n<���	�2:\�=A�-\�%<X\"C�#�\n<X\�<���xd����=cN�8\��(A���i\�<�\�<����\�4<\�\�=�چ<=\�9=j5ɼ+N|�\"��=\�,�\�\���\0���yj�<V\rG�~�<vP�W�e<��m=e���\�:����,�PuԼ*���SEw<q\�ܻ� ��x�޼���V�,�U�8<\�`:�\�6C=<\0�<��s;\�k�͙�=���\"I4�i��=\�%\"�lDi�\�,-=\Z\ZN=�\�<(o�\�*�<�&��X\���avB����<qT�\�]	=#�<x\�G�\r\�O�E\'<��;�����Ǽth��\�lȼ��:D=\���[Z�i\�\�;��\�<I��;a\�軒�&=4D\�<�.�XDF<�D�<2n��}D<R��� \�<H[#�93\"= ���wc�Q�y<\��3�6%=',12),(9,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n|g�<�-!<\�]C=;d��\�<�\�;�O�ӻk\Z�;��=e\� <��c���\�;^�\�<\�[Q�][=��=#\����7=۠�<��;\�:��\�h�j\\0=�\�<�F-�\�F2�\�\�}?�6\�;\�\�f�?W���cn<!�2� \��;\�\�#��t)=�0���L\�(�\Z�\�	м}Nλ<�\"=���y�\�\�\�F��2�;�\�\Z=�>!=k��k�y=�P-<}��<2\�*<\�\����\�;> <�����}�H\�<:`�:�ed=,\�;0\�߼\�;鼌4;�����75=tJ��x�\�<}�\�;U:\�;0EA�������VS:�<�	^��\�F�G\�\��߿�<|\����8%=/w�<\�\�<\n��=�X��|�<\�NN; /=|�\�;U�\�\�m;����\�Y\�<jk4�)n�<��B=�xS�d\�<�l������\�\�\�veV;�c��@j�:W6��m��`�<=��<t���\�\�<*�n=ڎ<?��;�T�<\�D��b�y�<\�v�r\�<+Κ�~\�#=0���H,\�<\�\�<�\�<\�2�|���2b�.��=���\�m� M<D�r<\�Y*�R䈼�r�<�\��/���b�=�<\�T\r�,�����@�\�#��\�AC=���$\�׼ݩ<��\\<q���6G5����=4�\�<Cz:���*�x|=0N\��n&\�<�5��\�p\�<_\�+<\�/\�<\\{I=\�z\0=�YN</\���]��c\�\�<h�=����\�\�\�;51�<�=^) <W\�5=\�u\�<&T\�<=\�\�;vOk�\�;�7� 1m; F�<-\�[;��ǹf-\0�#瓻�\�z=\�\�:\�\�z=?\�v��R��6o=��*<�F�]���d\�\�әn;]J��*\��:\�?�\�_\�h<\�\�Ѽ�H�<F\�\��5�\'�\���\�\0�=�)\�<\��ƻ\�\n<J\�ؼG�\�<e��\�<\n=\�P\n<�0&<\�\�;��^��ǌG��\�\�:\�<�$�Z=/\�c@�yjf�t!�\�]=\��;Wz��Fͻ\�F\�ʏ2=\\\�\�\�\":�\��Ҽ�v\�<�T�ar����\�;����Gf��\�H��\����@:�\�ۼ@�\r(\�6#�xCB=d�\�<Uo�<}e�<.�*��n�#\��(5�������蛽\�\"��}����<�i;�\�\�5=Q\�w�B\�B�/�\�;l�;\�N\�<譼�y��+p�w�c�(��+\�;\�\�[=\�b<fA<\�ġ<�x<\�듼r}M<�\�t�ٸ\Z����\�[�ge�<�}%<\Z7{��HS;W	{=q���S^>=�B��U�=��=ƽ�=�\�R�\�\0��k}��\�\�;�\�\r�C\�\�:j�\�<=<\�E:��=V�\�<�]/=\�3\�<Q^��K\�~�=�G\�<\�\�>=�\�I�i�<D\�P�aS\�<T�\�RP;��C=f���\�쉽\��p������C��ǒ\�6�J	=Ҡ<1gh</ͭ�y�M���=��\�<׼��ɐA=i ��\�<<\�:(��\�-;�>�<bO<=�\�N<e˼\����.�3�f\�\r��M=�3^��,!�����*5�&�\���\�+=8�;�:-&�	���\�\�T;	\r\�<|b!�\�=V =WU\�<\�ǰ:6\�\��=d�)~<k���q�8�.�\�^/�\�O�SU\�<g�Bd弯И<4��|\0=�t;��\�;�<\'\�)�EXN<\Z�=\�Y\0=\r$\�<��<ĕ��\�u�<S4��#kU<����r~�\�n{<\r\�������i#��&�<g涻\���\�Y\�<1�]<\r���j��{\Z<\���Ut��;�� ��<\�\�=\�,9=�\�F�l=k��<\�׎�y�л����&��\�\r�=����W\�w�<�\��k��f=\�&���z;M�Q��Y+�d���*�u=�\�ѻ\�m\�<�\�\'�\�\�\�\�<\�\�=\�[�\�\�<`\�J��\�-��v�G�\�<\�\�C=ɽ��i\�|��\0�;hK��;+�\�\"��?tK<��t�&\�<P:�<G�\�q\�\�L%{�\�\���\�;{L#�P=9���%����\�|��\�;\0\���\�\"�<��<ЅV<@�U=���;�{s�۵ֻ\�TE�VG�;i\���W�4�Z����gU�\�祿�\�?=\�T\�<1��\�Y<{��\�Zn�\�U=R\�(=!\�;L\�2�\�����켻�Իi�=Q\��Q>�<��¼J%ݼ��м�\�\�\�f��<\�S��<�\��k���\�\�<V���\�\��<Z�x��kj=���=\��;�v<�5>=�R��\�F\r����/�\��Ls+�W?�<\�\�\��n�_=��ƍ7=k\�=�\�F�LU����[�=k;I\'~�XX<=$K�D�\�<27\'=\�	�;��9߅6�0	\"��\r=\���=	ּl)#�\�7\�<\�.�X*u=\�s߼�����\�k�	6�<\�^v<1�M���G��j\�3u\�<\n\�: \�\�<*Y��\\\�I�$%�<��<\�\�;\�;x\'�<�\�\�<h`���\�N<4���=\�]=���<]7��q����\�\���V���ۼ�G\��<=Y�<�b�=�&;�=��\�<�.��\�r���?=\�R�q�\�\�4J<\�ю�x\���WҼ�ꊼ�{=���=M\�>=l���!!}�v��\���-<��\�*=\�B�<�;ڼ4*������O�\�K\�;�N�;����J\�7�\�\�\0�\�l=s�W��=?��;P���\0c�]ݎ�J�<\�\�\��\�\'a=T4��ɜ�=[\�<C\�<\�vD��1=�\�|�\��\�<`W*=�\�<\�I��Ȩ<��n<�H+����܌A�h�=�\�8�ۺW�X<z\�Ƽ\�\\M�N�\�<sL��IZŻÓ};ϱ<2q���\�ͼ��L;r�y<���WDz�V\�\r=�~�:���<\�\�\����<2��<nI�ˈ��GG�b\�\�;�L\�;�5��D�޼~\��w��<�}\'=(\Z��cpW<�\�E;4�\�<�\nܼ\����RJ��\�i��\�l�E�ټ�w<6ټӈ����<\��;�4*=�>=,�\�<\���<{H%=�zC��8��Iy<7x߼5y�<\r><�g<����g�Vf1�\�\�R�\�\�;�	V�<��$=\�:;��U=�1�<�\0�=L�#=OB<\��<H\�=_�o�\nd�<L<���7\��f\��\�`\�����<܄ʼ\�f�L@��ֵ<����1�\�<Qao�^��<\n\�>;E\�ԼT�F<\r�\�;�o2��_\�<��_�9�<\�\�̻k<C�<,^:�\'�<\�}�Ǹ��t‹\�C<F�\"=+\�b�Dq=�\�<�N���\�ż19\�<\�K�<<�;<kb=�û��:?>�S�$��Ӈ<\�\�<f\�}�-\���\�<�L\�;\��<�1��K�\�<�1�<���De=ݷx=\�\�m<�<샼\�=\�==2�P=\�Y\�<\'���Y\��,C(�\�\�e�2<\n�.o�=@���ȇH<�D�<\����\�\n�Y\�<Ri�9��=�Qh�\�70;^nʼ\�|�=\�C�<�o� r�B}�i�=H\n���/*��\\���\�;@6H<QX<��������\�t�i\���\�I; �\����<\\\�S<@į<VR<j\�}��l$=\�=�<�B�9R}��n\��\�n��\0T=H��<��=�\��%�����<�5�\\\�ۼ�Ù<\\O:<��<�μ��9s�=�n���l�;\�\�*<Z:�\\9�<?Eм>!\�<!�{�����$f\��L\Z�\�k�VZ�;J�ں&O�;i[<\�\�y�!/=܆/�WJl<\�p;@�ļ�JL��#ػL�����\�5�n\���Y�<�%?�\�ች,\��:;\�\��m�-=ƼO;P�o=��\�<b-=!Z�<�\�<\�\�\r�¥5��z�<\n\�}<N\���0�;�d���\�<\�P\�<Tz�\�Lj<�\�\�<ަ_�\�e<�\�<\�D��\�{�ޝ6=���\�ֶ<���<\�<�\�0:\�.<e{<\"E��<\��\�K����<i��<-��5#<\�4<o\�<�zm=g���|u��4F�k�:�;(\n������X<\��=��X�\�2<=W	�\�u$<Ć=�\�q�\�\�h=7«�x���\\3=2�L�\r��;\�c\�<Q��<t���\�\�<S���sl=+=ʂ	=\�\�h�8\�x�)z\0�\�ƞ���к��\�<#�`<�\�ɺ\n\�0<t��<烵<g@_<G��P<����<Y�l�>\�=��\�;�!���]c<۷d��\�<��:=F-\�<aވ;��w��]=Y?!�qA�m\�p�;\�=�`\�:��\�<\�a\�\�˼����9Dw<�T�� q��B��W�\���2\�<�ߺ�\�<��\�\�M��;\�F=\��ɼ��\�<@�輇&��\�X<&a��\n=��0=�bW=TjR�\�\�\�;R\�_<u�\r��\�<\�\�<>E�T\�~<���2K=V���c\�L�V=,<�\�<Xz��\�Ù�﷙:OG�<(\n�:',13),(10,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n���<�C;���#\���ɞ\�;\nV;u\�(<<y<�a�<�گ�� =\�\�<M\�;<�\��;�}=脚:\0�<q\�=L;Ҽ�\"�=\"����ﻡ\�<KhݼpNU�ЈV�\�\�l���D<���;\��_�\�\�Z;*m;�ߗ8�{p=\�I=Ջ?=\�I��\�r<\���\��<e\�U��\�v<\nj��\�\�q<\�\�*<\�F��y�T��=�LƼ%\�0<�\Z+<����\�\�3/\�N^;\'��<䩈;3���2 \�<�,=\�n�<7I�b!���{\Z�y\�l<\�+��96;qi��\"l\�<5㼭j!;\�\�\0���y=��	��\'=x+>=@\\��Q<09Ӽb�\�;�w)�\�3=Րͼ�t�<�ք= �ۼ\\\r=\�\�o;B�>=\��7ﰼO=��=Jkl�e_�A3��p]\r=\�\��)�I���\�E��T�B;��:����9��؞�d\�:%\���\��\�T	=9\�u:\�R�_#�<հ<<\�+�@�<I�O<��Z\�ݼ<�\�8JF <�e���C=�8��Z\�$;\�u��\�>|<\��<�\�;�\��\�\�<F1{�>D�<�8��?t�w�P��\�}<j�.=|:3=%-\�;.��<>\�!=Q\�K��jn;<��ƼZY�<�*?<\����N�»\�\�=�\�\"��T�~�2<Գ&�\�\��Z+L<�1\�<ae=�3`<�\�l;\�綻\�M\Z<\�C]<H\Z�=h<3=\�6�s|���<�P\�t<BHݼ�(�[\�߻C֔=\�A�\"\�t�S\�\�<Q\�a;��4;\�\�\��F5L=�\�\�<<s=\�6�\����\�_�\nm�Fg��v��=6\�v�\�\�<����i>�>\�=\�+�ΆM��4��B8�<j�z=:�!\���������vO��\'P<~E�<�_�<}\n�ͽ;��О=|��<�颻���;\�1�����	2;\"C�;4\�\�9�B��I\n=��8\�\�\�%;t����5a=\r��:$\�2<\�e,������!R=�K��4Ҽ�9\�:��b�\�\�F=Հ=\�����\�n�\�x�=P���\�|�tv�\�\�~<X\�<\�\�#�Z�X<�\��Wm~<F�ռ\�E�<�\�<\�^�=$��<\�Ʃ<g}�;�J^�lCv�V֛<\��]�;��<\�2\�<�\�r����ٙ<\�D\�\���1\�\�;O\�d�EY�!B��\�W=�\\�V\�\r=RU�>mp: b��\�4t<��;\�ԗ�X`=A\��;�\�⴦�G�!=��A<Hwn�|\�r�\�=�O;oѼ��=\�W\'�\��I��f�� \�&=ɛ\r=�X<W!�\�W=����:�9;K��\�4����<�\��;��̻�~\�;�IW<\�=Y =\�U��\�\�]�\�\�@=�g\�<B��\�\�\�;\�Rc=\"<�;0�\�\�\�<\�Ў<�\�\n���>��[=8*\�<(�ջ?S==\�T¼\�J1==\n\�<\�q��\��<\��<�5K=�\�W�.\�<8\�l�\�M\�<n�;�vS=\"�.�\�ټ�\�<��;c\�\"��\�g���=\�<\�ż�lp��\���Ë���s:\�=\�k\��y��U�E�#D\�rx��J<\�\�C;XP7=�\�^<~\��<[\ZF<��߼���=4m\�;\�\\�; f|�J�\���\"\�<;�<���;\"\n�<j\�\�\�Ĭ*��	���_�}Ȁ�z\��:�\��<\rBg=��<b\'�;\�<�;�;��\�/��g\'<H:=�\�\�bp=W\�B��򶼣�ƺ�G=�]�<�A���~.=��<\�{G�O�-�g\�\�vʔ�U���\�<r\���_=�۽<JI�<~u=$d��\n6����;\�07;dû/�i<�u�+�<�\\b<\�L�� b<R���<\��t\r%=����\�\�;�9=W��\�7=�ZB�\�vL;@\�<�<\�\�%~J=�ʢ��:��?�7\�=6v��\�U��\�<C�\�<��<u��|�Q� @*�-X;\�*;�%3��g^<>�����{�\�\'�\�y;�=H\�O����9�\��\���*\�	==I���ɼ�	M=\�z\"�\�ŗ�\�\�*=�-\�J�e\�\�<�\�x����;�\�;z0?�P��<�Q��6\r\�R�<��>=������<�m�CfM;�\����T�A��=�\�89Dd`�|\�S��m�G�����<՟\�\"��$0\n�4\�h;\n�	��\�<$\�S��\�>�\���j6�\r{A��0<\�qb���\�<\�@]��9=4L\�;ɽ�<�F=�\���\�{��\�Q<���\�\�\\�0�{�S=M���u=X���	E=���<�/�D��\�C\�\�J=\�\��Z1����<��<�\�(<���<s��=n\�\�<{E���:<\�u�e:�;�=�G\"�{2=1\�=\�\��L\�<��<\�d�ܰ¼��=�\\E�1�(=j�c<\Z�=��<��X<�#g<\�=Y^;\�K�<\\Q��<\�*��y߼�O���B=\�<ʦ*��\�6<\�7=Y׍�GX�<l�-:�\�;6\�\n�V��<�]\�<IG=_Ǆ=�\�<z4��\�\�<8�:��I9�=|=\0<��VǢ�\Z�\0<\�\"0��/2;KC\0<��^�Sź�\�L;����\�G`�\�\�\�:\�<r�����\�	y�螠�Fvz�5\r�M\���/�;\�١�������:ww\�<�\�e�c\��/��L��Z�$=�r#=$\�_�\"���\�r��\�%yû��=\�[=\�Wi�6=��;ڀ=F\�7�N\�=\�˒<�4�;���L,<\�s\�<³�=�\�g��\�=6ۘ��Q�\�)��@�<����\��м\�K�:����8\�R��4\�<\n֗�qk��1\n\'�#\�\�:<z��b\�V0ֻ�R;\�\"��\�F���Y�</61��pֻj���\rs����ٻR�켚\���\�TŹ���\rmʼNx\�<�X�\�A��j\�<1�\�<��t��E\�<.\�-=9<\���\�\�<�\���׌�yɮ��ؼg����7=\�v��\�\�<Nכ�Ѥ�UJB=\�=\�=�*m=\�*��\�ﻘ�|<k\'t�\nC��\�}\�<X\'�<�\�ٽ��4=�(��r*=\�)��Y�ީ�\�DX=4\�\�9_�A;ĕ=)Y�;\�c<o��\��=�@u�\�w<��8���\�<]G.=\�Y��\�\�O=\'\�3<\��L�E�g<��<�w��;�\�<\���iZ5�~l=���;\�樽�\�H�0Γ�\���<y�p<�8I<~\0[�y\�<q�\�<\�\�\�<�Kϼ�R��$��\��pN)�z���`-�\�\�2�X\��<���9�����J<z�\�<\�[<\�\0=�;t=�\�W<Ae����ν@\�d�=�\�2�<�Z�����z\�<��;/Ι;䭺\�K=;�<8(*;\�R�\\X�<\�P\�;C/\0�{r<\�\�\�:jK����\�<�蛻݄=<JzZ���?=N\�<�=\��:\�<5�\\�m\�=;��<\�L\�<\�A�\0\�I=\�y�����<$\�ؼCn��rT\�!T\n=G\"��vg�}g���Ҽ�D�=��c�\"�9�/��@)=X=6�\�~�:GK���߹�و���=\�\��^;\�?	�\�=o#���%N��jҼm/��ͱ\�<n\"���@;\�@\�<�L�@a\�\"\�M��9=#\�0�G$�A�:A\�<�G� �\n=y�<@��<A��\�\�d=Ä:;�&�O\�q�Ʉ�L�7=2���,I�<�\�<�\�<\�r��}�/~�,��\�\��<�9�\0�H�h<UU3�J��\�\�<tR�=\��4¼�\'\�</=���\�\�<\�\�\�;\��}\rJ��\�\�9��¤�6R=\�=~\�\�<z!\�<�9<Q��<\�\�=摦�:�+��;e\�M�IJ�<\����|=~\�\r=J\�=c<\�\\O���%<\��<�G=�B.��\�>��\�\'�2XּJ =��M=DK�<3�n<Z�:}\�\�;���(J�\�90<�Y�G���$�<K`\�꿪<\�6��ϰw��\�k�3wѻ\�<eX�<[q�\���w��\�\�j<K�=�\�t\r�*F���\�;��?=�\�\���/\��]=V��\�[�;z\�=��FV=\�]=:�<\�0\�<\�\�t<�\�E<@\\��)ڐ�]�L=i���\�ü��a;W���(\���\�cu��һ\��	��rN<\�K:�Hy8=��<\�	����:�I�\�;&=*�w=z��;pG�:tWk7貽2��:3�\�<] \�<<E=�0�\�:�h��Љ�QD=Q\�<��\�;�i==.,=\�D��\�6\�;\�m;\�\�\��<��\�m�\�;\"+\'�s߼�\�\�[���/tH�oW8;jU\�<n5μԓ/�Ĺ� $��3ļ�U�X+=v����\�\�<\�\0\Z=0Ue�fc<�/�\�<8x�<��(��k<Ǿ<᩸��=��\\(��\�Z<\�$<�\r\�<��;�\�;\��=&�ȱ��',14),(11,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n\�`��u\�\�<	�{�z\nh�}|�b\�=t,\��\�\�Zw=RO)� Z=�\�0=�<�y\�<�8�:\\��<s\r\�J\��D	;��6�<V\�Z,��U\\�9	��ԛ�\�߻��\�L��Ā�̴�=�p���dM�\�e�<\�g\�<g\�\n=\�Q�9j�;\��F<��\�x��,;;��b���Gg;\�\�O�\ns��x0�1}��\�0�Y�J<\��J<�(�=*%+�V��;�\�<�\�E;.��;��\�\�`<48t= ��<���<\�\�n�Ł <�\�C�Y\�e�Z�0=�\�=��-��!z��<ɏ�`۪<��ϼ�:C=� <�(=h\�5��\�C�\�%�<�Q\�<ܭ:�\�\�e����<꿥<[��=ƻH=m5w�\�&2=k�a�O�t=�K��qN�;ë�;/�8<0`��\��<~^)�q��<:\�<\�\��<\0%~���s<s\r$�r��)�N�ug�@\�\0����V&o�<x�<ƚ��[�����Z\�M=\r\�x�X\�;1�;�t�\�I::Fܼ8}; ����i/<<$�9��\r��2�<\�-<-ˣ���&�\�6����<H�\���{\�<Z\'5<\�\�l<\�*�\�\�\�<�\'<s\�\�vu\�:��v<2S�	�ֻP\�G��g<��2�X\�\\<8\����s�]O�<\��.�P{μ��H=\��>�R\�=J,1<B]�<oF�<\�r�V\�~���r��8\����Щû���<�KŻ3�>�Eu%�f�\�</yV�g�3���xz����\�<_�D=ď\�;�J�<\�i\��#?��f��\�g�<\�:���C�;\� �M1��fM\����ͻ5=6��@��\�cJ�C\�\0=\�\�<̛��\�&^�.6\�:���f\���\�< Y\�<g���˵<6�^<\��\�\�\�\�+\�:X\�\���J#�DpK�\�U\�;\Z\�=�	>=��$:=c<�<K;��\�?�;{�^=����r7�`\��D��E��\�ʼ�/9���)��\�2<\�\�< \�\�<\�\��H3��\�,f93\�9<�D\���\�=\�y}��q\�<e\���\�\�;�rM�q\�ֻ�+.=Y&ü\\� C;�u��n\n;�\�W�\�q\��\�ռ�V��\��n��%x\�<n�,;�\�]=\��;�&�0\�\�+y\"=4�X������\�<\�D.<�a}��h�<l����f^�\�\�\�<��\�;��\� =&��\\z�=@��\�\�ʼX��=W\\T=Tܼdx:;����\�Wѻb��;%B�9R\�<\�;=\�\�ͻ\���K\�5��$X=:\����<\�兽�\�<���<5Ϫ<֧<\�\�4=�\�-�z=̐��B�=��<\�`�a\�%�\��<*��\����NN�\Z�G=w�9:H_\n�ќ�1ie=`qh=��������F�<;��O<gf=,4�*?\�<\�\�<=�_�\�k���[W�5\�\�;\����}�<�d=�v��\�c�~\"�:\n;E=\�	\�:Dh��\��L\�=�>���ռ_��\�9Լ��C=\�\�=\�\Z��Ŧ���vq�M\���/ڻ\"\�L�`IB<�p��=\Z�\�粻���<��#=�\�=dmü�s;L�ؼ�o��rӳ�)f��k[<j�\�<���˽d<m>=��u�<�\�K@<\�9;�dz;y�м�)��\�@��4ټ���f��<^��;�\�<\�-%� �A�(\��=�f���+�<\r���N輖c\"<Ŀ\��$�<�8=z\"�a]\�;\Z�4<\�$�<�\�=a\r�<\�3<\0k<�\��܃=��\�<�;f<�\�R=\�a��5|t<Pm�<;\�C=��8�9gb;�\��\�$�;��=\�\�Ｕi�<\�͔�\�\���\�߇�\�Ǒ�Z<c�<\�\�;\�Ԧ<\�5�<\�L��\���/�;�Gϼ#M���,=Z�<S\�=ݮ�����N�B��ټ$�^�\��\�<?~\n<�\��J\�3�,h�<\��q��Р<\r\�1�2�<m����E���������P\��z^ϼI6��\�=!���\�\�<y\��3+.�۔=q\��\�2�<T\�\�=�$6<�\�h�s͙��r<����6j\�<\���}���G�]��t�<\�#ּ�q4��L�{\0�=j\��\�.��[M\�~\�=o�I=��<������\�<�\�N�\��;�mǼ\n�=\�9��I�8�0\�Y=\��a�����i�7=+�E��\'ѼD�<�=~;у#���<\�-�ƈ*�2e�<�fF=#L\�<��n���Y��\'\�;�3��e:=\���<t9l<�F\�ʶ����ɻR\�ȼ�\�����S�t3;�\�a<=�\�<���9�U\�;�ۇ=�О�����=OI�%���ҼPY<ޛr=\�\�\�<y�<�K��\�\�<�\�޹C�E�4eh;pݺ;��x<x1���T���!<}\�i<\�nq�\'���d\�@�~���\\\n=��V�$Q�;���7<\�u�\�ټWf=�ۆ���}<�/�o,�jg�<�\�$�	M�<���8�ӻ\�==��<\�9[�\�V\�;%��$�;��\�:t\\�O���\�cw;f��2;�<\�\��\rq��N�\�;�f<\�8�=�/\��B��\�\�<��\�< ˘�\�|n=\�?Ż�=������\r�:V\�\�<6�G=d\�\�<>\�hl2�\r���Q\�q\�ؼ\��};\'7��Kʄ;�\���\Z;�<,M��@qW=��n;\��#=,+�<���8\�+�\�\�3��}8=\�+�=;\��8�j�\�\0�	�8=\��E\�\�:-6=�Υ��\�3�����\�\�<\r�\0T��\�u�*��\����!=�\Z�<\��\'<=\�\�3�k0t=\�!B�2���\�\�|�r�缣�k�\�\'<\�\Z�����<\�c�i��<\�:-�j\�<\r����X �?��<|��B�W�@�)����<����ڎ<�\�=��<cU��R\��;;]����5�rH�<�i<?Ne����<*�ݻ�\�<�G�<��E���\�?.�<\�\�4�\�t�;�9�yp���uY<\�k��\�-=5�\'��\�e<���ZC�<��;3�;jR5=/�=\�-\�<o��<k��<{=�<���=>V��M+�<\�\�}<�\�4=\�6��\�\�<�{�x!��Xe\�<�\�=9\�K=[F�=�\�\�<�=\�;T\�b<\�� >�\�c\�\0=�\�,�\�\��\�Wr=u\�޼�ȍ=\�[��\�&:�lֵ���5; ���u�:\�f\�<�$��\����MN=Q\�����7��\�\�<{=W<�\�\�<�W0�-a\�;\�񩼋;<\n��<�\�\":��\r�ӏ2�\�z&=B)�<[p\�<���;���\�s<K={}C=>\�=` \�<�=\�>=�\�z�IQ�<��<_\�!�ƾH��ه�\�0-=M\�<�!g��eA�<�����F=t=\0����C�7�\�5q�x��~���k2����<�*7�`��~m\��t=�v\Z�\�TP:��߼eu=X����y��lو���A�:��;\�S�;�\"��,�@<��\�(��<x\�9�\�YS��Q����=\��)\�#�>���<W�ۻdeU�����\�,��A\�<Z\�=\����4��\�^�;u��c�O<�I<�),�._<��\�<�0�<\�\"=�=C�A논�c���:�X\'<\�\�缘��<�9q�e[x=�\�ؼ<VؼP\�\"��.}=y\�\�ߥt=\�4=m�\�&8���f	=\�\���\�\�=�W�<\�_��P\�\�<}&��\�<$c-�,�4�\��%�ܶ��#,b�\r3=Co=\�\��H�=J�<&a\�<s���\��\�V\��;\�}�5.\�;\n9\�<�\�%�;==����xخ�z^�՗%�`\�:�\�f\�<\�����T���U=���2��=*\�<;\�;\rF\�<\�\0��jo(�`�\0�7\�\�;�\����<��<�Q�<�7;<�\r�\�l\r=� #�J ����<\�|<&��䀋;��9�\���ls^<Ws�=\�\�<�ˮ<^q\�<��\�U`+=5Z�Ӓ =\"v������?�<�����Pe�T\n��J��)\��<���\��F�\�X�\�o��0���\�WP:��%=4L��a\�<>*�<K;��~\�<H�8<m�<\���u׻\�u\0�\�{h<\�\�{��\�\\=qi\"=��V����=��\�<C͔=��Y=���<Y�\0�\�\�;��!�\�,��\"����\�U���I���J>����鮼����(x)�$[�\��˼\�W�<�.���;=\�-<2��h퉼\�bc��\�N��Q �1j2=�\�<1\�<b�$�Z\�=�g\��Y\�<=/R\�;\�Z���f=\�V\\<�<�\�J�\�Y�B\�S�\�F�<;�7�-�B�]��;��Z�\�:\'�:=)�w��m�<7Z�wđ�\�\�c�5��\�Ҽ\�4=�x=9��WTD=#1\�<<\��0ޟ<\�S��\�\�\�#n�m<�\�<\�_<|>�;m\���)蟹�k=\���\�o_�	+=}^v=�\�d=ޫ8<',15);
/*!40000 ALTER TABLE `jobapis_candidatevector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_category`
--

DROP TABLE IF EXISTS `jobapis_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_category`
--

LOCK TABLES `jobapis_category` WRITE;
/*!40000 ALTER TABLE `jobapis_category` DISABLE KEYS */;
INSERT INTO `jobapis_category` VALUES (1,'Lập trình & CNTT','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/it_a4gnnw.png'),(2,'Thiết kế & sáng tạo','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/pain_jtltmn.png'),(3,'Công nghệ AI','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/robot_kx8kta.png'),(4,'Bán hàng & Tiếp thị','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/sell_rbw06w.png'),(5,'Viết & dịch thuật','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754065265/pen_w2lnmx.png'),(6,'Hành chính & Hỗ trợ','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/person_adjmf3.png'),(7,'Tài chính & Kế Toán','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/banking_uzwqze.png'),(8,'Pháp Luật','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754065249/balance_phkyy0.png'),(9,'Nhân sự & đào tạo','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754065232/people_venfdr.png'),(10,'Kỹ thuật & Kiến trúc','image/upload/https://res.cloudinary.com/drzc4fmxb/image/upload/v1754064979/setting_yfqfsl.png');
/*!40000 ALTER TABLE `jobapis_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_company`
--

DROP TABLE IF EXISTS `jobapis_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `tax_id` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `status` varchar(2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_company_user_id_f9f6e44c_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_company_user_id_f9f6e44c_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_company`
--

LOCK TABLES `jobapis_company` WRITE;
/*!40000 ALTER TABLE `jobapis_company` DISABLE KEYS */;
INSERT INTO `jobapis_company` VALUES (1,'Công Ty TNHH VIÊN THÔNG FPT','Công ty TNHH MTV Viễn thông Quốc tế FPT (tên giao dịch quốc tế: FPT Telecom International - FTI) là thành viên thuộc Công ty Cổ phần Viễn thông FPT (FPT Telecom). Được thành lập năm 2008, FTI là nhà cung cấp hàng đầu tại Việt Nam trong lĩnh vực Data Center, Internet, VoIP và các giải pháp CNTT, viễn thông cho doanh nghiệp.','12323213213','25 Nguyễn Trãi, Quận 1, TP.HCM','AP','2026-05-10 07:51:21.975723',1,5),(2,'Công ty cổ đoàn VNG','VNG (tiền thân là VinaGame) là Công ty Cổ phần VNG - một trong những \"kỳ lân công nghệ\" đầu tiên và hàng đầu tại Việt Nam, thành lập năm 2004. Công ty cung cấp hệ sinh thái kỹ thuật số đa dạng bao gồm trò chơi trực tuyến (VNGGames), mạng xã hội (Zalo), thanh toán điện tử (ZaloPay) và điện toán đám mây (VNG Cloud).','0861168158251','30 Văn Chung Tân Bình','AP','2026-05-10 07:56:55.018316',1,5);
/*!40000 ALTER TABLE `jobapis_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_companyimages`
--

DROP TABLE IF EXISTS `jobapis_companyimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_companyimages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `company_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_companyimages_company_id_b485aaee_fk_jobapis_company_id` (`company_id`),
  CONSTRAINT `jobapis_companyimages_company_id_b485aaee_fk_jobapis_company_id` FOREIGN KEY (`company_id`) REFERENCES `jobapis_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_companyimages`
--

LOCK TABLES `jobapis_companyimages` WRITE;
/*!40000 ALTER TABLE `jobapis_companyimages` DISABLE KEYS */;
INSERT INTO `jobapis_companyimages` VALUES (1,'image/upload/v1778399481/tw6gosrkkkhz4itsaacp.png',1),(2,'image/upload/v1778399482/li7fir4b6wnuniax7a1s.webp',1),(3,'image/upload/v1778399483/gdwkpyooj4daxrydjojg.jpg',1),(4,'image/upload/v1778399816/tgiexwrrqbpa2mlziu8c.png',2),(5,'image/upload/v1778399817/z62bjzpadofwjiznpqns.webp',2),(6,'image/upload/v1778399817/zjstybbr6w2s8xgao1kq.jpg',2);
/*!40000 ALTER TABLE `jobapis_companyimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_conversation`
--

DROP TABLE IF EXISTS `jobapis_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_msg` longtext NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `last_sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_conversation_last_sender_id_e0ac019e_fk_jobapis_user_id` (`last_sender_id`),
  CONSTRAINT `jobapis_conversation_last_sender_id_e0ac019e_fk_jobapis_user_id` FOREIGN KEY (`last_sender_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_conversation`
--

LOCK TABLES `jobapis_conversation` WRITE;
/*!40000 ALTER TABLE `jobapis_conversation` DISABLE KEYS */;
INSERT INTO `jobapis_conversation` VALUES (1,'xin chào','2026-05-10 07:48:48.581212',NULL),(2,'demo chat','2026-05-10 08:53:53.825696',NULL);
/*!40000 ALTER TABLE `jobapis_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_conversation_participants`
--

DROP TABLE IF EXISTS `jobapis_conversation_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_conversation_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapis_conversation_par_conversation_id_user_id_4e914d23_uniq` (`conversation_id`,`user_id`),
  KEY `jobapis_conversation_user_id_824e22d9_fk_jobapis_u` (`user_id`),
  CONSTRAINT `jobapis_conversation_conversation_id_61b6c41f_fk_jobapis_c` FOREIGN KEY (`conversation_id`) REFERENCES `jobapis_conversation` (`id`),
  CONSTRAINT `jobapis_conversation_user_id_824e22d9_fk_jobapis_u` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_conversation_participants`
--

LOCK TABLES `jobapis_conversation_participants` WRITE;
/*!40000 ALTER TABLE `jobapis_conversation_participants` DISABLE KEYS */;
INSERT INTO `jobapis_conversation_participants` VALUES (2,1,6),(1,1,16),(3,2,5),(4,2,6);
/*!40000 ALTER TABLE `jobapis_conversation_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_follow`
--

DROP TABLE IF EXISTS `jobapis_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_follow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_follow_company_id_f165e9cf_fk_jobapis_company_id` (`company_id`),
  KEY `jobapis_follow_user_id_dab7cc75_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_follow_company_id_f165e9cf_fk_jobapis_company_id` FOREIGN KEY (`company_id`) REFERENCES `jobapis_company` (`id`),
  CONSTRAINT `jobapis_follow_user_id_dab7cc75_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_follow`
--

LOCK TABLES `jobapis_follow` WRITE;
/*!40000 ALTER TABLE `jobapis_follow` DISABLE KEYS */;
INSERT INTO `jobapis_follow` VALUES (2,2,6);
/*!40000 ALTER TABLE `jobapis_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_interviewparticipant`
--

DROP TABLE IF EXISTS `jobapis_interviewparticipant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_interviewparticipant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `session_id` bigint NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapis_interviewparticipant_session_id_user_id_b42c3aa7_uniq` (`session_id`,`user_id`),
  KEY `jobapis_interviewparticipant_user_id_5fe861e9_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_interviewpar_session_id_b904ae95_fk_jobapis_i` FOREIGN KEY (`session_id`) REFERENCES `jobapis_interviewsession` (`id`),
  CONSTRAINT `jobapis_interviewparticipant_user_id_5fe861e9_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_interviewparticipant`
--

LOCK TABLES `jobapis_interviewparticipant` WRITE;
/*!40000 ALTER TABLE `jobapis_interviewparticipant` DISABLE KEYS */;
INSERT INTO `jobapis_interviewparticipant` VALUES (1,5,1,'HOST'),(2,6,1,'CANDIDATE');
/*!40000 ALTER TABLE `jobapis_interviewparticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_interviewparticipantlog`
--

DROP TABLE IF EXISTS `jobapis_interviewparticipantlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_interviewparticipantlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `joined_at` datetime(6) NOT NULL,
  `left_at` datetime(6) DEFAULT NULL,
  `participant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_interviewpar_participant_id_c2ac16a9_fk_jobapis_i` (`participant_id`),
  CONSTRAINT `jobapis_interviewpar_participant_id_c2ac16a9_fk_jobapis_i` FOREIGN KEY (`participant_id`) REFERENCES `jobapis_interviewparticipant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_interviewparticipantlog`
--

LOCK TABLES `jobapis_interviewparticipantlog` WRITE;
/*!40000 ALTER TABLE `jobapis_interviewparticipantlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapis_interviewparticipantlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_interviewsession`
--

DROP TABLE IF EXISTS `jobapis_interviewsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_interviewsession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `meeting_link` varchar(200) DEFAULT NULL,
  `start_time` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `host_id` bigint NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_name` (`room_name`),
  KEY `jobapis_interviewsession_host_id_405e0f60_fk_jobapis_user_id` (`host_id`),
  CONSTRAINT `jobapis_interviewsession_host_id_405e0f60_fk_jobapis_user_id` FOREIGN KEY (`host_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_interviewsession`
--

LOCK TABLES `jobapis_interviewsession` WRITE;
/*!40000 ALTER TABLE `jobapis_interviewsession` DISABLE KEYS */;
INSERT INTO `jobapis_interviewsession` VALUES (1,'https://job-django.daily.co/interview-821ce43b49c7','2026-05-12 03:00:00.000000',1,5,'Phỏng vấn','PENDING','2026-05-10 08:54:25.203253','2026-05-12 04:00:00.000000','interview-821ce43b49c7');
/*!40000 ALTER TABLE `jobapis_interviewsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_invoice`
--

DROP TABLE IF EXISTS `jobapis_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `posting_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_id` (`posting_id`),
  KEY `jobapis_invoice_user_id_effe78e5_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_invoice_user_id_effe78e5_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`),
  CONSTRAINT `jobapis_invoicestatu_posting_id_5786c3be_fk_jobapis_j` FOREIGN KEY (`posting_id`) REFERENCES `jobapis_jobposting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_invoice`
--

LOCK TABLES `jobapis_invoice` WRITE;
/*!40000 ALTER TABLE `jobapis_invoice` DISABLE KEYS */;
INSERT INTO `jobapis_invoice` VALUES (1,200000,'paid','2026-05-10 08:31:47.618401','cs_test_a1SHRzV822NrQAZq5tePi26aRiLjgleUMRfj03GOfcwJqJFSQbK0tPaSJi',1,5),(2,200000,'paid','2026-05-10 08:32:46.269756','cs_test_a1348YqhaZ9PkmP0mNMTzvNNz5S6tJUaqGyrzff53R55TLkNy8f9BK8Tz0',2,5),(3,200000,'paid','2026-05-10 08:41:01.195705','cs_test_a1CJ39tZSng8liGcCg3rhoNGgko8NkUHHm6hsBhZlXwCfkH0TMLq27uJNp',3,5),(4,200000,'paid','2026-05-10 08:42:07.649732','cs_test_a1rdpsolzalxNFMO7AC0ru0KNZIrWXu7vzAvveUi81kNorzAlYBkbpVxQf',4,5),(5,200000,'paid','2026-05-10 08:43:45.123144','cs_test_a1p2MwHp04vrxIYm6WYNlhBaDZaAM8rfe1585Seu7q2rpfRLWCUOdsl0Fm',5,5),(6,200000,'paid','2026-05-10 08:44:46.094177','cs_test_a1yNpyTHSYQ259zT9cMsdoQgbzYS984Rk32RzO3CPU5RWvDz4U9LenmLEX',6,5);
/*!40000 ALTER TABLE `jobapis_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_jobapplication`
--

DROP TABLE IF EXISTS `jobapis_jobapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_jobapplication` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `cv_file` varchar(255) DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `job_posting_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_jobapplication_user_id_a9a9eac5_fk_jobapis_user_id` (`user_id`),
  KEY `jobapis_jobapplicati_job_posting_id_241b131b_fk_jobapis_j` (`job_posting_id`),
  CONSTRAINT `jobapis_jobapplicati_job_posting_id_241b131b_fk_jobapis_j` FOREIGN KEY (`job_posting_id`) REFERENCES `jobapis_jobposting` (`id`),
  CONSTRAINT `jobapis_jobapplication_user_id_a9a9eac5_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_jobapplication`
--

LOCK TABLES `jobapis_jobapplication` WRITE;
/*!40000 ALTER TABLE `jobapis_jobapplication` DISABLE KEYS */;
INSERT INTO `jobapis_jobapplication` VALUES (1,'Ứng tuyển lập trình viên backend','Phát triển hệ thống backend sử dụng Django/FastAPI. Thiết kế và tối ưu hóa cơ sở dữ liệu PostgreSQL. Xây dựng các API RESTful và tích hợp dịch vụ bên thứ ba. Yêu cầu ít nhất 3 năm kinh nghiệm và am hiểu về kiến trúc Microservices.','image/upload/v1778402839/ytkkpsuasivxcpy63isl.pdf','PE','2026-05-10 08:47:20.551669',6,2);
/*!40000 ALTER TABLE `jobapis_jobapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_jobposting`
--

DROP TABLE IF EXISTS `jobapis_jobposting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_jobposting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `salary` int NOT NULL,
  `work_time` int NOT NULL,
  `address` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `company_id` bigint NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_jobposting_company_id_7b450f20_fk_jobapis_company_id` (`company_id`),
  KEY `jobapis_jobposting_category_id_09b28a4c_fk_jobapis_category_id` (`category_id`),
  CONSTRAINT `jobapis_jobposting_category_id_09b28a4c_fk_jobapis_category_id` FOREIGN KEY (`category_id`) REFERENCES `jobapis_category` (`id`),
  CONSTRAINT `jobapis_jobposting_company_id_7b450f20_fk_jobapis_company_id` FOREIGN KEY (`company_id`) REFERENCES `jobapis_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_jobposting`
--

LOCK TABLES `jobapis_jobposting` WRITE;
/*!40000 ALTER TABLE `jobapis_jobposting` DISABLE KEYS */;
INSERT INTO `jobapis_jobposting` VALUES (1,'Tiếp viên hàng không (Flight Attendant)','Đảm bảo an toàn cho hành khách trong suốt chuyến bay. Phục vụ thức ăn, đồ uống và hỗ trợ hành khách đặc biệt. Yêu cầu tiếng Anh giao tiếp tốt (TOEIC > 600), ngoại hình ưa nhìn, kỹ năng xử lý tình huống tốt.',12000000,40,'Sân bay Tân Sơn Nhất, Quận Tân Bình, TP.HCM.',1,'2026-05-10 08:31:45.424846',2,1,4),(2,'Tuyển lập trình viên Backend','Kỹ năng: Python, Django, REST API. Mô tả: Xây dựng hệ thống backend cho nền tảng tuyển dụng. Phát triển hệ thống backend sử dụng Django/FastAPI. Thiết kế và tối ưu hóa cơ sở dữ liệu PostgreSQL. Xây dựng các API RESTful và tích hợp dịch vụ bên thứ ba. Yêu cầu ít nhất 3 năm kinh nghiệm và am hiểu về kiến trúc Microservices.',20000000,40,'Tầng 10, Tòa nhà FPT, Cầu Giấy, Hà Nội.',1,'2026-05-10 08:32:45.560997',1,1,1),(3,'Chuyên viên thiết kế hệ thống quản lý bệnh viện','Thiết kế và triển khai luồng vận hành cho hệ thống hồ sơ bệnh án điện tử. \r\nLàm việc với bác sĩ để tối ưu hóa giao diện người dùng (UI/UX) cho các thiết bị chẩn đoán. \r\nĐảm bảo tính bảo mật dữ liệu y tế theo tiêu chuẩn quốc tế.',30000000,40,'Khu công nghệ cao, Quận 9, TP.HCM.',1,'2026-05-10 08:40:59.989512',1,1,1),(4,'Kỹ sư Hóa quy trình (Process Chemical Engineer)','Giám sát dây chuyền sản xuất hóa phẩm công nghiệp. \r\nNghiên cứu và cải tiến công thức sản phẩm để giảm thiểu chi phí và bảo vệ môi trường. \r\nPhân tích mẫu tại phòng thí nghiệm và báo cáo chất lượng định kỳ.',20000000,20,'Khu công nghiệp Phú Mỹ, Bà Rịa - Vũng Tàu.',1,'2026-05-10 08:42:06.963423',1,1,10),(5,'Kỹ sư Machine Learning (AI Engineer)','Nghiên cứu và triển khai các mô hình Deep Learning về xử lý ngôn ngữ tự nhiên (NLP). \r\nXây dựng hệ thống chatbot và nhận diện giọng nói. \r\nYêu cầu thành thạo Python, PyTorch hoặc TensorFlow.',50000000,40,'123 Lê Lợi, Quận 1, TP.HCM.',1,'2026-05-10 08:43:43.781125',2,1,1),(6,'Graphic Designer (Thiết kế đồ họa)','Thiết kế bộ nhận diện thương hiệu, ấn phẩm truyền thông cho Facebook, Google Ads. \r\nPhối hợp với đội ngũ Marketing để lên ý tưởng sáng tạo cho chiến dịch mới. \r\nSử dụng thành thạo Adobe Photoshop, AI.',18000000,40,'Nguyễn Hữu Cảnh, Quận Bình Thạnh, TP.HCM.',1,'2026-05-10 08:44:44.957375',1,1,2);
/*!40000 ALTER TABLE `jobapis_jobposting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_jobpostingfee`
--

DROP TABLE IF EXISTS `jobapis_jobpostingfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_jobpostingfee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_jobpostingfee`
--

LOCK TABLES `jobapis_jobpostingfee` WRITE;
/*!40000 ALTER TABLE `jobapis_jobpostingfee` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapis_jobpostingfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_message`
--

DROP TABLE IF EXISTS `jobapis_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `conversation_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_message_conversation_id_036c6c23_fk_jobapis_c` (`conversation_id`),
  KEY `jobapis_message_sender_id_88f79484_fk_jobapis_user_id` (`sender_id`),
  CONSTRAINT `jobapis_message_conversation_id_036c6c23_fk_jobapis_c` FOREIGN KEY (`conversation_id`) REFERENCES `jobapis_conversation` (`id`),
  CONSTRAINT `jobapis_message_sender_id_88f79484_fk_jobapis_user_id` FOREIGN KEY (`sender_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_message`
--

LOCK TABLES `jobapis_message` WRITE;
/*!40000 ALTER TABLE `jobapis_message` DISABLE KEYS */;
INSERT INTO `jobapis_message` VALUES (1,'xin chào','2026-05-10 07:48:48.565815',1,6),(2,'xin chào','2026-05-10 07:49:17.523444',2,5),(3,'abc','2026-05-10 07:49:30.210524',2,5),(4,'demo','2026-05-10 07:49:47.407587',2,6),(5,'abc','2026-05-10 07:49:49.071068',2,6),(6,'demo chat','2026-05-10 08:53:53.814081',2,5);
/*!40000 ALTER TABLE `jobapis_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_notification`
--

DROP TABLE IF EXISTS `jobapis_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL,
  `target_id` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_notification_user_id_faab7e29_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_notification_user_id_faab7e29_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_notification`
--

LOCK TABLES `jobapis_notification` WRITE;
/*!40000 ALTER TABLE `jobapis_notification` DISABLE KEYS */;
INSERT INTO `jobapis_notification` VALUES (1,'Công ty Công ty cổ đoàn VNG đăng tin tuyển dụng','Kỹ sư Machine Learning (AI Engineer)','2026-05-10 08:43:53.635187',0,'jobposting','5',6);
/*!40000 ALTER TABLE `jobapis_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_postingvector`
--

DROP TABLE IF EXISTS `jobapis_postingvector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_postingvector` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dim` int NOT NULL,
  `vector` longblob,
  `posting_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posting_id` (`posting_id`),
  CONSTRAINT `jobapis_postingvecto_posting_id_6617f7aa_fk_jobapis_j` FOREIGN KEY (`posting_id`) REFERENCES `jobapis_jobposting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_postingvector`
--

LOCK TABLES `jobapis_postingvector` WRITE;
/*!40000 ALTER TABLE `jobapis_postingvector` DISABLE KEYS */;
INSERT INTO `jobapis_postingvector` VALUES (1,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \nv\�%�E�e=�ߜ<�k	��������\���;��B��<A�O=!�Y=\Zb���<<i\\���Δ�n\��\�`\�<\�\rb=�KڼJ6;!\'M;(c=�\\=�u��\�\�7�N-��P�3=�Lݻ\�\�<1�R<=v=\�\�<q�:�\��;\�|�\�F\�<s,o�\�\�;�Q���\�9<�]	=��\�<:�;9.���<!�-8���6<U�\Z<�\�`�c�!�\�=1�༣�P\�\�<W<�κ\�Y\'�\�\�:=M\����<�e`<\�־��>�<|u<Ҝổ\�=\�\�#�\�3�<�\��p0=x\r�=\�Cm�\�\���ځ\�;�>A<U�\�<\�B=�0�;yy�=T\�<I�d�\�\Z0<>��<���p!<\�\�>�\��;�\�o�8a�|�<��}<\���\�|�������=lҼXe���/�;\�<�ߌ;���T\r=����kp~�\�܀=S�\r�l\�*<>X.�z�o<���;\"���\nxo�\Z�\�\�\�+=�7��t\�\�;.\��< �j�h�ؼ\�OQ��7ɻ��:<\�ᑼ�뫼\�4q�vI�<N����:�0b�<\�,<9�\0=R�<��$�\�u5�:Լ\�M<�R���\�;<n�\��~�;\�b=ۚ<���=Y���\�_��\�Z�]\�q=�\�*<�T\n�\��;��5;\�l����\�;c\n<��<!\�&�/�	=\��\�<eg��\n=3Dl��\�#�\�\�#=4��=~q<�1.<bR\��\�=��\�;o\�= =#<�<\�����.���\�q�+���b\�<�bB<���\� B��7;O\�J��Z\�<�1;2L��\�?ƽ�\��<\�W �r\�r<H�6<W��;K�=\�t��x缹�X=ގ>=�B_�%sx=P/��|Z�=w{�<��߼Xu��U����M�Գ\'=\�[�p��<w�\�:~ޤ�\�;@���\�1<.��OV��\�A\n=?tn<\�\�<�JB=vW\�<�iۻŨ���]�a\�k=�lL=OJ=�\'4�\�}/=\�\�:���;���<P�7;����\�;OHO<�4伌)ڼ\�\r�$�4��`\�<�Zڼ�W����:��\�_=�|��\���iV5<��@�n��<\�ȶ�\�g�<�=>]2=\�=��ڼ���;hZ>�\�\�M�P\�\0ڻ<\Z*<\�fA=�z=�c\0=����\'��D=�\�I�k�Ip\��\�\�$=M��|\�9��1y<Xb�=T4�h\���XV�\�\�\\=��a=\�P��X�<_��<\���[��=�hX=\�\�»4/�sZ�\�-\�<\�\�ü\�\���\"�%==U��++�<�\�Z;\�Ҽ\�:wV\�;\�h;��48:<5\�:\�<Y)\Z=O�a<�ޛ<H\�=JE\�<�|<H�:�~=�:�<�\���\�\�V�\�<j\�\�;��؆Z:#�,=u\\˼\�d=6K\�h\n\"�fD�\�\�\�<B\Z;\���[�,<�B��\��Bm�;P@��ߑ\�<\�03=1\�\�mq��L&\�<��w=\�󩼼\�޻L\0��yp\"��\�1=\���=�jE�\�>X��ǡ:�>�<�5��\�\�ʻN\�\n��ĉ<����Y;L�\�<\�1\�<\��<Ua\�U���P�<\�A\�?5\�<N��=\�S��ۈ<A�p�o�t�\���\�<%��<�\�<ޏ<���<�q�<���;̗\�;Tu5��\�<D�;8��\�����	\�<*\�(�\� \�<qZ�;�)\�<�B�<���<N6r<q\�$=0�����B=���<\�C��+<{d�<ɝ<\���=E\\�;\�O�<�Cp�x\���\�\�{�5��<]\�a<\\6�\� }�qC\�:ѳU=���<\����6���=�\��Ș]=\�z�<SG\�<U=�F\�<ߢ���v�<�T�Jf㼼5˻9-=\�:鼴{��c\0v=�9\"<3MF<\r1��9.,<\�\r\�<G��\�wH;�����\r<\���\���Y�<���;-(��kV/�SK��m�R=�䜻\r<���\�!�\�L<s\�O�\�c<��,�\�\�ͼ/\\D<\�=m<?\���E���\��=K�O\�\�<\�\�&;\�[\��\�|�\�\"Y�\�=�<\���w7F��y�_\�\�<�i�\��G��\�C�� m�=+u<cϼoz\�<&�\0��\�|<\n;\�;G�\0�Փi������\��1\�Q�!P�\�+p=�\��<^�s<\�v\���x\�<=��<g7I�\�\�\�< #=7I\\=}愼m\�<!���\�<�l`;�\�-�\�g=�&ļ;K=���<\�\�ļ]\�e<������\�:Ɖ=�\�<PI��U�<4m���d\Z=��<��\�<�\�<�\��Qka<&9�\�W\"�Q�=&F�y]t=P\�o;\�h\�C�d��\�%<0\�\�=TV+;!uS<�\��;\��gջ<�\�8\�jP�_\�p�LL\"��g��A��\��<_\Z<\�\�\�:iUT=�\0\�<ׁ�PD;̿\r<�<Y6�;��\r=*�<\'N</���D��\���\��<v]ؼ�\�z�\�F_����=�B<Lz�֯m<�C�\�\�7=���=L\�\�<�\�h+�=�=��4���6=�NR<�琼���<\�K�<�<�x��-��\���\�V��A��{�J=p3=\�\��<�<w�\�F\0=\�\�<\�|�\�>M=}��<ω�;\�:�\�/=\�=�<�ա<��9�0\�̻\�J���v=\�\\м3;�;*��L}\�U?���e�/��<\�}��W��;y�\�\Z=n�;2�:\��<M\�\�<\�!�9�@��r�=�Y�-\�d<\�j�\�\'\�<L2�s���T�<q��?/<Aӻ�s=O�L=�\���W��)=<�=@ڡ;ݜ�[=\�[�\�\�<�8<�_٤<�b���<�\�n��\�a�\�	=���=)�*=_!�\�\�<\�\�\�<��<2��N \Z�\�\�<ة�<\�j3�o}\�Q\�;(�<Pļ\�=�\�༽�\Z<Q����-\�\�\rP;��\�<m��\�\�<\�C�[\�i<8�A�\�<�\�԰-<�Z\�<r\�\�=�$G�NL�<_\�\�;�\�~��uk�^\r�\�B�\�|��c�\�<\��\r<2�<�s��}\�\�<\��I�>�`<\"#4=\�4>��=CCw<j\�=m�	����!\�<e��;L\�0�\�b�_㯼\��<4\�r<����\�\�<�^#=�`��Jgx=�h\�;�M���\'�\�\�\�<D�����\�<\�D;l}��31���=���܈<�\�<\"O��Y���\���\�\�<O[�8g����<�\��B�=l�߼\�\�<\�\'L�\�h���&���1s;X�~�6<ə��W�]�Ѩ\�<\�\�0=�~\0�&l<�EQ=f(���L\�<2m=�\�=WB��䓼�殼2�X�\�鼱�ʼ�=\�;02N��3=\�_Q�	�=?�\�<;\�<\�#�6\�M=\0�<�K�\�#f=\�\'\�<��\�;\�l���\�\�<%]#=�4=R���_��=\�5�<m���\�j&=BkP<+�G<��\�<�\��<\�\�.<\�\�d�%%\�<\r�\�<gD==�㼓M�:mS<\���!\�%�\�f\Z<q\�\���4���\�;G����?��ԭ;��j\�<橅��(=Hށ=~0��7=��:�nU��\�<���<�\�\�^=i;\��� ��7\���W�\�t�;9]\�<0��<p�D=�g=_���\�=\�\Z<�]F<,#&<�\���z��c\��\�;_�\0V�;�#�=�OT=\n��<�Ii�� *=��\�;\��9_�\�;����j|d��`p�bm��\�\�<���=�\�|:M��\�\�\n=P�8�\�c��\�\�[\�)�\�F�\Z\ro;#΅<ק\�<I�=뀔<C���΍Ӽ��\�<S\�;�c�<A��;Nc����ߪ<\Z\�\��\��<\�P\�;�\�:\��<�U�=�$�<	Z��0 �����K\�<\�<.�c����<~R�o�i�eQ\�;U\�:<�i��\'��L\�<L�\��If]�<x$�o7���9�9\�Ҵ�\�\�<�rk�IS<<+\r=�-_���<�!8�\\�\��\��<�\�m;��.�{�?�j=�\�y�\�=E��;\Z\�X<J=\�<e\���\�6ݼȺ?�\��<L=\�\�߼�=)\�\0<�\'ļ��\n=%\�;=\Z\�9�^�\�\�\�7����.=�2T�{K�\�\�2<�5�K�,�0���\����\�S�~��$b����/�UR<��<-)e�F��<z�H=���<Tq弛\�=�/Z�9%�;\�.=�6NJ=�R\�:hg�\�\�<b�#=N���\�\�\�<<w�н\�K|?=3\�i���<P`t�\�,;\�ā=Pb}�y;\\���/=�9�<���\�s�%=,��<�\�O<�\�R<i\0Z<���;�ۦ=\�t*�n<請=\nk+=^�<E4O<]/<Kkʼ�Ů���<4qG;�X\0=�\�I<3n�`Һ�O\�!<�\�u:Qu���2�<�\�3=�xh=�)���И�\�t@��=	�l�6\�<,I\�<J\�<���',1),(2,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n�\�\�<}C�\�B��\�\"!<4�;ϞI�r֐<\Z\�=<�<g��\"�D=�D]=�\�x�Hᑼ�7<�@]�\�p,<��p<B,9�/x�<\�\�C����Y3=\�bH=�\�\�;eM��\�5\�<�]�/G��A�ǺY==|�_��<�-�	��\�;��E=<\�C\�<\��9�;��<�(w=\�ډ<�;��\�#�<�ɐ<\�\�<�Ĺ���y=o.��w};;jD=��뼄�ȼ\�h	�ˡ\�;��X�l\�5C�<?U)���<e=4Ck�3��I�̼!\�A=#\�,�^\�\�\�>�x޶<\�\�<\�#-=�r���\�4<�$�\�\ZY3=�Տ�%\�Y<\�Ƭ�ဿ<#���\�3\�<@}@�(\�k�\�,�<�O;4�\�<k\�z�Di=�\��W+�\n\�G����<��\�8��\�ߗ<,��\�\�<�\�\�;��;�(޺tG����2\�`�,\�;�aBP=Ww\�<��ۼ:\��=�<�叻�<�폶<5\�@=9n¼}�\�dZ�\'V��p����Q=���;K\�<x}y=�\\м�\�`={_Ļ��;{.\\�\�ļ=sV!=�J<\�A;\�\0\0�\�\�b�i¼\�bֻL\'|=�G7<� ݼ��\�<5�E=\�j��L\��B\Z8���.� �\�<��S<\�S�\\t���Ƭ��C��\�*��)�<\�=b�ӻbg[=\�$u<��<��»<˨�\�\���\�0<�2\�=�k<r1�<_\�?��OT�A*��i\�<ÿ9=C�@�6C\'=\�F.<yX=e����\�,;���<\�\�v���μ\�_^=\�c�;\�\�<�l\���=��<\�:��[\�ڼ�w\r��H\�<\�$\�;!�/=�+�� �WǕ;\nr�=�\ZB=)<3n\�<�\r�:DA��B@����\�\�t��%;��*=\�4�<6�\�<\�\ZF�<�]�y��~�ټ\rk6��=/˙��;j5\�<����h\�\�<y?��Iҽ�F�\�\�e<^ϻT��<M�=�\�r<�\��0F���c0=\�D<ZS<	+Z<\�p8=rx�=_\�O<%\�:�$l��A��<΀�<\r�\�\�p�K7=�\�t��=v�@;>O=V��:>I�\�֕<_���=C��+q�<�(�<\��m=Y	����<\�iҼ&T=\����\�=o\�2<\�\�<����a\�C=\�i<\�G\�;�\�\����<׃<%�\�;L\'�<\�=��<κ\�8v�\�<\�$@;A�J<l*�:�J��ٱ\���<86�lӤ�nRm=�NZ<4*�\Z���\�4;m�\�<\�|�<�7�<=5_�\���<\�:\�;\�\�\���\�\�<��=�\�R<\�0.�6\�F�v���fD�\�\�+=Zv�<u��=3<�!�\�:\�\�=\�\��<n಼��W<�PV;�S��\�\�<hw�=�x8=����\�~�<A\��V\'\�<\��\�\�\nJ�z����\�7��Q／��:i��<J�&���=3%߼|R���,\�<�|�9-=<+`�\�\�\�< 1Ҽ|���T����>�\�\�\�;w�;\�E��\�	<JZ<2�p<\�e\0<\�y0�Gr\�<0N\��8\�?��=��=uh<�\�x:�\�e���F�\�;�V��?)�;\�I=QG�;^̂=�\\=k� ���j���i;l\�	<vv�=e\�]����<\�ۼ^�C=��\�;��=��=_�C��g\�:R���\�<�[=�\�	� ��=\��\�<�\"��\�7<�=Ne��\�Yݻ\�y\�<�~���\�=K4<ݠ��=.ѻj�<]ğ;��\�(�</\�M<��W<\�!�\"��ڑ?��Q&=m�<\��_Y<4�=:-\���\�<\�\\L��V:�\'=\"7�<\�p��\�0Y����Wdc<�ɜ<=o��	��\�y<#k��\�W=D\�\�\�\0�5�\�<���񑌼�\�<�Lu���j=t\�<F\\k��\\�=�߿�P�<����\nZ\�<�I{<hw�:�\�5���<�\�=Mn<\�\n<7\���)*|��\�o�]�/==^�<�7�<���H\�<�\�1�]�\�Z=�:	5<2_E<����\�=K%˼\0켣Z\�<\�22�h	>=v�0=����\��;(#=LRC�m3�;�̉�_)��u���yU��=\�\�\�;v��j0��s2=\�M1<�Z�\�\�;E�<;�p=�\�蹊�˹NM�\�FĻ\�gH=p<��S���̵�-+��\��s9=\��\�\��\�M��u@x;}\�K=�\0\0<���;�\�;����\\��b\��<ʉ���X<\�\�\r;,%8�\�\�2�Z\�輔ㇽ�:��0;| �9\�д<��<\0\�y=\�\nD<�Y�;Xd.=N\�<-�%�=�=��\�U\�<��\�<\��\"\���\�}<(\�0=����w��$��ִ�<\�L(=�弈>U<W	�=�jۼ�/<\�+��ѻ\��=�_l==\�i<\�l��$�]<\�7��\�\�<E�+�����\�\�<{#X<��<f\��<��<\n��<J�H<FuY<\�<Rߦ�rmb<\�lT=\�\�\�<\��=���<G�_<���;�\�+<ѻ\�<�\�*�y��=����~mQ=�\��;�A����5;wK\�<�ɼ����1=*$��\�Б<�C�;i.S�I̮��\�m=T\�b�\�\�\�<2\�{�E�C=\�1�<\"�M�Љ)=�\�<�=�\��\�<M2$��$x9\�[���\�b=\�\��\�t1��\�\�`\�=f��<�\�=\�\�L=J�\�<df=C\r��c�;Mbǽ�3�<���;N\�d������a=`�\�\�\�<wQ���ŻI�v�)\0	=1!0=W�\�T�\�:{,��Z,e�O�=ka\r��\�I�b��\�5X<.�غ3\"�<U�=\�Zw�����~���|�g��:�t�<\���\��<ݫx�>\�:<\�\�+=e4��\r$��Ԛ;�(�O\�\�\�L�	\��\�cü\�<\�<�\�\�(�H�8�\�<�\0�\�G����=\� ��è9�\0�<\�\�\n<\�Y�H4=�ړ�\0�\��|J��~q��wE\�<_��<�5\�:�^4�\�\�\n�\�ԓ�,ˤ<�_\�<.$\n=�\rl�\�\�H�\�㓼\�A=3\�1�\�a\�E���\�ɧ;��{�3N�<\�7+=\�ɤ\Z�e�μK��A�<k�\�<�2�����;��<��<\0�: ���X\�G��\�[=\�\�S=�X������\0�;)4<\��\"< ��<͏(�\�\�\'�\�p�\��;H\�;DfB��Y�\�j��>�?��`�;?���\�\�ϼhS]�\�ru�잇;B\��}ӊ�\�Z�<O���2ɚ��c�?\���0AM=*�\�<L\�;\�@Q:��\'�\���<aC(�==�o><~{Լm\�ӼR�\�<�\�\�;q\0�C2�ݒ��?V�:@�<yCz�\�;j<��;&\�\�<)�\�G\�;4����2�<$6M=�*=�[\Z;I\"�נһ�T�<\�\�v:�	B�\�P��xB��uzn=���f\�~=\n��`2�;W��uC޼ۧM=\�;�(\�VBr<;׍�\�~<Q$\�<\�G\"=;f�<(�ݼ,�t���a���Ǽ��H��q�<\�n���k<�xǺ(}=\���N%l<-n>�(RB;\�\�=%7�^�Ƽ�t��{,<\�D�<\�ȼ3d:=�G(�����\�`<\�\���\�i\�<�7H<v��=2�p=/%\�<$z輧Ti�\�ػ�`ݼh��}=�\�+��*�W\�\��R=Z\�\�;\'F\Z�f��<����f\'Z<F�1��\�=VF�<\�\��<\�U<�𭼄��\�y=�F\��,�;\��=�<\n�\�<�\�\�<\�>j<�s}�VU\�r����@\�9=\��\�a%�\�\�=\�Ӥ;�\���\��\�\�;X�\�;y\Z����\�:ڵ<S\0�;p\�M��Ľ�*\�\�<\�z�<�\���\�\�;�U��\���\�o�;���¿\0=ɡ.;\��;ķ9��S���;=7�<a\�S=8�\r=E	\�:�:;<A���ûT\�<�\���i�M=̠N�\�^w<H=T��w���]\�|-�|L�m���^�E��\����^\�\�\�0�\�\�C<:Ƙ�T�<fW�<\�IS�s�Q�N\�<��\�<C\�<�!��F$<��\�\rX��q˪<\�\���p<KW�\�U<\�Fs<f\��\�u��bOռ\�\�\0<��\�</D�;�<��3=\�:=J\�/=[c켥7�p�\�8j��:\0\ZB����P��\0;���<����fQ�<(_<!o�<����+���G{�<\�\�<\�&-�\�\�ռr%���*U�\�6=Sn><8�t<\�\�l�\�<�\'j\n<���ݒ);P�t��֜<\�:|=9S���S��d\�<���<����_q\�3�=\��<\�&<n&-<.-\�4�U����<�Y�� �\�<�(\0<A@`�\�\�Y�\�c&=�켔5=���<I�U<�\"�Z��<F��\�U<+ ��%M�<\�\�<�\�\�<�ß=\���G\�<��\Z<Ą;VUo<���qP7�\�B=k��=J\�\�<\�W�',2),(3,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n6�K<.��Ov��	��C\�C��;9�=��GA��b;���Y�=��l�z�廓\�<�\�g�=\�\�%<k�Ǽ0�\Z=˫%�a�=V�3�^><?�\�<$�\�C\0J=^�!�Yټ�U	)�=A��i\�<\�l�\���9�X���<\��ݼ\�U\0=��1�\�J=zkT�p�2=�A`���\�<?P;�=3�g�\�=i\�J�2�[=�&��Wb<�̼}Iv;x�@<�Z��{�ܻuO>:��\0<?~�\�\�=uޓ;E�<TlD<\�8�!n=�ʓ<:^��oT<\�\�û\�;�\'��њ�;��\Z={�ڼ&uA�\�OV�\�Tz=Tvb<��s��$W��jY<°};u\'�\�\�\n<!\� <Dօ<L�ػ�\��:����;\�S�<\"�	�\�A=�˭�yc޼\�u&�\r\�(�o�\��׼Q�<�\Z\���5��\�C$��+p<\�D	�wV\�<(��\Z\�k\�9���\�\�=.h@�� n��5Y=E =�\�u��L2�Lђ�\�{\�<\r�b�\�x\�<�T9=�96<�P5=\�$켶\�[�q\\�<��j=E\�\�;pf���V=\�IP��Ժ���<H0�\�\�{����==D=V\�o�\�A=\�\�J=9=\'{�[,�V{�;�-��cE�<\�o;=:�ݼ�0���R=�W��wؒ:�\�\�<T0���M(�\\t� 6��\������j=�lļ\��=�!=�1��/Q�=`��:\�p*��B[<q\�[:\�x���<BL\�pe�<{f꼲lM=ț\�<7Lμ\Z��<�(	=yK=�\�\�<�@<Tq˻�\�;\�\�=D�[:&H;c��\�\�<�r�;^zQ<4�7=V<z�&��\n�9\�\�<%\�b��\nۼx�����8�\�\�\�ڭ�O\�E��d;\���\�\�\�\�\�<�CL��\�(��I�!yt�-�)=\'(f�\�\�n<\0h�� m<�\�\�L�<-M�>r7�b����I�s�����<������h;\�S]�*a�\nʬ�Yކ��~�Z�\�\�\�;!λd =\��=i<��tV�<\�X<�O2=\�B��%��|��6\�~<س+���[vt�\�\�\�;�ɑ<غ��aV�;\�M<��W�\�\�<w�\�<�d�\��<yﳻ\�p�#6񼱍;�e��̉�%]�b\\���0	�\�\�<\�\��\�	��\��0��\�\�b�<�H�<{\�ļX��\�L��T�[�i�ɻ?g�.\�\�<�=!\�	;�7\�;L`:�\�26�;\n]�D�M<ypȼ>��V��\�\�\�W�E3E�O�;\�)۹p\�=�.��0	=-�=\"�=c�M-��\�4	��,���\�Ǻ�eu<\�\�\�<~�\�;\�ˤ�\�\�F<\r$=M�`<\�L=��V��+�\�H	; .=nL\�\�\r\�d\��<֜E�3\�һ7\':<\�\�<O=s����U��S\�<���\\D��i\�<�蚼��\�<T� =Z\�E��\�q�>�P��\�}<\�y=ڂ,=\�{�<^�n;h��cޜ<�@j=��>�G�\��\�#=hxļStx=\�\�<���\rU�<O}�;\�\��b�\�\���\nu\�<~\�\n�\��\�厼*<Z�Q�\��@;\r.`=\�\�s90��<\rt�<�C&�-W�����:O\�<\�Y���<�@>=�d��\�\�=�T=l��ߚH=z\��\�����\'���ɼ\�\�u����2�=`6\�<���<a��<\�\�%=:ܹ�\�\\�*�\�1E�Zj���\���e\�C�m\�t�\�:\"k���/[<�q<�\�\��Ls\�<\�#D�\�\�y�\r\0��0ǻ�\"�<)\�Kd�6\��6�<)����rļ�T\�<�ѐ�\�<�1�\�<�̼��\�</�<Uw\0�Sᦼ\�\�\�<\�2��\�)�\Z�<Ϗ ;\�4\Z=��Pâ�l�<\�\\�\�(7=\�w�;}+���:�\��= ��C��q� ��)Z��5��?ܠ<z�\r=ٵ�\�pe��ؼ�`��E\�պ\�Q��\�ث<\��\�iR(�\�[a�4\�<v�i� \�~�7�%�\�5:Pg�=\�h2�F�\�;������\�Hc<:�i;��M<$q\�<s߼����=�<�W1=\�\�<�\�@<y��\�0%=t\�$�\�.z<�\���J\�½\�7=���<g(�<E����e&���ļ[Z����\�<\�R�<:�=�\�x;^f��\�W!�՘��Cz�|\��� �۽��čƼ����3Թ�\�-<;� 	�4�&�A�:~�\�;�t\�<��9<\�W=X�\�\�<AY=��E�^Z�<��\�<Fd$�\�T<\�1\�;\Z8��;1�ONQ=���<s)\�:͝��c�-=�H=߆���v����=pd9<vX��;u9,�V;�z=��~=\��<�N;h�����2�\�|t�˩2;��U�\��<��j�6B�\�g<�O�^J=�\�<S�<�}��\�L=�\�W<��\�<	4=rĒ�h�=\��S�ͼ~�H;�ou;��R=q�<��<ְ\�\�$=r,=���<Xh�ăj�.\0=� n��-�<\���\�<<29���2�<���;U�,��\�<T|<]o�\�M���\�G�\�\�g��@\�<q��<��U�w�\���K�\�4T;\0RҼ	]\�;u\���#�<�&=\�`<L\'(=\�\�3�n���\�b�C�����<Ȑ<���<�̦<��\�<c����E�<�<I�\�G�<\�ݻO\���Z<�O��=&<9DP<��W�{��\�\�7\�,=(q[</K.=���=l,=\\\�\"��C��/3Q=��,�ת�:�pμ	�h=�;�\�p4=+\� ���˒\n�=w< 4=͘c=6_K�5\� �)\� <?�¼�\nӼ\�9?<��0�\�$�\�)������\�����Y�<\�\�I���=*\�#��\�\�<��K�=;ۛ�0���$�N<�\rC�ơ-�f�x<�\"��ü\��C<�\�<�-�<�%{�\�м9��=Nul�𝹻��<�P��Y;�_�G�\�Iz;�\�̻\�%\��\�P4=s����w<0x�\�\0Y=\�&��\�\��VW=.\�-<U��;�\�3=\�\rm=V\�;3�M�|\�8<����C_��N\�;(w1��b�<AC�[L\r=��\�\�8X<�\�ռ�\�8D੼��ȼ\0\�<m��<�J�;\�Z�<\�\�=C\'ѽ�\�c=�V9�:�\�<_���\�s;\�i\�=�]��2\����\�<\�\�\\�Rj�����u\�\�\�|� ѷ<\���g�1�\�*\r�.W�<w\�V�\�˹<rM�\0Ж<z�4�\�\�Z=X�>=�2I��)�<L��0���!;���C�0=�X\�<�p仍�\�<]�S�E�<�˄=\������ۭ�=j&\�N�\Z���J�e8;�\�<:\�\�\n�Z�\�<\'.<�\�:$\�<1\�<�!;H�M�,<��3�<�==��2=\�\�:�\�\�<�,ռE΂���;�U\\<�����\�y;\r�����:��\�\\l\"=�gL<K�l;�\�t�7Ln=\�ؼË���V\�;�\r=qi/��&5���\�<]��;\r��:�����B4<`�\�\�\�3:hï=<�8��v?�}���\�a�<\�\�<�e�<x`��n+s=�C��)\�=\��������6\�<\�[�ک�;����u<�\�=\"\�ͼ�G�`\�\�/=#;=5��\�;S\�W�R���[�(�H�\�\�\"<��9�Z�\Z=�*o<�\�\��\� ��\�߼���=/\�<\��v\�+<\�m�;�\�=M�;�\�7ݻL�R=\����8�p/����\'����<�\�L:9\�=�z���S\�<\��B�\�N!�\�N:�.\�<GК�-1=+\"c�F\��q���\�\�%=�\r5<M�>=o\Z;�\�;NR2��\�w<�7����\�<��\�<|�!=\����=q����H�<Cl-=��W!\�<�\�\�X\�q�:F]�]Q\�;\�\�\�<�\�߼[=]=���\�\�\�;X 6���������.\�sO�ϻ\'�\�C�7\'\�%<1\"\�\�\��<�\�Ѽ_g�<�5=;Pb<��x�\�-\\<�\�弧6�<�\�\r�\�V\�<�M�;\�����2�\�}<��1�.1V<1!\\�\�/�{�<�RC<iz���׻Hm9GD<�Sv=x��<�\�\�a\�\Z����O�Y�D�=��(=	%�;`\�\�<\�\�\�qZ�;_\��#j\n=�yB<�HE=��\�<\�\�\�\�Ԑ�\�\�=`����5Q=0�K�|�G:\�[2<��<:}\�<\��l�<�=,�Z{\�\'��<��ao4=���<\��<\r#y�\�\�<!7w=U<O=�)=1\�\�<\��W=m�=�\�=<NY{���[=m\�q<wTºٻ9����<�<띰�[o.�o\�;|-�;I@��b�R<j\Z	<�º��\�\�<\�\�\��LF%�i\Ze�:�\�<%3\"�N_;\�m��\��<\�1!:)\�{��n=�g��l�j=\�鼊&=\�H#�N\n��\�0\�<B�=�L<i�<�\�*����=�}X�����F�<f*.=E\\g�\�-�<�{<�j(�}媼',3),(4,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n\'$��1K¼\"ǼpN=�/=LC=\�������#1�}D�<\�W���M;)7默Ž�u�;Q���ü�\�<j&�CPQ�D�u�\�\�9<mND=\�\�\�;�\�=\�b�;\� =���<�Ū:l��<#\�<�\�=\'\�ѻ6;.U8�W�=\�j�;h=�<2�\�<��+�DZ�<\�=\�M��]Ǽc���	b\'���z<\�,<֩\�$�M=H\�㹽a\�<=�\�=\�\�$�̡<�)��\'�#<Q	$;��K=0\\�=G��0���\�\�x�L<=[e��h����<$k��\�_=\�D=J5���\�\�<)�H<\�\r<+\'\'=i��<\� I�(�x\�\�<=XZ=y����.\�<C\�=���<=]\�~x<�7=o`��\�-��ļ..<g�\�Q\�;�\�<��<$\0�v\�ۻ=Z�<z�\"�\" =\��:<O\�\�<��1�\'�v=\�U<��<[�<6\�g=�4@<\��#�\\�=��i<�\�6<�=v�<!�R�\�<i��\�\�;	S\�<A\�a<A����f�\'��;��A=q��\�\"=ս\0��H3=\�ᕺ��;<���b؅;\�\�<@;�\�=\�\�<�9���ۅ�<\��<T�������=�}��s6�7&��b\�\�\�¼�o\�;սo=\�\���}��Ľ2�\�=<;=��X�.(\�;�\�2:m	=$MJ�۞��M\�&<��j�=�F;\"V<,l(��\��;�\�1<\�d<2�\�\�\0=�k�<x7����u�A�=��<\�3<�\�%�KJ���v7<�!�;В���W\�<`g�\n\�\����N=v�<r��\�G=��\�< /P�5\\����ϼfQ\�<�p_���@��a_=H\�)<��\n�h\\)<U�\\�`Լ��z<[�\�<��=�.�<mͱ�a��,�K<z���k��G\�<}\����\�<<\�<Y��\���0\�\�<�\�o<*T��\0��;�<[��\�5�<C.j=N\�e���`N�i97��%�<��o<�\"=W\�=f�;d����:����X\�\�\�X�����\�\Z�p�2=\�\�<\�u<�\�<�\����%r<T��\��<�\���T=B�`�*\��`MļX�;=\�Hn���<�3<(ß<\����\�Ak�˯\�P��<\��<l�(��a\�\�<.?���=5\� �^�\�ĲO���P�&\�\r=�\�Ӽli@:D�=W\Z%�	\�*=-�G=�\�ȼ\�Y�<\���\�$=�ـ��T���(_<�\�\�;ERi�Cz�<\�?\�<j�\'=�d\r;2¼�U�9u����L=\�\�.�q\�==Ә��\n2=\�\�<P+�:���N�g�p⼼�(�>@��5���\�^�<�\�\\�}W/�%<\�<l���;	�\�P=\�*=�\��<\�m<�\Z�<W\�R����\"\�I=��<m�d=��\�:�\������Ѐ\�<W��cV<W=)[Լ�/��>\�\�;NJ��\'v<f$��BJ�<X;�<\�\�X�&\\I�|\�=6\�<�\��\���\Z�.�!�h��؃��l=\�v�=W�=�&�\�Le�\'�E8�$;=��]�\�\�<�\�\rU=�uM<��\�<#1=\�i<�O�<�qܼ�@D<56�<�\�\'�\�\r�;sd|<�)\�<#�)<dĿ�(�S;�Q\Z�΂��\�a\�<ؚ#����o9i=��=\�q!�\�Ȫ:�E%<-k��v�\�:@��<I���q���o\�6=�#<���<o\n���e�;��K<\'�н\�m��\�\0=S$R��֚<k\�6=R��<[<����W��\�h:<J�\�Bؼt\"Q=\�j�<�]\�;���,\�=��<\�\���S�<V;=\�\�\0�d�<\��X��;�>7�f�*;6\�\n;\�\��l)h�\��=�\�2=\�������@=\�<�;M�,/U�z\��1-�<_\�F��\�<�\�\�л��\Z�<\�d=��_\�<;{\\:\�}���/��\�<�5;~�<;\�#=�\'�<\�@h�h໢5	=Sv��[�<q�4�\�\�=y\�E��S<\�\Z�1t�;��(<p�c�ް<A��^����\�=R\�һ3ў<�:)<\�\�ͼ;b��]�=�\�	��/w=5�	:\�a����<�\�w�9�\�<盽\��=*���S��\�\";�\�W�zD�=-�\�<\�\�<\\�8<�\�A<i�\Z��5��;Į<y�<8\�{\�\�<\�\�1�C[�\�ٔ;\0�Q�\�\���LZR�\�\�\�<\�E��\�B=vt��\������<�\�\�;Hd�<䊼K;+<E�5��2\�<\'�<�\�\�\��\�\�<mï��\�<;�;�\�x��H�\�\�	<\�w�I\����<&T\�<w!�����\�/��u׉<\�F <c��;�\"��7���mB:�΀<�		=1@=e�\�<\"L~=qh\�;b��<�5�ԥ;�M<�X6�ߘ��l	=jW�;\�<��(9��\�;%�\�\"6��G�?�]�i=I!=����g$=\����\�\'�\�\"E;��<\�\\��\�\�:4�\�\�.<\�$J�\'ȍ<bq���H�<ۥ��\�<\�[�<!��\�H���\�˄=8����\Z@��f�\�pg<\�\�W=\n�t<9<:��<\�\��\�t�<�BK��\�=�7o=Fa<Q���G6<_o\�<w�[���;9\�\�:�D�%\�~<\��\\=\�0�TN<$�=\�f0=\�6�\�P\�;\"\�q=��;��\�d\�<7ѽ<\��\�;Of�<cݘ���;\�\�Q��~�����JM�Ʀ*�}0I����<8<y̡<˸<�r�5m��Q��氂<1�\��\���05=z\�=zX^�Q�\�<\'�|;RR5<l��<4�?;M#!�m��<x^�\�9=9;��~��~��;D��\�Ͱ<\0\'�<R ��|*\�<KC\�9�(A=ǚp<\�\�<�k\�Rn�;+쐼\�6��!�޼\�@��c�@=\�\�;ɥ�\�3�	�l<\�\�\�:H�b=ɡt�]yb<��a��=;\�41�7J��=�\��M�\�<|�`<G\�=\�K�y\�j�\�$��h\�;G������Fv�P2�<�	\��\�d���#�,?�<\04�re=`�<SO�=r\�V=�o�.\�c�\�e�<��=�k\�����<�n=σ9�N\����{��\�)�Ȁ0<W�T=�lW=FP\��\� O����<K��\�ܣ���[<f6켞9\�;�vͼ4ɼ͡A�t\�û\�y/=\Z\���\�y�<�?���͟��\�=A$�<���l�˽\�4�<\'\�$=k���䚼\�yb�t�̻��+���<f\\�<�<�<,$��\�\�\��<�\���8<\�\�\�<\�f?�r~��C!��3��\�\���hm<-WU;\r\�<�ꍼ>\�;\�.<Xh�<���<Gֵ�_3<��q�=dҼ)\�h��Fr�\�V\0=ɪ\��*\��<i\�:�m,����Ҭ<��;��#�\�\��n뭼\n�\'=\����3���޻�\�0�~+.=�ʓ��\�ۼ`��o��<-\�\�;�:\�<\�\\!�U�7�#\�=�A7�\n�I<�u<\�i2��\Z<=�\�d<\�뼦\�2=+1x<�S��A���!\�T�\�\���V���p�:jѥ<\�(��������L�ɼ�\�Ȼ\ZX\"=o\0�<\�e�<#\�*��R=0\�5�ms�m\�q<\�aE=�V���|G<\�\�\�<�\���ݓ&�;A�;\�-<��~=�\�B�7���&\���J�ռ��<f�J�K1O��/[���������\�\�닻\�[N�\�I=u\�!;�3=h��<�R\�\�\�+=�ք�\�\"<����sM=3�=�x�<Ӧ=\�P0�M.�|�%���p����\�\�\�\"d�ƶS�+-<�y4<\�\��\�S=xn�=\�(�<I%R<8ı<Y2=�\�x<W6\�<�(2=�8<��\�;P�\�\�b\�z<�s=T\Z=���<R)��>n���\�5�J]=��<\0e8�μ\��3dr�]\�>� ���\�Re�0s��\\8���N�\�;W\�<�ϱ�ឆ:g2�=�\Z<�~��S\�|�A��^K��Ԕ�^%|<!\r����&�N�;\�\�\�<A���9�\"<C\0\�<GD?�\�\��ٹ<�I�^�<Cs�]�<=�h=g�\�:G]=?%\Z�ㅿ��\�=dj�Į�!����g�+f�2�,���Bd�;\�%\�<t��<�;�0�\�\�\���j�\�\\��	�\"�$\�5��v��Ϥ\�\�߼)t3<&\��\�u�;+�6<�%1����d�*=\����vg=e\�=����ȼ�)\�9K\�=ؼ =\�0����<:,N���]���A�\�\�k=\�F=\�U=�c=K\�\�<\�Ka<$J;�\�	=��\Z�%5���<\Zd}�\�Z�O-�;� ����\�=#fk�\\��:\�=C\�<�T=\'2�\�;�<�9@;�ꔼޢ�<J�\�\rD�<\�d\�<\�\�\�<��\�{�;���<aV<\�!>�',4),(5,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \n\�&N<8\�<�B��@ş<w8���\�:\�\�úRE\�<�\��\�R&�����P��<C\�c�6��S����E\�;R3���=�<\���=A�<	Wm<�a\�:x��<\r�\�;�8R<\�\�<�\�<\��p�s�oc�<c=\"�&�\�E\�<Esp��`��\�\n=}wm�\�d���U<\�\0\n�p\"\n=p=+��;�M;�e�\�<�Z�;�\�<\'����7�Ҙt;��4=��w����h9�\�\���{�B�ͺ�\�=�\�K�_`<�=\�p�=��N��3*�sa<\�,߻�\�\"<�E?=dI\�;�f=\�;�,!�5�=��\�,=Ag==da�;�h������;}h=fO�<_�=��Ӻ\�\r}<\�=;8=��\�<\��\�4�;�X9�\�ڐ�T_ȼ�Y\�;Սɺ�\�3=\��Z�6=�\�^=����H8m=A�\��	,F:Lz$=߀��n\�=]h=�\�仯U��z�9.\����\������\�J���^=��;:Iչ�\�Q<���<;�ڻL�=y\0�=Ҧy�\�<G\�D�J���/ݨ<��\�:��<�/c=L�=�\���<\�-=���\�\�)�?\�\�<7)\'=\�\"�=\n��\�=M=\�`\�<Q\�<G6>�\�\�\��\\jF�>h=e=\�ړ<\�嚼�8�F��<\�l�<w-�;�A}=��5�\�\n=ڵ��i�.=H��<��p�\�\�ӊG=\�\�R=2>/<\��;\�1L�v\�;�[�:�\�\�;W+L<\�\�~�	0:����F��:�/�V�U�͌��`���\�\�;K�=Sr�;p�=MQ=��E�\�\�r�I�=\�e��B�<<\�<Q\��<W=\�<�5��B�D��{w<\�ʎ=\Z/=\�\�<k\�1�\�wU=\�<=�\�M<@���RW��#����x�K�=�1��r[t�`��\�_	\�<Ǹ�<\�h�=n<�\�8=ѵ=�7^=.ԏ�/ݪ��<\�\�׼���]L8=\�\�\�;�n��t��d��9\�M\�<>�üE\�=$�z�\��<�AM��H�;ׇ��@��<\�\'�<����\���<ܐX�3:O� =\�X=\�\�\�\�$�\�I���/=s<�Gg<�\�\�<��\�8\n̓<@rl��\\�<ʔ��)\�޼Ѽ��\"T����\�<���<\�\�\��X󊼌t&�Q�G�^\�\Z=GF�\�Z@��c �]��\�\�<�\�9<AS<P\��<f�w<T\���V#���޻�J<\������;#A\�;�\�O�g�\Z<S8�w֯��HT���\"��D��\��k�\��\� ��\�\\��N���ük�+=3=�p�;+_\�<><0�	��m\�<\�M��\�Q����\�\�\�<����?E�`\�,�\��<x��<\����ԼNTT<��;�8���1��t\�<T\��M:G<X�<�b=x�&��������\r<=D\�;Sl.=M-_=\�]B<aG==�\�<b:j�e�aV��1uH�e*K�^�c<}���^\�h\���;zC��c\�>�	8;;L2S�{n7�PtU��x��s�m<\�k��c>\�-z~�e\�9<6$,=��\�<r�<P:\�!K�Dz><\�\�J+K=\�eG=O\�<\n\�=�!=ɫz;I\�\n=\��<\�\\\�<ˮ��\�\0;7�\0��﮻�~�<\�a��ǔ�<�\�;H�\\�\�\�Լ�ںX��<K\���\�\��\���=\�z\�<´L;|�=���=�h\�;\���幼�\�\�;y\��<�l��a9<\Z�<\�o�[>�<\r\\�<Z�\�\�N��Ԑ��\�\�<\�W&�����\�\�\"ÿ�_\�<�pO=���<�=�;�=g<T;��<O󱼳\�F=t$^=\�7=V\�<�7���ϼ\�Q[;�\�\�;8T@��\�\r=�_�\�w<�\�=\�sɼ-���\�8�%\���\�\"=\�Gk��r���L=�\0�<\�\n\\�\�5�;\� �S�ȼ�,<\��I\�;�\���ؗ<l��F���\rD}:2�(8FO���]\���F˵�\�Y�<\�\�~�0�5��.j<\�P<�E��.u\�<�y<���&k�;�`�e?{<\��K<?��;\�k����\�k�=`�;��=lF���D\�\�</�\�RX��ɢ����q�\�T\�<\�\�	���#�5\�e;6\�=s\�#��)<;s=p\�μK���xu���ռS�#�_\�<\'g=]Lo=�5)�\�7g<���\�\��\�e��\�U�qG=\�\rù\�o4�=eW�\� B<\�\�=\"-�<\�*5;\�\� �\ZP�w\0�=8м<ǰ=\�O���H<\�%�<j\�6=�jf;k\��\�\0�<�Ƽ\�\���k��<$k-<d\�o<�C��RSC=Y|A;\rE��ƈ	�\�\0;	�8�<_\�3����<�8&=��\�;{&\�<�7\�;S��\�ŋ8Q(�;,\�j�R��; \�\��u\�V<Ƕ\�<6�\0��^k<��<CM\�\�\�<\r���[�I;�H�\�.�\�=�\�	=\�v�=֟��)�=\�D=(�;�\�Af<ui�<�[�\�U��s9�\�#�=}cd<���<�6\�<�\�.�m͆���<�����*�\�7<9=\�7t�\�	���==\�h�=\�\��p���%��V�=��H�ե�\�\�ɼL\�\n<!�\r=��P=���=\r\�׼w�3< 1<��	=���<њ���Ǯ=(`\�<�ټ�1\�<�T��Z����H���K�v\�\�<Ϋ�K\�<\�\�3<\�7�<J�\�<�\�=\��\\�\�@=L�@��[=�\"A���<\\DS;35\�\�=�>��k\�\�`�&=\�3���ļ�ި��%=c\��\�Ä�rok=�3ۼ�5�:�Zػ\�#\�:�2E�\�D�7^\�=BF�����a&f=\�De�\�xM9\�h��\�;�<\�;U�ٔ�;Oߴ�r�;\�e��ˇ=�B\�;�����΀�\�<<\�A;X�P�\�lI��\�˼j\�+���_�܈\�\�s%=OA���#F�\�\�ȷ.6%�B�5=\�\'<��\�$�<�,\�:�\n\�͘<	Ƽ)o\0������E=\�\�=2\�E:(���1H%�P**�6\�H=Ur\�<\n\r=��7��O+�w�]�^T��g�F�R��-\Z<l\�8=f\nl�\��\�I�<)\��6h\0��8=p���\�\�=��;�g׼9F�<\�\�=_\�(<F�s;\'���l���o6\�<ܑ�<�U{<3�v�Y�?<��;q?�<ɔ�E�޼zu�<�0q�ɲ\�;\�̽<r܃�C�P:=\�!�%�B\�S�͡⻫�˼a�y<4ȥ<,�\�<\���X�=\�\�C���KS�<ڒB<TW=����P�\�g=\�\'�\�\�\�<�럼�A�<\�\r�L\�{��\�λyI\�<@\�=ʸ�<�,��̏9Ｑ:]\�\�\�\�ͻu�=��y:�\���c��\�bl��f���\�<�\�=Ds�hCl=�\"�=\�\r\�<y6\�<��o=�c!=�#�)i�\�&ͺ��\�:\�\�\��H<ax=D�$���>�6\n\�K\�\\���\�;�\Z��+t�:{�-�q�\�<-D\�<);ռ8$߻����\�\�\�&�I�6�\�;y���C;R\�z���8=k~�<�\n�=z�;\�u]<5L��4�=�\�}<繼\��<�/����<,���󾥼	=�=���\�T=\r�C<\�\��<�\��YG=,h>=�\�=�\�\�<\�h7=\�3\�:F}�<dT\�<.pB;]\�\�<{\�;!\�+�	l�<�CۻtcJ=��<e���\�]\�:]?{�S��I�:\�>=\"�8�u\�$��\�\�<��<E[��y�3vλ�\��A=�\���g*=��=@�<c0Ⱥ0\����G�;5\�<\�(=�\����=u�|=c�=�O4<K$ĺ\rz=�\�\�\��<!�M�q� <�a�<���<\�\�\�o�<5K=&�\�;R\�\r�\�\Zo<݌T=�\0Q<\�Kf�T�8=k�ʼ\�\�_��b@�\����\� ��\�&E=\�\�;\�-V=��żڦ :\�ͼ�\�=�\�Z<Q\�ͼ�\�1<\���?�<$<W��;H��8)��\��\�\"	=`*�������OL<G�%<`\�j=��H<Դ�<�l\�;$Ǽ���8��<\�o��}�\"�\0�Ѽ�2\�e�R=\"=\�\Z缟{!=@�ƻ\�\0��T\�<�e=�i�簴�=�B��\�\n�\�|��\�3�<\Z(��\�.=\�h)�j\�\�<�\�W�Of�\���O:��_I�\r9/=\�9=�\�\�<\�\�;\�\�\0\0L�\�g<-�<�����B;%\�a����ϼ׼6���@<�jV��Ѽ\�\��=ђ�������\�=2)=\�\�!�\�\�C�.��;�\�=m�q<ْ<m찻4{k<�\Z)=���J�I=�\�*=�\��_ɠ���W�B\nY=\�\�P,={\�\�w�<#\�t=W4\�:�w�<�Ƶ8V伹� =\�\�s�h?T�\�>�:\�\�-���<̥<B;��U��=Ӷ;�\�\�<�ō=)\�\0��.<\\\�<�[��V(#;A�\�\�k���W=\�%)=\�{<\��',5),(6,1024,_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (1024,), }                                                         \nx\�9\�\�.=u\"=�D�\�9�<�C=6xE�\�)<=\\\�<�g\�:��T=��K�=N���[*�;O\�<�`ͼ��=@�p�\����\\=�\�˺�E�;\�U�<FJ��r�ļ~\��<�+�<5\�7<\0\�r��׿�Nܞ<\�\�ּS\��\�U\�<G����J�H�3�/�:=-���\���=�\�\�<O��;0\�G��q=�\�ϼ�\�<+�;*\�\r<�\�e<.2=5st�\�\�<Lp��(�&�\�\�;��\�<L\r�j�t=\�P���xؼr�\�<�\�R�����\0Z�c����\�ż�v�9\�\�;\�\�I<\�ϑ<Ug�<R���=�\�<�\�=\�_i==�s�Mu<(���$E=�\�`=Wi�<E\r=\�\n<�8��\��\�;p�μp\'K=\�\�\�7\�,�W\�ȼ\�74=ù˻\�>< �1����;Ҧ�<F�<��=\0n=�g�\�~ļ_�����:��<ލ=x��<ݶ\�\�Ǽ\�ٵ;f\�= 5�<-@�<��\�௘���6�$�\�:�������Y\�I?=w`ѻȦ��lt�-K\��\�\0��\0V�\�xK�Zrb=)\r�ۿq<mm\��!�/�+\�=]���Y���\�|�<��\Z�\�����\n<��9�D�tt�\�\�\��Ή��\�$=\"\�<OQ��\�!<`A\��r�\�:����#�`<	<\�E�\�=H6z�%��<ϴ;������\��;\rA|�\�XK=@��\�B=��\�<^\�\r=V�:=�QH�����\�\�=<�a��E^�����CNg��i*�	\\\�<&\�E<�!�\��μN�9=񫻼R\�\'�3p��кG;�\Zh<ǫy<3\�=\�U�\�缲���o��\�;\��=} Ѽ\�J\�;\�4%�ސ��1�\�\�;\�\��q^s�;��[�\n�\'֊�\�M ;]u+�&��\�\0d=�&=YU�<	\�{=\�\�<\�.��x�;�OU<:h\n=B�\\=��\�<qx?�\0h@�9Z\�<��\�<=Ѽ\�P�C�\�<x�\r�L貼0+\�<\�	�\�!N;�ۼ��\�4n�\Zf<\�Ԇ�\�z&�N\�\0=m\��6���5�:)\�\�;/\r�<\nWz��j<<\�G_<I�H�8�i�Y��\�U��\�\�<0`��Tm�=r�\��V\r�<\��w\\����%F��*�\0=�6�<\�pA�\�\�:\�\��?�\0�ׇ��\�\0\�\�,�<\�\\J�T\��ŷy=\�v2<GC;�\�m=\�h�\�h���<��P=O��%NݼTr\�Q`=1i��\�ں�.\�<\0K�<��޼m\�X�\�<\� a�&\��<\�7�;�\�;cKy���<�\�ѻT����:X<I|=޾���Cܼ\�X!�s\�#=\n?9;a��nr(=�a�<��&�\�ދ<=\�=\�\�L;\�\�R;\�OP�\�\�=�օ=P\�9񲬼Ly�<\�P<����ᩣ=δU;�\�F=]����\�K9< b=\Zb)=[AT=�V<\�\�;�����\�:�t�;+{�\�51�<#�==\�\�1�\\�!=o6��uz�<\�\�����;�\��<\�8<L0\n�4h��\��<\�\0=y@\�DC{�=\�q���H<D�\�0o<[�\n�)mP�\����ҼQ��\Z\�;���<��\�<ٲ\r��\�6=���=uE��\�\�\�Cu<\06�A�;\�:#��޼<	=�E�<�u!�\�\�B�����<y\�|;�+\�<_<�c\�;a\�#<F^6=\�\"�<6w9��9\�<ޥ�<���_���{����=�\�4�\�\�=�?A<�L�;|��\��<�\�J=�\� �h=)=�<ή<\�Żṙ<�C�\�U�=�<\�T�A\�-=ػ�<c���>s<I�\�:�9\�9�0Y=m\�\�<٢	������������D<\�\�p��s\n<Xs=<W2<� =#I/=�	9=X����4<:=�O3�!ּ+��l�<J95�\\\�n����f��\���\�\�P=�\�i=�nͼ=\�u=��˼\���;)\��\�]��\�?��«�k\�?��/�<\n\�ļ\�{���\n-=�͎�%� �#���\r����\r��;�<�\Z/<b71�į���\�<�ӱr;\�`�:^�L��\n\0�s�G=ϥ�=�2�<\�\�<���F\�<����#��]M�\�>�\�}/=�b�\�-��v\�*��\0i�?��\��\�̥<��Q=\�Rڼ�\Z8=j\��\r=\�XX=N~<j.;�}hȻ�\���k��v��\�\�W=��ۼ\�Lx�ǹ\r;G7=\�M\�<\�駼(c�<�q?�cK=#�==8��;<��<2=\�J0=\�<��=z�I�<���6u=��w<\�/l<�e�=9\�;�q\\�]/�\�{]<\�\�;\\���a����D=+�<,l��9J�<k�n=\�=�Gz<�\��\�\��;�)<oT=�n<H��GQ�Yo=BG�<1̉<�v�=\���\�z3=\�<(���\�\�<\�\�3=�`,<\��\�<X3�����\"����<��A�G;�0=d0%=�`s�t-<\�l=\�K��>滊���E\�<\�M�<�\�=c=���\��=9Ox<F\�V<�q�n����$J;�*:�\�ŋ�Ro�\�p�<Źl�\�\�<[?U=U����-;�����$=��\r=�e]<;�\�;�\�\\�&UT<\��<`��<�\��;o\�=;9�<�w<K��S��\�s���h��\��4�\r\�<�l��������$�\��!��P�!=?ۻ\"��\�T@=�=\�Z�\��\�\�=U\�=p�{\�\�;��ݻ`V<\�<�\�Ӽ-f ��L_=����\�7=2\�<H\�\�M�X��\�B<\�m�<S\":ȫ�E\�\r��G��=\�y\�<q\"F�C\�ɼ�L.<F�\r�:P��n����\�3�&=��\�;v+=��7<!Ǖ<rO\�\�IX�<ش��3X�M\�^<ׇ==4\�\�<@V��K�=\�f�<\�\Zܻ\�\�(<|=�B��E`S<i\��<GR�=\�h\�<���R;���ʼuBp�\"&��{\�<S$=ɫ��\�b�\�\�p<�6\�;\�=�\�:=V\�7=l�3;�,Ż�M?�\��=Tm<��\�<Q}-<\�\�M=�\�\�<�R\��k���\�q�={F�Q��;�\�K�Qa�<\��v��\�;�,6����\�<E -=�c��\�!=ݔ\n��o=)?���#\�<\�U<�����=8�<�� ��鉼\�\�\�<�b4�|%�6\Z=\�ɦ����xW��\�ӼC\�I�z����\�<Y�A<�F#=b�\�2\�<x\�{�?\�=�TT�g-�E\�\0=\�\n��\��<&���\�t�\�D����U�@-��\�<�\"u�\�3��@(C<-,ټ\�K=\'�/=ؘ�k҉<����@�\�;|\�\�;5gݼ�21�d���]P�;�e��ڂ=\�\�к%��¥<(\�¼�u�`\�<��޼\\$d=Dǖ=�~\�<\"\�?�@\�һB \r���Ҽ\�C&�M\�?��<~�<.\Z�;���ctx<�\�[<�y��\�b1�\�R9�5=Zo׼Q����B\�:j2^:;(�7\Z{:\�ZǼq\�^��L$=\�2j��^���M�aKٻ��\�<-nͻ�8�\�A%<!{\�<�\�;��<���\�׻>�<������\�<8(<a��=},	=Byg=/n<M%�;D���i�?=[ļ�e\�<\�0V;�\�;\���BU\�;D6�����=\�S���=?\�=\�\�;�����\�\�;�h!<��\r�\���\�:\�\�<�\�茂<Y5���˼=@��\�U<�/�#b<�C�\�#��⦼�Z���)９\�ͼ$\���\���?{\0�Bw��!�<7&;=\�\�=-�=�@={\n��#Sr;�A=lݻ�\�X�\��Qv\�<wS��\�q;\�״<�O����!=\�\�\�;F*��\0=}\\�;N��r�T:�~\�<�\�<�=�\�`�\�!�y�V�\'�����=�;�\�\�;��ļBCA�M�<�\����8<v֬<\����b��������g/��|;��\�w�\�a\�\�\�L��\�\n\�<�\�<tS�<�\�\"�*G%�\�k�� \��?�B;\�u=\��\��^�\�;S���\�\�l=�\�=\�\�<��<\�\��7<�Գ��\�2=r\�l��͖��<�Ϯ��8=ո<��Ҽ\��\�2�<�\0c=�V���\"/�\�6���jY�Zi<��\�<\�\�<�<��`�\�b��B���R�YAA��?\�\�\�5=\�ZO=܇\0=>e_�t�J�}��<������\�\�\�\�\�$<$��;ނ�<�`<\�6j�O∽\�.�<X�\�؁�;�T�\"\�м\�u=\�0�<󘧼��l;Aj������\0\�<gUV=J�߻��;H�=:\�k;qj:�mCZ<5�N�\0q=���\��\�a�<q�\�Ǫ<d�̼c\��;�\�;Y�<�\�\�\�C�<\"v=��k���6�r�\�I>;�g\n��f?�w�\�;��<(\�\�<T\�~<;7��w��&\�s�ep�<',6);
/*!40000 ALTER TABLE `jobapis_postingvector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_ratingcompany`
--

DROP TABLE IF EXISTS `jobapis_ratingcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_ratingcompany` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `target_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_ratingcompany_target_id_ce49713f_fk_jobapis_company_id` (`target_id`),
  KEY `jobapis_ratingcompany_user_id_0ff4a646_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_ratingcompany_target_id_ce49713f_fk_jobapis_company_id` FOREIGN KEY (`target_id`) REFERENCES `jobapis_company` (`id`),
  CONSTRAINT `jobapis_ratingcompany_user_id_0ff4a646_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_ratingcompany`
--

LOCK TABLES `jobapis_ratingcompany` WRITE;
/*!40000 ALTER TABLE `jobapis_ratingcompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapis_ratingcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_ratinguser`
--

DROP TABLE IF EXISTS `jobapis_ratinguser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_ratinguser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `target_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobapis_ratinguser_target_id_e643257c_fk_jobapis_user_id` (`target_id`),
  KEY `jobapis_ratinguser_user_id_c41bf5c6_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `jobapis_ratinguser_target_id_e643257c_fk_jobapis_user_id` FOREIGN KEY (`target_id`) REFERENCES `jobapis_user` (`id`),
  CONSTRAINT `jobapis_ratinguser_user_id_c41bf5c6_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_ratinguser`
--

LOCK TABLES `jobapis_ratinguser` WRITE;
/*!40000 ALTER TABLE `jobapis_ratinguser` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapis_ratinguser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_user`
--

DROP TABLE IF EXISTS `jobapis_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `user_role` varchar(2) NOT NULL,
  `phone_number` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_user`
--

LOCK TABLES `jobapis_user` WRITE;
/*!40000 ALTER TABLE `jobapis_user` DISABLE KEYS */;
INSERT INTO `jobapis_user` VALUES (3,'pbkdf2_sha256$1000000$PWm8devT2fKJuAwDlf5iJU$dmdF5aJaqTkZ/4Ilz5XlIv0jc+nfsPfQhDXk1yiJ4O8=','2026-05-10 07:01:27.871611',1,'admin','','','admin@gmail.com',1,1,'2026-05-10 07:01:18.620554','image/upload/v1778396663/dfkywmx6fgrjiocjqif7.jpg','AD','976521288'),(5,'pbkdf2_sha256$1000000$5hsLWL4HqU5dHWTwhN9MRL$+ef23K3Jzl01gsOK3Dn32ykP3uB2PygONtuxZVzKvnY=',NULL,0,'employer','Demo','Employer','dangthanh.992004@gmail.com',0,1,'2026-05-10 07:03:50.777198','image/upload/v1778396630/q7uj9ablftgct8fgocql.jpg','EM','0345067146'),(6,'pbkdf2_sha256$1000000$rMs19q5luOvwJf1VgnbxD0$aoFFC9zqEBK5hx5aN/rgBu3Btpik8vfecqNQoowqFGg=',NULL,0,'candidate','Demo','Candidate','dangthanh.090904@gmail.com',0,1,'2026-05-10 07:04:23.174007','image/upload/v1778396663/dfkywmx6fgrjiocjqif7.jpg','CA','0345067145'),(7,'pbkdf2_sha256$1000000$LSg5vD5HsnzGEzHbvyfUj3$Omw3fLvfdwrIl8Bcz533EvHakKktsGbEyDY9/OAFoXs=',NULL,0,'candidate01','Demo 01','Candidate','candidate01@gmail.com',0,1,'2026-05-10 07:11:49.182362','image/upload/v1778397109/jf3ufzvqjeghs7yzae2e.jpg','CA','0345067101'),(8,'pbkdf2_sha256$1000000$6ZdUbGGq2ixajmb6cPqxbB$KcqmU0a/+4aoQ7OyNxM+NpJ+tQ2rkvi1IG4rrgklrL0=',NULL,0,'candidate02','Demo 02','Candidate','candidate02@gmail.com',0,1,'2026-05-10 07:12:03.898996','image/upload/v1778397124/mgkwuoi9twkvzlvudzmw.jpg','CA','0345067102'),(9,'pbkdf2_sha256$1000000$IrsdeL48gY2wP0scpButxC$LdsAHJLrwAwPdzpoNlxecfZ6S4dH/06sIIMeiCQRM4M=',NULL,0,'candidate03','Demo 03','Candidate','candidate03@gmail.com',0,1,'2026-05-10 07:12:15.419645','image/upload/v1778397135/o5vfjk87xvkbf24ar8gb.jpg','CA','0345067103'),(10,'pbkdf2_sha256$1000000$vKYqSlLF4mpqx2qERoeRg3$2bEPpskZFhO6P5hknqIpmDprL5v6y/ug9+6HYmyj24M=',NULL,0,'candidate04','Demo 04','Candidate','candidate04@gmail.com',0,1,'2026-05-10 07:12:42.482769','image/upload/v1778397162/aphvhlsueh2lizzpylrv.jpg','CA','0345067104'),(11,'pbkdf2_sha256$1000000$3BELnRRrF0ASW71KGDJrqt$qJbjf3jUOHborULeEKdUkac3ZNwVyyw6Rm/S1q2fP04=',NULL,0,'candidate05','Demo 05','Candidate','candidate05@gmail.com',0,1,'2026-05-10 07:12:54.495064','image/upload/v1778397174/xccipdoqfp2wnbplz7lc.jpg','CA','0345067105'),(12,'pbkdf2_sha256$1000000$f5XVA2o77ypQF2wFkCTc1S$bx7lUaNVVPQx54V5N15gepXeoExCNVHV8ZY2yj0h5aQ=',NULL,0,'candidate06','Demo 06','Candidate','candidate06@gmail.com',0,1,'2026-05-10 07:13:04.891820','image/upload/v1778397184/msvnjhlw6c8hlkdylmlu.jpg','CA','0345067106'),(13,'pbkdf2_sha256$1000000$3ymyE11suB6Sq4U7qOF3YI$dy58sHPcfz+mBmSArZg1GO1uievwIgZcohTmVZFpGJY=',NULL,0,'candidate07','Demo 07','Candidate','candidate07@gmail.com',0,1,'2026-05-10 07:13:14.460735','image/upload/v1778397194/oguoredotykeyrg9dp3d.jpg','CA','0345067107'),(14,'pbkdf2_sha256$1000000$iqFkwRQJnSa9hvmWg6iQ6w$giQf6tsIqcp7cMUD3IpSdJ7yeGW2A9k+hjBMHnZqkdM=',NULL,0,'candidate08','Demo 08','Candidate','candidate08@gmail.com',0,1,'2026-05-10 07:13:24.704453','image/upload/v1778397204/gdfs62tsk5dkljixxiot.jpg','CA','0345067108'),(15,'pbkdf2_sha256$1000000$lw0rrj3WcSp9KVzExYYsbL$hmi+i9FShGK5//eOwTMddSY5kkuNeoYrgZ+it0v3Bd0=',NULL,0,'candidate09','Demo 09','Candidate','candidate09@gmail.com',0,1,'2026-05-10 07:13:34.855227','image/upload/v1778397214/sfbgvrtocrd96z09lt3s.jpg','CA','0345067109'),(16,'pbkdf2_sha256$1000000$5CPwftYJ6W7ty9him47B3d$3jCjUMnyihMijyYMX6uIxcpNZFsnBIHpQ5txVsAcLJg=',NULL,0,'candidate00','Demo 00','Candidate','candidate00@gmail.com',0,1,'2026-05-10 07:13:46.924431','image/upload/v1778397227/ftkjm8sxbdxzraifmdb6.jpg','CA','0345067100');
/*!40000 ALTER TABLE `jobapis_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_user_groups`
--

DROP TABLE IF EXISTS `jobapis_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapis_user_groups_user_id_group_id_257d4cf6_uniq` (`user_id`,`group_id`),
  KEY `jobapis_user_groups_group_id_a059c73c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `jobapis_user_groups_group_id_a059c73c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `jobapis_user_groups_user_id_11f1c140_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_user_groups`
--

LOCK TABLES `jobapis_user_groups` WRITE;
/*!40000 ALTER TABLE `jobapis_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapis_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapis_user_user_permissions`
--

DROP TABLE IF EXISTS `jobapis_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapis_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobapis_user_user_permis_user_id_permission_id_9d738472_uniq` (`user_id`,`permission_id`),
  KEY `jobapis_user_user_pe_permission_id_a3ddbffa_fk_auth_perm` (`permission_id`),
  CONSTRAINT `jobapis_user_user_pe_permission_id_a3ddbffa_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `jobapis_user_user_pe_user_id_4062b45c_fk_jobapis_u` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapis_user_user_permissions`
--

LOCK TABLES `jobapis_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `jobapis_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobapis_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  `token_checksum` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_checksum_85319a26_uniq` (`token_checksum`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'wMFuSkGhei3OIKjnC2jaXCd6cGg3zP','2026-05-10 17:15:25.251284','read write',1,6,'2026-05-10 07:15:25.253215','2026-05-10 07:15:25.253226',NULL,NULL,'a3d8ab0946539471f82903af3d96a5d2b7c430f6b6af3ccd8fc47e9ada1068d6'),(2,'fU1fHPHVF4zcHmSWGpljdOX11KZxUK','2026-05-10 17:15:31.365288','read write',1,5,'2026-05-10 07:15:31.365624','2026-05-10 07:15:31.365633',NULL,NULL,'b4690b5b8335dfa7873d07a0af9fe1a9f9b524bc83a8b9b33f360089bcada76d'),(3,'P7wvO9e6hUoOlc4oWU36QhvPTGLPss','2026-05-10 17:24:11.329550','read write',1,6,'2026-05-10 07:24:11.329996','2026-05-10 07:24:11.330007',NULL,NULL,'e5f9d4adc84d40c34977304b387421ffe6588b3a8ece8a3a182fd0c0abb4c44c'),(4,'22CEnx8ADy3wHLaGvE0gBoLJRst5v2','2026-05-10 17:26:15.209435','read write',1,16,'2026-05-10 07:26:15.209759','2026-05-10 07:26:15.209768',NULL,NULL,'1438fcedfc183d03277243672e260a01d2ad1a19fcd5026ede0ec24201160dd2'),(5,'xlKCwoJw0xIDGt5W2wBRyyzutp7SDd','2026-05-10 17:29:27.750391','read write',1,6,'2026-05-10 07:29:27.750709','2026-05-10 07:29:27.750718',NULL,NULL,'e92523111eb89f142558f79b09747c6125b3aa7a5d8cae844bb4857b10fb4f7a'),(6,'x1Zn9VBGXs4hJcwbf4WWo1IlW2rcwJ','2026-05-10 17:31:05.409068','read write',1,7,'2026-05-10 07:31:05.409411','2026-05-10 07:31:05.409420',NULL,NULL,'60535e23d537579fa84ee5672e6617dd7de1826524a456fc93a1e24c0952bb69'),(7,'OnaTkxBbH0oMpMERfBXGGzC2UdtQ5j','2026-05-10 17:32:26.089161','read write',1,8,'2026-05-10 07:32:26.089642','2026-05-10 07:32:26.089655',NULL,NULL,'2ed37e69235c9d285b1424d1e3e16abd75bc8c07c4213c99b770f4b12059850d'),(8,'Xm00nmhijJlNfuPLRN9tHYBrqBtkPV','2026-05-10 17:33:27.565420','read write',1,9,'2026-05-10 07:33:27.565747','2026-05-10 07:33:27.565757',NULL,NULL,'be53873dc5427ac099a2a2a6f5a0394d9daf4058d13c52d6cac0f3063dfea933'),(9,'x0bti0Xe7fAhTZ3hjrbP21oLcmfG0p','2026-05-10 17:34:38.501177','read write',1,10,'2026-05-10 07:34:38.501749','2026-05-10 07:34:38.501760',NULL,NULL,'e6fbd5051a56808d8608d50855a76a7167980ec589f07f31fbca51bfc74cacc1'),(10,'Y08IqrlmMeA7lrRby85d8vrmv7lZQJ','2026-05-10 17:35:04.368954','read write',1,11,'2026-05-10 07:35:04.369230','2026-05-10 07:35:04.369239',NULL,NULL,'aef7517b82c49d7458f1ca8a9c35f335b3de2458feb06d0bcbe0570a36bffc2b'),(11,'zLKIcRJjuItncUOB79Zl4WIp9iRplG','2026-05-10 17:37:08.547891','read write',1,9,'2026-05-10 07:37:08.548204','2026-05-10 07:37:08.548213',NULL,NULL,'65256489cad08aeec9c25bca262df7cdc4234baed7955dfa722979464dc70cdc'),(12,'ZplVoGjnQqN5L36bleHFpYRvU3xViA','2026-05-10 17:37:43.699557','read write',1,12,'2026-05-10 07:37:43.699852','2026-05-10 07:37:43.699861',NULL,NULL,'d257098ba4c7bf9c8d6c8f6390bca510f0fc09af481315a8277aa0aaa228dbbf'),(13,'OfQUnIKtrXHZeXhm6uswXXqrxng1A8','2026-05-10 17:38:59.264073','read write',1,13,'2026-05-10 07:38:59.264361','2026-05-10 07:38:59.264370',NULL,NULL,'957fef55aa51a01cb0fe561ba1c7aec172de42b7259df5aa11198f541bab3687'),(14,'RQiQUezO0qlM7FM4jUiRwV330YqI4o','2026-05-10 17:39:52.421589','read write',1,14,'2026-05-10 07:39:52.421902','2026-05-10 07:39:52.421913',NULL,NULL,'17b61b578e370f4f9d2ba15956eeff566504c66d78350c46d2b0eefab78c16bc'),(15,'Zg2bbfpVfDEIpLWg8vEO4I0o0TZPRn','2026-05-10 17:41:11.251839','read write',1,15,'2026-05-10 07:41:11.252159','2026-05-10 07:41:11.252224',NULL,NULL,'53a56d7fb7aa11489125c45ff17c1cb37e800feabdb05704895106899c144f38'),(16,'pfdlikwyJPkuGXHy9Uv5SpS8XGTTao','2026-05-10 17:44:54.832018','read write',1,6,'2026-05-10 07:44:54.833515','2026-05-10 07:44:54.833538',NULL,NULL,'fcbac1e24b15bf86c9f6abb6464a185e8e551dff791d085605734ad6357bd1b5'),(17,'zuLtieh2pLx5sEBXnqElPOUkm4PEBT','2026-05-10 17:49:08.778779','read write',1,5,'2026-05-10 07:49:08.779067','2026-05-10 07:49:08.779076',NULL,NULL,'33cfd4707f4bb0fc4e701230d999a7198c816b2c1ac38e609659e8316ce42a92'),(18,'qDU8tCMoyFcGoB7iRpt1W834VgwSHX','2026-05-10 17:49:39.230066','read write',1,6,'2026-05-10 07:49:39.230499','2026-05-10 07:49:39.230509',NULL,NULL,'185ab4a0dc0c708ba83db4308aa584eb50dae0b04187e16ce45b5b8c4795161f'),(19,'QN7lUVi6bCeQtJ5ahT7cw8lpYLU4Z4','2026-05-10 17:55:16.806020','read write',1,5,'2026-05-10 07:55:16.806455','2026-05-10 07:55:16.806471',NULL,NULL,'a5503c5070d5ecf25c76cb68ed82d04b261d3e534f1addec0858714ccb2c0d55'),(20,'seniCmAiD1tOC9NEHr2KqDF91Eg3xh','2026-05-10 18:23:33.676287','read write',1,6,'2026-05-10 08:23:33.676748','2026-05-10 08:23:33.676759',NULL,NULL,'9cd613d4a39be54452af544c560ab88d75fa97cb7d35a74bc55de275bb64b790'),(21,'Hk2bkSRmI4SYxg9i3MeU7HXfpYHUeG','2026-05-10 18:23:58.955539','read write',1,5,'2026-05-10 08:23:58.955873','2026-05-10 08:23:58.955888',NULL,NULL,'0b83f91d8f993fa6d833162f0191bbeccd16a84342d597ad23350cbe8d542479'),(22,'e7s6qaoOnSmGZGRVKSXXSy56PZAcS8','2026-05-10 18:29:17.041304','read write',1,5,'2026-05-10 08:29:17.041836','2026-05-10 08:29:17.041845',NULL,NULL,'9230cfadb945d87df281fb3b7799863014db467b40122be330a2d8bb532c1e3c'),(23,'EfFhCDcTPDaAw4RwXmtQkaSFqOj0TM','2026-05-10 18:32:34.163980','read write',1,6,'2026-05-10 08:32:34.164439','2026-05-10 08:32:34.164449',NULL,NULL,'e23ae2962a04294a1e7f70ef0ebc0e81e29db1f56a52c601e3927cbd74686815'),(24,'aoluxMMDiYc5HCT7MGZ2y9CcETywlW','2026-05-10 18:39:07.248586','read write',1,6,'2026-05-10 08:39:07.248992','2026-05-10 08:39:07.249001',NULL,NULL,'9b936b762397a75350f849b5e04442e6ee4948da1d660e9310466518336efd24'),(25,'V9Kdo47pSBRmtBMtB4u36HWuTpspVp','2026-05-10 18:46:21.360623','read write',1,6,'2026-05-10 08:46:21.360918','2026-05-10 08:46:21.360927',NULL,NULL,'f0e0442e381f2ceefd500e4a468f9a25fcb62754e3bd8c862bce039e6ebb29f4'),(26,'eeSii3QfPDUptLWddagrCjaaunfurG','2026-05-10 18:48:12.822953','read write',1,5,'2026-05-10 08:48:12.823275','2026-05-10 08:48:12.823285',NULL,NULL,'5b8181500a03277ff6cfe41ff25c8b02dd1df04a818b6387114eb811edb43c20'),(27,'S21txB5PN70ZGsIaJiTJgMGRkFKo5S','2026-05-10 18:51:01.280571','read write',1,6,'2026-05-10 08:51:01.280917','2026-05-10 08:51:01.280926',NULL,NULL,'b97e70ec254e19835dbb179970560a3e6c8aefeeb123dceb5e0b3fa25583f50f'),(28,'lD7V8iGTkHxW5RQhLGP8KYJhl5f5b7','2026-05-10 18:52:40.714401','read write',1,5,'2026-05-10 08:52:40.714883','2026-05-10 08:52:40.714893',NULL,NULL,'171a36c1013e4e086977c1643033d5ff40a9f137b6756f58b48f262360036d41');
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) NOT NULL,
  `post_logout_redirect_uris` longtext NOT NULL,
  `hash_client_secret` tinyint(1) NOT NULL,
  `allowed_origins` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_jobapis_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'G1gA0t0nIsAJqyBSc1iyNb1Daur3qktL7VxDyIAq','','confidential','password','pbkdf2_sha256$1000000$YXEXT0nwtXgq5LumuAKNbE$vy1+GLEwzJfctok/LIlTNut1Z88ZvleFRZa1DemcV3k=','job-system-backend',3,0,'2026-05-10 07:02:55.451655','2026-05-10 07:02:55.451690','','',1,'');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) NOT NULL,
  `code_challenge_method` varchar(10) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `claims` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  `token_family` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_jobapis_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_jobapis_user_id` FOREIGN KEY (`user_id`) REFERENCES `jobapis_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'byqMqtaNPoeofwRRXzw0kEDZ7kueud',1,1,6,'2026-05-10 07:15:25.255713','2026-05-10 07:15:25.255764',NULL,'df9b5fda660e4400ab2a2b32b7543ecd'),(2,'WvPuIc1Hc1olHZois6EfghDYeTiBvF',2,1,5,'2026-05-10 07:15:31.366806','2026-05-10 07:15:31.366831',NULL,'0457477801f448f1973801c231c08e88'),(3,'Pby7Vljhsgb8DTxX7ltGGE7HztjAMs',3,1,6,'2026-05-10 07:24:11.331374','2026-05-10 07:24:11.331430',NULL,'ca0528c9a6444f168e01d9e6ebe6fb1a'),(4,'9ENQqANCFUsadS3L5MOCwQx8uslouM',4,1,16,'2026-05-10 07:26:15.210863','2026-05-10 07:26:15.210884',NULL,'d5d89aeaf6314bb68bf8d86ceb5d9813'),(5,'zip4AWlXaH3YsexunNguuojqNGirHq',5,1,6,'2026-05-10 07:29:27.751638','2026-05-10 07:29:27.751655',NULL,'5993a0ad1e534cd7898350834d8b2a32'),(6,'X54OSK2DKA7H6DuyufI3wqJ9TBJuFT',6,1,7,'2026-05-10 07:31:05.410721','2026-05-10 07:31:05.410770',NULL,'5cee1ee3d3ed42fab6cc00a8133bd21f'),(7,'DQugjv8BqQIO8SdEFe94PJLljIvWCn',7,1,8,'2026-05-10 07:32:26.091301','2026-05-10 07:32:26.091326',NULL,'39126473afcc41f2ae6742e5216fab31'),(8,'yjejdiqCyWJFUnOv57YWXYCgSRCjOL',8,1,9,'2026-05-10 07:33:27.566758','2026-05-10 07:33:27.566774',NULL,'2045bb9bd2d242e9b90b980d205f5bb3'),(9,'RJkOBc1hoacTeCHhK3VehsW1tKnPV6',9,1,10,'2026-05-10 07:34:38.503096','2026-05-10 07:34:38.503118',NULL,'55743b45e8ec40b28a02c6785b31bdb5'),(10,'ARDMRUdel7uFTe9Igo3aijzM0zovJE',10,1,11,'2026-05-10 07:35:04.370140','2026-05-10 07:35:04.370157',NULL,'0d98d7de23f9427e953fab15b35bdc19'),(11,'ruRiwxVmoUA6300qShQ6J9jK0zHEhF',11,1,9,'2026-05-10 07:37:08.549272','2026-05-10 07:37:08.549303',NULL,'9145427132eb4e29bd19673536a264b2'),(12,'Dw2mfy99brBnrUqgbtzYx93gwyKSf5',12,1,12,'2026-05-10 07:37:43.700832','2026-05-10 07:37:43.700848',NULL,'25ac1c80312c4a2aa8c7f7eeb96c93fd'),(13,'8noGlA0uQTzjTyUA4w292Z0dlx5K5y',13,1,13,'2026-05-10 07:38:59.265325','2026-05-10 07:38:59.265344',NULL,'7dd2bbdfc8ca410a8aa6c7cb00397c37'),(14,'Te58jO4Ba6jvIv7qlIRTXlmiSJMPxy',14,1,14,'2026-05-10 07:39:52.423550','2026-05-10 07:39:52.423582',NULL,'271ac50127d04abfaf1a0637b9eec3f7'),(15,'XgesLSrAxhzicn3YbhnuVUPkme4vj6',15,1,15,'2026-05-10 07:41:11.253474','2026-05-10 07:41:11.253499',NULL,'7e1426a728a94aca94468e5df9104e48'),(16,'ADn9MD3ImxGTzPzKNHxuocYqGvtTNX',16,1,6,'2026-05-10 07:44:54.838306','2026-05-10 07:44:54.838331',NULL,'292e2a2d37a942c39ffbfecdcd7b1b70'),(17,'Ck2tmWUj2zOMB7cHo7TOMhj73kEaQw',17,1,5,'2026-05-10 07:49:08.782546','2026-05-10 07:49:08.782574',NULL,'fe10dfc126ba4edca308b413b2f0297d'),(18,'YUDva92VNHijPSmoognPqtkNGbgBal',18,1,6,'2026-05-10 07:49:39.233069','2026-05-10 07:49:39.233094',NULL,'7bffbc13a477460aa89d87e37df273d4'),(19,'jz7ml4vnrTCwoPVgSNfpzJd0kWfwft',19,1,5,'2026-05-10 07:55:16.807673','2026-05-10 07:55:16.807695',NULL,'a282eb98ec8a47c58d459c04bb1f2a53'),(20,'2UgujYNZIOQ7EVWrF1SZHffXKF0sLm',20,1,6,'2026-05-10 08:23:33.679533','2026-05-10 08:23:33.679585',NULL,'0bef94638b454178a01de91cfa0cc715'),(21,'0ih1hsowYI30NM9clN4OpSdXcm2kH8',21,1,5,'2026-05-10 08:23:58.965303','2026-05-10 08:23:58.965341',NULL,'1982698da8474993b5e43b912019350d'),(22,'s0fhR9vmkNfHVtkBSgreMfhqXq90Iw',22,1,5,'2026-05-10 08:29:17.043444','2026-05-10 08:29:17.043463',NULL,'2918e55c312e4863a6dc8207f8c5ef93'),(23,'3kEAWDT2XGYopkG1QNLY76aHMLokLw',23,1,6,'2026-05-10 08:32:34.165669','2026-05-10 08:32:34.165693',NULL,'1d5909e513d7423b9704e779597b5597'),(24,'DovxkEcDA9L7biyz1noHW2rGXWrNRI',24,1,6,'2026-05-10 08:39:07.250134','2026-05-10 08:39:07.250151',NULL,'6ce3897a8e1f4eeab98c3048d84d4be6'),(25,'KhSHkjedhhus8D3MPRVnoDpnZzi3yH',25,1,6,'2026-05-10 08:46:21.361883','2026-05-10 08:46:21.361901',NULL,'dd241f52c3314dba95bb36f0da69fd88'),(26,'95AcYDWth7SELsYt2qz6az2siVVzfD',26,1,5,'2026-05-10 08:48:12.824208','2026-05-10 08:48:12.824226',NULL,'19aa7767c75747b98a9c65e98aa93bb9'),(27,'QJteiLNBlnhULxHPZBwUVCRYh6sFWX',27,1,6,'2026-05-10 08:51:01.282179','2026-05-10 08:51:01.282205',NULL,'3d8c17856e744dc5a914f14c14a73ed5'),(28,'qg5sGbziROFKW8AZ3U1X1hVoqA5Whs',28,1,5,'2026-05-10 08:52:40.716254','2026-05-10 08:52:40.716271',NULL,'d48a2758996b47648495961c4b7d24d2');
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-10  9:47:53
