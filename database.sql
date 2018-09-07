-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018 m. Rgs 07 d. 12:38
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betting-simulator`
--
CREATE DATABASE IF NOT EXISTS `betting-simulator` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `betting-simulator`;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `bets`
--

CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bet_amount` float NOT NULL,
  `final_odd` float NOT NULL,
  `result` tinyint(1) DEFAULT NULL,
  `odd_1` float NOT NULL,
  `odd_2` float NOT NULL,
  `odd_3` float NOT NULL,
  `odd_4` float NOT NULL,
  `odd_5` float NOT NULL,
  `match_1_id` int(11) NOT NULL,
  `match_2_id` int(11) NOT NULL,
  `match_3_id` int(11) NOT NULL,
  `match_4_id` int(11) NOT NULL,
  `match_5_id` int(11) NOT NULL,
  `match_1_final` varchar(1) NOT NULL,
  `match_2_final` varchar(1) NOT NULL,
  `match_3_final` varchar(1) NOT NULL,
  `match_4_final` varchar(1) NOT NULL,
  `match_5_final` varchar(1) NOT NULL,
  `match_1_end` varchar(1) DEFAULT NULL,
  `match_2_end` varchar(1) DEFAULT NULL,
  `match_3_end` varchar(1) DEFAULT NULL,
  `match_4_end` varchar(1) DEFAULT NULL,
  `match_5_end` varchar(1) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `leagues`
--

CREATE TABLE `leagues` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `leagues`
--

INSERT INTO `leagues` (`id`, `name`, `country`, `timezone`) VALUES
(1, 'Division 1', 'England', 0),
(2, 'Division 1', 'Italy', 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `odd_h` float NOT NULL,
  `odd_x` float NOT NULL,
  `odd_a` float NOT NULL,
  `team_h_id` int(11) NOT NULL,
  `team_a_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `score_h` int(2) DEFAULT NULL,
  `score_a` int(2) DEFAULT NULL,
  `final` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `matches`
--

INSERT INTO `matches` (`id`, `odd_h`, `odd_x`, `odd_a`, `team_h_id`, `team_a_id`, `date`, `time`, `score_h`, `score_a`, `final`) VALUES
(1, 12.5, 7.4, 1.27, 1, 2, '2018-08-25', '11:30:00', 1, 1, 'x'),
(2, 2.56, 3.4, 3.1, 3, 4, '2018-08-27', '19:00:00', NULL, NULL, ''),
(3, 1.38, 5.8, 9.6, 5, 6, '2018-08-25', '14:00:00', 3, 1, 'h'),
(4, 5.8, 4.1, 1.71, 9, 10, '2018-08-26', '15:00:00', 1, 2, 'a'),
(5, 1.19, 8.6, 20, 7, 8, '2018-08-25', '16:30:00', 1, 0, 'h'),
(6, 2.72, 3.55, 2.74, 11, 12, '2018-08-25', '14:00:00', 2, 2, 'x'),
(7, 2.06, 3.4, 4.2, 15, 16, '2018-08-25', '14:00:00', 4, 2, 'h'),
(8, 2.6, 3.3, 3.1, 13, 14, '2018-08-26', '12:30:00', 2, 1, 'h'),
(9, 2.38, 3.1, 3.75, 19, 18, '2018-08-25', '14:00:00', 0, 0, 'x'),
(10, 2.48, 3.3, 3.3, 20, 17, '2018-08-25', '14:00:00', 1, 2, 'a'),
(11, 7, 4.8, 1.51, 17, 7, '2018-09-01', '11:30:00', NULL, NULL, ''),
(12, 2.64, 3.45, 2.9, 6, 1, '2018-09-01', '14:00:00', NULL, NULL, ''),
(13, 5.8, 4, 1.62, 18, 5, '2018-09-02', '12:30:00', NULL, NULL, ''),
(14, 1.3, 6.4, 11.5, 10, 11, '2018-09-01', '14:00:00', NULL, NULL, ''),
(15, 1.13, 11.5, 28, 2, 9, '2018-09-01', '16:30:00', NULL, NULL, ''),
(16, 1.55, 4.2, 7.6, 12, 19, '2018-09-01', '14:00:00', NULL, NULL, ''),
(17, 6.4, 3.7, 1.65, 16, 3, '2018-09-02', '15:00:00', NULL, NULL, ''),
(18, 2.34, 3.35, 3.35, 8, 15, '2018-09-01', '14:00:00', NULL, NULL, ''),
(19, 5.3, 3.95, 1.67, 13, 4, '2018-09-02', '15:00:00', NULL, NULL, ''),
(20, 2.04, 3.45, 4.3, 14, 20, '2018-09-01', '14:00:00', NULL, NULL, ''),
(21, 1.38, 5.3, 10, 21, 22, '2018-08-25', '16:00:00', NULL, NULL, ''),
(22, 1.71, 4, 5.9, 23, 24, '2018-08-27', '18:30:00', NULL, NULL, ''),
(23, 5.5, 4.2, 1.65, 25, 26, '2018-09-02', '18:30:00', NULL, NULL, ''),
(24, 1.67, 3.95, 6, 26, 27, '2018-08-25', '18:30:00', NULL, NULL, ''),
(25, 3.25, 3.2, 2.38, 29, 28, '2018-08-26', '18:30:00', NULL, NULL, ''),
(26, 2.08, 3.35, 4, 30, 31, '2018-08-26', '16:00:00', NULL, NULL, ''),
(27, 1.53, 4.2, 5.8, 32, 33, '2018-08-26', '18:30:00', NULL, NULL, ''),
(28, 2, 3.25, 3.9, 34, 35, '2018-08-26', '18:30:00', NULL, NULL, ''),
(29, 2.3, 3.2, 3.35, 36, 35, '2018-09-02', '18:30:00', NULL, NULL, ''),
(30, 2.58, 3.3, 2.98, 37, 38, '2018-08-26', '18:30:00', NULL, NULL, ''),
(31, 2.24, 3.4, 2.82, 39, 25, '2018-08-26', '18:30:00', NULL, NULL, ''),
(32, 0, 0, 0, 5, 2, '2018-08-01', '15:00:00', 0, 2, 'a'),
(33, 2.52, 3.3, 3.15, 8, 20, '2018-08-28', '18:45:00', NULL, NULL, NULL),
(34, 1.13, 11.5, 28, 2, 15, '2018-09-15', '14:00:00', NULL, NULL, NULL),
(35, 2.86, 3.75, 2.56, 4, 7, '2018-09-15', '11:30:00', NULL, NULL, NULL),
(36, 2.46, 3.6, 3.05, 11, 17, '2018-09-15', '14:00:00', NULL, NULL, NULL),
(37, 4.6, 3.7, 1.93, 13, 3, '2018-09-15', '16:30:00', NULL, NULL, NULL),
(38, 1.91, 3.8, 4.3, 12, 6, '2018-09-16', '15:00:00', NULL, NULL, NULL),
(39, 1.24, 6.4, 14, 22, 29, '2018-09-02', '18:30:00', NULL, NULL, NULL),
(40, 2.04, 3.35, 3.85, 38, 34, '2018-09-02', '18:30:00', NULL, NULL, NULL),
(41, 18.5, 7.6, 1.19, 31, 21, '2018-09-01', '18:30:00', NULL, NULL, NULL),
(42, 1.68, 3.7, 5.4, 33, 30, '2018-09-02', '18:30:00', NULL, NULL, NULL),
(43, 5.8, 3.95, 1.59, 28, 32, '2018-09-01', '16:00:00', NULL, NULL, NULL),
(44, 1.57, 3.85, 5.5, 40, 39, '2018-09-02', '16:00:00', NULL, NULL, NULL),
(45, 1.54, 4.1, 7, 3, 1, '2018-09-22', '14:00:00', NULL, NULL, NULL),
(46, 1.19, 8.2, 22, 10, 18, '2018-09-15', '14:00:00', NULL, NULL, NULL),
(47, 1.81, 3.65, 5.5, 1, 16, '2018-09-16', '12:30:00', NULL, NULL, NULL),
(48, 4.4, 3.8, 1.91, 9, 5, '2018-09-15', '14:00:00', NULL, NULL, NULL),
(49, 3.1, 3.25, 2.62, 19, 14, '2018-09-15', '14:00:00', NULL, NULL, NULL),
(50, 2.02, 3.35, 4.1, 20, 8, '2018-09-17', '19:00:00', NULL, NULL, NULL),
(51, 1.21, 7.4, 18, 7, 20, '2018-09-22', '14:00:00', NULL, NULL, NULL),
(52, 5.4, 4, 1.58, 6, 10, '2018-09-23', '12:30:00', NULL, NULL, NULL),
(53, 19, 7.4, 1.22, 18, 2, '2018-09-22', '14:00:00', NULL, NULL, NULL),
(54, 2.22, 3.1, 1.38, 8, 4, '2018-09-22', '16:30:00', NULL, NULL, NULL),
(55, 2.02, 3.3, 4.2, 34, 28, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(56, 1.23, 6.8, 16, 21, 38, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(57, 3, 3.5, 2.42, 39, 33, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(58, 1.62, 4.3, 5.6, 26, 40, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(59, 1.26, 6, 13, 23, 36, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(60, 12.5, 5.9, 1.24, 29, 21, '2018-09-23', '14:00:00', NULL, NULL, NULL),
(61, 4.4, 3.55, 1.87, 30, 24, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(62, 3.55, 3.4, 2.16, 29, 25, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(63, 4.1, 3.55, 1.74, 35, 22, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(64, 3.25, 3.1, 1.8, 37, 27, '2018-09-16', '14:00:00', NULL, NULL, NULL),
(65, 1.29, 4.8, 10, 32, 31, '2018-09-16', '14:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `league_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `teams`
--

INSERT INTO `teams` (`id`, `name`, `league_id`) VALUES
(1, 'Wolves', 1),
(2, 'Man City', 1),
(3, 'Man Utd', 1),
(4, 'Tottenham', 1),
(5, 'Arsenal', 1),
(6, 'West Ham', 1),
(7, 'Liverpool', 1),
(8, 'Brighton', 1),
(9, 'Newcastle', 1),
(10, 'Chelsea', 1),
(11, 'Bournemouth', 1),
(12, 'Everton', 1),
(13, 'Watford', 1),
(14, 'C Palace', 1),
(15, 'Fulham', 1),
(16, 'Burnley', 1),
(17, 'Leicester', 1),
(18, 'Cardiff', 1),
(19, 'Huddersfield', 1),
(20, 'Southampton', 1),
(21, 'Juventus', 2),
(22, 'Lazio', 2),
(23, 'Roma', 2),
(24, 'Atalanta', 2),
(25, 'Sampdoria', 2),
(26, 'Napoli', 2),
(27, 'AC Milan', 2),
(28, 'Bologna', 2),
(29, 'Frosinone', 2),
(30, 'SPAL', 2),
(31, 'Parma', 2),
(32, 'Inter', 2),
(33, 'Torino', 2),
(34, 'Genoa', 2),
(35, 'Empoli', 2),
(36, 'Chievo', 2),
(37, 'Cagliari', 2),
(38, 'Sassuolo', 2),
(39, 'Udinese', 2),
(40, 'Fiorentina', 2);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `users`
--

CREATE TABLE `users` (
  `id` int(6) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cash` float NOT NULL,
  `date_loggedin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_registered` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bets`
--
ALTER TABLE `bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `leagues`
--
ALTER TABLE `leagues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
