-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2021 at 10:00 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `champions-league`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipes`
--

CREATE TABLE `equipes` (
  `id_equipes` int(11) NOT NULL,
  `nom_equipes` varchar(250) DEFAULT NULL,
  `drapeau_equipes` text DEFAULT NULL,
  `butEnc_equipes` int(2) DEFAULT NULL,
  `butMarq_equipes` int(2) DEFAULT NULL,
  `point_equipes` int(5) DEFAULT NULL,
  `diffBut_equipes` int(5) DEFAULT NULL,
  `matchNull_equipes` int(10) DEFAULT NULL,
  `id_groupe` int(11) DEFAULT NULL,
  `id_lots_eq` int(11) DEFAULT NULL,
  `MatchGagne_equipes` int(11) NOT NULL,
  `MatchPerdu_equipes` int(11) NOT NULL,
  `matchJouer_equipe` int(11) NOT NULL,
  `testQalifie` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `equipes`
--

INSERT INTO `equipes` (`id_equipes`, `nom_equipes`, `drapeau_equipes`, `butEnc_equipes`, `butMarq_equipes`, `point_equipes`, `diffBut_equipes`, `matchNull_equipes`, `id_groupe`, `id_lots_eq`, `MatchGagne_equipes`, `MatchPerdu_equipes`, `matchJouer_equipe`, `testQalifie`) VALUES
(1, 'Brésil', 'bresil.svg', NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 0, 0, 0),
(2, 'France', 'france.svg', NULL, NULL, 0, NULL, NULL, NULL, 2, 0, 0, 0, 0),
(3, 'Espagne', 'espagne.svg', NULL, NULL, 0, NULL, NULL, NULL, 3, 0, 0, 0, 0),
(4, 'Portugal', 'portugal.svg', NULL, NULL, 0, NULL, NULL, NULL, 4, 0, 0, 0, 0),
(5, 'Argentine', 'argentine.svg', NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 0, 0, 0),
(6, 'Italie', 'italie.svg', NULL, NULL, 0, NULL, NULL, NULL, 2, 0, 0, 0, 0),
(7, 'Allemagne', 'allemagne', NULL, NULL, 0, NULL, NULL, NULL, 3, 0, 0, 0, 0),
(8, 'Haïti', 'haiti.svg', NULL, NULL, 0, NULL, NULL, NULL, 4, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `groupe`
--

CREATE TABLE `groupe` (
  `id_groupe` int(11) NOT NULL,
  `nom_groupe` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groupe`
--

INSERT INTO `groupe` (`id_groupe`, `nom_groupe`) VALUES
(1, NULL),
(2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jouer`
--

CREATE TABLE `jouer` (
  `id_matchs` int(11) NOT NULL,
  `id_equipes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lots_eq`
--

CREATE TABLE `lots_eq` (
  `id_lots_eq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lots_eq`
--

INSERT INTO `lots_eq` (`id_lots_eq`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `matchs`
--

CREATE TABLE `matchs` (
  `id_matchs` int(11) NOT NULL,
  `idEq2_matchs` int(250) DEFAULT NULL,
  `idEq1_matchs` int(250) DEFAULT NULL,
  `scoreEq1_matchs` int(5) DEFAULT NULL,
  `scoreEq2_matchs` int(5) DEFAULT NULL,
  `siJouer_matchs` tinyint(1) DEFAULT NULL,
  `phase_matchs` text NOT NULL,
  `position_eq_1` int(11) NOT NULL,
  `position_eq_2` int(11) NOT NULL,
  `eq_p` int(11) NOT NULL,
  `eq_g` int(11) NOT NULL,
  `matchs_termine` tinyint(1) NOT NULL,
  `match_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matchs`
--

INSERT INTO `matchs` (`id_matchs`, `idEq2_matchs`, `idEq1_matchs`, `scoreEq1_matchs`, `scoreEq2_matchs`, `siJouer_matchs`, `phase_matchs`, `position_eq_1`, `position_eq_2`, `eq_p`, `eq_g`, `matchs_termine`, `match_num`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'Premier Tour', 1, 2, 0, 0, 0, 1),
(2, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 3, 4, 0, 0, 0, 3),
(3, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 1, 3, 0, 0, 0, 5),
(4, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 2, 4, 0, 0, 0, 7),
(5, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 1, 4, 0, 0, 0, 9),
(6, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 2, 3, 0, 0, 0, 11),
(7, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 1, 2, 0, 0, 0, 2),
(8, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 3, 4, 0, 0, 0, 4),
(9, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 1, 3, 0, 0, 0, 6),
(10, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 2, 4, 0, 0, 0, 8),
(11, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 1, 4, 0, 0, 0, 10),
(12, NULL, NULL, NULL, NULL, 0, 'Premier Tour', 2, 3, 0, 0, 0, 12),
(13, NULL, NULL, NULL, NULL, 0, 'Demi Finale', 1, 2, 0, 0, 0, 13),
(14, NULL, NULL, NULL, NULL, 0, 'Demi Finale', 1, 2, 0, 0, 0, 14),
(15, NULL, NULL, NULL, NULL, 0, 'Petite Finale', 2, 2, 0, 0, 0, 15),
(16, NULL, NULL, NULL, NULL, 0, 'Grande Finale', 1, 1, 0, 0, 0, 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id_equipes`),
  ADD KEY `FK_equipes_id_groupe` (`id_groupe`),
  ADD KEY `FK_equipes_id_lots_eq` (`id_lots_eq`);

--
-- Indexes for table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Indexes for table `jouer`
--
ALTER TABLE `jouer`
  ADD PRIMARY KEY (`id_matchs`,`id_equipes`),
  ADD KEY `FK_jouer_id_equipes` (`id_equipes`);

--
-- Indexes for table `lots_eq`
--
ALTER TABLE `lots_eq`
  ADD PRIMARY KEY (`id_lots_eq`);

--
-- Indexes for table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`id_matchs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id_equipes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_groupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jouer`
--
ALTER TABLE `jouer`
  MODIFY `id_matchs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lots_eq`
--
ALTER TABLE `lots_eq`
  MODIFY `id_lots_eq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id_matchs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `FK_equipes_id_groupe` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`),
  ADD CONSTRAINT `FK_equipes_id_lots_eq` FOREIGN KEY (`id_lots_eq`) REFERENCES `lots_eq` (`id_lots_eq`);

--
-- Constraints for table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `FK_jouer_id_equipes` FOREIGN KEY (`id_equipes`) REFERENCES `equipes` (`id_equipes`),
  ADD CONSTRAINT `FK_jouer_id_matchs` FOREIGN KEY (`id_matchs`) REFERENCES `matchs` (`id_matchs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
