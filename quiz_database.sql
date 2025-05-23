-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 20, 2022 at 07:56 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_question_paper`
--

CREATE SCHEMA quiz_database;
DROP TABLE IF EXISTS `active_question_paper`;
CREATE TABLE IF NOT EXISTS `active_question_paper` (
  `question_paper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `stud_id` int(11) NOT NULL,
  `attend` int(11) NOT NULL
);

--
-- Dumping data for table `active_question_paper`
--


-- --------------------------------------------------------

--
-- Table structure for table `answer_details`
--

DROP TABLE IF EXISTS `answer_details`;
CREATE TABLE IF NOT EXISTS `answer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_paper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `answer_details`
--

-- --------------------------------------------------------

--
-- Table structure for table `instructor_details`
--

DROP TABLE IF EXISTS `instructor_details`;
CREATE TABLE IF NOT EXISTS `instructor_details` (
  `data` int(11) NOT NULL AUTO_INCREMENT,
  `firstnme` varchar(255) DEFAULT NULL,
  `lst_nme` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `cntno` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `house` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `login`
--


-- Table structure for table `question_details`
--

DROP TABLE IF EXISTS `question_details`;
CREATE TABLE IF NOT EXISTS `question_details` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `value3` varchar(255) DEFAULT NULL,
  `value4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
);

--
-- Dumping data for table `question_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `question_paper`
--

DROP TABLE IF EXISTS `question_paper`;
CREATE TABLE IF NOT EXISTS `question_paper` (
  `question_paper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `science` int(11) DEFAULT NULL,
  `commerce` int(11) DEFAULT NULL,
  `humanities` int(11) DEFAULT NULL,
  `apt` int(11) DEFAULT NULL
);

--
-- Dumping data for table `question_paper`
--



-- --------------------------------------------------------

--
-- Table structure for table `student_description`
--

DROP TABLE IF EXISTS `student_description`;
CREATE TABLE IF NOT EXISTS `student_description` (
  `stud_id` int(11) NOT NULL,
  `descrip1` varchar(255) DEFAULT NULL,
  `descrip2` varchar(255) DEFAULT NULL,
  `descrip3` varchar(255) DEFAULT NULL
);

--
-- Dumping data for table `student_description`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_profile`
--

DROP TABLE IF EXISTS `student_profile`;
CREATE TABLE IF NOT EXISTS `student_profile` (
  `stud_id` int(11) NOT NULL,
  `stud_first_name` varchar(255) DEFAULT NULL,
  `stud_last_name` varchar(255) DEFAULT NULL,
  `stud_dob` date DEFAULT NULL,
  `stud_gender` varchar(255) DEFAULT NULL,
  `cnt_number` varchar(255) DEFAULT NULL,
  `stud_email` varchar(255) DEFAULT NULL,
  `stud_inst` varchar(255) DEFAULT NULL,
  `stud_class` varchar(255) DEFAULT NULL,
  `stud_house` varchar(255) DEFAULT NULL,
  `stud_city` varchar(255) DEFAULT NULL,
  `stud_country` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `science` varchar(255) DEFAULT NULL,
  `commerce` varchar(255) DEFAULT NULL,
  `humanities` varchar(255) DEFAULT NULL,
  `aptitude` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
);

--
-- Dumping data for table `student_profile`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
CREATE TABLE IF NOT EXISTS `user_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email_ID` varchar(50) NOT NULL,
  `Page_no` varchar(5) NOT NULL,
  `Actual_skills` varchar(5000) NOT NULL,
  `stud_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `stud_id` (`stud_id`)
);

CREATE UNIQUE INDEX uidx_pid
ON user_data (stud_id);

--
-- Dumping data for table `user_data`
--


-- Adding sample data to the 'active_question_paper' table
INSERT INTO active_question_paper (question_paper_id, question_id, question_type, stud_id, attend)
VALUES (1, 101, 'Multiple Choice', 1, 1),
       (1, 102, 'Multiple Choice', 2, 1),
       (2, 103, 'True/False', 1, 0);

-- Adding sample data to the 'answer_details' table
INSERT INTO answer_details (question_paper_id, question_id, stud_id, response)
VALUES (1, 101, 1, 'Option A'),
       (1, 102, 2, 'Option B'),
       (2, 103, 1, 'True');

-- Adding sample data to the 'instructor_details' table
INSERT INTO instructor_details (firstnme, lst_nme, dob, gender, cntno, email, qualification, house, city, state, country, pin)
VALUES ('John', 'Doe', '1990-05-15', 'Male', '1234567890', 'john.doe@example.com', 'Ph.D.', '123 Main St', 'New York', 'NY', 'USA', '10001'),
       ('Jane', 'Smith', '1985-07-20', 'Female', '9876543210', 'jane.smith@example.com', 'M.Sc.', '456 Elm St', 'Los Angeles', 'CA', 'USA', '90001');

-- Adding sample data to the 'login' table
INSERT INTO login (u_email, password, user_type)
VALUES ('john.doe@example.com', 'password123', 'Instructor'),
       ('jane.smith@example.com', 'securepwd456', 'Instructor');

-- Adding sample data to the 'question_details' table
INSERT INTO question_details (question, value1, value2, value3, value4, answer, question_type)
VALUES ('What is the capital of France?', 'Paris', 'Berlin', 'Madrid', 'Rome', 'Paris', 'Multiple Choice'),
       ('Is the Earth flat?', 'True', 'False', NULL, NULL, 'False', 'True/False');

-- Adding sample data to the 'question_paper' table
INSERT INTO question_paper (question_paper_id, question_id, question_type, science, commerce, humanities, apt)
VALUES (1, 101, 'Multiple Choice', 1, 0, 0, 0),
       (2, 103, 'True/False', 0, 0, 1, 0);

-- Adding sample data to the 'student_description' table
INSERT INTO student_description (stud_id, descrip1, descrip2, descrip3)
VALUES (1, 'Description 1 for Student 1', 'Description 2 for Student 1', 'Description 3 for Student 1'),
       (2, 'Description 1 for Student 2', 'Description 2 for Student 2', 'Description 3 for Student 2');

-- Adding sample data to the 'student_profile' table
INSERT INTO student_profile (stud_id, stud_first_name, stud_last_name, stud_dob, stud_gender, cnt_number, stud_email, stud_inst, stud_class, stud_house, stud_city, stud_country, pin_code, science, commerce, humanities, aptitude, total)
VALUES (1, 'Alice', 'Johnson', '1995-03-10', 'Female', '9876543210', 'alice@example.com', 'XYZ School', 'Grade 10', 'House A', 'Los Angeles', 'USA', '90001', 'A', 'B', 'C', 'A', 400),
       (2, 'Bob', 'Smith', '1998-06-15', 'Male', '1234567890', 'bob@example.com', 'ABC School', 'Grade 11', 'House B', 'New York', 'USA', '10001', 'B', 'A', 'A', 'B', 380);

-- Adding sample data to the 'user_data' table
INSERT INTO user_data (Name, Email_ID, Page_no, Actual_skills, stud_id)
VALUES ('John Doe', 'john.doe@example.com', 'Page 1', 'Skills 1, Skills 2', 1),
       ('Jane Smith', 'jane.smith@example.com', 'Page 2', 'Skills 3, Skills 4', 2);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
