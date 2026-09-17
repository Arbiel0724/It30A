CREATE DATABASE `library_db` 

USE `library_db`;



DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(50) NOT NULL,
  `book_author` varchar(100) NOT NULL,
  `book_category` varchar(50) NOT NULL,
  `book_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




LOCK TABLES `books` WRITE;

INSERT INTO `books` VALUES (1,'The Hobbit','J.R.R. Tolkien','Fantasy','2026-08-25 01:44:24'),(2,'Harry Potter','J.K. Rowling','Fantasy','2026-08-25 01:44:24'),(3,'Pride and Prejudice','Jane Austen','Romance','2026-08-25 01:44:24');

UNLOCK TABLES;


DROP TABLE IF EXISTS `borrow`;

CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrow_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `borrow_return_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `fk_borrow_student` (`student_id`),
  KEY `fk_borrow_book` (`book_id`),
  CONSTRAINT `fk_borrow_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `fk_borrow_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




LOCK TABLES `borrow` WRITE;

INSERT INTO `borrow` VALUES (4,1,2,'2026-08-25 02:24:39','2026-08-27 01:30:25'),(5,2,1,'2026-08-25 02:24:39',NULL),(6,2,3,'2026-08-25 02:24:39',NULL);

UNLOCK TABLES;


DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_first_name` varchar(50) NOT NULL,
  `student_last_name` varchar(50) NOT NULL,
  `student_course` varchar(50) NOT NULL,
  `student_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`student_id`)
) DEFAULT  COLLATE




LOCK TABLES `students` WRITE;

INSERT INTO `students` VALUES (1,'STEPHEN','COLAO','BSIT','2026-08-24 02:08:37'),(2,'KRISTINE','COLAO','BSBA','2026-08-24 02:10:56');

UNLOCK TABLES;
