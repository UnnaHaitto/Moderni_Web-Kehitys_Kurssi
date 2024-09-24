-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01.06.2016 klo 07:16
-- Palvelimen versio: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kommentointisivusto`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `asiakirja`
--

CREATE TABLE `asiakirja` (
  `asiakirja_id` int(11) NOT NULL,
  `otsikko` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `teksti` text COLLATE utf8_swedish_ci NOT NULL,
  `pvm` date NOT NULL,
  `kirjoittaja` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `asiakirja`
--

INSERT INTO `asiakirja` (`asiakirja_id`, `otsikko`, `teksti`, `pvm`, `kirjoittaja`) VALUES
(1, 'Kannanotto peruskoulun kevätjuhlien ohjelmaan', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a ex felis. Suspendisse potenti. Etiam eu orci est. Mauris quis lorem erat. Vivamus a diam sed leo luctus mollis. Cras hendrerit finibus dolor, quis varius orci placerat non. Suspendisse mollis iaculis nisi in dignissim. Phasellus quis faucibus massa, ut sagittis mi. Phasellus efficitur massa ut commodo ultrices. Praesent rutrum ante quis nibh viverra vestibulum.\r\n\r\nProin vel dolor ligula. Ut hendrerit placerat justo a ullamcorper. Donec vel nunc odio. Vivamus quam justo, aliquam placerat rutrum ut, fringilla at mi. Aliquam erat volutpat. Cras euismod magna a lacinia auctor. Pellentesque sit amet nunc mollis augue tincidunt sagittis. Duis eu leo lobortis, feugiat eros et, finibus eros.\r\n\r\nMorbi dolor leo, suscipit eget condimentum nec, tempus in enim. Nunc pretium tincidunt magna, eget tincidunt ex auctor sodales. Curabitur nec molestie nunc. Ut ut augue in tellus sollicitudin aliquet. Sed mollis at diam vel varius. Duis eu gravida felis, sit amet suscipit ligula. Sed quis imperdiet massa, eget imperdiet risus. Ut consequat dapibus est non vehicula. Nam est purus, ultricies nec ullamcorper sed, tempor sit amet massa. In sed varius urna, a lacinia ex. Donec hendrerit tempus lorem vitae maximus. Donec vitae placerat magna, id ultricies enim. Vivamus id metus vulputate, egestas tortor commodo, lobortis lorem. Sed scelerisque leo vel suscipit sodales. Phasellus ullamcorper faucibus nisi ac pretium.\r\n\r\nEtiam ipsum justo, euismod eu turpis ut, suscipit egestas ligula. Nullam sit amet accumsan neque. Integer vel lacus a ipsum iaculis egestas in aliquet risus. Integer nisi enim, malesuada eget sem nec, fermentum luctus quam. Ut sed tellus ut diam auctor congue. Phasellus vitae scelerisque nisl. Cras eget eros vitae velit suscipit cursus sed eu sapien.', '2016-05-25', 'Kari Kriitikko');

-- --------------------------------------------------------

--
-- Rakenne taululle `kommentti`
--

CREATE TABLE `kommentti` (
  `kommentti_id` int(11) NOT NULL,
  `otsikko` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `teksti` text COLLATE utf8_swedish_ci NOT NULL,
  `pvm` date NOT NULL,
  `kommentoija` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `asiakirja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `kommentti`
--

INSERT INTO `kommentti` (`kommentti_id`, `otsikko`, `teksti`, `pvm`, `kommentoija`, `asiakirja_id`) VALUES
(1, 'Turhaa purnaamista', 'Olen eri mieltä aiheesta. Eikö jokaisen koulun henkilökunta voisi vain laatia mielestään sopivan ohjelman?', '2016-05-26', 'Kiia Kommentoija', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asiakirja`
--
ALTER TABLE `asiakirja`
  ADD PRIMARY KEY (`asiakirja_id`);

--
-- Indexes for table `kommentti`
--
ALTER TABLE `kommentti`
  ADD PRIMARY KEY (`kommentti_id`),
  ADD KEY `asiakirja_id` (`asiakirja_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asiakirja`
--
ALTER TABLE `asiakirja`
  MODIFY `asiakirja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kommentti`
--
ALTER TABLE `kommentti`
  MODIFY `kommentti_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
