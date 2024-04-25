-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2024 at 08:39 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neuvontapalsta`
--

-- --------------------------------------------------------

--
-- Table structure for table `kayttaja`
--

CREATE TABLE `kayttaja` (
  `nimimerkki` varchar(50) NOT NULL,
  `salasana` varchar(100) NOT NULL,
  `sposti` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kayttaja`
--

INSERT INTO `kayttaja` (`nimimerkki`, `salasana`, `sposti`) VALUES
('MammanPoika', 'mamis123', 'mammanpoika@yahoo.com'),
('marjatta', 'moimoi', ''),
('muikkis', '123', 'muikkis@yahoo.com'),
('Osbdons', '123', 'lol@yahoo.com'),
('Possu', '123', 'possu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `kysymys`
--

CREATE TABLE `kysymys` (
  `id` int(11) NOT NULL,
  `otsikko` varchar(100) NOT NULL,
  `sisalto` text NOT NULL,
  `paivamaara` date NOT NULL,
  `nimimerkki` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kysymys`
--

INSERT INTO `kysymys` (`id`, `otsikko`, `sisalto`, `paivamaara`, `nimimerkki`) VALUES
(1, 'testinh', 'Minkälainen keli?', '2024-04-04', 'Possu'),
(2, 'Mikä meisinki??', 'MITEN MENEE???', '2024-04-04', 'Possu'),
(3, 'Hahmo', 'Mikä on teidän lempi nallepuh hahmo?', '2024-04-04', 'Possu'),
(4, 'mmm', 'kkkkkkkk', '2024-04-05', 'Possu'),
(5, 'Paras bändi', 'Mikä on teidän lempi bändi?', '2024-04-05', 'muikkis');

-- --------------------------------------------------------

--
-- Table structure for table `vastaus`
--

CREATE TABLE `vastaus` (
  `id` int(11) NOT NULL,
  `sisalto` text NOT NULL,
  `paivamaara` date NOT NULL,
  `nimimerkki` varchar(50) NOT NULL,
  `kysymys` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vastaus`
--

INSERT INTO `vastaus` (`id`, `sisalto`, `paivamaara`, `nimimerkki`, `kysymys`) VALUES
(1, 'Ihan paska keli >_>', '2024-04-04', 'MammanPoika', 1),
(2, 'TOODELLA HYVÄ KELI!', '2024-04-04', 'MammanPoika', 1),
(3, 'hytsk,yd', '2024-04-04', 'Possu', 1),
(4, 'mmmmmm', '2024-04-04', 'Possu', 1),
(5, 'mmmmmm', '2024-04-04', 'Possu', 1),
(6, 'HIRVEETÄ!! TAKATALVI', '2024-04-04', 'Possu', 1),
(7, 'Ihan hyvä :)', '2024-04-05', 'Possu', 2),
(8, 'jjnjnjln', '2024-04-05', 'Possu', 4),
(9, 'kauhia', '2024-04-05', 'Possu', 1),
(10, 'Haloo Helsinki', '2024-04-05', 'Possu', 5),
(11, 'HUONO :(', '2024-04-08', 'Possu', 2),
(12, 'HUONO :(', '2024-04-08', 'Possu', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kayttaja`
--
ALTER TABLE `kayttaja`
  ADD PRIMARY KEY (`nimimerkki`);

--
-- Indexes for table `kysymys`
--
ALTER TABLE `kysymys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nimimerkki` (`nimimerkki`);

--
-- Indexes for table `vastaus`
--
ALTER TABLE `vastaus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nimimerkki` (`nimimerkki`),
  ADD KEY `kysymys` (`kysymys`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kysymys`
--
ALTER TABLE `kysymys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vastaus`
--
ALTER TABLE `vastaus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kysymys`
--
ALTER TABLE `kysymys`
  ADD CONSTRAINT `kysymys_ibfk_1` FOREIGN KEY (`nimimerkki`) REFERENCES `kayttaja` (`nimimerkki`);

--
-- Constraints for table `vastaus`
--
ALTER TABLE `vastaus`
  ADD CONSTRAINT `vastaus_ibfk_1` FOREIGN KEY (`nimimerkki`) REFERENCES `kayttaja` (`nimimerkki`),
  ADD CONSTRAINT `vastaus_ibfk_2` FOREIGN KEY (`kysymys`) REFERENCES `kysymys` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
