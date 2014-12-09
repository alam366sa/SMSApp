-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2014 at 02:56 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE IF NOT EXISTS `batches` (
`batch_id` int(11) NOT NULL,
  `batch_name` varchar(100) NOT NULL,
  `study_program_id` mediumint(9) NOT NULL,
  `department_id` smallint(6) NOT NULL,
  `batch_start_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`batch_id`, `batch_name`, `study_program_id`, `department_id`, `batch_start_date`) VALUES
(1, '2k10-14', 1, 1, '2010-10-10'),
(2, '2k11-15', 1, 1, '2011-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `batch_course`
--

CREATE TABLE IF NOT EXISTS `batch_course` (
`batch_course_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `batch_semester_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_course`
--

INSERT INTO `batch_course` (`batch_course_id`, `course_id`, `batch_semester_id`, `batch_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `batch_semester`
--

CREATE TABLE IF NOT EXISTS `batch_semester` (
`batch_semester_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `semester_start_date` date NOT NULL,
  `semester_end_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_semester`
--

INSERT INTO `batch_semester` (`batch_semester_id`, `semester_id`, `batch_id`, `semester_start_date`, `semester_end_date`) VALUES
(1, 1, 1, '2010-10-10', '2011-01-30'),
(2, 2, 1, '2011-02-02', '2011-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
`course_id` int(11) NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `course_desc` text NOT NULL,
  `course_code` varchar(100) NOT NULL,
  `course_credit_hours` tinyint(4) NOT NULL DEFAULT '3',
  `course_lab_credit_hours` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_desc`, `course_code`, `course_credit_hours`, `course_lab_credit_hours`) VALUES
(1, 'Computer Fundamentals', 'The fundamentals of computer', 'CS-112', 3, 1),
(2, 'Computer Programming For Engineers', 'Computer Programming For Engineers', 'CS-124', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
`department_id` smallint(6) NOT NULL,
  `department_name` varchar(250) NOT NULL,
  `department_desc` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_desc`) VALUES
(1, 'Computing', '');

-- --------------------------------------------------------

--
-- Table structure for table `mark_distribution`
--

CREATE TABLE IF NOT EXISTS `mark_distribution` (
`mark_distribution_id` int(11) NOT NULL,
  `mark_weight_id` int(11) NOT NULL,
  `mark_distribution_no` tinyint(4) NOT NULL,
  `mark_distribution_total` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mark_distribution`
--

INSERT INTO `mark_distribution` (`mark_distribution_id`, `mark_weight_id`, `mark_distribution_no`, `mark_distribution_total`) VALUES
(1, 1, 1, 10),
(2, 1, 2, 10),
(3, 1, 3, 10),
(4, 2, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `mark_type`
--

CREATE TABLE IF NOT EXISTS `mark_type` (
`mark_type_id` smallint(6) NOT NULL,
  `mark_type_name` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mark_type`
--

INSERT INTO `mark_type` (`mark_type_id`, `mark_type_name`) VALUES
(3, 'Assignment'),
(4, 'Attendance'),
(6, 'Final Semester Exam'),
(10, 'Final Year Project'),
(11, 'Grace Marks'),
(8, 'Lab Work'),
(5, 'Mid Semester Exam'),
(2, 'Presentation'),
(1, 'Quiz'),
(7, 'Semester Project'),
(12, 'Sessional'),
(9, 'Viva');

-- --------------------------------------------------------

--
-- Table structure for table `mark_weight`
--

CREATE TABLE IF NOT EXISTS `mark_weight` (
`mark_weight_id` int(11) NOT NULL,
  `mark_type_id` int(11) NOT NULL,
  `batch_course_id` int(11) NOT NULL,
  `mark_weight` double NOT NULL,
  `mark_type_parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mark_weight`
--

INSERT INTO `mark_weight` (`mark_weight_id`, `mark_type_id`, `batch_course_id`, `mark_weight`, `mark_type_parent_id`) VALUES
(1, 1, 1, 0.1, 12),
(2, 2, 1, 0.05, 12),
(3, 3, 1, 0.05, 12),
(4, 5, 1, 0.2, 0),
(5, 6, 1, 0.3, 0),
(6, 12, 1, 0.2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
`section_id` int(11) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `study_program_id` mediumint(9) NOT NULL,
  `department_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE IF NOT EXISTS `semesters` (
`semester_id` smallint(6) NOT NULL,
  `semester_name` varchar(100) NOT NULL,
  `semester_season` varchar(100) NOT NULL DEFAULT 'fall',
  `semester_order` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `semester_name`, `semester_season`, `semester_order`) VALUES
(11, 'Eighth Semester', 'spring', 11),
(7, 'Fifth Semester', 'fall', 7),
(1, 'First Semester', 'fall', 1),
(3, 'First Summer Semester', 'summer', 3),
(5, 'Fourth Semester', 'spring', 5),
(12, 'Fourth Summer Semester', 'summer', 12),
(2, 'Second Semester', 'spring', 2),
(6, 'Second Summer Semester', 'summer', 6),
(10, 'Seventh Semester', 'fall', 10),
(8, 'Sixth Semester', 'spring', 8),
(4, 'Third Semester', 'fall', 4),
(9, 'Third Summer Semester', 'summer', 9);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`student_id` int(11) NOT NULL,
  `student_name` varchar(150) NOT NULL,
  `student_father_name` varchar(150) NOT NULL,
  `student_reg_no` varchar(250) NOT NULL,
  `student_phone_no` varchar(50) NOT NULL,
  `student_city` varchar(50) NOT NULL,
  `student_province` varchar(50) NOT NULL,
  `student_address` text NOT NULL,
  `student_country` varchar(100) NOT NULL,
  `student_cnic` varchar(50) NOT NULL,
  `student_email` varchar(250) NOT NULL,
  `student_domicile` varchar(250) NOT NULL,
  `student_dob` date NOT NULL,
  `student_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = enrolled, 2 = suspended, 3 = left, 4 = struck',
  `student_gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = male, 0 = female'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `student_father_name`, `student_reg_no`, `student_phone_no`, `student_city`, `student_province`, `student_address`, `student_country`, `student_cnic`, `student_email`, `student_domicile`, `student_dob`, `student_status`, `student_gender`) VALUES
(1, 'Anwar Zeb', 'Naqeeb Ullah', '2010-USTB-32944', '0092-332-9885050', 'Bannu', 'KPK', 'Shahbaz Azmat Khail', 'Pakistan', '37405-2538733-1', 'wasxxm@gmail.com', 'Bannu, KPK', '1988-03-01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_enrollment`
--

CREATE TABLE IF NOT EXISTS `student_enrollment` (
`student_enrollment_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `study_program_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_enrollment`
--

INSERT INTO `student_enrollment` (`student_enrollment_id`, `department_id`, `study_program_id`, `batch_id`, `section_id`, `student_id`) VALUES
(1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_mark`
--

CREATE TABLE IF NOT EXISTS `student_mark` (
`student_mark_id` bigint(20) NOT NULL,
  `student_id` int(11) NOT NULL,
  `batch_course_id` int(11) NOT NULL,
  `mark_distribution_id` int(11) NOT NULL,
  `student_mark_obtained` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `study_programs`
--

CREATE TABLE IF NOT EXISTS `study_programs` (
`study_program_id` mediumint(9) NOT NULL,
  `study_program_name` varchar(250) NOT NULL,
  `study_program_duration` tinyint(4) NOT NULL,
  `department_id` smallint(6) NOT NULL,
  `study_program_desc` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `study_programs`
--

INSERT INTO `study_programs` (`study_program_id`, `study_program_name`, `study_program_duration`, `department_id`, `study_program_desc`) VALUES
(1, 'BS-CS', 4, 1, 'BS-CS program at university of science and technology, Bannu'),
(2, 'MCS', 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `user_fullname` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = blocked',
  `user_last_login` datetime NOT NULL,
  `user_last_login_ip` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `user_title` varchar(250) NOT NULL,
  `user_profile_desc` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `user_email`, `user_password`, `user_type_id`, `user_status`, `user_last_login`, `user_last_login_ip`, `student_id`, `user_title`, `user_profile_desc`) VALUES
(1, 'Waseem Khan', 'wasxxm@gmail.com', 'waseem', 1, 1, '2014-12-08 05:00:00', '127.0.0.1', 0, '', ''),
(2, 'Anwer Zeb', 'wasxxm@gmail.com', 'waseem', 5, 1, '2014-12-08 00:00:00', '127.0.0.1', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
`user_type_id` int(11) NOT NULL,
  `user_type_name` varchar(100) NOT NULL,
  `user_type_level` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `user_type_name`, `user_type_level`) VALUES
(1, 'System Administrator', 1),
(2, 'Department Administrator', 2),
(3, 'Course Administrator', 3),
(4, 'Data Entry Operator', 4),
(5, 'Student', 5),
(6, 'Guest', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
 ADD PRIMARY KEY (`batch_id`), ADD UNIQUE KEY `batch_name` (`batch_name`,`study_program_id`,`department_id`,`batch_start_date`);

--
-- Indexes for table `batch_course`
--
ALTER TABLE `batch_course`
 ADD PRIMARY KEY (`batch_course_id`);

--
-- Indexes for table `batch_semester`
--
ALTER TABLE `batch_semester`
 ADD PRIMARY KEY (`batch_semester_id`), ADD UNIQUE KEY `semester_id` (`semester_id`,`batch_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
 ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
 ADD PRIMARY KEY (`department_id`), ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `mark_distribution`
--
ALTER TABLE `mark_distribution`
 ADD PRIMARY KEY (`mark_distribution_id`);

--
-- Indexes for table `mark_type`
--
ALTER TABLE `mark_type`
 ADD PRIMARY KEY (`mark_type_id`), ADD UNIQUE KEY `mark_type_name` (`mark_type_name`);

--
-- Indexes for table `mark_weight`
--
ALTER TABLE `mark_weight`
 ADD PRIMARY KEY (`mark_weight_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
 ADD PRIMARY KEY (`section_id`), ADD UNIQUE KEY `section_name` (`section_name`,`batch_id`,`study_program_id`,`department_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
 ADD PRIMARY KEY (`semester_id`), ADD UNIQUE KEY `semester_name` (`semester_name`,`semester_season`,`semester_order`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_enrollment`
--
ALTER TABLE `student_enrollment`
 ADD PRIMARY KEY (`student_enrollment_id`);

--
-- Indexes for table `student_mark`
--
ALTER TABLE `student_mark`
 ADD PRIMARY KEY (`student_mark_id`);

--
-- Indexes for table `study_programs`
--
ALTER TABLE `study_programs`
 ADD PRIMARY KEY (`study_program_id`), ADD UNIQUE KEY `study_program_name` (`study_program_name`,`study_program_duration`,`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
 ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `batch_course`
--
ALTER TABLE `batch_course`
MODIFY `batch_course_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `batch_semester`
--
ALTER TABLE `batch_semester`
MODIFY `batch_semester_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
MODIFY `department_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mark_distribution`
--
ALTER TABLE `mark_distribution`
MODIFY `mark_distribution_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `mark_type`
--
ALTER TABLE `mark_type`
MODIFY `mark_type_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `mark_weight`
--
ALTER TABLE `mark_weight`
MODIFY `mark_weight_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
MODIFY `semester_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `student_enrollment`
--
ALTER TABLE `student_enrollment`
MODIFY `student_enrollment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `student_mark`
--
ALTER TABLE `student_mark`
MODIFY `student_mark_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `study_programs`
--
ALTER TABLE `study_programs`
MODIFY `study_program_id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
