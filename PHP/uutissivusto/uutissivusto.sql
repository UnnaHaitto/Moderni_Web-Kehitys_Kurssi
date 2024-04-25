-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 23.05.2016 klo 18:50
-- Palvelimen versio: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uutissivusto`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `blogi`
--

CREATE TABLE `blogi` (
  `blogi_id` int(11) NOT NULL,
  `nimi` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `kuvaus` text COLLATE utf8_swedish_ci NOT NULL,
  `kirjoittaja` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `blogi`
--

INSERT INTO `blogi` (`blogi_id`, `nimi`, `kuvaus`, `kirjoittaja`) VALUES
(1, 'Seikkailuni Narniassa', 'Matkakuvaus seikkailuistani Narniassa ja maailman äärissä.', 'Prinssi Kaspian'),
(2, 'Mikä-mikä-maa', 'Maa, jossa ei ikinä tarvitse kasvaa aikuiseksi. Seikkailuja joka nurkan takana. Mitä enempää voisi toivoa?', 'Tiikerililja');

-- --------------------------------------------------------

--
-- Rakenne taululle `blogikirjoitus`
--

CREATE TABLE `blogikirjoitus` (
  `kirjoitus_id` int(11) NOT NULL,
  `otsikko` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `teksti` text COLLATE utf8_swedish_ci NOT NULL,
  `julkaisuaika` datetime NOT NULL,
  `blogi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `blogikirjoitus`
--

INSERT INTO `blogikirjoitus` (`kirjoitus_id`, `otsikko`, `teksti`, `julkaisuaika`, `blogi_id`) VALUES
(1, 'Valkoinen noita', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam consequat rutrum blandit. Donec facilisis vel quam eget maximus. Cras sagittis, justo at imperdiet consectetur, augue erat convallis nibh, vitae ultrices lorem enim vehicula velit. Quisque aliquet vel eros dictum lacinia. Pellentesque accumsan tempor maximus. Nulla facilisi. Proin eget lectus nec velit facilisis suscipit. Aliquam sagittis, massa sed laoreet tristique, arcu neque vulputate arcu, nec blandit libero ligula nec libero.', '2016-04-14 14:02:00', 1),
(2, 'Merirosvoaarre!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam consequat rutrum blandit. Donec facilisis vel quam eget maximus. Cras sagittis, justo at imperdiet consectetur, augue erat convallis nibh, vitae ultrices lorem enim vehicula velit. Quisque aliquet vel eros dictum lacinia. Pellentesque accumsan tempor maximus. Nulla facilisi. Proin eget lectus nec velit facilisis suscipit. Aliquam sagittis, massa sed laoreet tristique, arcu neque vulputate arcu, nec blandit libero ligula nec libero.', '2016-05-10 12:36:00', 2),
(3, 'Retki merenneitojen laguuniin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam consequat rutrum blandit. Donec facilisis vel quam eget maximus. Cras sagittis, justo at imperdiet consectetur, augue erat convallis nibh, vitae ultrices lorem enim vehicula velit. Quisque aliquet vel eros dictum lacinia. Pellentesque accumsan tempor maximus. Nulla facilisi. Proin eget lectus nec velit facilisis suscipit. Aliquam sagittis, massa sed laoreet tristique, arcu neque vulputate arcu, nec blandit libero ligula nec libero.', '2016-04-04 17:18:00', 2);

-- --------------------------------------------------------

--
-- Rakenne taululle `saa`
--

CREATE TABLE `saa` (
  `id` int(11) NOT NULL,
  `vko` int(11) NOT NULL,
  `paiva` date NOT NULL,
  `saatila` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `lampotila` float NOT NULL,
  `tuulennopeus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `saa`
--

INSERT INTO `saa` (`id`, `vko`, `paiva`, `saatila`, `lampotila`, `tuulennopeus`) VALUES
(1, 20, '2016-05-19', 'aurinkoista', 25, 2),
(2, 20, '2016-05-20', 'aurinkoista', 22, 3),
(3, 20, '2016-05-21', 'puolipilvistä, paikoittain tuulista', 18, 10),
(4, 20, '2016-05-22', 'puolipilvistä, paikoittain tuulista', 17, 10),
(5, 21, '2016-05-23', 'pilvistä', 15, 6),
(6, 21, '2016-05-24', 'pilvistä', 15, 2),
(7, 21, '2016-05-25', 'aurinkoista', 23, 2),
(8, 21, '2016-05-26', 'aurinkoista', 26, 3),
(9, 21, '2016-05-27', 'aurinkoista', 26, 3),
(10, 21, '2016-05-28', 'aurinkoista', 25, 4),
(11, 21, '2016-05-29', 'puolipilvistä', 22, 4),
(12, 22, '2016-05-30', 'puolipilvistä', 21, 5);

-- --------------------------------------------------------

--
-- Rakenne taululle `uutiset`
--

CREATE TABLE `uutiset` (
  `uutinen_id` int(11) NOT NULL,
  `otsikko` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `julkaisuaika` datetime NOT NULL,
  `kirjoittaja` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `sisalto` text COLLATE utf8_swedish_ci NOT NULL,
  `paauutinen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Vedos taulusta `uutiset`
--

INSERT INTO `uutiset` (`uutinen_id`, `otsikko`, `julkaisuaika`, `kirjoittaja`, `sisalto`, `paauutinen`) VALUES
(1, 'Kaksi lasta eksyneet metsään', '2016-05-02 07:23:00', 'Grimm', 'Puunhakkaajan lapset, poika ja tyttö, ovat kadonneet metsään. Alueella kerrotaan kummia tarinoita, että jossakin metsän siimeksessä olisi sokerista ja leivonnaisista rakennettu talo.', 1),
(2, 'Vanhus katosi merelle', '2016-04-07 16:20:00', 'Carlo Collodi', 'Vanha puunkaivertajana työskennellyt mies katosi lähdettyään merelle pienellä veneellä etsimään poikaansa. Huhujen mukaan valas nielaisi hänet.', 0),
(3, 'Tuholaisongelma ratkaistu musiikin voimalla', '2016-05-11 18:42:00', 'Grimm', 'Kaupunkia pitkään piinanneet rotat on saatu vihdoinkin hävitettyä. Tämän ihmeteon takana on salaperäinen pillipiipari.', 0),
(4, 'Kansantarinoista lastensaduiksi', '2016-05-20 11:30:00', 'Kirjatoukka', 'Kaikkien nykyään tuntemat lastensadut, kuten Lumikki, Pieni Merenneito tai Punahilkka, eivät alkujaan olleet varsinaisesti "sopivia lapsille". Vuosien kuluessa niistä poistettiin liian raakoina pidettyjä piirteitä ja lopetuksia kirjoitettiin uusiksi.\r\n\r\nPienestä merenneidosta kaikki tuntevat luultavasti parhaiten Disneyn version. Pieni merenneito rakastuu pelastamaansa prinssiin, antaa äänensä vastineeksi ihmisen jaloista ja vaikeuksien kautta saa prinssin omakseen. Alkuperäisessä tarinassa...hän saa kyllä ihmisen jalat kävelläkseen ja tanssiakseen, mutta jokainen askel on kuin veitsillä kävelyä. Prinssi menee naimisiin toisen kanssa, ja pieni merenneito kuolee, muuttuen meren vaahdoksi.\r\n\r\nSankarit ja sankarittaret eivät myöskään ole läheskään aina jaloja ja kunniallisia. Herättyään myrkytetystä unestaan - ei tosin prinssin suudelman, vaan palvelijan kompastumisen takia - Lumikki kutsuu pahan kuningattaren häihinsä. Siellä tälle annetaan polttavan kuumat rautakengät, joissa hänen on tanssittava kunnes menehtyy.', 1),
(5, 'Kuninkaalliset häät: Lasikenkä yhdisti rakastavaiset', '2016-05-16 04:41:00', 'Grimm', 'Kuninkaallisissa tanssiaisissa prinssi tanssi koko illan tuntemattoman kaunottaren kanssa, joka katosi paikalta kertomatta kuka on. Jälkeensä hän jätti vain lasisen kengän.\r\n\r\nPitkällisen etsinnän jälkeen prinssi löysi vihdoin neidon, jolle kenkä sopii. Neidon kerrotaan olevan hyvästä perheestä, mutta kovin köyhässä asemassa, käytännössä palvelija.\r\n\r\nTästä huolimatta prinssi ja neito ovat menossa naimisiin, ja häistä povataan vuosisadan suurimpia. Kaikki merkittävät aateliset on kutsuttu. Parin tulevan lapsen nimeäkin arvuutellaan jo. Onko se kenties Noki?', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogi`
--
ALTER TABLE `blogi`
  ADD PRIMARY KEY (`blogi_id`);

--
-- Indexes for table `blogikirjoitus`
--
ALTER TABLE `blogikirjoitus`
  ADD PRIMARY KEY (`kirjoitus_id`),
  ADD KEY `blogi_id` (`blogi_id`);

--
-- Indexes for table `saa`
--
ALTER TABLE `saa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uutiset`
--
ALTER TABLE `uutiset`
  ADD PRIMARY KEY (`uutinen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogi`
--
ALTER TABLE `blogi`
  MODIFY `blogi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `blogikirjoitus`
--
ALTER TABLE `blogikirjoitus`
  MODIFY `kirjoitus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `saa`
--
ALTER TABLE `saa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `uutiset`
--
ALTER TABLE `uutiset`
  MODIFY `uutinen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
