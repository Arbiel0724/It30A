CREATE DATABASE  `library_db` R SET  COLLATE 
USE `library_db`;



DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_first_name` varchar(50) NOT NULL,
  `student_last_name` varchar(50) NOT NULL,
  `student_course` varchar(50) NOT NULL,
  PRIMARY KEY (`student_id`)
)  DEFAULT COLLATE




LOCK TABLES `students` WRITE;
INSERT INTO `students` VALUES (1,'ARBIEL','BAYANTONG','BSIT');
UNLOCK TABLES;
`
--

CREATE DATABASE /`library_db`  SET utf8mb4 COLLATE 
USE `library_db`;



DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_first_name` varchar(50) NOT NULL,
  `student_last_name` varchar(50) NOT NULL,
  `student_course` varchar(50) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


LOCK TABLES `students` WRITE;

INSERT INTO `students` VALUES (1,'STEPHEN','COLAO','BSIT');

UNLOCK TABLES;
/
>>>>>>> main