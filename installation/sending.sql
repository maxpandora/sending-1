-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- name: 127.0.0.1
-- Gegenereerd op: 08 aug 2022 om 20:36
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sending`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

CREATE TABLE `product` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(17) NOT NULL,
  `productype` varchar(30) NOT NULL,
  `gateway` varchar(30) NOT NULL,
  `netmask` varchar(30) NOT NULL,
  `dns` varchar(30) NOT NULL,
  `netwerk` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `finished` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `productype`, `gateway`, `netmask`, `dns`, `netwerk`, `email`, `date`, `finished`) VALUES
(14, 'kaan-linux', 'test', '192.168.178.119', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'DHCP', NULL, '2022-08-07 19:38:42', 1),
(18, 'player', 'kasodksaopdkp', '192.168.178.110', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'Static', NULL, '2022-08-06 20:46:26', 0),
(19, 'kaan-linux', '-', '192.168.178.119', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'DHCP', NULL, '2022-07-26 23:45:39', 0),
(20, 'kaan-linux', '-', '192.168.178.119', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'DHCP', NULL, '2022-08-06 20:46:27', 0),
(22, 'kaan-linux', '-', '192.168.178.119', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'DHCP', NULL, '2022-08-05 22:43:50', 0),
(23, 'test', 'test', 'test', 'test', 'test', 'testr', 'DHCP', NULL, '2022-08-05 23:05:26', 0),
(24, 'kaan-linux', '-', '192.168.178.119', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'DHCP', NULL, '2022-08-06 00:09:34', 0),
(25, 'kaan-linux', '-', '192.168.178.119', '192.168.178.1', '255.255.255.0', '8.8.8.8 8.8.4.4', 'DHCP', NULL, '2022-08-06 20:46:18', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `login`
--

CREATE TABLE `login` (
  `id` int(6) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `email`) VALUES
(1, 'kaan', '4e3b3d2cfe8bf81bbe6e02b169fcf57a', 'kaanenveraydin@gmail.com'),
(9, 'test', '098f6bcd4621d373cade4e832627b4f6', '123@gmal.csa'),
(11, 'test', '7aaf808100a49463d144930b07b3df21', 'test@gmaIL.COM'),
(12, 'sadfdsaf', 'ff024173abcac25470928411cec961d1', 'fdsafda@dfsa'),
(13, 'dsafdasf', '4edab39d5783b6060f2ae46d78bdef6a', 'fdsafdsa@gmail.com'),
(14, 'asdasd', '6753a27847d7e4e3518b1837c2f0e716', '123123@dfsadsa.nl');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT voor een tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
