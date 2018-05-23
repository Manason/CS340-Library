-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: May 23, 2018 at 03:42 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_edwarda3`
--
CREATE DATABASE IF NOT EXISTS `cs340_berksn` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cs340_berksn`;

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `bookID` int(32) NOT NULL,
  `author` varchar(255) NOT NULL,
  `numPages` int(32) NOT NULL,
  `mediaID` int(32) NOT NULL,
  `userID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`bookID`, `author`, `numPages`, `mediaID`, `userID`) VALUES
(0, 'tester', 10, 0, 'testuser01'),
(1, 'tester', 10, 0, NULL),
(2, 'tester2', 40, 1, NULL),
(3, 'tester3', 109, 3, NULL),
(4, 'tester', 10, 0, 'testuser03');

-- --------------------------------------------------------

--
-- Table structure for table `Film`
--

CREATE TABLE `Film` (
  `filmID` int(32) NOT NULL COMMENT 'For a copy',
  `director` varchar(255) NOT NULL,
  `length` int(32) NOT NULL,
  `mediaID` int(32) NOT NULL,
  `userID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Film`
--

INSERT INTO `Film` (`filmID`, `director`, `length`, `mediaID`, `userID`) VALUES
(0, 'director1', 120, 2, 'testuser01'),
(1, 'director1', 120, 2, NULL),
(2, 'director1', 120, 2, NULL),
(3, 'director2', 134, 4, 'testuser02'),
(4, 'director2', 134, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Media`
--

CREATE TABLE `Media` (
  `mediaID` int(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sectionName` varchar(32) NOT NULL,
  `imageURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Media`
--

INSERT INTO `Media` (`mediaID`, `title`, `description`, `type`, `sectionName`, `imageURL`) VALUES
(0, 'test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'book', 'text', ''),
(1, 'book', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'book', 'text', ''),
(2, 'film', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'film', 'movie', ''),
(3, 'goodbook', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'book', 'text', ''),
(4, 'badfilm', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'film', 'movie', '');

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `mediaID` int(32) NOT NULL,
  `userID` varchar(32) NOT NULL,
  `rating` int(32) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `upvotes` int(32) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`mediaID`, `userID`, `rating`, `description`, `upvotes`, `date`) VALUES
(0, 'testuser01', 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 4, '2018-05-12'),
(0, 'testuser02', 3, NULL, 1, '2018-05-14'),
(0, 'testuser03', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 2, '2018-05-10'),
(1, 'testuser01', 5, NULL, 1, '2018-05-12'),
(2, 'testuser01', 3, 'description here', 1, '2018-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `userID` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `favoriteBook` varchar(255) DEFAULT NULL,
  `favoriteFilm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userID`, `password`, `favoriteBook`, `favoriteFilm`) VALUES
('testuser01', 'password', 'test', 'test'),
('testuser02', 'password', NULL, NULL),
('testuser03', 'password', NULL, NULL),
('testuser04', 'default', 'book', 'film'),
('testuser05', 'goodpassword', 'book', 'film');

--
-- Triggers `User`
--
DELIMITER $$
CREATE TRIGGER `NullUserID` AFTER DELETE ON `User` FOR EACH ROW BEGIN
	if old.userID is NOT NULL THEN
    	update Review
        set userID = NULL 
        WHERE userID = old.userID;
        update Film
        set userID = NULL 
        WHERE userID = old.userID;
        update Book
        set userID = NULL 
        WHERE userID = old.userID;
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`bookID`),
  ADD UNIQUE KEY `bookID` (`bookID`),
  ADD KEY `bookID_2` (`bookID`),
  ADD KEY `mediaID` (`mediaID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Film`
--
ALTER TABLE `Film`
  ADD PRIMARY KEY (`filmID`),
  ADD UNIQUE KEY `filmID` (`filmID`),
  ADD KEY `filmID_2` (`filmID`),
  ADD KEY `mediaID` (`mediaID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `Media`
--
ALTER TABLE `Media`
  ADD PRIMARY KEY (`mediaID`),
  ADD UNIQUE KEY `mediaID` (`mediaID`),
  ADD KEY `mediaID_2` (`mediaID`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`mediaID`,`userID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD KEY `userID_2` (`userID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`),
  ADD CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`);

--
-- Constraints for table `Film`
--
ALTER TABLE `Film`
  ADD CONSTRAINT `Film_ibfk_1` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`),
  ADD CONSTRAINT `Film_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`);

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  ADD CONSTRAINT `Review_ibfk_2` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
