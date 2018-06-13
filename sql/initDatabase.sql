SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `Book` (
  `bookID` int(32) NOT NULL,
  `author` varchar(255) NOT NULL,
  `numPages` int(32) NOT NULL,
  `mediaID` int(32) NOT NULL,
  `userID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Film` (
  `filmID` int(32) NOT NULL,
  `director` varchar(255) NOT NULL,
  `length` int(32) NOT NULL,
  `mediaID` int(32) NOT NULL,
  `userID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Media` (
  `mediaID` int(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sectionName` varchar(32) NOT NULL,
  `imageURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Review` (
  `mediaID` int(32) NOT NULL,
  `userID` varchar(32) NOT NULL,
  `rating` int(32) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `User` (
  `userID` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `favoriteBook` varchar(255) DEFAULT NULL,
  `favoriteFilm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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


ALTER TABLE `Book`
  ADD PRIMARY KEY (`bookID`),
  ADD UNIQUE KEY `bookID` (`bookID`),
  ADD KEY `bookID_2` (`bookID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `Book_ibfk_1` (`mediaID`);

ALTER TABLE `Film`
  ADD PRIMARY KEY (`filmID`),
  ADD UNIQUE KEY `filmID` (`filmID`),
  ADD KEY `filmID_2` (`filmID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `Film_ibfk_1` (`mediaID`);

ALTER TABLE `Media`
  ADD PRIMARY KEY (`mediaID`),
  ADD UNIQUE KEY `mediaID` (`mediaID`),
  ADD KEY `mediaID_2` (`mediaID`);

ALTER TABLE `Review`
  ADD PRIMARY KEY (`mediaID`,`userID`),
  ADD KEY `userID` (`userID`);

ALTER TABLE `User`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD KEY `userID_2` (`userID`);


ALTER TABLE `Book`
  MODIFY `bookID` int(32) NOT NULL AUTO_INCREMENT;

ALTER TABLE `Film`
  MODIFY `filmID` int(32) NOT NULL AUTO_INCREMENT;

ALTER TABLE `Media`
  MODIFY `mediaID` int(32) NOT NULL AUTO_INCREMENT;


ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Book_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`);

ALTER TABLE `Film`
  ADD CONSTRAINT `Film_ibfk_1` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Film_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`);

ALTER TABLE `Review`
  ADD CONSTRAINT `Review_ibfk_2` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
