CREATE DATABASE /*!32312 IF NOT EXISTS*/ `library_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `library_db`;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_first_name` varchar(50) NOT NULL,
  `student_last_name` varchar(50) NOT NULL,
  `student_course` varchar(50) NOT NULL,
  `student_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `students` WRITE;

INSERT INTO `students` VALUES (1,'ARBIEL','BAYANTONG','BSIT','2026-08-24 02:08:37'),(2,'JAY-ANN','BAYANTONG','BSBA','2026-08-24 02:10:56');
UNLOCK TABLES;
// lab 2