-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2019 at 07:04 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attareeqdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblfavouritelectures`
--

CREATE TABLE `tblfavouritelectures` (
  `rowid` int(11) NOT NULL,
  `lectureid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfavouritelectures`
--

INSERT INTO `tblfavouritelectures` (`rowid`, `lectureid`, `userid`, `dateadded`) VALUES
(2, 100, 2, '2019-12-17 19:35:43'),
(8, 9, 2, '2019-12-17 19:55:08'),
(10, 100, 5, '2019-12-18 23:27:42'),
(11, 88, 11, '2019-12-19 19:51:11'),
(13, 83, 11, '2019-12-19 19:52:20'),
(14, 100, 14, '2019-12-21 08:34:06'),
(21, 80, 2, '2019-12-23 08:33:15'),
(43, 31, 8, '2019-12-23 12:55:16'),
(44, 42, 8, '2019-12-23 12:56:37'),
(45, 32, 8, '2019-12-23 13:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `tbllecturecategory`
--

CREATE TABLE `tbllecturecategory` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllecturecategory`
--

INSERT INTO `tbllecturecategory` (`categoryid`, `categoryname`) VALUES
(1, 'Routine Ta''leem'),
(2, 'Special Lecture');

-- --------------------------------------------------------

--
-- Table structure for table `tbllecturedaytime`
--

CREATE TABLE `tbllecturedaytime` (
  `rowid` int(11) NOT NULL,
  `lectureid` int(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  `dayordate` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllecturedaytime`
--

INSERT INTO `tbllecturedaytime` (`rowid`, `lectureid`, `time`, `dayordate`) VALUES
(1, 1, '12:00pm - 01:20pm', 'Friday'),
(2, 2, '07:30pm - 08:30pm', 'Thursday'),
(3, 4, '02:30pm - 03:00pm', 'Friday'),
(4, 5, '04:00pm - 05:00pm', 'Tuesday'),
(5, 7, '02:00pm - 04:00pm', 'Friday'),
(6, 8, '06:15pm - 07:00pm', 'Monday'),
(7, 12, '04:15pm - 05:30pm', 'Thursday'),
(8, 14, '02:00pm - 04:00pm', 'Thursday'),
(9, 16, '03:30pm - 05:00pm', 'Wednesday'),
(10, 17, '02:00pm - 04:00pm', 'Monday'),
(11, 18, '05:00pm - 05:30pm', 'Monday'),
(12, 19, '04:00pm - 05:00pm', 'Monday'),
(13, 23, '02:30pm - 03:00pm', 'Thursday'),
(14, 26, '06:15pm - 07:00pm', 'Saturday'),
(15, 30, '12:00pm - 01:20pm', 'Tuesday'),
(16, 32, '02:30pm - 03:00pm', 'Thursday'),
(17, 34, '03:30pm - 05:00pm', 'Saturday'),
(18, 35, '07:30pm - 08:30pm', 'Thursday'),
(19, 36, '02:30pm - 03:00pm', 'Monday'),
(20, 37, '02:30pm - 03:00pm', 'Thursday'),
(21, 39, '02:30pm - 03:00pm', 'Saturday'),
(22, 41, '02:00pm - 04:00pm', 'Monday'),
(23, 42, '12:00pm - 01:20pm', 'Friday'),
(24, 43, '02:00pm - 04:00pm', 'Thursday'),
(25, 45, '02:30pm - 03:00pm', 'Monday'),
(26, 48, '12:00pm - 01:20pm', 'Saturday'),
(27, 49, '02:00pm - 04:00pm', 'Wednesday'),
(28, 50, '06:15pm - 07:00pm', 'Tuesday'),
(29, 52, '06:15pm - 07:00pm', 'Wednesday'),
(30, 55, '05:00pm - 05:30pm', 'Tuesday'),
(31, 57, '06:15pm - 07:00pm', 'Thursday'),
(32, 58, '12:00pm - 01:20pm', 'Saturday'),
(33, 60, '03:30pm - 05:00pm', 'Monday'),
(34, 67, '07:30pm - 08:30pm', 'Wednesday'),
(35, 69, '04:15pm - 05:30pm', 'Friday'),
(36, 70, '04:00pm - 05:00pm', 'Saturday'),
(37, 73, '05:00pm - 05:30pm', 'Saturday'),
(38, 74, '04:15pm - 05:30pm', 'Saturday'),
(39, 78, '02:00pm - 04:00pm', 'Thursday'),
(40, 84, '06:15pm - 07:00pm', 'Monday'),
(41, 89, '07:30pm - 08:30pm', 'Monday'),
(42, 94, '02:30pm - 03:00pm', 'Thursday'),
(43, 95, '04:15pm - 05:30pm', 'Saturday'),
(44, 99, '07:30pm - 08:30pm', 'Saturday'),
(45, 3, '02:30pm - 03:00pm', 'Monday'),
(46, 6, '12:00pm - 01:20pm', 'Thursday'),
(47, 10, '04:00pm - 05:00pm', 'Monday'),
(48, 11, '04:15pm - 05:30pm', 'Thursday'),
(49, 13, '02:00pm - 04:00pm', 'Tuesday'),
(50, 15, '02:00pm - 04:00pm', 'Thursday'),
(51, 20, '03:30pm - 05:00pm', '12/02/2019'),
(52, 21, '02:30pm - 03:00pm', '19/11/2020'),
(53, 22, '12:00pm - 01:20pm', '21/09/2019'),
(54, 25, '02:30pm - 03:00pm', '19/05/2020'),
(55, 24, '03:45pm - 05:45pm', '05/08/2020'),
(56, 27, '04:15pm - 05:30pm', '31/07/2020'),
(57, 28, '12:00pm - 01:20pm', '25/02/2020'),
(58, 29, '07:30pm - 08:30pm', '28/09/2020'),
(59, 31, '03:30pm - 05:00pm', '27/12/2019'),
(60, 33, '03:45pm - 05:45pm', '16/10/2019'),
(61, 38, '03:30pm - 05:00pm', '11/01/2020'),
(62, 40, '12:00pm - 01:20pm', '17/06/2020'),
(63, 44, '06:15pm - 07:00pm', '20/04/2019'),
(64, 46, '02:30pm - 03:00pm', '15/06/2020'),
(65, 47, '02:30pm - 03:00pm', '08/01/2020'),
(66, 51, '02:00pm - 04:00pm', '29/04/2020'),
(67, 53, '03:30pm - 05:00pm', '21/10/2020'),
(68, 54, '12:00pm - 01:20pm', '17/02/2020'),
(69, 56, '07:30pm - 08:30pm', '04/10/2020'),
(70, 59, '12:00pm - 01:20pm', '08/11/2019'),
(71, 61, '07:30pm - 08:30pm', '04/08/2020'),
(72, 62, '04:15pm - 05:30pm', '02/05/2019'),
(73, 63, '03:45pm - 05:45pm', '06/05/2020'),
(74, 64, '02:30pm - 03:00pm', '21/09/2020'),
(75, 65, '03:30pm - 05:00pm', '10/12/2019'),
(76, 66, '03:45pm - 05:45pm', '30/08/2020'),
(77, 68, '04:15pm - 05:30pm', '22/01/2020'),
(78, 71, '03:45pm - 05:45pm', '30/03/2020'),
(79, 75, '02:00pm - 04:00pm', '30/04/2020'),
(80, 72, '05:00pm - 05:30pm', '19/08/2020'),
(81, 76, '03:45pm - 05:45pm', '29/06/2020'),
(82, 77, '02:00pm - 04:00pm', '10/09/2020'),
(83, 79, '04:00pm - 05:00pm', '10/12/2020'),
(84, 80, '12:00pm - 01:20pm', '17/12/2019'),
(85, 81, '02:30pm - 03:00pm', '29/02/2019'),
(86, 82, '02:30pm - 03:00pm', '19/08/2019'),
(87, 83, '06:15pm - 07:00pm', '29/06/2020'),
(88, 85, '02:30pm - 03:00pm', '10/05/2019'),
(89, 86, '02:00pm - 04:00pm', '01/08/2020'),
(90, 87, '05:00pm - 05:30pm', '06/10/2020'),
(91, 88, '04:00pm - 05:00pm', '29/12/2019'),
(92, 90, '07:30pm - 08:30pm', '20/06/2020'),
(93, 91, '02:00pm - 04:00pm', '05/12/2019'),
(94, 92, '03:45pm - 05:45pm', '01/06/2020'),
(95, 93, '04:15pm - 05:30pm', '02/12/2020'),
(96, 96, '06:15pm - 07:00pm', '08/11/2019'),
(97, 97, '02:00pm - 04:00pm', '08/12/2019'),
(98, 98, '04:15pm - 05:30pm', '14/12/2020'),
(99, 100, '03:30pm - 05:00pm', '24/12/2019'),
(100, 9, '07:30pm - 08:30pm', '29/04/2020');

-- --------------------------------------------------------

--
-- Table structure for table `tbllecturenotification`
--

CREATE TABLE `tbllecturenotification` (
  `rowid` int(11) NOT NULL,
  `lectureid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllecturenotification`
--

INSERT INTO `tbllecturenotification` (`rowid`, `lectureid`, `userid`, `dateadded`) VALUES
(2, 100, 2, '2019-12-17 19:33:21'),
(6, 80, 1, '2019-12-17 19:46:56'),
(8, 80, 2, '2019-12-17 19:54:41'),
(9, 68, 2, '2019-12-17 19:54:54'),
(10, 9, 2, '2019-12-17 19:55:18'),
(11, 80, 5, '2019-12-18 23:27:21'),
(12, 100, 5, '2019-12-18 23:28:21'),
(13, 88, 11, '2019-12-19 19:51:14'),
(14, 68, 11, '2019-12-19 19:51:36'),
(16, 51, 11, '2019-12-19 19:53:38'),
(17, 100, 14, '2019-12-21 08:33:57'),
(18, 34, 2, '2019-12-22 19:18:20'),
(20, 69, 2, '2019-12-22 20:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbllectures`
--

CREATE TABLE `tbllectures` (
  `lectureid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `speaker` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `briefinfo` varchar(300) NOT NULL,
  `speakerphotourl` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL,
  `createdby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllectures`
--

INSERT INTO `tbllectures` (`lectureid`, `categoryid`, `topic`, `speaker`, `location`, `briefinfo`, `speakerphotourl`, `datecreated`, `createdby`) VALUES
(1, 1, 'Love your neightbour', 'Bilal Philip', '399 Laoreet Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-08-10 10:29:52', 1),
(2, 1, 'Pearls of Grace and Wisdom', 'Bilal Philip', '308-1818 Nulla St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-12-19 03:08:24', 2),
(3, 1, 'Principle of Tafseer', 'Bilal Philip', 'Ap #229-497 Feugiat Road', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-03-05 17:44:07', 1),
(4, 1, 'Pearls of Grace and Wisdom', 'Bilal Philip', 'Ap #275-6491 Nulla. Street', 'Lorem ipsum', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-09-26 11:05:19', 1),
(5, 1, 'The true essence of Islam', 'Bilal Philip', '3421 Arcu Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-02-27 09:33:24', 2),
(6, 1, 'Love your neightbour', 'Bilal Philip', '5498 Ornare, Ave', 'Lorem ipsum dolor', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-12-14 23:07:42', 2),
(7, 1, 'Pearls of Grace and Wisdom', 'Bilal Philip', '333-7903 Ipsum. Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-10-05 00:38:48', 1),
(8, 1, 'Pearls of Grace and Wisdom', 'Bilal Philip', 'Ap #103-5870 Vel Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-08-24 10:37:53', 1),
(9, 2, 'Principle of Tafseer', 'Bilal Philip', '118-9927 Quis Road', 'Lorem ipsum dolor sit', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-07-28 10:24:00', 1),
(10, 1, 'Principle of Al-Quran', 'Bilal Philip', 'Ap #269-3467 Proin Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-07-24 09:15:25', 1),
(11, 1, 'The true essence of Islam', 'Bilal Philip', '7461 Elementum, Street', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-10-07 00:46:37', 1),
(12, 1, 'Principle of Al-Quran', 'Bilal Philip', 'Ap #476-5697 Natoque Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-04-06 17:05:13', 1),
(13, 1, 'Pearls of Grace and Wisdom', 'Bilal Philip', 'Ap #730-1135 Mollis Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-07-20 18:15:56', 2),
(14, 1, 'The Do''s and Don''ts of Marriage', 'Bilal Philip', 'P.O. Box 903, 3366 Libero Road', 'Lorem ipsum', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-03-05 21:14:31', 2),
(15, 1, 'Love your neightbour', 'Bilal Philip', 'P.O. Box 477, 6752 Porttitor Rd.', 'Lorem ipsum', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-12-03 21:03:25', 2),
(16, 1, 'Purification', 'Bilal Philip', 'Ap #781-3168 Eu St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-06-04 06:54:25', 2),
(17, 1, 'Jannah', 'Bilal Philip', 'P.O. Box 605, 8435 Cras St.', 'Lorem', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-07-14 19:24:02', 1),
(18, 1, 'Pearls of Grace and Wisdom', 'Bilal Philip', '576-808 Vel Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-05-08 14:33:35', 2),
(19, 1, 'Purification', 'Bilal Philip', '461-6971 Nunc Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2019-03-11 22:50:43', 1),
(20, 2, 'Love your neightbour', 'Bilal Philip', '727-3878 Neque St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/TkPhHfw/bilal.jpg', '2020-02-16 18:30:09', 2),
(21, 2, 'The true essence of Islam', 'Malam Aminu Daurawa', 'P.O. Box 645, 9742 Risus. Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-12-02 22:07:37', 1),
(22, 2, 'Jannah', 'Malam Aminu Daurawa', '6992 Sagittis. Avenue', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-12-23 03:45:15', 2),
(23, 1, 'Principle of Al-Quran', 'Malam Aminu Daurawa', '9714 Nulla. Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-07-05 03:11:09', 2),
(24, 2, 'Jannah', 'Malam Aminu Daurawa', '304-5605 Diam. Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-08-25 11:05:09', 1),
(25, 2, 'Love your neightbour', 'Malam Aminu Daurawa', '6518 Phasellus St.', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-11-06 10:57:46', 1),
(26, 1, 'Love your neightbour', 'Malam Aminu Daurawa', 'Ap #289-7567 Sem Rd.', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-07-30 13:39:33', 1),
(27, 2, 'The true essence of Islam', 'Malam Aminu Daurawa', 'P.O. Box 911, 3864 Aliquam, Rd.', 'Lorem ipsum dolor sit', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-07-31 05:32:22', 2),
(28, 2, 'Principle of Tafseer', 'Malam Aminu Daurawa', 'Ap #900-7469 Ut, Ave', 'Lorem ipsum', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-05-02 19:16:32', 2),
(29, 2, 'Principle of Tafseer', 'Malam Aminu Daurawa', 'Ap #278-4085 Ac Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-10-11 02:24:14', 1),
(30, 1, 'Principle of Tafseer', 'Malam Aminu Daurawa', '7186 Hendrerit Street', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-11-29 19:17:12', 1),
(31, 2, 'The true essence of Islam', 'Malam Aminu Daurawa', 'P.O. Box 444, 9372 Sollicitudin Road', 'Lorem ipsum dolor sit amet, consectetuer adipiscing', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-05-19 02:35:34', 1),
(32, 1, 'Love your neightbour', 'Malam Aminu Daurawa', 'P.O. Box 531, 1476 Nec Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-04-21 08:30:13', 2),
(33, 2, 'Nature', 'Malam Aminu Daurawa', 'P.O. Box 581, 3486 Vitae, Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-06-27 23:29:56', 1),
(34, 1, 'Jannah', 'Malam Aminu Daurawa', 'P.O. Box 233, 4395 Id Rd.', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-05-01 06:32:13', 1),
(35, 1, 'The true essence of Islam', 'Malam Aminu Daurawa', 'Ap #470-9608 Amet Rd.', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-11-16 00:08:11', 1),
(36, 1, 'Nature', 'Malam Aminu Daurawa', 'P.O. Box 242, 8796 Varius St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-09-26 19:19:15', 2),
(37, 1, 'Nature', 'Malam Aminu Daurawa', '634-4524 Curabitur Street', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-02-29 11:19:29', 2),
(38, 2, 'Principle of Al-Quran', 'Malam Aminu Daurawa', 'P.O. Box 555, 3442 Auctor St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-07-05 18:22:41', 2),
(39, 1, 'The true essence of Islam', 'Malam Aminu Daurawa', 'Ap #813-9054 Vivamus Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2020-11-22 20:02:09', 1),
(40, 2, 'Principle of Tafseer', 'Malam Aminu Daurawa', 'Ap #164-2545 Justo Av.', 'Lorem', 'https://i.ibb.co/bbwYTy6/daurawa.jpg', '2019-08-11 03:16:17', 2),
(41, 1, 'Jannah', 'Malam Kabir Gombe', 'Ap #922-7885 Velit St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-11-09 14:53:49', 2),
(42, 1, 'Pearls of Grace and Wisdom', 'Malam Kabir Gombe', 'Ap #854-4925 Pretium St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2018-12-24 06:25:42', 2),
(43, 1, 'Principle of Tafseer', 'Malam Kabir Gombe', '808-1751 Urna Avenue', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-06-12 20:24:22', 2),
(44, 2, 'Principle of Tafseer', 'Malam Kabir Gombe', '1441 Dui Ave', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2018-12-23 11:00:33', 2),
(45, 1, 'Principle of Tafseer', 'Malam Kabir Gombe', '211-4540 Mi St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-07-15 21:21:27', 1),
(46, 2, 'The true essence of Islam', 'Malam Kabir Gombe', '2383 Et, Avenue', 'Lorem ipsum dolor sit', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-03-24 12:25:17', 1),
(47, 2, 'Love your neightbour', 'Malam Kabir Gombe', '2393 Dui. Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-04-16 15:27:44', 1),
(48, 1, 'Pearls of Grace and Wisdom', 'Malam Kabir Gombe', 'P.O. Box 831, 9498 Mollis Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-07-04 20:14:42', 2),
(49, 1, 'Purification', 'Malam Kabir Gombe', '3997 Ultrices St.', 'Lorem ipsum dolor', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-10-17 09:28:46', 2),
(50, 1, 'Nature', 'Malam Kabir Gombe', '3742 Rutrum Street', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-02-25 10:06:07', 1),
(51, 2, 'The true essence of Islam', 'Malam Kabir Gombe', 'Ap #534-1866 Rhoncus Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-03-08 21:11:57', 2),
(52, 1, 'Nature', 'Malam Kabir Gombe', '9583 Gravida Avenue', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-07-04 01:34:02', 2),
(53, 2, 'Nature', 'Malam Kabir Gombe', '582-7817 Facilisis St.', 'Lorem ipsum dolor', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-02-27 11:21:51', 2),
(54, 2, 'Pearls of Grace and Wisdom', 'Malam Kabir Gombe', '4337 Et Street', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-02-26 19:43:14', 2),
(55, 1, 'Purification', 'Malam Kabir Gombe', 'Ap #861-6303 Sodales Avenue', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-03-12 05:19:01', 2),
(56, 2, 'Principle of Tafseer', 'Malam Kabir Gombe', 'Ap #316-992 Donec Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-11-12 02:33:07', 2),
(57, 1, 'The life hereafter', 'Malam Kabir Gombe', 'Ap #497-171 Aliquet Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-06-07 19:45:44', 2),
(58, 1, 'The Do''s and Don''ts of Marriage', 'Malam Kabir Gombe', 'P.O. Box 442, 3808 Elementum Avenue', 'Lorem ipsum dolor sit', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2020-06-16 13:27:52', 2),
(59, 2, 'The true essence of Islam', 'Malam Kabir Gombe', 'Ap #212-7146 Sit Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-02-03 10:23:25', 2),
(60, 1, 'Nature', 'Malam Kabir Gombe', '9697 Erat, Avenue', 'Lorem ipsum dolor sit', 'https://i.ibb.co/3sK6kGc/gombe.jpg', '2019-05-27 06:32:20', 1),
(61, 2, 'Purification', 'Mufti Menk', 'P.O. Box 869, 318 Aliquet St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-01-23 08:47:46', 2),
(62, 2, 'Love your neightbour', 'Mufti Menk', '823-4868 Nisi Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-07-01 00:15:36', 2),
(63, 2, 'Jannah', 'Mufti Menk', '9486 Dapibus St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-08-05 19:55:24', 1),
(64, 2, 'Nature', 'Mufti Menk', '9588 Nibh Rd.', 'Lorem ipsum', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-05-15 02:42:25', 2),
(65, 2, 'Jannah', 'Mufti Menk', 'P.O. Box 353, 4351 Sem Avenue', 'Lorem ipsum', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-11-27 12:37:39', 1),
(66, 2, 'Love your neightbour', 'Mufti Menk', '7533 Sem, St.', 'Lorem ipsum', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-08-18 02:54:39', 2),
(67, 1, 'The Do''s and Don''ts of Marriage', 'Mufti Menk', '505-571 Congue. Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-04-07 09:41:37', 2),
(68, 2, 'The Do''s and Don''ts of Marriage', 'Mufti Menk', 'Ap #171-1481 Gravida Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-01-02 07:07:03', 2),
(69, 1, 'The life hereafter', 'Mufti Menk', 'P.O. Box 624, 7507 Accumsan Ave', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2018-12-17 00:29:23', 1),
(70, 1, 'Jannah', 'Mufti Menk', '8123 Molestie Road', 'Lorem', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-10-05 02:27:07', 2),
(71, 2, 'Jannah', 'Mufti Menk', 'P.O. Box 393, 582 In Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-04-16 10:25:46', 1),
(72, 2, 'Pearls of Grace and Wisdom', 'Mufti Menk', 'P.O. Box 385, 8872 Lorem Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2018-12-21 05:31:05', 1),
(73, 1, 'Principle of Tafseer', 'Mufti Menk', 'Ap #599-1986 Sodales Ave', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-08-16 16:42:50', 2),
(74, 1, 'Principle of Tafseer', 'Mufti Menk', '405-2553 Egestas. St.', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-08-01 18:09:39', 2),
(75, 2, 'The Do''s and Don''ts of Marriage', 'Mufti Menk', 'Ap #969-532 Nisi Rd.', 'Lorem ipsum dolor sit', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-08-30 02:03:22', 1),
(76, 2, 'Principle of Tafseer', 'Mufti Menk', 'P.O. Box 689, 530 Placerat, St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-10-31 13:44:58', 2),
(77, 2, 'Jannah', 'Mufti Menk', 'Ap #264-6485 Dictum Road', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-12-10 22:26:50', 1),
(78, 1, 'The Do''s and Don''ts of Marriage', 'Mufti Menk', '208-3463 Felis Rd.', 'Lorem ipsum', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2020-10-05 20:58:39', 2),
(79, 2, 'Purification', 'Mufti Menk', '744 In St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-07-08 07:11:45', 1),
(80, 2, 'The life hereafter', 'Mufti Menk', '647-8191 Dictum. Ave', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor.', 'https://i.ibb.co/CpyPVVs/mufti.jpg', '2019-03-19 04:44:33', 1),
(81, 2, 'Purification', 'Dr Isa Pantami', '193-4989 Erat, Rd.', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-03-12 02:47:45', 2),
(82, 2, 'Pearls of Grace and Wisdom', 'Dr Isa Pantami', 'Ap #709-8161 Commodo St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-11-18 15:04:30', 1),
(83, 2, 'Nature', 'Dr Isa Pantami', 'Ap #518-5550 Erat Street', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-09-10 11:38:04', 1),
(84, 1, 'Pearls of Grace and Wisdom', 'Dr Isa Pantami', '2027 Pede. St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-04-21 07:03:37', 1),
(85, 2, 'Jannah', 'Dr Isa Pantami', 'P.O. Box 275, 2909 Tellus Street', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-12-06 14:00:56', 1),
(86, 2, 'Principle of Al-Quran', 'Dr Isa Pantami', 'P.O. Box 388, 5429 Varius Avenue', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-11-25 19:00:22', 1),
(87, 2, 'The Do''s and Don''ts of Marriage', 'Dr Isa Pantami', '188-6016 Sed Road', 'Lorem ipsum dolor sit amet, consectetuer adipiscing', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-03-06 08:47:44', 1),
(88, 2, 'The Do''s and Don''ts of Marriage', 'Dr Isa Pantami', '712-8665 Et, Ave', 'Lorem ipsum dolor', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-01-31 16:00:59', 2),
(89, 1, 'Jannah', 'Dr Isa Pantami', 'Ap #358-675 Arcu. Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-03-17 16:58:09', 2),
(90, 2, 'Love your neightbour', 'Dr Isa Pantami', '9063 Malesuada Avenue', 'Lorem ipsum dolor sit amet,', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-08-05 17:18:04', 1),
(91, 2, 'Principle of Tafseer', 'Dr Isa Pantami', '818-2887 Tellus Street', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-04-11 21:04:10', 1),
(92, 2, 'Love your neightbour', 'Dr Isa Pantami', '989-5103 Suspendisse St.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-09-21 22:01:45', 2),
(93, 2, 'Pearls of Grace and Wisdom', 'Dr Isa Pantami', '326-3598 Sed Road', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-04-09 20:08:27', 2),
(94, 1, 'Pearls of Grace and Wisdom', 'Dr Isa Pantami', 'P.O. Box 817, 2410 Dolor, Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-06-26 13:57:32', 1),
(95, 1, 'The Do''s and Don''ts of Marriage', 'Dr Isa Pantami', '6942 Nibh Street', 'Lorem ipsum dolor sit amet, consectetuer adipiscing', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-02-07 16:47:17', 2),
(96, 2, 'Pearls of Grace and Wisdom', 'Dr Isa Pantami', 'P.O. Box 651, 4495 Consequat Rd.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2018-12-31 05:50:17', 1),
(97, 2, 'Pearls of Grace and Wisdom', 'Dr Isa Pantami', '911-6781 Augue Rd.', 'Lorem ipsum dolor sit amet, consectetuer', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-10-31 12:17:50', 2),
(98, 2, 'Principle of Al-Quran', 'Dr Isa Pantami', 'Ap #834-2572 Nec Av.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-12-27 02:30:41', 2),
(99, 1, 'The life hereafter', 'Dr Isa Pantami', '400-7580 Malesuada Street', 'Lorem ipsum dolor sit', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2020-08-05 04:46:59', 1),
(100, 2, 'Love your neightbour', 'Dr Isa Pantami', '551-1615 Nisi. St.', 'Lorem ipsum dolor sit', 'https://i.ibb.co/B3PtkC3/pantami.jpg', '2019-02-20 15:24:19', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblmosque`
--

CREATE TABLE `tblmosque` (
  `mosqueid` int(11) NOT NULL,
  `mosquename` varchar(128) NOT NULL,
  `mosquecat` enum('1','2') NOT NULL,
  `location` varchar(255) NOT NULL,
  `dateregistered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registeredby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmosque`
--

INSERT INTO `tblmosque` (`mosqueid`, `mosquename`, `mosquecat`, `location`, `dateregistered`, `registeredby`) VALUES
(1, 'Fbhj', '1', 'Xxfggh', '2019-12-21 13:08:41', 17),
(2, 'Kwara Central Mosque', '1', 'Kwara State, Nigeria', '2019-12-27 19:12:01', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tblmosqueadmin`
--

CREATE TABLE `tblmosqueadmin` (
  `rowid` int(11) NOT NULL,
  `mosqueid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmosqueadmin`
--

INSERT INTO `tblmosqueadmin` (`rowid`, `mosqueid`, `userid`, `datecreated`) VALUES
(1, 1, 17, '2019-12-21 13:08:41'),
(2, 2, 18, '2019-12-22 17:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `tblnotification`
--

CREATE TABLE `tblnotification` (
  `notificationid` int(11) NOT NULL,
  `notificationtype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblnotification`
--

INSERT INTO `tblnotification` (`notificationid`, `notificationtype`) VALUES
(1, 'New Lectures'),
(2, 'New Mosques');

-- --------------------------------------------------------

--
-- Table structure for table `tblroles`
--

CREATE TABLE `tblroles` (
  `roleid` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblroles`
--

INSERT INTO `tblroles` (`roleid`, `role`, `datecreated`) VALUES
(1, 'user', '2019-11-19 12:59:08'),
(2, 'admin', '2019-11-19 12:59:08'),
(3, 'super admin', '2019-11-19 12:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `tbluserfeedback`
--

CREATE TABLE `tbluserfeedback` (
  `feedbackid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `datesent` int(11) NOT NULL,
  `status` enum('read','unread') NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblusernotification`
--

CREATE TABLE `tblusernotification` (
  `rowid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `notificationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusernotification`
--

INSERT INTO `tblusernotification` (`rowid`, `userid`, `notificationid`) VALUES
(7, 18, 1),
(8, 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbluserrole`
--

CREATE TABLE `tbluserrole` (
  `rowid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateassigned` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluserrole`
--

INSERT INTO `tbluserrole` (`rowid`, `roleid`, `userid`, `dateassigned`) VALUES
(1, 1, 3, '2019-12-18 11:02:08'),
(2, 1, 4, '2019-12-18 11:02:12'),
(3, 1, 5, '2019-12-18 11:32:30'),
(4, 1, 6, '2019-12-18 23:31:10'),
(5, 1, 7, '2019-12-19 12:21:38'),
(6, 1, 8, '2019-12-19 14:38:07'),
(7, 1, 9, '2019-12-19 15:02:59'),
(8, 1, 10, '2019-12-19 19:45:14'),
(9, 1, 11, '2019-12-19 19:49:17'),
(10, 1, 12, '2019-12-19 19:57:23'),
(11, 1, 13, '2019-12-21 07:46:47'),
(12, 2, 14, '2019-12-21 08:24:16'),
(13, 2, 15, '2019-12-21 12:54:16'),
(14, 2, 16, '2019-12-21 13:04:06'),
(15, 2, 17, '2019-12-21 13:08:41'),
(16, 2, 18, '2019-12-22 17:00:16'),
(17, 1, 19, '2019-12-26 20:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `userid` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `displayname` varchar(128) NOT NULL,
  `phone` varchar(124) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photourl` varchar(255) NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`userid`, `fullname`, `displayname`, `phone`, `email`, `location`, `password`, `photourl`, `datecreated`) VALUES
(1, 'Ahmad Sani Ibrahim', 'Ahmad SI', '07012345678', 'asi@gmail.com', 'Zoo road, Kano', 'asiasi', 'https://themify.me/demo/themes/pinshop/files/2012/12/man-in-suit2.jpg', '2019-12-11 23:00:00'),
(2, 'Jabir Bako', 'JBako', '07098764534', 'jabir@gmail.com', 'Sabongari Zaria, Kaduna State', 'jabir', 'https://vengreso.com/wp-content/uploads/2016/03/LinkedIn-Profile-Professional-Picture-Sample-Bernie-Borges.png', '2019-12-11 23:00:00'),
(3, 'Ummi Abdul', 'Ummi Abdul', '07012345679', 'ummi@steam.com', 'No 21, zoo road, Kano', 'pass', 'https://vengreso.com/wp-content/uploads/2016/03/LinkedIn-Profile-Professional-Picture-Sample-Bernie-Borges.png', '2019-12-18 11:40:25'),
(4, 'Ummi Abdul', 'Ummi Abdul', '07012345679', 'ummi@steam.com', 'No 21, zoo road, Kano', 'pass', 'https://vengreso.com/wp-content/uploads/2016/03/LinkedIn-Profile-Professional-Picture-Sample-Bernie-Borges.png', '2019-12-18 11:40:38'),
(5, 'Ibrahim', 'Ibrahim', 'Isah', 'ibrahim@gmail.com', 'ABU Zaria, Kaduna State', 'ibro', 'https://vengreso.com/wp-content/uploads/2016/03/LinkedIn-Profile-Professional-Picture-Sample-Bernie-Borges.png', '2019-12-18 11:40:41'),
(6, 'Yusuf Abubakar', 'Yusuf Abubakar', '07025232421', 'yuslim@gmail.com', 'Milgoma town, Shika, Zaria', 'silimi', '', '2019-12-18 23:31:10'),
(7, 'Salam Usain', 'Salam Usain', '07023456789', 'usain@gmail.com', 'Central Mosque, Liberia', 'usain', '', '2019-12-19 12:21:38'),
(8, 'Abba Usman', 'Abba Usman', '08025252525', 'abba', 'Samaru, Zaria', 'abba', 'http://10.200.0.129/attareeq/api/uploads/photo.jpg', '2019-12-23 11:30:47'),
(9, 'Ummi Bashir', 'Ummi Bashir', '09078945612', '', 'Kano, Nigeria', '09078945612', 'http://10.200.0.129/attareeq/api/uploads/photo1576767778959.jpg', '2019-12-19 15:02:59'),
(10, 'Zndndnd', 'Zndndnd', '07038', '', 'Zaria', '07038', 'http://192.168.43.77/attareeq/api/uploads/default.jpg', '2019-12-19 19:45:14'),
(11, 'Ameen Mubarak Ahmad', 'AMA', '08025252525', 'ameen@gmail.com', 'Zaria road, Kano', 'Qwerty', 'http://192.168.43.77/attareeq/api/uploads/photo1577370358602.jpg', '2019-12-26 18:48:29'),
(12, 'Haruna Kamal', 'Haruna Kamal', '07054545454', 'harunakamal@yahoo.com', 'Opp GT Bank, Gusau, Zamfara State.', 'haruna', 'http://192.168.43.77/attareeq/api/uploads/default.jpg', '2019-12-19 19:57:23'),
(13, 'Ahmad Sani', 'Ahmad Sani', '09012452385', 'ahmadsani@steamledge.com', 'Minna, Niger State, Nigeria', 'ahmad', 'http://192.168.43.77/attareeq/api/uploads/photo1576914299899.jpg', '2019-12-21 07:46:47'),
(14, 'Kamalu Nsiru', 'Kamalu Nsiru', '08054545454', 'kamalunasiru@gmail.com', 'Soro, Bauchi State', 'kamalu', 'http://192.168.43.77/attareeq/api/uploads/photo1576916547902.jpg', '2019-12-21 08:24:16'),
(15, 'Aliyu Muazu', 'Aliyu Muazu', '07096969696', 'aliyumuazu@gmail.com', 'Kwanan magi, Kano', 'aliyumuazu', 'http://192.168.43.77/attareeq/api/uploads/photo1576932750868.jpg', '2019-12-21 12:54:16'),
(16, 'Aliyu Usman', 'Aliyu Usman', '88555', '', 'Xxfggh', 'Qwer', 'http://192.168.43.77/attareeq/api/uploads/photo1576933340423.jpg', '2019-12-21 13:04:05'),
(17, 'Aliyu Usman', 'Aliyu Usman', '88555854', '', 'Xxfggh', 'Qwer', 'http://192.168.43.77/attareeq/api/uploads/photo1576933615989.jpg', '2019-12-21 13:08:41'),
(18, 'Abubakar Yusuf', 'Abubakar Yusuf', '08139393939', 'yuslim', 'Edo State, Nigeria', '$2y$10$2zRYAmuJ.dF.Dlo4s/S4yeMn3Q0/ZQRFMupSHpMyTTWtc7elI3xBW', 'http://192.168.43.77/attareeq/api/uploads/default.jpg', '2019-12-27 09:13:40'),
(19, 'Jafar Audu', 'JFA', '07036180679', 'jafar', 'Dutsinma Katsina', '$2y$10$2zRYAmuJ.dF.Dlo4s/S4yeMn3Q0/ZQRFMupSHpMyTTWtc7elI3xBW', 'http://192.168.43.77/attareeq/api/uploads/photo1577437995492.jpg', '2019-12-27 09:15:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblfavouritelectures`
--
ALTER TABLE `tblfavouritelectures`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `tbllecturecategory`
--
ALTER TABLE `tbllecturecategory`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `tbllecturedaytime`
--
ALTER TABLE `tbllecturedaytime`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `tbllecturenotification`
--
ALTER TABLE `tbllecturenotification`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `tbllectures`
--
ALTER TABLE `tbllectures`
  ADD PRIMARY KEY (`lectureid`);

--
-- Indexes for table `tblmosque`
--
ALTER TABLE `tblmosque`
  ADD PRIMARY KEY (`mosqueid`);

--
-- Indexes for table `tblmosqueadmin`
--
ALTER TABLE `tblmosqueadmin`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `tblnotification`
--
ALTER TABLE `tblnotification`
  ADD PRIMARY KEY (`notificationid`);

--
-- Indexes for table `tblroles`
--
ALTER TABLE `tblroles`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `tblusernotification`
--
ALTER TABLE `tblusernotification`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `tbluserrole`
--
ALTER TABLE `tbluserrole`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblfavouritelectures`
--
ALTER TABLE `tblfavouritelectures`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `tbllecturecategory`
--
ALTER TABLE `tbllecturecategory`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbllecturedaytime`
--
ALTER TABLE `tbllecturedaytime`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `tbllecturenotification`
--
ALTER TABLE `tbllecturenotification`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tbllectures`
--
ALTER TABLE `tbllectures`
  MODIFY `lectureid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `tblmosque`
--
ALTER TABLE `tblmosque`
  MODIFY `mosqueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblmosqueadmin`
--
ALTER TABLE `tblmosqueadmin`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblnotification`
--
ALTER TABLE `tblnotification`
  MODIFY `notificationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblroles`
--
ALTER TABLE `tblroles`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblusernotification`
--
ALTER TABLE `tblusernotification`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbluserrole`
--
ALTER TABLE `tbluserrole`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
