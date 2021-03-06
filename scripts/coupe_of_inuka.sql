SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `coupe_of_inuka`
--

CREATE DATABASE `coupe_of_inuka`;
USE `coupe_of_inuka`;

-- --------------------------------------------------------
--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `phase` varchar(255) DEFAULT NULL,
  `posEquipe_1` int(11) NOT NULL,
  `posEquipe_2` int(11) NOT NULL,
  `idEquipe1` int(11) DEFAULT NULL,
  `idEquipe2` int(11) DEFAULT NULL,
  `scoreEquipe1` int(11) DEFAULT NULL,
  `scoreEquipe2` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL DEFAULT '0',
  `peutJouer` tinyint(1) NOT NULL DEFAULT '0',
  `termine` tinyint(1) NOT NULL DEFAULT '0',
  `idEqG` int(11) DEFAULT NULL,
  `idEqP` int(11) DEFAULT NULL,
  `pen_1` int(11) DEFAULT NULL,
  `pen_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `phase`, `posEquipe_1`, `posEquipe_2`, `idEquipe1`, `idEquipe2`, `scoreEquipe1`, `scoreEquipe2`, `numero`, `peutJouer`, `termine`, `idEqG`, `idEqP`, `pen_1`, `pen_2`) VALUES
(1, 'Premier Tour', 1, 2, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL),
(2, 'Premier Tour', 3, 4, NULL, NULL, NULL, NULL, 3, 0, 0, NULL, NULL, NULL, NULL),
(3, 'Premier Tour', 1, 3, NULL, NULL, NULL, NULL, 5, 0, 0, NULL, NULL, NULL, NULL),
(4, 'Premier Tour', 2, 4, NULL, NULL, NULL, NULL, 7, 0, 0, NULL, NULL, NULL, NULL),
(5, 'Premier Tour', 1, 4, NULL, NULL, NULL, NULL, 9, 0, 0, NULL, NULL, NULL, NULL),
(6, 'Premier Tour', 2, 3, NULL, NULL, NULL, NULL, 11, 0, 0, NULL, NULL, NULL, NULL),
(7, 'Premier Tour', 1, 2, NULL, NULL, NULL, NULL, 2, 0, 0, NULL, NULL, NULL, NULL),
(8, 'Premier Tour', 3, 4, NULL, NULL, NULL, NULL, 4, 0, 0, NULL, NULL, NULL, NULL),
(9, 'Premier Tour', 1, 3, NULL, NULL, NULL, NULL, 6, 0, 0, NULL, NULL, NULL, NULL),
(10, 'Premier Tour', 2, 4, NULL, NULL, NULL, NULL, 8, 0, 0, NULL, NULL, NULL, NULL),
(11, 'Premier Tour', 1, 4, NULL, NULL, NULL, NULL, 10, 0, 0, NULL, NULL, NULL, NULL),
(12, 'Premier Tour', 2, 3, NULL, NULL, NULL, NULL, 12, 0, 0, NULL, NULL, NULL, NULL),
(13, 'Demi Finale', 1, 2, NULL, NULL, NULL, NULL, 13, 0, 0, NULL, NULL, NULL, NULL),
(14, 'Demi Finale', 1, 2, NULL, NULL, NULL, NULL, 14, 0, 0, NULL, NULL, NULL, NULL),
(15, 'Petite Finale', 2, 2, NULL, NULL, NULL, NULL, 15, 0, 0, NULL, NULL, NULL, NULL),
(16, 'Grande Finale', 1, 1, NULL, NULL, NULL, NULL, 16, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `nomGroupe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `nomGroupe`) VALUES
(1, 'A'),
(2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

CREATE TABLE `lot` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `idLot` int(11) DEFAULT NULL,
  `idGroupe` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `drapeau` varchar(255) NOT NULL,
  `matchJoue` int(11) DEFAULT NULL,
  `matchGagne` int(11) DEFAULT NULL,
  `matchNull` int(11) DEFAULT NULL,
  `matchPerdu` int(11) DEFAULT NULL,
  `butPour` int(11) DEFAULT NULL,
  `butContre` int(11) DEFAULT NULL,
  `diffBut` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `qualifie` tinyint(1) DEFAULT NULL,
  `surnom` varchar(255) NOT NULL,
  `titre` int(11) NOT NULL,
  `descr` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `idLot`, `idGroupe`, `nom`, `drapeau`, `matchJoue`, `matchGagne`, `matchNull`, `matchPerdu`, `butPour`, `butContre`, `diffBut`, `points`, `qualifie`, `surnom`, `titre`, `descr`) VALUES
(1, 1, NULL, 'Br??sil', 'br.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Sele????o', 5, 'L\'??quipe du Br??sil de football (en portugais : Sele????o Brasileira de Futebol) est la s??lection de joueurs br??siliens repr??sentant le pays lors des comp??titions internationales de football masculin, sous l\'??gide de la Conf??d??ration br??silienne de football.'),
(2, 2, NULL, 'France', 'fr.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Les Bleus', 2, 'L\'??quipe de France de football, cr????e en 1904, est l\'??quipe nationale qui repr??sente la France dans les comp??titions internationales masculines de football, sous l\'??gide de la F??d??ration fran??aise de football (FFF).'),
(3, 3, NULL, 'Espagne', 'es.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'La Roja', 1, 'L\'??quipe d\'Espagne de football (en espagnol : Selecci??n de f??tbol de Espa??a) est la s??lection de joueurs espagnols repr??sentant le pays lors des comp??titions internationales de football masculin, sous l\'??gide de la F??d??ration royale espagnole de football. '),
(4, 4, NULL, 'Portugal', 'pt.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Sele????o das Quinas', 0, 'L\'??quipe du Portugal de football (en portugais : Sele????o portuguesa de futebol) est la s??lection de joueurs portugais repr??sentant le pays lors des comp??titions internationales de football masculin, sous l\'??gide de la F??d??ration portugaise de football.'),
(5, 1, NULL, 'Argentine', 'ag.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'L\'Albiceleste', 2, 'L\'??quipe d\'Argentine de football (Selecci??n de f??tbol de Argentina) est la s??lection de joueurs argentins repr??sentant le pays lors des comp??titions internationales de football masculin, sous l\'??gide de l\'Asociaci??n del F??tbol Argentino.'),
(6, 2, NULL, 'Italie', 'it.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Squadra Azzurra', 4, 'L\'??quipe d\'Italie de football (en italien : Nazionale di calcio dell\'Italia) est la s??lection de joueurs italiens repr??sentant le pays lors des comp??titions internationales de football masculin, sous l\'??gide de la F??d??ration italienne de football.'),
(7, 3, NULL, 'Allemagne', 'al.svg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'Nationalelf', 4, 'L\'??quipe d\'Allemagne de football (en allemand : Deutsche Fu??ballnationalmannschaft) est constitu??e d\'une s??lection des meilleurs joueurs allemands sous l\'??gide de la F??d??ration allemande de football (en allemand : Deutscher Fu??ball-Bund) (DFB).'),
(8, 4, NULL, 'Ha??ti', 'ht.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '	Les Grenadiers', 0, 'L\'??quipe d\'Ha??ti de football est constitu??e par une s??lection des meilleurs joueurs ha??tiens sous l\'??gide de la F??d??ration ha??tienne de football et repr??sente le pays lors des comp??titions r??gionales, continentales et internationales depuis sa cr??ation en 1925.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipes_1_match` (`idEquipe1`),
  ADD KEY `fk_equipes_2_match` (`idEquipe2`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipe_groupe` (`idGroupe`),
  ADD KEY `fk_equipes_lot` (`idLot`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lot`
--
ALTER TABLE `lot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_equipes_1_match` FOREIGN KEY (`idEquipe1`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `fk_equipes_2_match` FOREIGN KEY (`idEquipe2`) REFERENCES `team` (`id`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_equipe_groupe` FOREIGN KEY (`idGroupe`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `fk_equipes_lot` FOREIGN KEY (`idLot`) REFERENCES `lot` (`id`);
COMMIT;

