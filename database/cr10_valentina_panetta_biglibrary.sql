-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 13, 2019 at 10:14 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_valentina_panetta_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `cr10_valentina_panetta_biglibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr10_valentina_panetta_biglibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `surname` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `name`, `surname`) VALUES
(1, 'Bram', 'Stoker'),
(2, 'Sheridan', 'Le Fanu'),
(3, 'Emma', 'Cline'),
(4, 'Jane', 'Austen'),
(5, 'Jean Paul', 'Sartre'),
(6, 'Greta', 'Gerwig'),
(7, 'Luca', 'Guadagnino'),
(8, 'Ari', 'Aster'),
(9, 'Mark', 'Waters'),
(10, 'Richard', 'Kelly'),
(11, 'Hozier', ''),
(12, 'Florence', 'and the Machine'),
(13, 'Mitski', ''),
(14, 'Marina', 'and the Diamonds'),
(15, 'The', 'Fratellis'),
(16, 'Bram', 'Stoker'),
(17, '', ''),
(18, 'Valentina', ''),
(19, 'Valentina', 'Panetta'),
(20, 'Valentina', 'Pahr');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `isbn` int(11) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `written_language` varchar(55) DEFAULT NULL,
  `fk_media` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `isbn`, `pages`, `written_language`, `fk_media`) VALUES
(1, 1853260865, 352, 'English', 1),
(2, 1934555649, 108, 'English', 2),
(3, 1812988027, 368, 'English', 3),
(4, 2147483647, 480, 'English', 4),
(5, 2147483647, 253, 'French', 5),
(8, 111111, 123, 'English', 18),
(12, 111111, 203, 'English', 22);

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

DROP TABLE IF EXISTS `cds`;
CREATE TABLE `cds` (
  `cd_id` int(11) NOT NULL,
  `num_of_discs` int(11) DEFAULT NULL,
  `num_of_tracks` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `fk_media` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`cd_id`, `num_of_discs`, `num_of_tracks`, `length`, `fk_media`) VALUES
(3, 1, 14, 33, 13),
(4, 1, 14, 47, 14),
(5, 1, 11, 47, 15);

-- --------------------------------------------------------

--
-- Table structure for table `dvds`
--

DROP TABLE IF EXISTS `dvds`;
CREATE TABLE `dvds` (
  `dvd_id` int(11) NOT NULL,
  `audio_description` enum('English','German','Italian','French','Spanish') DEFAULT NULL,
  `aspect_ratio` varchar(55) DEFAULT NULL,
  `subtitles` enum('English','German','Italian','French','Spanish') DEFAULT NULL,
  `run_time` int(11) DEFAULT NULL,
  `rated` varchar(55) DEFAULT NULL,
  `fk_media` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dvds`
--

INSERT INTO `dvds` (`dvd_id`, `audio_description`, `aspect_ratio`, `subtitles`, `run_time`, `rated`, `fk_media`) VALUES
(2, 'English', '1.85:1', 'Italian', 132, 'Restricted', 7),
(3, 'English', 'NTSC', 'German', 127, 'Restricted', 8),
(4, 'English', 'Widescreen', 'French', 97, 'PG-13', 9),
(5, 'English', 'Widescreen', 'Spanish', 211, 'Restricted', 10);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `name`) VALUES
(1, 'horror'),
(2, 'thriller'),
(3, 'romance'),
(4, 'comedy'),
(5, 'fantasy'),
(6, 'drama'),
(7, 'science-fiction'),
(8, 'comedy'),
(9, 'historical fiction'),
(10, 'documentary'),
(11, 'pop'),
(12, 'rock'),
(13, 'rap'),
(14, 'indie rock'),
(15, 'blues'),
(16, 'jazz');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `description` text,
  `availability` tinyint(1) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `fk_genre` int(11) DEFAULT NULL,
  `fk_publisher` int(11) DEFAULT NULL,
  `fk_author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `title`, `img_path`, `description`, `availability`, `publish_date`, `fk_genre`, `fk_publisher`, `fk_author`) VALUES
(1, 'Dracula', 'resources/img/book.png', 'Count Dracula, a 15th-century prince, is condemned to live off the blood of the living for ever.', 0, '1897-05-25', 1, 1, 1),
(2, 'Carmilla', 'resources/img/book.png', 'Carmilla is an 1872 Gothic novella by Irish author Joseph Sheridan Le Fanu and one of the early works of vampire fiction, predating Bram Stokers Dracula by 26 years', 1, '1872-09-16', 1, 2, 2),
(3, 'The Girls', 'resources/img/book.png', 'The Girls is a 2016 debut novel by American author Emma Cline. It is loosely inspired by the Manson Family and the murder of actress Sharon Tate.', 1, '2016-06-14', 9, 3, 3),
(4, 'Pride and Prejudice', 'resources/img/book.png', 'Pride and Prejudice is a romance novel filled with comedy, its humor lies in its honest depiction of manners, education, marriage and money during the Regency era in Great Britain.', 0, '1813-01-28', 3, 4, 4),
(5, 'La Nausee', 'resources/img/book.png', 'The novel takes place in Bouville and it concerns a dejected historian, who becomes convinced that inanimate objects and situations encroach on his ability to define himself,evoking in the protagonist a sense of nausea.', 0, '1938-02-21', 9, 5, 5),
(7, 'Call Me By Your Name', 'resources/img/movie.png', 'In the summer of 1983, 17-year-old Elio Perlman is spending the days with his family at their 17th-century villa in Lombardy, Italy. He soon meets Oliver, a handsome doctoral student who is working as an intern for Elios father.', 1, '2017-10-20', 6, 7, 7),
(8, 'Hereditary', 'resources/img/movie.png', 'When the matriarch of the Graham family passes away, her daughter and grandchildren begin to unravel cryptic and increasingly terrifying secrets about their ancestry, trying to outrun the sinister fate they have inherited.', 0, '2018-06-07', 1, 6, 8),
(9, 'Mean Girls', 'resources/img/movie.png', 'Cady Heron is a hit with The Plastics, the A-list girl clique at her new school, until she makes the mistake of falling for Aaron Samuels, the ex-boyfriend of alpha Plastic Regina George.', 1, '2004-04-30', 4, 8, 9),
(10, 'Donnie Darko', 'resources/img/movie.png', 'During the presidential election of 1988, a teenager named Donnie Darko sleepwalks out of his house one night and sees a giant, demonic-looking rabbit named Frank, who tells him the world will end in 28 days.', 1, '2001-01-19', 7, 6, 10),
(13, 'Be the Cowboy', 'resources/img/cd.png', 'Be the Cowboy is the fifth studio album by Japanese-American indie rock musician Mitski.', 1, '2018-08-17', 14, 10, 13),
(14, 'Electra Heart', 'resources/img/cd.png', 'Electra Heart is the second studio album by Welsh singer Marina Diamandis, released under the stage name Marina and the Diamonds', 1, '2012-04-27', 11, 11, 14),
(15, 'In your own Sweet Time', 'resources/img/cd.png', 'In Your Own Sweet Time is the fifth studio album by Scottish rock band, The Fratellis.', 1, '2018-03-16', 14, 12, 15),
(18, 'titlel', 'img', '', 0, '2019-02-13', 3, 1, 19),
(22, 'titlel', 'img', 'fdfadfdafdaf', 1, '2019-02-13', 6, 4, 19),
(24, 'titlel', 'img', 'rwafeafae', 1, '2019-02-13', 6, 6, 19),
(25, 'titlel', 'img', 'gssfgs', 1, '2019-02-13', 1, 6, 19),
(26, 'titlel', '2www', 'kfhajldhflad', 1, '2019-02-13', 1, 8, 19);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE `publishers` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `size` enum('big','medium','small') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `name`, `address`, `size`) VALUES
(1, 'Barnes & Noble', 'New York, New York, United States', 'big'),
(2, 'CreateSpace', 'Scotts Valley, California, United States', 'big'),
(3, 'Random House Trade Paperbacks', 'New York, New York, United States', 'medium'),
(4, 'Penguin Books', 'London, United Kingdom', 'big'),
(5, 'Editions Gallimard', 'Paris, France', 'small'),
(6, 'Lionsgate', 'Santa Monica, California, United States', 'big'),
(7, 'Sony Pictures Home Entertainment', 'Culver City, California, United States', 'big'),
(8, 'Paramount', 'Hollywood, Los Angeles, California, United States', 'big'),
(9, 'Island Records', 'London, United Kingdom', 'medium'),
(10, 'Dead Oceans', 'Bloomington, Indiana', 'small'),
(11, 'Warner Music International', 'New York, New York, United States', 'big'),
(12, 'Cooking Vinyl', ' London, United Kingdom', 'medium');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_media` (`fk_media`);

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
  ADD PRIMARY KEY (`cd_id`),
  ADD KEY `fk_media` (`fk_media`);

--
-- Indexes for table `dvds`
--
ALTER TABLE `dvds`
  ADD PRIMARY KEY (`dvd_id`),
  ADD KEY `fk_media` (`fk_media`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_genre` (`fk_genre`),
  ADD KEY `fk_publisher` (`fk_publisher`),
  ADD KEY `fk_author` (`fk_author`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`publisher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
  MODIFY `cd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dvds`
--
ALTER TABLE `dvds`
  MODIFY `dvd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_media`) REFERENCES `media` (`media_id`);

--
-- Constraints for table `cds`
--
ALTER TABLE `cds`
  ADD CONSTRAINT `cds_ibfk_1` FOREIGN KEY (`fk_media`) REFERENCES `media` (`media_id`);

--
-- Constraints for table `dvds`
--
ALTER TABLE `dvds`
  ADD CONSTRAINT `dvds_ibfk_1` FOREIGN KEY (`fk_media`) REFERENCES `media` (`media_id`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_genre`) REFERENCES `genres` (`genre_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher`) REFERENCES `publishers` (`publisher_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_author`) REFERENCES `authors` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
