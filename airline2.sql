-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 02, 2022 at 12:39 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline2`
--

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
CREATE TABLE IF NOT EXISTS `airplane` (
  `ID` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `company` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airplane`
--

INSERT INTO `airplane` (`ID`, `type`, `company`) VALUES
('1170', 'B738', 'Boeing'),
('1201', 'A320', 'Airbus');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
CREATE TABLE IF NOT EXISTS `airport` (
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`code`, `name`, `city`, `state`, `country`) VALUES
('DAL', 'Dallas Love Field', 'Dallas', 'Texas', 'USA'),
('DFW', 'Dallas Fort Worth Airport', 'Dallas', 'Texas', 'USA'),
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'California', 'USA'),
('SEA', 'Seattle-Tacoma International Airport', 'Seattle', 'Washington', 'USA'),
('SFO', 'San Francisco International', 'San Fransciso', 'California', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `date` date NOT NULL,
  `flightno` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `classtype` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`,`flightno`),
  KEY `username_idx` (`username`),
  KEY `classname_idx` (`classtype`),
  KEY `flightno_idx` (`flightno`,`classtype`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ID`, `time`, `date`, `flightno`, `username`, `classtype`) VALUES
(1, '2015-12-01 17:22:00', '2015-12-01', 'AA986', 'song', 'Economy'),
(2, '2015-12-01 17:23:00', '2015-12-01', 'AA986', 'song', 'Economy'),
(3, '2015-12-01 17:24:00', '2015-12-02', 'AA986', 'abc', 'Economy'),
(4, '2015-12-01 17:25:00', '2015-12-01', 'AA986', 'song', 'Business'),
(5, '2015-12-01 17:26:00', '2015-12-01', 'AA986', 'abc', 'Business'),
(6, '2015-12-01 17:27:00', '2015-12-01', 'AA986', 'abc', 'Business'),
(7, '2015-12-01 17:27:00', '2015-12-01', 'AA1512', 'song', 'Economy'),
(8, '2015-12-02 04:22:32', '2015-12-02', 'AA986', 'song', 'Economy'),
(9, '2015-12-02 04:26:29', '2015-12-02', 'AA120', 'song', 'Economy'),
(10, '2015-12-02 04:26:29', '2015-12-02', 'AA100', 'song', 'Economy'),
(11, '2015-12-02 04:27:36', '2015-12-02', 'AA1512', 'abc', 'Economy'),
(12, '2015-12-02 04:27:36', '2015-12-03', 'AA1512', 'abc', 'Economy'),
(13, '2015-12-02 05:55:15', '2015-12-02', 'AA1512', 'abc', 'Economy'),
(14, '2015-12-02 05:55:15', '2015-12-03', 'AA1512', 'abc', 'Economy'),
(15, '2015-12-02 05:57:27', '2015-12-02', 'AA1512', 'abc', 'Economy'),
(16, '2015-12-02 05:57:27', '2015-12-03', 'AA1512', 'abc', 'Economy'),
(17, '2015-12-02 05:58:11', '2015-12-02', 'AA1512', 'abc', 'Economy'),
(18, '2015-12-02 05:58:11', '2015-12-03', 'AA1512', 'abc', 'Economy'),
(19, '2015-12-02 06:05:52', '2015-12-02', 'AA6861', 'song', 'Economy'),
(20, '2015-12-02 11:46:57', '2015-12-02', 'AA100', 'song', 'Business'),
(21, '2015-12-02 11:56:31', '2015-12-02', 'AA986', 'song', 'Economy'),
(22, '2015-12-02 01:24:08', '2015-12-02', 'AA120', 'xianchu', 'Economy'),
(23, '2015-12-02 01:24:08', '2015-12-02', 'AA100', 'xianchu', 'Economy'),
(24, '2015-12-02 01:24:42', '2015-12-02', 'AA6861', 'xianchu', 'Economy'),
(25, '2015-12-02 01:26:46', '2015-12-02', 'AA986', 'xianchu', 'Economy'),
(26, '2015-12-02 01:26:46', '2013-12-03', 'AA986', 'xianchu', 'Economy'),
(27, '2015-12-02 02:34:02', '2015-12-02', 'AA986', 'song', 'Economy'),
(28, '2015-12-02 02:34:02', '2015-12-02', 'AA6927', 'song', 'Economy'),
(29, '2015-12-06 06:48:46', '2015-12-06', 'AA986', 'abc', 'Economy'),
(30, '2015-12-06 07:26:56', '2015-12-06', 'AA1512', 'qun', 'Economy'),
(32, '2015-12-06 07:27:20', '2015-12-06', 'AA6861', 'qun', 'Economy'),
(34, '2015-12-06 10:04:30', '2015-12-06', 'AA120', 'abc', 'Economy'),
(45, '2015-12-07 01:46:49', '2015-12-06', 'AA986', 'tao', 'Economy'),
(54, '2015-12-07 02:12:07', '2015-12-06', 'AA100', 'tao', 'Economy'),
(55, '2015-12-07 02:13:40', '2015-12-06', 'AA100', 'tao', 'Economy'),
(56, '2015-12-07 12:50:44', '2015-12-06', 'AA180', 'abc', 'Economy'),
(60, '2015-12-07 12:57:53', '2015-12-06', 'AA100', 'abc', 'Economy'),
(61, '2015-12-07 01:50:05', '2015-12-07', 'AA600', 'eve', 'Economy'),
(63, '2015-12-07 01:53:03', '2015-12-07', 'AA100', 'eve', 'Economy'),
(66, '2015-12-07 01:55:51', '2015-12-07', 'AA986', 'eve', 'Business'),
(67, '2015-12-07 01:55:51', '2015-12-08', 'AA1512', 'eve', 'Business'),
(68, '2021-12-24 01:58:18', '2021-12-24', 'AA100', 'abc', 'Business'),
(70, '2021-12-25 09:36:40', '2021-12-25', 'AA100', 'abc', 'Economy'),
(71, '2021-12-25 09:38:37', '2021-12-25', 'AA600', 'abc', 'Economy'),
(72, '2021-12-26 11:38:48', '2021-12-22', 'AA80', 'abc', 'Economy');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `number` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`number`,`name`),
  KEY `number_idx` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`number`, `name`, `capacity`, `price`) VALUES
('AA100', 'Business', 5, 500),
('AA100', 'Economy', 200, 180),
('AA120', 'Business', 15, 4000),
('AA120', 'Economy', 100, 1000),
('AA1512', 'Business', 1, 200),
('AA1512', 'Economy', 100, 100),
('AA180', 'Business', 15, 800),
('AA180', 'Economy', 100, 240),
('AA181', 'Business', 10, 200),
('AA181', 'Economy', 100, 100),
('AA600', 'Business', 5, 200),
('AA600', 'Economy', 80, 50),
('AA601', 'Business', 3, 300),
('AA601', 'Economy', 50, 60),
('AA6861', 'Business', 3, 100),
('AA6861', 'Economy', 100, 40),
('AA6927', 'Business', 10, 100),
('AA6927', 'Economy', 200, 40),
('AA80', 'Business', 3, 200),
('AA80', 'Economy', 80, 50),
('AA986', 'Business', 8, 400),
('AA986', 'Economy', 120, 120),
('BB04', 'Business', 100, 200),
('BB04', 'Economy', 250, 120),
('MH270', 'Business', 250, 200),
('MH270', 'Economy', 400, 100);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
CREATE TABLE IF NOT EXISTS `flight` (
  `number` varchar(20) NOT NULL,
  `airplane_id` varchar(10) NOT NULL,
  `departure` varchar(10) NOT NULL,
  `d_time` time NOT NULL,
  `arrival` varchar(10) NOT NULL,
  `a_time` time NOT NULL,
  PRIMARY KEY (`number`),
  KEY `code_idx` (`departure`,`arrival`),
  KEY `airplaneid_idx` (`airplane_id`),
  KEY `arrival_idx` (`arrival`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`number`, `airplane_id`, `departure`, `d_time`, `arrival`, `a_time`) VALUES
('AA100', '1201', 'LAX', '18:35:00', 'SEA', '21:00:00'),
('AA120', '1201', 'DFW', '14:35:00', 'LAX', '17:30:00'),
('AA1512', '1170', 'SEA', '13:40:00', 'DFW', '19:30:00'),
('AA180', '1201', 'DFW', '07:35:00', 'SFO', '10:30:00'),
('AA181', '1170', 'SFO', '19:30:00', 'DFW', '22:00:00'),
('AA600', '1201', 'DAL', '17:00:00', 'SEA', '21:00:00'),
('AA601', '1201', 'SEA', '20:00:00', 'DAL', '23:00:00'),
('AA6861', '1201', 'SFO', '11:00:00', 'SEA', '13:00:00'),
('AA6927', '1201', 'SEA', '17:00:00', 'SFO', '19:00:00'),
('AA80', '1170', 'LAX', '20:00:00', 'DFW', '23:00:00'),
('AA986', '1170', 'DFW', '10:00:00', 'SEA', '14:00:00'),
('BB04', '1170', 'LAX', '10:00:00', 'SEA', '06:00:00'),
('MH270', '1201', 'DAL', '21:00:00', 'DFW', '24:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `passanger`
--

DROP TABLE IF EXISTS `passanger`;
CREATE TABLE IF NOT EXISTS `passanger` (
  `username` varchar(30) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cellphone` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passanger`
--

INSERT INTO `passanger` (`username`, `firstname`, `middlename`, `lastname`, `email`, `cellphone`, `gender`, `birthday`, `password`) VALUES
('abc', 'abc', NULL, '', 'abc@utd.edu', NULL, NULL, NULL, 'abcdef123456'),
('eve', 'eve', '', 'adi', 'eve@utd.edu', '2143456543', '', '0000-00-00', 'Eve123'),
('qun', 'Qun', NULL, 'Niu', 'qun@utd.edu', '', 'Female', NULL, 'Niuqun1'),
('song', 'Song', NULL, 'Tao', 'ts@utd.edu', NULL, 'Male', NULL, 'Songtao1'),
('tao', 's', '', 't', 't@utd.edu', '987654321', '', '2015-12-06', 'Ts123456'),
('usman544k', 'usman', '', 'Khan', 'usman@gmail.com', '03245274991', 'Male', '1998-06-27', 'Abcdef1'),
('web', 'web', '', 'pro', 'web@utd.edu', '9998887777', '', '2015-12-06', 'Web123'),
('xianchu', 'xianchu', NULL, 'chen', 'xian@utd.edu', '', 'Male', NULL, 'Xianchu1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `flightno` FOREIGN KEY (`flightno`,`classtype`) REFERENCES `class` (`number`, `name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `passanger` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `number` FOREIGN KEY (`number`) REFERENCES `flight` (`number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `airplaneid` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrival` FOREIGN KEY (`arrival`) REFERENCES `airport` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departure` FOREIGN KEY (`departure`) REFERENCES `airport` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
