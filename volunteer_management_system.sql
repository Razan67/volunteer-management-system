-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 04:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `volunteer_management_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_team` (IN `id` INT, `name` VARCHAR(50), `nov` INT)   insert into team (id,name,number_of_volunteers)
VALUES(id,name,nov)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_volunteer` (IN `id` INT, `fn` VARCHAR(20), `ln` VARCHAR(20), `dob` VARCHAR(30), `gen` CHAR(1), `ct` VARCHAR(20), `st` VARCHAR(20), `bno` INT)   INSERT INTO volunteer (id,first_name,last_name,date_of_birth,gender,city,street_name,bul_no)
VALUES(id,fn,ln,dob,gen,ct,st,bno)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dept_name` (IN `dno` INT)   SELECT name from department
where id=dno$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_volunteer_info` (IN `idno` INT)   SELECT first_name,last_name,date_of_birth,gender,city,street_name,bul_no from volunteer
where idno=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `a_volunteer_team`
-- (See below for the actual view)
--
CREATE TABLE `a_volunteer_team` (
`first_name` varchar(20)
,`Last_name` varchar(20)
,`team_id` int(11)
,`id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `phone`) VALUES
(10, 'Social Support', '0796850901'),
(20, 'Health support', '0789466501'),
(30, 'entertainment', '07995688239'),
(50, 'medcare', '085403475'),
(100, 'New Department', '0473673943');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `event_name` varchar(30) DEFAULT NULL,
  `event_type` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `bul_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `department_id`, `event_name`, `event_type`, `city`, `street_name`, `bul_no`) VALUES
(1, 10, 'Homeless Shelter Support', 'Social', 'Amman', 'abu gazalih street', 25),
(3, 20, 'Blood Donation Drives', 'Health', 'Aqaba', 'almadina street', 7),
(4, 20, 'Hospital Volunteer Programs', 'Health', 'Amman', 'alqasrawi street', 37),
(5, 30, 'Children activities', 'entertainment', 'Amman', 'alestiklal street', 30),
(6, 20, 'Health Awareness Campaign', 'Health', 'Amman', 'Al-Rainbow Street', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_details`
-- (See below for the actual view)
--
CREATE TABLE `event_details` (
`name` varchar(20)
,`phone` varchar(20)
,`event_name` varchar(30)
,`event_type` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_participants`
-- (See below for the actual view)
--
CREATE TABLE `event_participants` (
`id` int(11)
,`first_name` varchar(20)
,`Last_name` varchar(20)
,`event_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `event_volunteer`
--

CREATE TABLE `event_volunteer` (
  `event_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_volunteer`
--

INSERT INTO `event_volunteer` (`event_id`, `volunteer_id`) VALUES
(1, 1),
(1, 11),
(3, 11),
(3, 21),
(4, 21),
(5, 31);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number_of_volunteers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `number_of_volunteers`) VALUES
(10, 'social team01', 5),
(20, 'social team02', 7),
(30, 'health team01', 10),
(40, 'health team02', 6),
(50, 'entertainment team01', 5),
(60, 'entertainment team02', 7),
(62, 'default team', 0),
(70, 'social team03', 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `teams_details`
-- (See below for the actual view)
--
CREATE TABLE `teams_details` (
`id` int(11)
,`name` varchar(50)
,`number_of_volunteers` int(11)
,`volunteer_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_of_birth` varchar(30) NOT NULL,
  `gender` char(1) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `bul_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `city`, `street_name`, `bul_no`) VALUES
(1, 'Mohammed', 'saleh', '1-1-1999', 'M', 'Amman', 'Main Street', 123),
(5, 'Jana', 'Ahmad', '1990-01-01', 'F', 'Irbid', 'Second Street', 456),
(11, 'Ahmad', 'Jameel', '25-9-2001', 'M', 'Amman', 'macca street', 13),
(21, 'Raneem', 'Ahmad', '3-5-2000', 'F', 'Amman', 'almadina street', 33),
(31, 'Razan', 'Alkhanji', '20-7-2004', 'F', 'Amman', 'alnahar street', 23),
(41, 'Ramez', 'Mohammed', '5-q0-2003', 'M', 'Aqaba', 'zuhair street', 7),
(51, 'Rami', 'naser', '4/5/2000', 'M', 'Amman', 'radi street', 43);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_phone`
--

CREATE TABLE `volunteer_phone` (
  `phone` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer_phone`
--

INSERT INTO `volunteer_phone` (`phone`, `volunteer_id`) VALUES
(775631842, 11),
(783256190, 31),
(794598392, 11),
(795642741, 41),
(798224532, 21),
(799825411, 21);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_team`
--

CREATE TABLE `volunteer_team` (
  `volunteer_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer_team`
--

INSERT INTO `volunteer_team` (`volunteer_id`, `team_id`) VALUES
(11, 10),
(11, 20),
(11, 30),
(21, 30),
(21, 40),
(31, 50),
(31, 60),
(41, 10);

-- --------------------------------------------------------

--
-- Structure for view `a_volunteer_team`
--
DROP TABLE IF EXISTS `a_volunteer_team`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `a_volunteer_team`  AS SELECT `v`.`first_name` AS `first_name`, `v`.`last_name` AS `Last_name`, `t`.`team_id` AS `team_id`, `v`.`id` AS `id` FROM (`volunteer` `v` join `volunteer_team` `t`) WHERE `v`.`id` = `t`.`volunteer_id` ;

-- --------------------------------------------------------

--
-- Structure for view `event_details`
--
DROP TABLE IF EXISTS `event_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_details`  AS SELECT `d`.`name` AS `name`, `d`.`phone` AS `phone`, `e`.`event_name` AS `event_name`, `e`.`event_type` AS `event_type` FROM (`department` `d` join `events` `e`) WHERE `d`.`id` = `e`.`department_id` ;

-- --------------------------------------------------------

--
-- Structure for view `event_participants`
--
DROP TABLE IF EXISTS `event_participants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_participants`  AS SELECT `v`.`id` AS `id`, `v`.`first_name` AS `first_name`, `v`.`last_name` AS `Last_name`, `e`.`event_id` AS `event_id` FROM (`volunteer` `v` join `event_volunteer` `e`) WHERE `v`.`id` = `e`.`volunteer_id` ;

-- --------------------------------------------------------

--
-- Structure for view `teams_details`
--
DROP TABLE IF EXISTS `teams_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teams_details`  AS SELECT `t`.`id` AS `id`, `t`.`name` AS `name`, `t`.`number_of_volunteers` AS `number_of_volunteers`, `v`.`volunteer_id` AS `volunteer_id` FROM (`team` `t` join `volunteer_team` `v`) WHERE `t`.`id` = `v`.`team_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk` (`department_id`);

--
-- Indexes for table `event_volunteer`
--
ALTER TABLE `event_volunteer`
  ADD PRIMARY KEY (`event_id`,`volunteer_id`),
  ADD KEY `fk3` (`volunteer_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteer_phone`
--
ALTER TABLE `volunteer_phone`
  ADD PRIMARY KEY (`phone`,`volunteer_id`),
  ADD KEY `fk1` (`volunteer_id`);

--
-- Indexes for table `volunteer_team`
--
ALTER TABLE `volunteer_team`
  ADD PRIMARY KEY (`volunteer_id`,`team_id`),
  ADD KEY `fk00` (`team_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_volunteer`
--
ALTER TABLE `event_volunteer`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`);

--
-- Constraints for table `volunteer_phone`
--
ALTER TABLE `volunteer_phone`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`);

--
-- Constraints for table `volunteer_team`
--
ALTER TABLE `volunteer_team`
  ADD CONSTRAINT `fk0` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`),
  ADD CONSTRAINT `fk00` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
