-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 05:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(6) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `usertype` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `productype` varchar(30) NOT NULL,
  `gateway` varchar(30) NOT NULL,
  `netmask` varchar(30) NOT NULL,
  `dns` varchar(30) NOT NULL,
  `netwerk` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `finished` smallint(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `desc`, `productype`, `gateway`, `netmask`, `dns`, `netwerk`, `email`, `date`, `finished`, `username`) VALUES
(1, 'tetst', 'te', 'twe', 'wettew', 'tew', 'tew', 'DHCP', NULL, '2023-01-15 14:57:16', 0, NULL),
(2, 'tetst', 'te', 'twe', 'wettew', 'tew', 'tew', 'DHCP', NULL, '2023-01-15 14:57:23', 1, NULL),
(3, 'fsdafsdafdsafafdsaf', 'sa:fd:sa:fd:sw:af', 'fdsafdsa', 'fdsafdsa', 'fdsafdsafdas', 'fdsafsda', 'DHCP', NULL, '2023-01-15 16:01:04', 0, NULL),
(4, 'safdsafds', '', 'afdsafds', 'afdsafsdaf', 'sdafasdf', 'asfdsdfasd', 'DHCP', NULL, '2023-01-15 16:02:27', 0, NULL),
(5, 'sdafdsafsda', 'fsdafsdafdas', 'fsdafsdaf', 'safdsaf', 'fdasfds', 'sdafasdfsda', 'DHCP', NULL, '2023-01-15 16:02:45', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
