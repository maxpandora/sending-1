-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jul 04, 2023 at 11:25 AM
-- Server version: 5.7.42
-- PHP Version: 8.1.17

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
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pakket`
--

CREATE TABLE `pakket` (
  `id` int(6) UNSIGNED NOT NULL,
  `host` varchar(30) NOT NULL,
  `ether` varchar(17) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `gateway` varchar(30) NOT NULL,
  `netmask` varchar(30) NOT NULL,
  `dns` varchar(30) NOT NULL,
  `netwerk` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` smallint(1) DEFAULT '0',
  `userId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE `screens` (
  `id` int(10) UNSIGNED NOT NULL,
  `isDefault` tinyint(4) NOT NULL COMMENT 'Every client should have a default screen, used for default screen resolution',
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `isLandscape` int(11) NOT NULL COMMENT '0 = Portrait, 1 = Landscape',
  `rotation` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'normal, left, right',
  `sizeX` int(11) NOT NULL,
  `sizeY` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sshUsername` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sshPort` int(11) NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `sshPassword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sshMasterServerPort` int(11) DEFAULT NULL,
  `rootPath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokenId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenshotFileId` bigint(20) UNSIGNED DEFAULT NULL,
  `sshRsaKeyPath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `htmlOverlayId` bigint(20) UNSIGNED DEFAULT NULL,
  `isContentScalable` tinyint(4) NOT NULL DEFAULT '0',
  `syncEnabled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` bigint(20) UNSIGNED DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` timestamp NULL DEFAULT NULL,
  `roleId` int(10) UNSIGNED DEFAULT NULL,
  `settingId` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `masterId` int(10) UNSIGNED DEFAULT NULL,
  `showSiblingsContent` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'An access control flag for client users having access to other sibling users content',
  `showChildrenContent` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'An access control flag for master users having access to content of their client users',
  `showOnlyPresentationContent` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `firstName`, `lastName`, `avatar`, `lang`, `status`, `created`, `updated`, `expires`, `roleId`, `settingId`, `remember_token`, `masterId`, `showSiblingsContent`, `showChildrenContent`, `showOnlyPresentationContent`) VALUES
(1, 'chris@screenimpact.nl', 'showreel', '$2y$10$.mCicrLLV18tcWDZPYdinOMXqU1d87PRvfatm2UDjJgOywT5/B9xe', 'ScreenImpact', 'Showreel', NULL, 'nl', 1, '2017-03-24 15:34:27', '2022-09-12 10:51:27', NULL, 2, 5, '5hzPPgoffPUYTmQgzGLSImRL0m0TPQghLadI8jx2tJk2j7DrHmb5agqSWGaK', NULL, 1, 1, 0),
(2, 'marcella@hallenstudios.nl', 'hallenstudios', '$2y$10$psR1V.Ly5VKWJx.5YvM4kO.PblUDmt8NHqjgxEBbKRShwYXlM5kYu', 'Hallen', 'Studios', NULL, 'nl', 1, '2017-03-24 15:37:32', '2019-06-21 15:06:27', NULL, 2, 6, NULL, NULL, 1, 1, 0),
(4, 'info@dcwetering.nl', 'dcwetering', '$2y$10$HeBtXNOQGd.i/7N4AaEf5.5Mk6WDXgONd26mk6oiKCqD95S7S0rAe', 'Michelle', 'Milo', NULL, 'nl', 1, '2017-03-24 15:42:01', '2017-04-10 10:34:12', NULL, 2, 7, NULL, NULL, 1, 1, 0),
(5, 'info@screenimpact.nl', 'admin', '$2y$10$OjjXjdBiDRaCKjBr5o4NqeJvTzI29SQ3nmGrGk6m1uXHHH0caK7LG', 'Max', 'Miermans', NULL, 'en', 1, '2017-03-29 07:45:18', '2017-08-16 14:24:42', NULL, 1, 9, NULL, NULL, 1, 1, 0),
(6, 'roczuid@info.nl', 'roczuid', '$2y$10$Ip2PJpOCptn/hOkV8peuR.hdydnB9/qNjy392Wbn8RoxQm.ce7roi', 'ROC', 'Zuid', NULL, 'nl', 1, '2017-04-05 08:08:03', '2017-04-05 08:08:03', NULL, 2, 10, NULL, NULL, 1, 1, 0),
(7, 'max@pandoraproducties.nl', 'ozzadmin', '$2y$10$/gzxMdWDZgxqEsKPa429L.4xEUx1o.ZnW87Jia8Up5q97bxRUoJ12', 'Marketing', 'Zonnestraal', NULL, 'nl', 1, '2017-04-12 08:38:57', '2021-07-02 13:37:50', NULL, 2, 11, '8zpv4q3DPqarTdTJXFraWjQeSbcWfADk88228Ut0ptkLlP6eai1w2FNCTfJN', NULL, 1, 0, 0),
(8, 'verwijderen@screenimpact.nl', 'verwijderen_14', '$2y$10$CykNV2PRl.d9NWIzovDdZeuQIc4vMhwluXL9f9E9.9kBC3AdtmZRm', 'Verwijderen', '14', NULL, 'nl', 1, '2017-04-14 08:08:03', '2020-02-19 15:05:55', NULL, 4, 12, NULL, 7, 0, 1, 0),
(10, 'dermicisadmin@screenimpact.nl', 'dermicisadmin', '$2y$10$GhEkNFAcFS81Bfsl4e96fO/DFGfR.MvO.Cs.v7DLjgiBBHaD9dLVu', 'Dermicis', 'Admin', NULL, 'nl', 1, '2017-05-08 13:31:08', '2017-05-15 14:41:03', NULL, 2, 14, NULL, NULL, 1, 1, 0),
(11, 'dermicisalkmaar@screenimpact.nl', 'dermicisalkmaar', '$2y$10$gMcYJIn3iUDeE2j445ozqOLKxgBjIGaQXr1dqPz31QnNinsulbei6', 'Dermicis', 'Alkmaar', NULL, 'nl', 1, '2017-05-08 13:37:39', '2018-04-16 09:10:00', NULL, 4, 15, NULL, 10, 0, 1, 0),
(12, 'verwijderen@screenimpact.nl', 'verwijderen_21', '$2y$10$hXDzHgcFv20daOygySW98O7eFB9rSdB6j3qo5Tt4x5qhWXLu.W.dK', 'Verwijderen', '21', NULL, 'nl', 1, '2017-05-08 13:38:58', '2020-02-19 15:11:24', NULL, 4, 16, NULL, 10, 0, 1, 0),
(13, 'dermicisdoetinchem@screenimpact.nl', 'dermicisdoetinchem', '$2y$10$lbJC40SjOUnok78ep4xaZukSGoM12i6yGd6Cn.YHtrrGM1TJRdwQi', 'Dermicis', 'Doetinchem', NULL, 'nl', 1, '2017-05-15 12:21:31', '2018-08-23 09:32:32', NULL, 4, 17, NULL, 10, 0, 1, 0),
(14, 'jopenkerk@screenimpact.nl', 'jopenkerk', '$2y$10$IJ9QbhHesAmWNmO4vwougO3mxV5VvuYW6.cpJspEbxXqnggGrRO/S', 'Jopenkerk', 'Admin', NULL, 'nl', 1, '2017-05-22 10:20:56', '2017-05-22 10:20:56', NULL, 2, 18, NULL, NULL, 1, 1, 0),
(15, 'jopenkerkmenu@screenimpact.nl', 'jopenkerkmenu', '$2y$10$cDq5Tws4iXxtyZtE7ZM9NO/J/3VByM8DesG9M6Tzr6cq33SFM/uNO', 'Jopenkerk', 'Menu Client', NULL, 'nl', 1, '2017-05-22 10:22:16', '2017-05-22 10:22:16', NULL, 4, 19, NULL, 14, 1, 1, 0),
(16, 'ozzhaarlem@screenimpact.nl', 'ozzhaarlem', '$2y$10$vU6Yg0df/QgdBQtJlma03OM5iJ1yabd24Y7gSJQFedy9sELRwk2cW', 'OZZ', 'Haarlem', NULL, 'nl', 1, '2017-06-16 07:11:50', '2017-06-16 07:11:50', NULL, 4, 20, NULL, 7, 0, 1, 0),
(17, 'ozzzaandam@screenimpact.nl', 'ozzzaandam', '$2y$10$UnsYiHlRDBE2JnM.kkOvh.x5plr4xbsWAldYT6vH.bP7uCrhpSfoa', 'OZZ', 'Zaandam', NULL, 'nl', 1, '2017-06-16 07:13:08', '2017-06-16 07:13:08', NULL, 4, 21, NULL, 7, 1, 1, 0),
(18, 'venv@screenimpact.nl', 'venvadmin', '$2y$10$8TH8XvGJzT6ByHqbldicFeppgh5O65MCYthSssYpF9IkjEZ2BjGYm', 'V&V', 'Huisartsen', NULL, 'nl', 1, '2017-07-07 07:30:09', '2017-07-07 07:30:09', NULL, 2, 22, NULL, NULL, 1, 1, 0),
(19, 'bram@campingderoos.nl', 'campingderoos', '$2y$10$LKJ2DtW1ye4JtNYcmDgOSejbWb9pAoJEhju6.Py4QsGuAY01Gjd5u', 'Camping', 'de Roos', NULL, 'nl', 0, '2017-07-13 15:27:15', '2018-12-14 10:53:56', NULL, 2, 23, NULL, NULL, 1, 1, 0),
(20, 'digidact@screenimpact.nl', 'digidact_demo', '$2y$10$xJOaGW80z2E1ib0uyQu6Ze6wkWcdVPIJ/3KO64A979yEBYnTg6iJ2', 'Stichting', 'Digidact', NULL, 'nl', 1, '2017-07-19 12:47:42', '2019-07-10 12:45:50', NULL, 2, 24, NULL, NULL, 1, 0, 0),
(21, 'ozzamsterdam@screenimpact.nl', 'ozzamsterdam', '$2y$10$hqnBCwN0QCOl5DEoleI.cOZ.TsyyN6RW74am.TQTQ2gE9p7Yj6yi6', 'OZZ', 'Amsterdam', NULL, 'nl', 1, '2017-08-16 14:27:45', '2017-08-16 14:27:45', NULL, 4, 25, NULL, 7, 0, 1, 0),
(22, 'ozzdoetinchem@screenimpact.nl', 'ozzdoetinchem', '$2y$10$Fep7DrkW5CxxPsWJfKJpl.ZWx3zQoHOw3V.pTgnCJL.h9G1t6Gg2u', 'OZZ', 'Doetinchem', NULL, 'nl', 1, '2017-08-16 14:30:20', '2017-08-16 14:30:20', NULL, 4, 26, NULL, 7, 0, 1, 0),
(23, 'ozzhilversum@screenimpact.nl', 'ozzhilversum', '$2y$10$XR./qAydt0jv7Yr6dA.pCu/YLubK9gNADg6aYhtoERj5eY0L/wNq2', 'OZZ', 'Hilversum', NULL, 'nl', 1, '2017-08-16 14:32:49', '2017-08-18 08:05:22', NULL, 4, 27, NULL, 7, 0, 1, 0),
(24, 'k.vanhees@stadskanaal.nl', 'geertteis', '$2y$10$Ldg6AdPQB/KOixJgqW.vcONC1OLYaGlll//dlvnNuZBNJOjctqXJS', 'Theater', 'Geert Teis', NULL, 'nl', 0, '2017-08-30 10:11:06', '2019-12-02 08:54:26', NULL, 2, 28, NULL, NULL, 1, 1, 0),
(25, 'msmit@zaantheater.nl', 'zaantheater', '$2y$10$AbLY.pC87ax40qgv2MY/QeLS2lt1gkVI8nZFNCyFzvh5lFbZqInk2', 'Zaantheater', 'Administrator', NULL, 'nl', 1, '2017-09-18 09:40:11', '2017-10-31 11:52:09', NULL, 2, 29, NULL, NULL, 1, 1, 0),
(26, 'comm@screenimpact.nl', 'beeld en geluid den haag', '$2y$10$zfvlE.bQ.lVNamLkTq9B0eaLmYYBkd8QnTVhMywWz91MXjix3K0PW', 'Beeld En Geluid', 'Den Haag', NULL, 'nl', 1, '2017-09-27 12:54:19', '2020-05-20 09:01:30', NULL, 2, 30, NULL, NULL, 1, 1, 0),
(27, 'verwijderen@screenimpact.nl', 'verwijderen_16', '$2y$10$L4eQisrg5aNXAl0/1QcMQe/tQllPKfceJ26PJ9GZq4GNl8MK6/ToS', 'Verwijderen', '16', NULL, 'nl', 0, '2017-09-28 13:56:34', '2020-02-19 15:08:21', NULL, 2, 31, NULL, NULL, 1, 1, 0),
(28, 'geertteiskopie@screenimpact.nl', 'geertteiskopie', '$2y$10$IrOR5RNts.7kF.KH7zd36ertnhTnBkZW29VUoUVLZZK9Xp1DpgVTe', 'geertteiskopie', 'test', NULL, 'nl', 1, '2017-10-03 13:01:15', '2017-10-03 13:01:15', NULL, 2, 32, NULL, NULL, 1, 1, 0),
(31, 'chris@screenimpact.nl', 'demo_account', '$2y$10$cq/x/xtAhRg0xK8gVFRDPOEaIGljPL.T9nUeyKqKnCq5chdUPj2lS', 'ScreenImpact', 'Demo Account 2020', NULL, 'nl', 1, '2017-10-13 15:12:34', '2021-03-23 15:01:23', NULL, 2, 35, NULL, NULL, 1, 0, 0),
(32, 'verwijderen@screenimpact.nl', 'verwijderen_18', '$2y$10$M0gJUz5y5I9HQvxiBKCvj.ip0KAvXJMfa8bygVzgCDUIJv6ogoCcm', 'Verwijderen', '18', NULL, 'nl', 0, '2017-10-16 13:22:05', '2020-02-19 15:09:22', NULL, 2, 36, NULL, NULL, 1, 1, 0),
(33, 'ozzlelystad@screenimpact.nl', 'ozzlelystad', '$2y$10$9.Xlg78CiAd0sP581gXSXOwFroEMFlT4DnPC7oj68359mBY7IX8B.', 'OZZ', 'Lelystad', NULL, 'nl', 1, '2017-10-20 07:42:56', '2017-10-20 07:42:56', NULL, 4, 37, NULL, 7, 0, 1, 0),
(34, 'berkelmans@screenimpact.nl', 'berkelmans', '$2y$10$pDUdq8mvpmgIUw9F/API..hRH5awK/ySH1yxs2ak64k46sGKHscya', 'Berkelmans', 'Admin', NULL, 'nl', 1, '2017-10-23 09:56:44', '2017-10-23 09:56:44', NULL, 2, 38, NULL, NULL, 1, 1, 0),
(35, 'berkelmansclient@screenimpact.nl', 'berkelmansclient', '$2y$10$shj61b1SrvEYtZ0cHoTM9eK2vYt7dLaIfKifycGNZ5NyW1.9mpC46', 'Berkelmans', 'Client', NULL, 'nl', 1, '2017-10-24 09:18:53', '2017-10-24 09:18:53', NULL, 4, 39, NULL, 34, 1, 1, 0),
(36, 'ozzemmeloord@screenimpact.nl', 'ozzemmeloord', '$2y$10$H7rQs2DJ1K0UEZytZXFjVeJyY.GYmeCwq.E/QG4Ol86fFDyKYiVFG', 'OZZ', 'Emmeloord', NULL, 'nl', 1, '2017-11-07 16:05:48', '2017-11-07 16:05:48', NULL, 4, 40, NULL, 7, 0, 1, 0),
(37, 'ozzhoogeveen@screenimpact.nl', 'ozzhoogeveen', '$2y$10$qx5944sbBw5GZvArHZeGXejJxw78wNXpTrsxDB70H95soEspxYOKS', 'OZZ', 'Hoogeveen', NULL, 'nl', 1, '2017-11-07 16:12:08', '2017-11-07 16:12:08', NULL, 4, 41, NULL, 7, 0, 1, 0),
(38, 'voedselbankleiden@screenimpact.nl', 'voedselbankleiden', '$2y$10$XNhpinZM8ncUYwxf2W2KrecEofLbgz3HUzRZeY6P40rbKb4NUBB6m', 'Voedselbank', 'Leiden', NULL, 'nl', 0, '2017-11-28 16:07:21', '2022-04-11 15:18:15', NULL, 2, 42, NULL, NULL, 1, 1, 0),
(39, 'flint@screenimpact.nl', 'flint', '$2y$10$8Us2IZR00qCNVwMczq6RAOvMAIBlQ73NDhPs3q1bQoX8dHMQQUHLm', 'Theater', 'de Flint', NULL, 'nl', 1, '2017-11-28 17:21:11', '2017-12-01 09:01:36', NULL, 2, 43, NULL, NULL, 1, 1, 0),
(40, 'marketing@agora-lelystad.nl', 'agora', '$2y$10$cJZ8AkpFrz7ecachRZhDQOOwNHosLn2xu.j8HlDWo8OarOq.KxUty', 'Agora', 'Lelystad', NULL, 'nl', 0, '2017-12-12 08:19:10', '2022-10-14 11:19:18', NULL, 2, 44, '4CT3cQ64X366axHaQA5sJwHkeTDp7xEID8q0xCCtgEO9eL0Ss1l2WJrvc4t5', NULL, 1, 1, 0),
(41, 'info@dehallenstudios.nl', 'hallenstudios_portrait', '$2y$10$oFszHdYuhtNRyTG7ymhZOeaFEFumxAoFZBRQGG7rn9Mq8DUSc/yGW', 'Hallen Studio\'s', 'Portrait', NULL, 'nl', 1, '2017-12-13 13:45:43', '2019-05-15 03:46:52', NULL, 2, 45, 'XwqG1He7HwfqgDCGxvWJXH6hgx0x74aaWwAcLRBRj48zzYCtUmp1o86DlTzN', NULL, 1, 1, 0),
(42, 'Jildau@theater-haarlem.nl', 'philharmonie', '$2y$10$iRVW1ZIOi2uKeXXBHbdcuOPVk6dgQOGVb4jmoBmEGYJ82JSMMAaT6', 'Philharmonie', 'Haarlem', NULL, 'nl', 0, '2017-12-13 15:49:20', '2020-02-05 08:22:30', NULL, 2, 46, NULL, NULL, 1, 1, 0),
(43, 'tadslinger@screenimpact.nl', 'tadslinger_portrait', '$2y$10$/UlA430NOfb5rb5TJoxBWO4L0AdhnMD./HnqTOdwNqU2zMse.H2V6', 'Theater', 'aan de Slinger', NULL, 'nl', 1, '2017-12-13 16:01:39', '2019-09-27 07:49:50', NULL, 2, 47, NULL, NULL, 1, 1, 0),
(44, 'b.siekman@vu.nl', 'griffioen_portrait', '$2y$10$0H.100Ue4aD5cDLh/0VLsuQyi1iD4ZmhEBEy8r5YLtBbmDsVf2/7C', 'Cultuurcentrum', 'Griffioen', NULL, 'nl', 1, '2017-12-13 16:15:41', '2017-12-27 11:30:35', NULL, 2, 48, NULL, NULL, 1, 1, 0),
(45, 'publiciteit@lawei.nl', 'lawei', '$2y$10$Q5ooh/mBLabQVb0WpkJJzeY7AOfn0Pc3hMaY7E3kI6AuLBM3zkhP2', 'Schouwburg', 'De Lawei', NULL, 'nl', 1, '2017-12-13 16:27:58', '2018-11-23 09:35:20', NULL, 2, 49, NULL, NULL, 1, 1, 0),
(46, 'Jildau@screenimpact.nl', 'SSBHaarlem', '$2y$10$3zTPg7niqAWAhD5M.liMFOcVR9cKLwK3CtAfna5Gemr4N.bYzUsBC', 'Stadsschouwburg', 'Haarlem', NULL, 'nl', 0, '2017-12-14 09:05:28', '2020-02-05 08:22:11', NULL, 2, 50, NULL, NULL, 1, 1, 0),
(47, 'scopic@screenimpact.nl', 'scopic', '$2y$10$F26rrReJgLUDGuR3rD6zJesHyLNlLc8AizEqmm6MUfR2oOiby3Wp6', 'Scopic', 'Admin', NULL, 'en', 1, '2017-12-21 09:45:58', '2021-11-26 14:50:47', NULL, 2, 51, NULL, NULL, 1, 1, 0),
(48, 'amphion@screenimpact.nl', 'amphion_portrait', '$2y$10$8uCY8d2K1AvQdzI5avtMy.iz.Nl.LeteuelPjOCO7h8cuJi6HcgGS', 'Schouwburg', 'Amphion', NULL, 'nl', 1, '2017-12-22 11:21:55', '2018-01-10 07:59:18', NULL, 2, 52, NULL, NULL, 1, 1, 0),
(49, 'g.rikkers@theaterdestoep.nl', 'stoep_portrait', '$2y$10$D/5TRJvKLTUIeORdinTNketFuNYKmMi8BrVLW0seWSlpd.cLw0WCC', 'Theater', 'De Stoep', NULL, 'nl', 1, '2017-12-22 14:57:15', '2019-11-14 17:27:19', NULL, 2, 53, 'NvxfOufIZsei9zjcSu3RP7jlIR3aq2K7IaoB9chcxKTs3K7sYYSTxA9yqZoP', NULL, 1, 1, 0),
(50, 'g.rikkers@theaterdestoep.nl', 'stoep', '$2y$10$m9Nma/R/4AJBUSj5aOentuTLtxBXxOSIxoT0QdxZOj7qcsyGDcrzW', 'Theater', 'De Stoep', NULL, 'nl', 1, '2017-12-27 14:06:18', '2019-07-05 14:08:08', NULL, 2, 54, NULL, NULL, 1, 1, 0),
(51, 'verwijderen@screenimpact.nl', 'verwijderen_19', '$2y$10$tuaflE6lyvwG1nlK3ejBVuGSptROwDdD1Wu6gW3HCQqCmjl1/U6Ue', 'Verwijderen', '19', NULL, 'nl', 1, '2017-12-28 14:07:03', '2020-02-19 15:10:08', NULL, 2, 55, NULL, NULL, 1, 1, 0),
(52, 'verwijderen@screenimpact.nl', 'verwijderen_20', '$2y$10$hIH8iLqKynAZMj5tvkt9B./SWTQmDtz3Mb02APTDffyRcH1ix6kdS', 'Verwijderen', '20', NULL, 'nl', 1, '2017-12-28 14:08:35', '2020-02-19 15:10:51', NULL, 2, 56, NULL, NULL, 1, 1, 0),
(53, 'ellen@amphion.nl', 'amphion', '$2y$10$kPvGSkl.c1D5yagrbhzrouMlxehFtYSKCdfrnSInZAtmCXZ6nH/SS', 'Schouwburg', 'Amphion', NULL, 'nl', 1, '2018-01-04 13:45:19', '2018-01-10 07:59:34', NULL, 2, 57, NULL, NULL, 1, 1, 0),
(54, 'i.frie@depurmaryn.nl', 'purmaryn', '$2y$10$ioMwY4JLU2GCRyDTYeAxrOiH9OQpEaE.aRmQdllxDRJD3rY1CR/Qm', 'Theater', 'De Purmaryn', NULL, 'nl', 1, '2018-01-11 10:57:05', '2018-01-16 09:52:34', NULL, 2, 58, NULL, NULL, 1, 1, 0),
(55, 'purmaryn@screenimpact.nl', 'purmaryn_portrait', '$2y$10$RNVydnfesItIyG50V8LM2uMcD5Lk5lmz3hKPWpxnhFVZd.5APQOny', 'Purmaryn', 'Posters', NULL, 'nl', 1, '2018-01-11 13:08:54', '2018-01-11 14:02:43', NULL, 2, 59, NULL, NULL, 1, 1, 0),
(56, 'flint_portrait@screenimpact.nl', 'flint_portrait', '$2y$10$cfXGgNMpM.GMk31DBgzPFO27uCpHOJVsnIhEBKQbe1vx8uT7Qouju', 'Flint', 'Posters', NULL, 'nl', 1, '2018-01-15 09:49:28', '2018-01-15 09:49:28', NULL, 2, 60, NULL, NULL, 1, 1, 0),
(57, 'chris@screenimpact.nl', 'demo_portrait', '$2y$10$RYxPUHq6FM7B1RyvClzOQul8B0pdp1p5VXicjyBkbKgTKMcXJUdZu', 'ScreenImpact', 'Portrait Demo', NULL, 'nl', 1, '2018-01-15 16:20:42', '2021-03-23 15:01:32', NULL, 2, 61, NULL, NULL, 1, 0, 0),
(58, 'S.Oldenburg@ssbu.nl', 'ssbutrecht_portrait', '$2y$10$cJ9I.Zwlnl.4ReSOWOWhW.LQxyy7910EoIGRYbhcWlAup/ovX6WBO', 'Stadsschouwburg Utrecht', 'Posters', NULL, 'nl', 1, '2018-01-25 15:45:33', '2018-01-25 15:45:33', NULL, 2, 62, NULL, NULL, 1, 1, 0),
(59, 'chris@ntvf.nl', 'demo_hospitality', '$2y$10$X9iqgDNzhMwn9bZgb0sg8O.8yebweyIUHauQzEx0UUWav.6NqTfXq', 'Demo', 'Hospitality', NULL, 'nl', 1, '2018-01-25 15:56:48', '2021-05-20 09:28:02', NULL, 2, 63, NULL, NULL, 1, 1, 0),
(60, 'purmaryn_horeca@screenimpact.nl', 'purmaryn_horeca', '$2y$10$KpKhw8XYPytn0kkN5nHYLOApoT/yR.i9dG9qAHaSSloeeG0pO0ddm', 'Purmaryn', 'Horeca', NULL, 'nl', 1, '2018-01-25 16:11:31', '2018-01-25 16:11:31', NULL, 3, 64, NULL, 54, 1, 1, 0),
(61, 'purmaryn_host@screenimpact.nl', 'purmaryn_host', '$2y$10$iWWgagV7vpN.lul9DEKyeOGh3A4F3OGcFl5MYcHGJXlNuo11KYH0G', 'Purmaryn', 'Gastheer/Gastvrouw', NULL, 'nl', 1, '2018-01-25 16:13:53', '2018-01-25 16:24:51', NULL, 3, 65, NULL, 54, 1, 1, 0),
(62, 'm.dekker@ssbu.nl', 'ssbutrecht', '$2y$10$7aT6ucIRQIsLrMpRGi4SxOceDQhUfrHmvfY2Qi2xH14HtKYaSPC5q', 'Stadsschouwburg Utrecht', 'Presentaties', NULL, 'nl', 1, '2018-01-25 16:35:24', '2018-01-25 16:35:24', NULL, 2, 66, NULL, NULL, 1, 1, 0),
(63, 'eelke@hoogstins.nl', 'hoogstins', '$2y$10$mG8qAUSKs41xqbpZKcBn8.DjTt5PBCBDMCfpVFSKGCpTE3cgkWvW6', 'Boekhandel', 'Hoogstins', NULL, 'nl', 1, '2018-01-31 11:59:06', '2020-08-14 10:54:52', NULL, 2, 67, 'ib4zNQoQU847dphSfQHH1LizkB2Mu7kHWfuSclje9y68WH46C3U5qkVut0TF', NULL, 1, 1, 0),
(64, 'tomasdma@screenimpact.nl', 'TomasDMadmin', '$2y$10$wCPSMh1XnpWqSoD6UaVWGu0D2WK5vnbCavPOrECgmABLslKB1KOaW', 'Admin', 'DM', NULL, 'en', 1, '2018-02-05 10:18:19', '2018-02-12 10:01:53', NULL, 2, 68, NULL, NULL, 1, 1, 0),
(65, 'tomasdmc@screenimpact.nl', 'TomasDMclient', '$2y$10$2s5d6WoX4KTXR25Cf.BK5ezvFYDVs0G2/CatevLOhGGrIFZ5J7/au', 'Client', 'DM', NULL, 'nl', 1, '2018-02-05 10:19:32', '2018-02-05 10:19:32', NULL, 2, 69, NULL, NULL, 1, 1, 0),
(66, 'nligthart@meervaart.nl', 'meervaart', '$2y$10$IC/gVvWthxzyoZnpmIrukOEyljDwKO6zvyurpVZnWPovsgBbC9RwG', 'Theater', 'de Meervaart', NULL, 'nl', 1, '2018-02-08 13:31:44', '2022-04-12 11:24:13', NULL, 2, 70, NULL, NULL, 1, 1, 0),
(67, 'pr@meervaart.nl', 'meervaart_portrait', '$2y$10$4dhxKf1UbQPcCJeASCbz4ey5Y8ZnzoO/gTGVuQh1AGCjdxSFGc.Wq', 'Theater', 'de Meervaart portrait', NULL, 'nl', 1, '2018-02-08 13:32:49', '2018-02-12 09:54:55', NULL, 2, 71, NULL, NULL, 1, 1, 0),
(68, 'lvdplas@praktijkschonenberg.nl', 'schonenberg', '$2y$10$PMx1Z8AE1HzQvVJhwmYOhO0wgaR4Il/NPMsnnUTTqaunVLKHSFTPG', 'Praktijk', 'Schonenberg', NULL, 'nl', 0, '2018-02-12 09:52:27', '2021-06-02 14:25:08', NULL, 2, 72, NULL, NULL, 1, 1, 0),
(69, 'info@huisartsenroodenburg.nl', 'roodenburg', '$2y$10$0zdxeSG3G2VYy2QFGpuLKu6nQFliQdQoCEog7yJhJ6b0iHbnlwKiW', 'Huisartsenpraktijk', 'Roodenburg', NULL, 'nl', 1, '2018-02-12 16:43:18', '2018-12-07 08:14:26', NULL, 2, 73, NULL, NULL, 1, 1, 0),
(70, 'jurre.machielsen@hoenderdaal-fasteners.nl', 'hoenderdaal', '$2y$10$hrB3FuzFEqOL3mUg/hLunuSowvE18cArtvJM.o1qIGROoH4xdh54y', 'Hoenderdaal', 'Fasteners', NULL, 'nl', 1, '2018-02-13 15:45:56', '2018-02-13 15:45:56', NULL, 2, 74, NULL, NULL, 1, 1, 0),
(71, 't.van.empelen@hilverdadeboer.nl', 'hilverdadeboer', '$2y$10$VwnhU.K6drBPQpfO44/Rv.aHFa0OCqjZnROY/fc.mhLFjUgdAJnYC', 'Hilverda', 'de Boer', NULL, 'nl', 1, '2018-02-19 08:53:03', '2018-02-19 08:53:03', NULL, 2, 75, NULL, NULL, 1, 1, 0),
(72, 'hilverdamarketing@screenimpact.nl', 'hilverdamarketing', '$2y$10$K7kunq8jgZiaiSZNsZiupO2CAO1IIMva87.7vLTQHteO0Z26gXVy2', 'Hilverda', 'Marketing', NULL, 'nl', 1, '2018-02-26 11:06:02', '2020-04-09 11:45:07', NULL, 3, 76, NULL, 71, 1, 1, 0),
(73, 'hilverdaboxleiding@screenimpact.nl', 'hilverdaboxleiding', '$2y$10$yrDwgtn4DpCSBgyZUTaWFupS9dNgHQpidGyoCGDSS3bjT3A7Phq7G', 'Hilverda', 'Boxleiding', NULL, 'nl', 1, '2018-02-26 11:07:16', '2018-02-26 11:07:16', NULL, 3, 77, NULL, 71, 1, 1, 0),
(74, 'hilverdareceptie@screenimpact.nl', 'hilverdareceptie', '$2y$10$aiV5I2OuO5U4NqwLYmcyduBgfZ7LfoHlM4ktRs8FEP2Z6.sMzBYLe', 'Hilverda', 'Receptie', NULL, 'nl', 1, '2018-02-26 11:09:46', '2018-02-26 11:09:46', NULL, 3, 78, NULL, 71, 1, 1, 0),
(75, 'retail@screenimpact.nl', 'demo_retail', '$2y$10$xc8BBxub5tQpkZzU5PY9x.e7EiOJnKutbSNVFIyBam22AQgIzWVpK', 'Demo', 'Retail', NULL, 'nl', 1, '2018-02-27 12:44:48', '2021-05-20 09:24:23', NULL, 2, 79, NULL, NULL, 1, 1, 0),
(76, 'service@georgetweewielers.nl', 'george', '$2y$10$wPtHkXnuttJgJRLTysjBcuvDKAKAEyGqwp/5tg.C8JICyax9hGQ4y', 'George', 'Tweewielers', NULL, 'nl', 1, '2018-03-02 10:03:10', '2018-03-02 10:05:42', NULL, 2, 80, NULL, NULL, 1, 1, 0),
(77, 'info@georgetweewielers.nl', 'george_portrait', '$2y$10$nmbRAuxOdd/CONRfiTqEkeCRRzC2sVetUohWCN9dYGT3pfMGWJsem', 'George', 'Tweewielers Portrait', NULL, 'nl', 1, '2018-03-02 10:04:16', '2018-03-02 10:04:16', NULL, 2, 81, NULL, NULL, 1, 1, 0),
(78, 'centerparcs@screenimpact.nl', 'centerparcs_zandvoort', '$2y$10$owADG0nltNxsPK97UAu1r.pdP06EbnJpYr4H03CalB7AwTGCqLM/e', 'Centerparcs', 'Zandvoort', NULL, 'nl', 1, '2018-03-06 08:46:37', '2018-03-22 14:38:08', NULL, 2, 82, NULL, NULL, 1, 1, 0),
(79, 'hoge_veluwe@screenimpact.nl', 'hoge_veluwe', '$2y$10$YfFlGlgpAyFtumlvpybD6uppXLx7gtlO1cUJrAb37/oLpGBbrW1he', 'Het Nationale Park', 'De Hoge Veluwe', NULL, 'nl', 1, '2018-03-06 11:21:30', '2021-02-10 14:15:10', NULL, 2, 83, NULL, NULL, 1, 1, 0),
(80, 'linie@screenimpact.nl', 'linie', '$2y$10$vMdDR/hl5ngugDtw7SGZ0uJmLpylG5CpU1wVowIZZzeQzYoJB6sYm', 'Huisartsenpraktijk', 'De Linie', NULL, 'nl', 1, '2018-03-08 14:22:36', '2019-10-21 09:38:09', NULL, 2, 84, NULL, NULL, 1, 1, 0),
(81, 'saendelft@screenimpact.nl', 'saendelft', '$2y$10$WXEjsJb8h5m2VYQPe71hNuGX3ClApbkXX1xVX.aBcFnDCr7MRdVMS', 'Gezondheidscentrum', 'Saendelft', NULL, 'nl', 1, '2018-03-09 08:21:59', '2020-10-01 12:03:55', NULL, 2, 85, NULL, NULL, 1, 1, 0),
(82, 'giesbeek@screenimpact.nl', 'giesbeek', '$2y$10$D0iFzH2tfxcBQ47Dmh4ClehG8uOsWypQ8AZ7iz458usz81yLZPGru', 'HAP', 'Giesbeek', NULL, 'nl', 1, '2018-03-09 10:08:52', '2018-03-22 15:40:33', NULL, 2, 86, NULL, NULL, 1, 1, 0),
(83, 'rbtkan@screenimpact.nl', 'rbtkan', '$2y$10$61wK4elWbFxM6ZJyLtpXredkQSzGoVXMfFe7115BmQon52k22E.Ba', 'RBT', 'KAN', NULL, 'nl', 0, '2018-03-09 11:33:21', '2019-07-12 08:39:11', NULL, 2, 87, NULL, NULL, 1, 1, 0),
(84, 'hallen@screenimpact.nlde', 'dehallenpassage', '$2y$10$uW11ODFarQhk.ZRSryC34.NuxxoylyLztaEFwtA41JSG0Sw9/.1W2', 'De Hallen', 'Amsterdam', NULL, 'nl', 1, '2018-03-09 13:45:16', '2021-02-24 09:25:47', NULL, 2, 88, NULL, NULL, 1, 1, 0),
(85, 'verwijderen@screenimpact.nl', 'verwijderen_17', '$2y$10$lmO6EJkennB5TdhqR15x5OkH7.h2trrnUs0nCNmu3SoEoeAx2Pw2W', 'Verwijderen', '17', NULL, 'nl', 1, '2018-03-12 08:19:21', '2020-02-19 15:08:56', NULL, 2, 89, NULL, NULL, 1, 1, 0),
(86, 'avandeneijkel@nederlandsfotomuseum.nl', 'nederlands_fotomuseum', '$2y$10$75H36OwMwTGcEUrL17Z8ie7jNgZsCKNcc2LOMuawDeHL/2NClV8gG', 'Nederlands', 'Fotomuseum', NULL, 'nl', 1, '2018-03-12 12:46:07', '2018-03-12 12:46:07', NULL, 2, 90, NULL, NULL, 1, 1, 0),
(87, 'polette@screenimpact.nl', 'polette', '$2y$10$rpKfkLoo2cnmpjCWZmln2uFjBIn5hgL2kkb/Gr0UH1QMQYnV42tC.', 'Polette', 'Amsterdam/Utrecht', NULL, 'nl', 1, '2018-03-12 13:32:57', '2018-03-12 14:47:32', NULL, 2, 91, NULL, NULL, 1, 1, 0),
(88, 'purple@screenimpact.nl', 'purple', '$2y$10$Nl6d5lCk8FWr7aiC/V0x0eYB2gN0ktWiT1xoUUSVzL3XK/jO8D2L2', 'Purple', 'Media', NULL, 'nl', 1, '2018-03-12 14:54:50', '2020-08-26 07:21:51', NULL, 2, 92, NULL, NULL, 1, 1, 0),
(89, 'stedelijk@screenimpact.nl', 'stedelijk', '$2y$10$aIX7bUmFdKo9qbriqZBr3OuKXR7meBdmEQwjj6XrgLdk/8jK7oEfu', 'Stedelijk Museum', 'Amsterdam', NULL, 'nl', 1, '2018-03-12 15:14:22', '2018-03-13 09:12:34', NULL, 2, 93, NULL, NULL, 1, 1, 0),
(92, 'toneelschuur@screenimpact.nl', 'toneelschuur', '$2y$10$sSybXZrW.PlxmjXhheJA0O5zdCJxb5K.vhKb4py6bHA4lXRcSIdUC', 'Theater', 'De Toneelschuur', NULL, 'en', 1, '2018-03-13 10:07:48', '2018-04-16 12:24:44', NULL, 2, 96, NULL, NULL, 1, 1, 0),
(93, 'munt@screenimpact.nl', 'munttheater', '$2y$10$1omKTQjnjy1yTQVYQMiLHuWD2PW.Yg4MQIFQdL942aHe4NCgVLO7u', 'Munt', 'Theater', NULL, 'nl', 0, '2018-03-13 13:53:01', '2020-06-02 10:19:59', NULL, 2, 97, NULL, NULL, 1, 1, 0),
(94, 'munt_portrait@screenimpact.nl', 'munttheater_portrait', '$2y$10$4Q.2Jyl2F.StnINXxClYeeWgHijNJdr/aTUhsITX/yCXedaw94Kmm', 'Munt', 'Theater', NULL, 'nl', 0, '2018-03-13 13:55:59', '2020-06-02 10:19:41', NULL, 2, 98, NULL, NULL, 1, 1, 0),
(95, 'h.veneklaas@schouwburgcuijk.nl', 'schouwburg_cuijk', '$2y$10$iHKJXVVQ84EOpvABuBvr/O.dRMLdzGGhW2.R3062s2asXZBBMMpnS', 'Schouwburg', 'Cuijk', NULL, 'nl', 1, '2018-03-14 09:15:58', '2022-02-15 16:06:16', NULL, 2, 99, NULL, NULL, 1, 1, 0),
(96, 'h.veneklaas@schouwburgcuijk.nl', 'schouwburg_cuijk_portrait', '$2y$10$C./IlZtz1zsjQ/zfBcuZ9eOUE0AgbXsMMzazMdw3SF6ErBPG6MMU6', 'Schouwburg', 'Cuijk', NULL, 'nl', 1, '2018-03-14 09:19:07', '2022-02-15 16:14:16', NULL, 2, 100, NULL, NULL, 1, 1, 0),
(97, 'kampanje@screenimpact.nl', 'kampanje', '$2y$10$ggEiVBYkWax/UGZrK/lWReEu0ZhezAOE6tV7nEAOsxhHnfOvZ1jaK', 'Schouwburg', 'De Kampanje', NULL, 'nl', 1, '2018-03-14 11:32:47', '2019-01-16 16:02:22', NULL, 2, 101, NULL, NULL, 1, 1, 0),
(98, 'kampanje_portrait@screenimpact.nl', 'kampanje_portrait', '$2y$10$Ib/l4tZPDGuje7Th6fklzOPb4UEgkRlppf4P/olL3IlBkowRG8CP2', 'Schouwburg', 'De Kampanje', NULL, 'nl', 1, '2018-03-14 11:42:03', '2019-01-09 16:22:31', NULL, 2, 102, NULL, NULL, 1, 1, 0),
(100, 'chvnoordkade@screenimpact.nl', 'demo_veghel', '$2y$10$2IvQODpCE10rclGywJVZMOH3jdWD34WBGFSP/Dh8aYpR1ADTvPxUO', 'CHV', 'Noordkade', NULL, 'nl', 1, '2018-03-15 13:08:34', '2021-03-23 15:01:51', NULL, 2, 104, NULL, NULL, 1, 1, 0),
(101, 'het_park@screenimpact.nl', 'het_park', '$2y$10$KIlvyBUVkB7uQJw1jhfmne1/.zC4VJwmgFnJunsQwSSsMnYD.w4uq', 'Schouwburg', 'Het Park', NULL, 'nl', 1, '2018-03-19 08:44:09', '2021-01-04 09:27:19', NULL, 2, 105, NULL, NULL, 1, 1, 0),
(102, 'de_vest@screenimpact.nl', 'de_vest', '$2y$10$kwx8oe5CB403YIxQevoL1OacDGfgwKht2tGwdEHiRKkNRwqbK2mgC', 'Theater', 'De Vest', NULL, 'nl', 1, '2018-03-19 12:49:33', '2019-11-25 15:47:49', NULL, 2, 106, NULL, NULL, 1, 1, 0),
(103, 'marc@ntvf.nl', 'marc', '$2y$10$VHqUdxXL4FMBa5MzDiUqwu8y8bkqYSR8mvZWGS.w/OsEqcYqUpatu', 'Marc', 'Nelissen', NULL, 'nl', 1, '2018-03-21 13:47:32', '2019-11-11 13:49:06', NULL, 2, 107, NULL, NULL, 1, 1, 0),
(104, 'max@ntvf.nl', 'marc_portrait', '$2y$10$e8M/qcLvvqm8b88D4vsDF.BpQ7XywtT3hyJR3JuYsS8vPpiaprCxW', 'Marc', 'Nelissen Portrait', NULL, 'en', 1, '2018-03-21 13:50:14', '2022-01-28 09:02:22', NULL, 2, 108, NULL, NULL, 1, 1, 0),
(105, 'hoogstraat@screenimpact.nl', 'hoogstraat', '$2y$10$YcMUsYArnA.UGmaTXVAHseaaUzvvstHOrtk9OxfBJOAefmx34EdIq', 'De Hoogstraat', 'Revalidatie', NULL, 'nl', 1, '2018-03-22 11:12:12', '2020-09-04 12:05:08', NULL, 2, 109, NULL, NULL, 1, 0, 0),
(106, 'universeel@screenimpact.nl', 'demo_universeel', '$2y$10$enN8GyPNEaomeAMZjIfMPuHNKnTamnzDZ3Y0Lg8jTF4L5OWlkCYxO', 'Demo', 'Universeel', NULL, 'nl', 1, '2018-03-22 13:39:08', '2021-03-23 15:01:57', NULL, 2, 110, NULL, NULL, 1, 1, 0),
(107, 'theater_speelhuis@screenimpact.nl', 'theater_speelhuis', '$2y$10$avc.4gwqExCN9KCZYoSNy.muci7uk0bCt3yV.s3L2s/axrYbL0UEO', 'Theater', 'Speelhuis', NULL, 'nl', 1, '2018-03-23 10:23:06', '2019-09-26 10:24:12', NULL, 2, 111, NULL, NULL, 1, 1, 0),
(108, 'theater_speelhuis_portrait@screenimpact.nl', 'theater_speelhuis_portrait', '$2y$10$NNhbSe3sOI2yWUok45Qexe2cY3PyFDmkhlZ8/23DO35jbp8EPjMve', 'Theater', 'Speelhuis', NULL, 'nl', 1, '2018-03-23 10:26:12', '2018-05-22 10:51:38', NULL, 2, 112, NULL, NULL, 1, 1, 0),
(109, 'lampegiet@screenimpact.nl', 'lampegiet', '$2y$10$uAAXq5NRwuD98CZbLuIbW.1JC3TbwV6Ssykj2BVZ4N9eJj5Y0zz0y', 'Theater', 'De Lampegiet', NULL, 'nl', 1, '2018-03-23 16:06:32', '2020-11-11 09:13:00', NULL, 2, 113, NULL, NULL, 1, 1, 0),
(110, 'lampegiet_portrait@screenimpact.nl', 'lampegiet_portrait', '$2y$10$uVD9bs2cO.W/.OkfHbRKWegRgK2W2BN.esh9gMU5CZ.2CHhgzxKjO', 'Theater', 'De Lampegiet', NULL, 'nl', 1, '2018-03-23 16:10:23', '2020-11-11 09:14:31', NULL, 2, 114, NULL, NULL, 1, 1, 0),
(111, 'schalm@screenimpact.nl', 'schalm', '$2y$10$TMgKSXhSZrYbj0XvAXaCYuTnvELuIgewrEWvUZRpIgLMm0bzFumbu', 'Theater', 'De Schalm', NULL, 'nl', 1, '2018-03-26 13:11:23', '2022-05-03 09:29:56', NULL, 2, 115, NULL, NULL, 1, 1, 0),
(112, 'schalm_portrait@screenimpact.nl', 'schalm_portrait', '$2y$10$DwxHq2S6AMGKg9Ad75rEs./8hqpClnlhDxggF6RJyJCYNRRpldgP6', 'Theater', 'De Schalm', NULL, 'nl', 1, '2018-03-26 13:14:23', '2018-03-27 15:28:51', NULL, 2, 116, NULL, NULL, 1, 1, 0),
(113, 'stopera@screenimpact.nl', 'demo_stopera', '$2y$10$cUBN4olhB46tMf2YEZ0OgOyVrS5UrXDOsh7Q8bhfz99FpiCpsrs5a', 'Stopera', 'Admin', NULL, 'nl', 1, '2018-03-28 11:36:46', '2021-03-23 15:02:03', NULL, 2, 117, NULL, NULL, 1, 1, 0),
(114, 'stopera_portrait@screenimpact.nl', 'demo_stopera_portrait', '$2y$10$gcLHxPpLqWQ1zWhVsGVJIORXDLF2.H8jUwpZC6Jlm8Gh8tFG4AjW2', 'Stopera', 'Admin', NULL, 'nl', 1, '2018-03-28 11:38:56', '2021-03-23 15:02:09', NULL, 2, 118, NULL, NULL, 1, 1, 0),
(115, 'onderwijs@screenimpact.nl', 'demo_onderwijs', '$2y$10$PSJQOb5TbxXpvkYkzDspeOZ9F62nFVKikIjlQ.aGAAWSjkX0VdIgO', 'Demo', 'Onderwijs', NULL, 'nl', 1, '2018-03-28 11:44:01', '2021-03-23 15:02:16', NULL, 2, 119, NULL, NULL, 1, 0, 0),
(116, 'nemo@screenimpact.nl', 'nemo', '$2y$10$fH0Yw6OnsrDpO2jZUna24O0V.HNF/OJs.AtcS3Z2wOGvOdPjW4pR6', 'Nemo', 'Science Center', NULL, 'en', 1, '2018-04-03 07:43:30', '2018-04-03 07:43:30', NULL, 2, 120, NULL, NULL, 1, 1, 0),
(117, 'nemo_portrait@screenimpact.nl', 'nemo_portrait', '$2y$10$panQXvTBk0T5Ak7Tfga8..bKQet.4yvVRj4qSNoyjep90n.u1m0dq', 'Nemo', 'Science Center', NULL, 'en', 1, '2018-04-03 07:47:28', '2018-04-03 07:47:28', NULL, 2, 121, NULL, NULL, 1, 1, 0),
(118, 'verwijderen@screenimpact.nl', 'verwijderen_24', '$2y$10$9WwwTh3SgSHyarQ0JSJe6OnoQ82a0y4FnGk2RNDZcGZnRZhSIEsvG', 'Verwijderen', '24', NULL, 'nl', 1, '2018-04-09 15:00:18', '2020-02-26 09:48:28', NULL, 2, 122, NULL, NULL, 1, 1, 0),
(119, 'arno@veluwevakantieparken.nl', 'veluwevakantieparken', '$2y$10$oHDU5MMpk1w8hGWeSrPpR.hoC0.7zrkBz5qF9RC53PSctDVdXF9lO', 'Veluwe', 'Vakantieparken', NULL, 'nl', 1, '2018-04-25 14:16:13', '2018-04-25 14:16:13', NULL, 2, 123, NULL, NULL, 1, 1, 0),
(120, 'chris@screenimpact.nl', 'demo_account_portrait', '$2y$10$sbXmNQTgx/S48lTBOQIJpuzOX/6GweL9RJCeO7tky0sADWtCXYMRa', 'ScreenImpact', 'Demo Account Portrait 2020', NULL, 'nl', 1, '2018-05-01 09:37:58', '2021-03-23 15:02:40', NULL, 2, 124, NULL, NULL, 1, 1, 0),
(121, 'msmit@zaantheater.nl', 'zaantheater_portrait', '$2y$10$.kbjWqmZaXbK5xplMM2HCOdAJXmVcdy50iX1EM23glVYgjnA1HR5K', 'Zaantheater', 'Portrait', NULL, 'nl', 1, '2018-05-03 09:17:06', '2018-05-03 09:17:06', NULL, 2, 125, NULL, NULL, 1, 1, 0),
(122, 'carre@screenimpact.nl', 'demo_carre', '$2y$10$ZgO6USjtK8/VryBzZSljQ.b4KeeRgLaijw2aGu8ki.Sax..mJeqk6', 'Demo', 'Carré', NULL, 'nl', 1, '2018-05-08 15:03:35', '2021-03-23 15:02:45', NULL, 2, 126, NULL, NULL, 1, 1, 0),
(123, 'carre@screenimpact.nl', 'demo_carre_portrait', '$2y$10$M47LmD2WolR6Rg2fRAqhHeBBnZ34lHs5K4JjATM7MqWB1qZZrrz/S', 'Demo', 'Carré', NULL, 'nl', 1, '2018-05-08 15:05:49', '2021-03-23 15:02:51', NULL, 2, 127, NULL, NULL, 1, 1, 0),
(124, 'hanzehof@screenimpact.nl', 'hanzehof', '$2y$10$SQbPIP2BmXWjY0kdTthn2elpLf25XRn9hRb2G.T.zyoZkWG0MOyC.', 'Theater', 'Hanzehof', NULL, 'nl', 1, '2018-05-11 08:07:16', '2018-05-11 08:07:16', NULL, 2, 128, NULL, NULL, 1, 1, 0),
(125, 'demomedisch@screenimpact.nl', 'demo_medisch', '$2y$10$jhBgnIWdagXsPhLTuaiAiOk4qor3.wVKCd8JOSshqzYFWNuefHq6u', 'Demo', 'Medisch', NULL, 'nl', 1, '2018-06-01 14:00:56', '2022-04-07 12:57:51', NULL, 2, 129, NULL, NULL, 1, 1, 0),
(126, 'dehagen@screenimpact.nl', 'dehagen', '$2y$10$FfuQsd.rr9qsRWqxY6YrXe/lvkISwfTui9HxigZDifiWzm3JSqPIW', 'Demo', 'De Hagen', NULL, 'nl', 0, '2018-06-04 14:32:41', '2022-08-10 09:08:23', NULL, 2, 130, NULL, NULL, 1, 1, 0),
(127, 'test9@screenimpact.nl', 'permission_test', '$2y$10$RiXduQwgo2W/1qkbWOPSHObOz39mIhN/.bDtD/vsRr0jRhTflnxHy', 'Test', 'Permissions', NULL, 'nl', 1, '2018-06-15 07:25:00', '2018-06-15 07:25:00', NULL, 2, 131, NULL, NULL, 1, 1, 0),
(128, 'permission_test2@screenimpact.nl', 'permission_test2', '$2y$10$DyN8fsP0vPFfzEPrCpbH5ulgJ4DEhOBhDKy.nvWH88GvEPAH8ejqu', 'Test', 'Permissions', NULL, 'nl', 1, '2018-06-15 08:05:46', '2018-06-15 08:05:46', NULL, 2, 132, NULL, NULL, 1, 1, 0),
(129, 'laplace@screenimpact.nl', 'demo_laplace', '$2y$10$TPkgn.u2MUyt3X6Rz2XjF.NEyQUwpTL/FLyq9yJMmV3Mp75O9y6ay', 'Demo', 'La Place', NULL, 'nl', 1, '2018-06-19 07:37:19', '2021-03-23 15:03:01', NULL, 2, 133, NULL, NULL, 1, 0, 0),
(130, 'laplace@screenimpact.nl', 'demo_laplace_portrait', '$2y$10$qD49tFiE3lehET9L6jSPzOxUNt3ozA6WqdjSwzhkMAQZatziIhkTG', 'Demo', 'La Place', NULL, 'nl', 1, '2018-06-19 07:38:24', '2021-03-23 15:03:05', NULL, 2, 134, NULL, NULL, 1, 1, 0),
(131, 'verwijderen@screenimpact.nl', 'verwijderen_23', '$2y$10$6Xk9vh3.ivFxyddCTZa9N.3mRPvEXoG8s8D9zD6tzK6TpdRQCZqR2', 'Verwijderen', '23', NULL, 'nl', 1, '2018-06-20 10:06:54', '2020-02-19 16:09:20', NULL, 2, 135, NULL, NULL, 1, 1, 0),
(132, 'laplace@screenimpact.nl', 'demo_laplace_client', '$2y$10$vKc1VUbISFtKahnSYXJBUuMqMSqwh8qhfzyxOjeh1qoZkaldsX3di', 'La Place', 'Schiphol', NULL, 'nl', 1, '2018-06-22 09:56:56', '2021-03-23 15:03:12', NULL, 4, 136, NULL, 129, 0, 1, 0),
(133, 'kennemertheater@screenimpact.nl', 'kennemertheater', '$2y$10$LCUFOUfuoxP5Jzct4sEqueznCHSp/7koZNkUPJ21r4LbuPKXOuifm', 'Kennemer', 'Theater', NULL, 'nl', 1, '2018-06-26 11:30:54', '2018-10-04 11:22:09', NULL, 2, 137, NULL, NULL, 1, 1, 0),
(134, 'kennemertheater@screenimpact.nl', 'kennemertheater_portrait', '$2y$10$YuGlG5WXM95jg4P4x2om7./qN0INpVjGz4K5OM7FDa/WvZ.VrNHOq', 'Kennemer', 'Theater', NULL, 'nl', 1, '2018-06-26 11:31:58', '2018-10-04 11:22:29', NULL, 2, 138, NULL, NULL, 1, 1, 0),
(135, 'onderwijs@screenimpact.nl', 'demo_onderwijs_client', '$2y$10$Ulsn8w3j/d2wXkhetcOZ7.Y1ISzek6MgsAGJVjED275LlojRgNJUy', 'Demo', 'Onderwijs Portrait', NULL, 'nl', 1, '2018-07-06 08:03:55', '2021-03-23 15:03:19', NULL, 4, 139, NULL, 115, 0, 1, 0),
(136, 'laplace@screenimpact.nl', 'demo_laplace_client2', '$2y$10$V4OBZMlqXE3DPbg6H8ThlOAUGAB6sKLHObFEkdD1zGXoglKnf3eg2', 'La Place ', 'Utrecht CS', NULL, 'nl', 1, '2018-07-13 14:33:31', '2021-03-23 15:03:25', NULL, 4, 140, NULL, 129, 0, 1, 0),
(137, 'vandal@screenimpact.nl', 'demo_vandal', '$2y$10$K3mscSqxtjP/m1JgApL8SuOoiosa9GihGidqvjl/hI8g0R.8/T9bq', 'Van Dal', 'admin', NULL, 'nl', 1, '2018-07-23 21:31:35', '2021-03-23 15:03:30', NULL, 2, 141, NULL, NULL, 1, 0, 0),
(138, 'vandal@screenimpact.nl', 'demo_vandal_client1', '$2y$10$q52SzMTJOz6NUiW.mzJYC.8sVWIa9wb/rEQY5V/L5g11H0COkB0py', 'Van Dal', 'Utrecht', NULL, 'nl', 1, '2018-07-23 21:33:29', '2021-03-23 15:03:53', NULL, 4, 142, NULL, 137, 0, 1, 0),
(139, 'vandal@screenimpact.nl', 'demo_vandal_client2', '$2y$10$pbPOTIUP64J2F7I2GsnYTOD.v5/nOiM9fbfqec.rV1mBjfMpiw7Re', 'Van Dal', 'Eindhoven', NULL, 'nl', 1, '2018-07-23 21:39:18', '2021-03-23 15:03:58', NULL, 4, 143, NULL, 137, 0, 1, 0),
(140, 'vandal@screenimpact.nl', 'demo_vandal_portrait', '$2y$10$tgWyF4qDr2N9KuS2vb7jb.4wR2Z/J.0qPiBISpA3ZraKRBFu0msWu', 'Van Dal', 'Portrait', NULL, 'nl', 1, '2018-07-23 21:56:11', '2021-03-23 15:04:03', NULL, 2, 144, NULL, NULL, 1, 1, 0),
(141, 'vandal@screenimpact.nl', 'demo_vandal_client3', '$2y$10$TvwLFysxL8/sBvwAbwpTV.hIxISx.0mCWSlgWlfccjEyvYqFugJ9q', 'Van Dal', 'Arnhem', NULL, 'nl', 1, '2018-07-23 22:03:56', '2021-03-23 15:04:09', NULL, 4, 145, NULL, 140, 0, 1, 0),
(142, 'vandal@screenimpact.nl', 'demo_vandal_client4', '$2y$10$nFWWOPjrIAJrQK6V9uZpHuNwXTjuWFb8Na.Iolu2Recikh93S8JVu', 'Van Dal', 'Breda', NULL, 'nl', 1, '2018-07-23 22:05:15', '2021-03-23 15:04:15', NULL, 4, 146, NULL, 140, 0, 1, 0),
(143, 'dermicisadmin@screenimpact.nl', 'dermicisenschede', '$2y$10$xLsP2FEk6ImtfHOHqED7Nu6rzY8o4RSjgIfoGHcQfxeHs37bjKIqC', 'Dermicis', 'Enschede', NULL, 'nl', 1, '2018-07-31 11:44:58', '2018-08-06 13:06:16', NULL, 4, 147, NULL, 10, 0, 1, 0),
(144, 'verwijderen@screenimpact.nl', 'verwijderen_04', '$2y$10$oiz1lTKalE4boW/SlKK8.uG2XQ6dQkxldxeK7ROhnu68dG3jJy8DW', 'Verwijderen', '04', NULL, 'nl', 1, '2018-08-22 12:26:13', '2020-02-19 11:49:58', NULL, 2, 148, NULL, NULL, 1, 1, 0),
(145, 'koninklijkeschouwburg@screenimpact.nl', 'koninklijkeschouwburg', '$2y$10$.7mXeLa6RhRiHkDCD2MtseqS.aLy6KJXsILliOBN7ipsi6g/ElweK', 'Koninklijke', 'Schouwburg', NULL, 'nl', 1, '2018-08-22 12:27:29', '2019-05-06 12:44:35', NULL, 2, 149, NULL, NULL, 1, 1, 0),
(146, 'verwijderen@screenimpact.nl', 'verwijderen_06', '$2y$10$Lp8FBD9Yl2jM8g3TUneFbu1QnBJi4xwaSdMUwcgAGRyeTJx3dIDii', 'Verwijderen', '06', NULL, 'nl', 1, '2018-08-22 12:28:42', '2020-02-19 11:51:18', NULL, 2, 150, NULL, NULL, 1, 1, 0),
(147, 'verwijderen@screenimpact.nl', 'verwijderen_03', '$2y$10$Wc8u.CwA1e4gJl.r2sPvsO.oCYZkITG8uwqUFg.bDIyWzqu.MzYie', 'Verwijderen', '03', NULL, 'nl', 1, '2018-08-22 12:46:38', '2020-02-19 11:47:51', NULL, 2, 151, NULL, NULL, 1, 1, 0),
(148, 'koninklijkeschouwburg@screenimpact.nl', 'koninklijkeschouwburg_portrait', '$2y$10$HNF35IrH/ZRZkjHE7kq.g.1nr.7lQ03L8gtNzFxOV9mZmvgqsC/dm', 'Koninklijke', 'Schouwburg Posters', NULL, 'nl', 1, '2018-08-22 12:48:15', '2019-05-06 13:08:14', NULL, 2, 152, NULL, NULL, 1, 1, 0),
(149, 'verwijderen@screenimpact.nl', 'verwijderen_05', '$2y$10$46C8QJqBdJWysMaOgNqDzeusJb0/7tlFgmkyHFe0DqChmXRNoelkm', 'Verwijderen', '05', NULL, 'nl', 1, '2018-08-22 12:49:53', '2020-02-19 11:50:40', NULL, 2, 153, NULL, NULL, 1, 1, 0),
(151, 'verwijderen@screenimpact.nl', 'verwijderen_22', '$2y$10$sVOILwH5TW.ss1zB7.y09urcrl39j91EuO6z9oBACcWavKi6H9SI2', 'Verwijderen', '22', NULL, 'nl', 1, '2018-08-27 14:18:56', '2020-02-19 15:41:30', NULL, 2, 155, NULL, NULL, 1, 1, 0),
(152, 'verwijderen@screenimpact.nl', 'verwijderen_09', '$2y$10$k5p7yoHAh4asxBufwnOUpeIG2aKkvbGl4FaxX8pWyGi4bsY0aBGBq', 'Verwijderen', '09', NULL, 'nl', 1, '2018-08-29 08:16:48', '2020-02-19 13:16:54', NULL, 2, 156, NULL, NULL, 1, 1, 0),
(153, 'spaarne@screenimpact.nl', 'demo_spaarne', '$2y$10$5f38Cmny43Y9SZhoXYrWJeErW76NPhV56ouW0sAuClVQki4fTMKCK', 'Spaarne Gasthuis', 'Haarlem', NULL, 'nl', 1, '2018-09-05 08:18:08', '2021-03-23 15:04:20', NULL, 4, 157, NULL, 125, 0, 1, 0),
(154, 'M.Bosch@vandervalkapeldoorn.nl', 'vandervalk_cantharel', '$2y$10$nJ7IHKO878tNxjr5cOp9aeuXo8KFyLEFfW9Op1ur/Z1s.2CUQUJ4G', 'Van der Valk', 'Cantharel', NULL, 'nl', 1, '2018-10-02 14:54:30', '2018-10-03 07:51:05', NULL, 2, 158, NULL, NULL, 1, 1, 0),
(155, 't.van.empelen@hilverdadeboer.nl', 'hilverdadeboerswe', '$2y$10$3m3M9UzdqJn1bN1IXMBDJ.A8Y5jbTHaBxyfFpqO8Zk0jMmotX9W8q', 'Hilverda de Boer', 'Sweden', NULL, 'en', 1, '2018-10-16 09:11:56', '2018-10-16 09:11:56', NULL, 3, 159, NULL, 71, 1, 1, 0),
(156, 'verwijderen@screenimpact.nl', 'verwijderen_10', '$2y$10$13cBJsQIH8dtIogVdT.oSuRkSPQLW7sbgLA1vjYnuJ0env5LU1rVq', 'Verwijderen', '10', NULL, 'nl', 1, '2018-10-17 12:37:23', '2020-02-19 13:20:59', NULL, 2, 160, NULL, NULL, 1, 0, 0),
(157, 'verwijderen@screenimpact.nl', 'verwijderen_11', '$2y$10$pSN6IK.a12A5lDcFeBKIcuo9kUOdSnw7FH3RIM1Fd4AlRbGC2LQ.2', 'Verwijderen', '11', NULL, 'nl', 1, '2018-10-17 12:40:48', '2020-02-19 13:21:31', NULL, 2, 161, NULL, NULL, 1, 1, 0),
(158, 'demo@screenimpact.nl', 'demo_hospitality_portrait', '$2y$10$22DFoRRROhioHO26vdiFGOkvnX.9CABqnETi2u2fbOHPf0b9qHd7e', 'Demo', 'Hospitality Portrait', NULL, 'nl', 1, '2018-10-26 09:11:22', '2021-03-23 15:04:26', NULL, 2, 162, NULL, NULL, 1, 1, 0),
(159, 'verwijderen@screenimpact.nl', 'verwijderen_01', '$2y$10$Nvv7LptU.zMBjLQApPfOLO63Bp7g3anTyJk9YGAwX9zsCh66hSfyi', 'Verwijderen', '01', NULL, 'nl', 1, '2018-10-31 09:05:11', '2020-02-19 11:36:45', NULL, 2, 163, NULL, NULL, 1, 1, 0),
(160, 'verwijderen@screenimpact.nl', 'verwijderen_02', '$2y$10$a04voAfGnuu.vj7KevTGQ.GyYaYL/8.Y89HFvY5ayaQ3VxaFSukJy', 'Verwijderen', '02', NULL, 'nl', 1, '2018-10-31 09:06:06', '2020-02-19 11:37:09', NULL, 2, 164, NULL, NULL, 1, 1, 0),
(161, 'info@screenimpact.nl', 'anamet_europe', '$2y$10$ntoN40RQ7iWTwHrg1chtoOjvXusKbEEhfs7lCZuTavuI8Q/dLPkSK', 'Anamet', 'Europe', NULL, 'nl', 1, '2018-11-16 10:58:01', '2019-05-15 13:18:55', NULL, 2, 165, NULL, NULL, 1, 1, 0),
(162, 'vesteda@screenimpact.nl', 'vesteda', '$2y$10$.g5VbplnhKoVZdTz2VnA5ejoM2lIjtrO1QlyNGUvRxjOV4M4jiJ.G', 'Vesteda', 'Amsterdam', NULL, 'nl', 1, '2018-11-28 12:49:55', '2018-12-03 15:44:01', NULL, 2, 166, NULL, NULL, 1, 1, 0),
(163, 'hollandcasino@screenimpact.nl', 'hollandcasino_client', '$2y$10$TjyUZbyrARBUrpU1o0mNEOAeYz8cinEFChFMAdkn/s59CLwziKeI6', 'Holland Casino', 'Client', NULL, 'nl', 1, '2018-11-28 14:01:00', '2018-11-28 14:01:00', NULL, 4, 167, NULL, 158, 0, 1, 0),
(164, 'bug@screenimpact.nl', 'Bugtestaccount', '$2y$10$j7G5gpcDwUzJi0GSUy5ZyuKcA9yD/9ZdWNUFFgp8Gjmg/SRPhf7dq', 'Bug', 'Testaccount', NULL, 'nl', 1, '2018-11-29 13:44:33', '2018-11-29 13:44:33', NULL, 2, 168, NULL, NULL, 1, 1, 0),
(165, 'info@screenimpact.nl', 'theaters_tilburg', '$2y$10$zOoNO/T3X6gFDs.XQ372HeCMMnDiadHN678lpR6yvVvsiXz.GgN8G', 'Theaters', 'Tilburg', NULL, 'nl', 1, '2018-12-03 11:24:50', '2021-11-15 13:19:56', NULL, 2, 169, NULL, NULL, 1, 1, 0),
(166, 'info@screenimpact.nl', 'theaters_tilburg_portrait', '$2y$10$BM7w5FvGkRIUapwvTUC6UuYKT.VygPmNzjCzrZiIY1mDMGt8inxF6', 'Theaters', 'Tilburg', NULL, 'nl', 1, '2018-12-03 11:26:13', '2021-11-15 13:20:18', NULL, 2, 170, NULL, NULL, 1, 1, 0),
(167, 'joeri@screenimpact.nl', 'test_joeri', '$2y$10$MJYwvfpO7/BJpFUgLOaG8e16sMCww5.bBJqBnVngQgU6NprVxSmC6', 'Joeri', 'Lamboo', NULL, 'en', 1, '2018-12-14 13:46:28', '2018-12-14 13:47:17', NULL, 2, 171, NULL, NULL, 1, 1, 0),
(168, 'support@screenimpact.nl', 'dummy', '$2y$10$4cLTWSoAi6V20SzgOphmGOK1oXNvLuLV9HXq.ir.DofB40u6gJEmK', 'Dummy', 'Account', NULL, 'nl', 1, '2018-12-20 08:51:12', '2018-12-20 08:51:12', NULL, 2, 172, NULL, NULL, 1, 1, 0),
(169, 'groot@hotelamsterdam.nl', 'hotelamsterdam', '$2y$10$JlW/pl75ZUbF81dY0RffiuvBfdXfPzJNsM9qoFgP22CB/27A./V1q', 'Rachel', 'Groot', NULL, 'nl', 1, '2019-01-23 10:03:42', '2020-05-21 11:36:22', NULL, 2, 173, '9kStZIaqntQqH8ZJrmDSwWXf4FwBPQg7hdRvvAPSXOTtZPgvuOhfUxYmcVwO', NULL, 1, 1, 0),
(170, 'verwijderen@screenimpact.nl', 'verwijderen_12', '$2y$10$3VKHl14HtEhNe9Ekg.np.eylL5qfYbbhID73xdL2mszQw/SoUpH0y', 'Verwijderen', '12', NULL, 'nl', 1, '2019-01-23 14:59:47', '2020-02-19 13:21:57', NULL, 2, 174, NULL, NULL, 1, 1, 0),
(171, 'verwijderen@screenimpact.nl', 'verwijderen_26', '$2y$10$4mFtDe0ObGbHJbZvaGuRZ.Xd8QcA.qIVNujU8RingShDDD8C6MJla', 'Verwijderen', '26', NULL, 'nl', 1, '2019-03-06 09:23:24', '2020-02-28 14:53:13', NULL, 2, 175, NULL, NULL, 1, 1, 0),
(172, 'verwijderen@screenimpact.nl', 'verwijderen_07', '$2y$10$smYEuqd0ubadR1f1wBFqq.oGGHU71hVsLMituWVQbIb7npc1Oy5yC', 'Verwijderen', '07', NULL, 'nl', 1, '2019-03-11 10:13:36', '2020-02-19 13:15:37', NULL, 2, 176, NULL, NULL, 1, 1, 0),
(173, 'verwijderen@screenimpact.nl', 'verwijderen_08', '$2y$10$P67qytiVr.Dm7NmIj61psO.p7H03p2iayiWOSqDdnloNqlKGc2f5i', 'Verwijderen', '08', NULL, 'nl', 1, '2019-03-11 11:22:52', '2020-02-19 13:16:24', NULL, 4, 177, NULL, 172, 1, 1, 0),
(174, 'Wendy@vvvermelo.nl', 'ermelo', '$2y$10$rwQ0H25LUx6ZWGmzU2VrcOmz4X0rYxgEcMJiMeRLXijsA1qc.abeu', 'Ermelo', 'Buitenleven', NULL, 'nl', 1, '2019-03-13 11:12:46', '2019-03-13 11:12:46', NULL, 2, 178, NULL, NULL, 1, 1, 0),
(175, 'joeri@screenimpact.nl', 'jcmcollege', '$2y$10$CEWqc8cwH6RQwqy01Gm6G.GC8LZwbZV0EkpxMacCn47AA2213tuEG', 'JCM', 'College', NULL, 'nl', 1, '2019-04-01 12:30:27', '2019-07-02 10:28:42', NULL, 2, 179, NULL, NULL, 1, 1, 0),
(176, 'joeri@screenimpact.nl', 'jcmcollege_portrait', '$2y$10$moGvhuwDwFID0rils1v2Q.kg1cKA2Dq9AOCW8KTorJR/OpYQJDBJ.', 'JCM', 'College', NULL, 'nl', 1, '2019-04-01 12:56:54', '2019-05-01 13:52:50', NULL, 2, 180, NULL, NULL, 1, 1, 0),
(177, 'info@screenimpact.nl', 'meldkameroostnl', '$2y$10$E3Fds5fA73jCg20L/cr6B.WsI6C//auw/Wici2j0r4jaJSWD9daLy', 'Meldkamer', 'Oost Nederland', NULL, 'nl', 1, '2019-04-17 09:42:48', '2019-04-17 09:42:48', NULL, 2, 181, NULL, NULL, 1, 1, 0),
(178, 'n.schutte@zwolsetheaters.nl', 'zwolse_theaters', '$2y$10$sGXuMP68OK9PTUMzMIjlYObrOO.oNeMAY9RqAiaUyddK6jG0Qmz4a', 'Zwolse', 'Theaters', NULL, 'nl', 1, '2019-05-08 10:52:00', '2019-05-13 15:08:11', NULL, 2, 182, NULL, NULL, 1, 1, 0),
(179, 'n.schutte@zwolsetheaters.nl', 'zwolse_theaters_portrait', '$2y$10$QdwOAKQsgXjq8LcfbQ8FxOMisAcNzdlo6qaE9RO4HGPF7.GPBZN82', 'Zwolse', 'Theaters Portrait', NULL, 'nl', 1, '2019-05-08 11:07:11', '2019-05-13 15:08:25', NULL, 2, 183, NULL, NULL, 1, 1, 0),
(180, 'impactentertainment@screenimpact.nl', 'impact_entertainment', '$2y$10$Akwwaq6NkYv5UJS4cN6XZuuh/Czkst0oVvhPoWFizXuT4HszX8K4i', 'Impact', 'Entertainment', NULL, 'nl', 1, '2019-06-26 23:06:45', '2019-06-26 23:06:45', NULL, 2, 184, NULL, NULL, 1, 1, 0),
(181, 'info@screenimpact.nl', 'demo_theater_landscape', '$2y$10$khkEuUqbeMgZw8kSriqkYucEhEhnZWeUGaXlYRPIrLTsaQjNE/ici', 'Demo Theater', 'Landscape', NULL, 'nl', 1, '2019-07-03 07:19:08', '2021-03-23 15:04:30', NULL, 2, 185, NULL, NULL, 1, 1, 0),
(182, 'info@screenimpact.nl', 'demo_theater_portrait', '$2y$10$Oa1L8eoL7.PrBp8MMd6yAeYTnFBA5VcUC//Y.nBolJQaIxAfV9cHq', 'Demo Theater', 'Portrait', NULL, 'nl', 1, '2019-07-03 11:47:38', '2021-03-23 15:04:36', NULL, 2, 186, NULL, NULL, 1, 1, 0),
(184, 'degrootewielen@screenimpact.nl', 'kcdegrootewielen', '$2y$10$BfT222pxOccjLMoppDva1ObOLcRMIaQC0ixG3bY6JebDQs6Tf.sWm', 'De Groote Wielen', 'Rosmalen', NULL, 'nl', 1, '2019-07-09 10:28:45', '2019-08-14 10:04:53', NULL, 3, 188, NULL, 185, 1, 0, 0),
(185, 'digidact@screenimpact.nl', 'digidact', '$2y$10$twkMk6.1c7zGX8M/LS/9keHOP4fjUm0s7agNviLOI8SZZuCiLGAf6', 'Digidact', 'Admin', NULL, 'nl', 1, '2019-07-10 12:50:04', '2019-09-24 11:38:12', NULL, 2, 189, NULL, NULL, 1, 1, 0),
(186, 'rutgerdehamer@iamcollege.nl', 'iamcollege', '$2y$10$Iu6ulH16fLxwtamUtuJLYupACtzAi/A4s8Yl0f9eTw6fdeX.kA30a', 'I Am College', 'Admin', NULL, 'nl', 0, '2019-08-23 09:49:25', '2022-01-03 10:44:14', NULL, 2, 190, NULL, NULL, 1, 1, 0),
(187, 'tadslinger@screenimpact.nl', 'tadslinger', '$2y$10$Wt/eN/oRWjhK15OtOmUVM.AxdgG/ZLvUWF2ojAdXewLQX5IMVHyOa', 'Theater', 'aan de Slinger', NULL, 'nl', 1, '2019-09-25 14:05:20', '2019-09-27 07:48:20', NULL, 2, 191, NULL, NULL, 1, 1, 0),
(188, 'info@screenimpact.nl', 'theateraanhetspui', '$2y$10$ec18LKElL97ErII0TgOMHuebEX2TJLt/m.YSU..8pEin/CKOrmjnS', 'Theater', 'Aan Het Spui', NULL, 'nl', 1, '2019-10-07 11:39:55', '2019-10-07 11:39:55', NULL, 2, 192, NULL, NULL, 1, 1, 0),
(189, 'verwijderen@screenimpact.nl', 'verwijderen_13', '$2y$10$DH97asgb4YN.crS/wEybruhHdCD3iDOiINh2oR2q6dMahUrW3Nf.i', 'Verwijderen', '13', NULL, 'nl', 1, '2019-10-09 14:30:15', '2020-02-19 14:49:59', NULL, 2, 193, NULL, NULL, 1, 1, 0),
(190, 'info@screenimpact.nl', 'screenimpact', '$2y$10$GOg8i3LF5UVwTuhwP3HuTOAzKL/gSdITuZqRg/JgXdz8vgdVaxcwW', 'ScreenImpact', 'Kantoor', NULL, 'nl', 1, '2019-11-26 14:09:10', '2019-11-26 14:09:10', NULL, 2, 194, NULL, NULL, 1, 1, 0),
(191, 'info@screenimpact.nl', 'screenimpact_client', '$2y$10$iAahUUwTjsT/9yIWk2DeEOJLXB/MYaKkjdyRvF2eyWtSJb3dAfvni', 'ScreenImpact ', 'Client', NULL, 'nl', 1, '2019-11-26 14:21:16', '2019-11-26 14:22:22', NULL, 4, 195, NULL, 190, 1, 0, 0),
(192, 'a.kurvers@dehoogstraat.nl', 'hoogstraat_orthopedietechniek', '$2y$10$XnOabueRRMqSjx6UiTS87ubvUYmQl2MZc1GsWlyBZcqKfvd/XWfYq', 'Hoogstraat', 'Revalidatietechniek', NULL, 'nl', 1, '2019-11-27 10:34:25', '2019-11-27 10:34:25', NULL, 2, 196, NULL, NULL, 1, 1, 0),
(193, 'a.kurvers@dehoogstraat.nl', 'a.kurvers', '$2y$10$h3TpNDhWEbTDz0AkRSH0FOhB4w558uUKT19JJHa7QTme.EO7nkOU.', 'Astrid', 'Kurvers', NULL, 'nl', 1, '2019-11-27 10:56:11', '2019-11-27 10:56:11', NULL, 3, 197, NULL, 192, 1, 1, 0),
(194, 'max@screenimpact.nl', 'maxtest', '$2y$10$bEdjoRd9xaGG3iw7dsx/QOzwmUoCmV.HnaGcgKPe9E6wW46/iGG8u', 'Max', 'Test', NULL, 'nl', 1, '2019-11-29 14:19:22', '2019-11-29 14:20:56', NULL, 2, 198, 'iFCids3V0wYfy8K1KKp9WssMFBCCZ5b9uQtJWF7PFtVZY0trxRxe020niGlY', NULL, 1, 1, 0),
(195, 'beek@huisartsoldenzaal.nl', 'DeHaer', '$2y$10$9YQDx2tSt2Vv5Dz/FHl91eewXj/zwkP1jZjywHPKTGkgHWh9ButL6', 'Huisartsenpraktijk', 'De Haer', NULL, 'nl', 0, '2019-12-16 09:54:26', '2022-10-14 13:34:21', NULL, 2, 199, NULL, NULL, 1, 1, 0),
(196, 'evandiepen@taqatheaterdevest.nl', 'vest_service', '$2y$10$2StGudhm/O4Whx/dSB53mO.rSF1YMxxnLmjuzfGaFd.iE.sNfQsse', 'De Vest', 'Publieksservice', NULL, 'nl', 1, '2019-12-17 10:22:13', '2019-12-17 10:22:13', NULL, 3, 200, NULL, 102, 1, 1, 0),
(197, 'dbrinkman@delinie.net', 'linie_balie', '$2y$10$04jriteWMaf4MRr19GSh9OH.puquKFKMr.O9KLfSq6bg2jMBh4rfS', 'Huisartsenpraktijk', 'de Linie', NULL, 'nl', 1, '2019-12-17 13:17:14', '2019-12-17 13:20:39', NULL, 4, 201, NULL, 80, 1, 1, 0),
(198, 'm.pereboom@hanzehof.nl', 'hanzehof_pereboom', '$2y$10$8g727vL2pynJQmzU/lOxkOKLLY7y.RpdcsZ/JBIjNoPzEGnHmk2Zy', 'Miranda', 'Pereboom', NULL, 'nl', 1, '2019-12-20 14:07:26', '2019-12-20 14:07:26', NULL, 3, 202, NULL, 124, 1, 1, 0),
(199, 'info@hanzehof.nl', 'hanzehof_receptie', '$2y$10$GCpxL2LpyncnGDP4ftTEfepduXpfRnqZPd1oeRuh1qC8SWO54n8jW', 'Hanzehof', 'Receptie', NULL, 'nl', 1, '2019-12-20 14:08:29', '2019-12-20 14:09:04', NULL, 3, 203, NULL, 124, 1, 1, 0),
(200, 'd.vredenberg@hanzehof.nl', 'hanzehof_vredenberg', '$2y$10$WY4ticO7bIYN6Q8WqA174erZv99bb/mwiWDX/Qom5pwT/CGP/ql.q', 'Devin', 'Vredenburg', NULL, 'nl', 1, '2019-12-20 14:11:01', '2019-12-20 14:11:01', NULL, 3, 204, NULL, 124, 1, 1, 0),
(201, 'horeca@hanzehof.nl', 'hanzehof_horeca', '$2y$10$0xhsMVswGEClZlM25pOtpee0FSzbHCKusKD49skzVSXvOPWUhUEZ2', 'Hanzehof', 'Horeca', NULL, 'nl', 1, '2019-12-20 14:12:55', '2019-12-20 14:12:55', NULL, 3, 205, NULL, 124, 1, 1, 0),
(202, 'm.degraaf@hanzehof.nl', 'hanzehof_degraaf', '$2y$10$d5mK3ceaD793fi6814SwmOTt6PZazuMxAU3PowVaB4.wy32cffP9m', 'Maaike', 'de Graaf', NULL, 'nl', 1, '2019-12-20 14:14:33', '2019-12-20 14:14:33', NULL, 3, 206, NULL, 124, 1, 1, 0),
(203, 'd.lugtmeijer@hanzehof.nl', 'hanzehof_lugtmeijer', '$2y$10$81gq3mdiDefXJ3ylwmFx9OtmVo.jaCHqvKggo8JdsqIDWaWSvmiLK', 'Daniel', 'Lugtmeijer', NULL, 'nl', 1, '2019-12-20 14:16:18', '2019-12-20 14:16:18', NULL, 3, 207, NULL, 124, 1, 1, 0),
(204, 'merketing@hanzehof.nl', 'hanzehof_marketing', '$2y$10$4K0G3zdBX6St91nEJOGnV.k/iNB/F9kf0VCORhCkQSVSJtBGInUTy', 'Hanzehof', 'Marketing', NULL, 'nl', 1, '2019-12-20 14:33:28', '2019-12-20 14:33:28', NULL, 3, 208, NULL, 124, 1, 1, 0),
(205, 'w.vanelteren@hanzehof.nl', 'hanzehof_elteren', '$2y$10$WZs68xT6PQbAUC2OYXp1Fu8i/cSchMNFZEK6ZeN2c7VGqe.5wwJPK', 'Walter', 'van Elteren', NULL, 'nl', 1, '2019-12-20 14:34:46', '2019-12-20 14:34:46', NULL, 3, 209, NULL, 124, 1, 1, 0),
(206, 'chris@screenimpact.nl', 'demo_1931', '$2y$10$hptWp1MG2puEeD5BXKNGJ.u3ilGhvUqZsxrsFt8D0D0oeMzXGRgva', '1931 Congrescentrum', 's-Hertogenbosch', NULL, 'nl', 1, '2020-01-15 08:49:35', '2022-04-06 07:35:04', NULL, 2, 210, NULL, NULL, 1, 1, 0),
(207, 'nikki@marks.nl', 'nmarks', '$2y$10$kvyH4VBLPp.P/8kSKkGy...f24R9tnDEV3bghnRcPrW8iHFAnNaH.', 'Nikki', 'Marks', NULL, 'nl', 1, '2020-01-29 12:24:39', '2020-01-29 12:24:39', NULL, 3, 211, NULL, 2, 1, 1, 0),
(208, 'info@screenimpact.nl', 'beekse_bergen', '$2y$10$rmG3ZpIDFX0ee8a/fF9cYugylMdwPPY34lNpl7MMyYzVPwlbVecVW', 'Beekse', 'Bergen', NULL, 'nl', 1, '2020-02-12 11:05:38', '2020-02-12 11:05:38', NULL, 2, 212, NULL, NULL, 1, 1, 0),
(209, 'info@screenimpact.nl', 'beekse_safaripark', '$2y$10$PgQIfZHAeBge2z5LNKepQe97na.lHI4iq2qeGuXbRXLIUg1BsNH9K', 'Safaripark', 'Beekse Bergen', NULL, 'nl', 1, '2020-02-21 09:05:01', '2020-02-21 09:05:01', NULL, 4, 213, NULL, 208, 1, 1, 0),
(210, 'info@screenimpact.nl', 'beekse_safariresort', '$2y$10$mGVkOqX4Y8fhH6Zx2zz9fuaizrGaPC5vZueEbv1sIciorhdL5W7JW', 'Safari', 'Resort', NULL, 'nl', 1, '2020-02-21 09:10:01', '2020-02-21 09:10:01', NULL, 4, 214, NULL, 208, 0, 1, 0),
(211, 'antonspaargaren@screenimpact.nl', 'antonspaargaren', '$2y$10$DH2j9td.Cj.V332TS0jq...6a5NQJ26IBY0Dcuhzorb20dBz1wvAa', 'Anton', 'Spaargaren', NULL, 'nl', 1, '2020-03-10 12:59:18', '2020-09-16 07:04:10', NULL, 2, 215, NULL, NULL, 1, 0, 0),
(212, 'klinker@screenimpact.nl', 'klinker', '$2y$10$2wsxwGwwpfjiQdxnU/JuPe8Rtx7HLt.8EctrXTKihyQA3nDeEtetG', 'Cultuurhuis', 'De Klinker', NULL, 'nl', 1, '2020-06-12 12:27:32', '2020-06-12 12:27:32', NULL, 2, 216, NULL, NULL, 1, 1, 0),
(213, 'klinker@screenimpact.nl', 'klinker_portrait', '$2y$10$qMOeBY3v/KaMswt/bt8x.unruzfnKbYpAySBeTDSFVOZUFZrbpQL.', 'Cultuurhuis', 'De Klinker Portrait', NULL, 'nl', 1, '2020-06-12 12:28:46', '2020-06-25 10:20:31', NULL, 2, 217, NULL, NULL, 1, 1, 0),
(214, 'marketing@nl.emglive.com', 'emglive', '$2y$10$T4eGya3KX2OjtI9f73/nEeO60vSumaFcLq1NfdQdNGEl8LvP9vHs.', 'EMG', 'Live', NULL, 'nl', 1, '2020-09-16 07:21:41', '2022-10-11 11:27:39', NULL, 2, 218, NULL, NULL, 1, 1, 0),
(215, 'rocva@screenimpact.nl', 'rocva', '$2y$10$Iw2zqBUZH27e9pQky.dZ4uMzn6Nt3RrOXiRF5U1u7xEIts9ImsHem', 'ROC', 'van Amsterdam', NULL, 'nl', 1, '2020-10-02 07:26:16', '2021-06-08 10:39:24', NULL, 2, 219, NULL, NULL, 1, 1, 0),
(216, 'ROC_gebruiker1@screenimpact.nl', 'roc_gebruiker1', '$2y$10$WL23cARwBdMbKJuFPH9nye5a3SXALPytGAp66sD1ZWFLSs32nVi.2', 'ROC', 'gebruiker1', NULL, 'nl', 1, '2020-10-09 09:28:21', '2021-06-08 10:43:46', NULL, 3, 220, NULL, 215, 1, 1, 0),
(217, 'ROC_gebruiker2@screenimpact.nl', 'roc_gebruiker2', '$2y$10$wZMCst2YcTYHVqPi5usRuew9J/YXg8/8.x10MzXh/TeVLVXFFRxW.', 'ROC', 'gebruiker2', NULL, 'nl', 1, '2020-10-09 09:32:44', '2021-06-08 10:43:58', NULL, 3, 221, NULL, 215, 1, 1, 0),
(218, 'ROC_gebruiker3@screenimpact.nl', 'roc_gebruiker3', '$2y$10$U8HiC09Yq/vL7YbacL15guy3J.6tRacs0p9YudkB6jrJzgdo1P8pu', 'ROC', 'gebruiker3', NULL, 'nl', 1, '2020-10-09 09:33:43', '2021-06-08 10:44:19', NULL, 3, 222, NULL, 215, 1, 1, 0);
INSERT INTO `users` (`id`, `email`, `username`, `password`, `firstName`, `lastName`, `avatar`, `lang`, `status`, `created`, `updated`, `expires`, `roleId`, `settingId`, `remember_token`, `masterId`, `showSiblingsContent`, `showChildrenContent`, `showOnlyPresentationContent`) VALUES
(219, 'ROC_gebruiker4@screenimpact.nl', 'roc_gebruiker4', '$2y$10$trXLr5w1353pSyhg/Cyr2ecwqQRjb3BaDwCFKvT3RGzPVfKtVYjxG', 'ROC', 'gebruiker4', NULL, 'nl', 1, '2020-10-09 09:36:06', '2021-06-08 10:44:34', NULL, 3, 223, NULL, 215, 1, 1, 0),
(220, 'ROC_gebruiker5@screenimpact.nl', 'roc_gebruiker5', '$2y$10$gY2LsXN8iLMKYA/6hUATxea5HoMHpgW4qs7JCr0EHi/mOMxv5Y2V6', 'ROC', 'gebruiker5', NULL, 'nl', 1, '2020-10-09 09:37:42', '2021-06-08 10:44:55', NULL, 3, 224, NULL, 215, 1, 1, 0),
(221, 'roc@screenimpact.nl', 'roc_gebruiker6', '$2y$10$lLBfUh5YmmFgDP4iHCQBqubrABH9qjapnfZMbm.OxTi2/LQKj4OrS', 'ROCvA', '6', NULL, 'nl', 1, '2020-10-27 08:58:03', '2021-06-08 10:45:12', NULL, 3, 225, NULL, 215, 1, 1, 0),
(222, 'info@hethuisutrecht.nl', 'hethuis', '$2y$10$M/P7AfjkpMDwRBTCihNipOrsWkKwngUcIKWNp1G4vcegIraXIJ51G', 'Het Huis', 'Utrecht', NULL, 'nl', 1, '2021-01-28 10:14:20', '2021-03-10 16:07:57', NULL, 2, 226, NULL, NULL, 1, 1, 0),
(223, 'max@screenimpact.nl', 'demo_universeel_client', '$2y$10$zuOkKPngrkHJNNwOWbTy5eXboRXTqsJ4iLsL33nr//HQqWgJaL08.', 'Demo', 'Client', NULL, 'nl', 1, '2021-03-10 16:18:26', '2021-03-23 15:04:41', NULL, 3, 227, NULL, 106, 1, 1, 0),
(224, 'max@screenimpact.nl', 'demo_client', '$2y$10$LQOgjlbDIrb9FkAgsx9mTOF0L3/MRB/WzplfJ/1qYSsHqSEpbuG16', 'Max', 'Demo', NULL, 'en', 1, '2021-03-11 08:57:50', '2021-03-23 15:04:55', NULL, 4, 228, NULL, 106, 1, 1, 0),
(225, 'peterdelamar@gmail.com', 'slotzeist', '$2y$10$yX07rttXqCVVRmk6Ly.sruYDLmyJRXTKfUKfSsa4VPAxKGqZf5TL2', 'Slot', 'Zeist', NULL, 'nl', 1, '2021-04-07 12:44:53', '2021-04-16 10:09:05', NULL, 2, 229, NULL, NULL, 1, 1, 0),
(227, 'demo@screenimpact.nl', 'demo_musea', '$2y$10$2vXbKLs2viQpgPqIlQD4heysXcbMnc4H44Rna1f2/dEQ0789DsfFq', 'demo', 'musea', NULL, 'en', 1, '2021-04-22 08:31:52', '2021-07-09 11:41:55', NULL, 2, 230, NULL, NULL, 1, 1, 0),
(228, 'test@gmail.com', 'Demo_restaurant', '$2y$10$4oWwxjqeucSgobIFW8KOI.nWBBA2sr8SyOuqGzSDBxQ0pwrdaVv4y', 'Demo', 'Restaurant', NULL, 'en', 1, '2021-04-28 13:04:14', '2021-05-03 12:53:16', NULL, 2, 231, NULL, NULL, 1, 1, 0),
(229, 'kaan@screenimpact.nl', 'Demo_account_office', '$2y$10$874d/vrFsT9uZloeFOLQke.qsATnU9q6TiGMz8ejgkNqJgpFdTzMW', 'kaan', 'kaan', NULL, 'en', 1, '2021-04-30 12:00:41', '2021-04-30 12:00:58', NULL, 2, 232, NULL, NULL, 1, 1, 0),
(230, 'office@screenimpact.com', 'demo_office', '$2y$10$xm1eDuDGt.g9AURPOtuGyeB2610Fvp.a6HOpUQovf9dm/VEDi7Cnu', 'Demo', 'Office', NULL, 'en', 1, '2021-05-04 11:50:57', '2021-05-04 11:50:57', NULL, 2, 233, NULL, NULL, 1, 1, 0),
(231, 'demo@screenimpact.nl', 'demo_onderwijs2021', '$2y$10$tI6Mj7XqDvXSZnLzrVopKOcfLQl3aGVFiGABSRZkuCY36QjacmbZq', 'demo', 'musea', NULL, 'en', 1, '2021-05-07 12:32:07', '2021-08-12 12:18:34', NULL, 2, 234, NULL, NULL, 1, 1, 0),
(232, 'demo@screenimpact.nl', 'demo_medisch2021', '$2y$10$tK9eGn0r13BKziEYj9EquONdbrDzyxW7cntT15JAI4SjGrz07Zi1a', 'demo', 'medisch2021', NULL, 'en', 1, '2021-05-18 14:30:49', '2021-08-12 12:17:47', NULL, 2, 235, NULL, NULL, 1, 1, 0),
(233, 'evandiepen@taqatheaterdevest.nl', 'de_vest_portrait', '$2y$10$ybfmDf/3y9DGQzD1h8PpLun7wjzwHhOTvxREwInPBJSKmMPUmWA7u', 'De Vest', 'Portrait', NULL, 'nl', 1, '2021-06-21 10:09:19', '2021-06-21 10:09:19', NULL, 2, 236, NULL, NULL, 1, 1, 0),
(234, 'evandiepen@taqatheaterdevest.nl', 'vest_service_portrait', '$2y$10$0NNRyR8hRrCbok5YeS8TQu65CCU27tizKaEfbIi/RaqZCMFDEuzoO', 'Vest Service', 'Portrait', NULL, 'nl', 1, '2021-06-22 08:11:08', '2021-06-22 08:11:08', NULL, 3, 237, NULL, 233, 1, 1, 0),
(235, 'communicatie@streams.city', 'streams', '$2y$10$vqa3YOIlpmd8JLaxOK9ibueUamuvTA5E9d1l..hbNhRN8FYdR/P/i', 'Streams', 'Landscape', NULL, 'nl', 1, '2021-07-06 13:02:07', '2021-11-04 09:37:47', NULL, 2, 238, 'dApezxKMWQ9Veh4LOJ4bYtxIOlxg8cO6FqY6X4hMNO141rn0yX1XbHN47Xyj', NULL, 1, 1, 0),
(236, 'streams@screenimpact.nl', 'streams_portrait', '$2y$10$x7HTXjveLH4uZ3OisUvb2eJMmDms5kIA4xdLcmahv7yKvmXjGlNLi', 'Streams', 'Portrait', NULL, 'nl', 1, '2021-07-06 14:02:37', '2021-11-02 13:25:00', NULL, 2, 239, NULL, NULL, 1, 1, 0),
(237, 'info@schouwburgamstelveen.nl', 'sbamstelveen', '$2y$10$B6vsbbEg.LZ5hqY.AsF5CeV0VFfUDkVyc5WdeuAP9YIuBXCyBuAN6', 'Schouwburg', 'Amstelveen', NULL, 'nl', 1, '2021-08-18 12:35:07', '2021-11-03 10:03:12', NULL, 2, 240, NULL, NULL, 1, 1, 0),
(238, 'ed.van.hees@maastricht.nl', 'vrijthof', '$2y$10$/WYSppS554XA7DQ7y7A7neTZAoAkIZ03EJCJDjGvnd7WU0ofV/neq', 'Vrijthof', 'Theather', NULL, 'nl', 1, '2021-09-10 13:30:03', '2021-09-22 14:17:09', NULL, 2, 241, NULL, NULL, 1, 1, 0),
(239, 'ed.van.hees@maastricht.nl', 'vrijthof_portrait', '$2y$10$hzXXBvJlFIzdlwP1Orx5ze/THHyxOduQ9ylQJ76hxrh3DELtUW16u', 'Vrijthof Portrait', 'Theater', NULL, 'nl', 1, '2021-09-13 08:37:16', '2021-10-07 08:19:40', NULL, 2, 242, NULL, NULL, 1, 1, 0),
(240, 'kaan@screenimpact.nl', 'Demo', '$2y$10$OXUL1V3vGWNXIokBz8U8Me21nBw/.f6ZBVKHb2xNX8rfC8lseRnkO', 'Demo', 'Portrait', NULL, 'nl', 1, '2021-10-13 09:18:51', '2021-11-08 09:07:18', NULL, 2, 243, NULL, NULL, 1, 1, 0),
(241, 'kaan@screenimpact.nl', 'Landscape_Junushoff', '$2y$10$K.iEUhR/47ArLMyRTxRIiOCyW8rfv.JRsRKoryipTQzAgb.RP3R7m', 'Demo', 'Junushoff_Lanscape', NULL, 'nl', 1, '2021-10-13 14:47:20', '2021-10-18 09:56:27', NULL, 2, 244, NULL, NULL, 1, 1, 0),
(242, 'kaan@screenimpact.nl', 'testomgevingkaan', '$2y$10$lDJQBcd2gtH/AY/461qGMOEMXlPje/7bsYPL7Me61hgTUoA.bfade', 'Kaan', 'Aydın', NULL, 'en', 1, '2021-10-18 11:32:29', '2022-04-06 19:21:51', NULL, 2, 245, NULL, NULL, 1, 1, 0),
(243, 'doornroosje@screenimpact.nl', 'doornroosje', '$2y$10$.7EGDaa5qf5RXk3ckPgoguDW49boQYymepfFZOaA6IvIzM.bUTMsy', 'Doornroosje', 'Landscape', NULL, 'nl', 1, '2021-10-26 11:38:05', '2021-10-26 11:38:05', NULL, 2, 246, NULL, NULL, 1, 1, 0),
(244, 'doornroosje@screenimpact.nl', 'doornroosje_portrait', '$2y$10$j9NFJL3/.GVZtJQksAzp/OkC8G7Hf.zAsLnO4DEatWXXYHzoaqTbS', 'Doornroosje', 'Portrait', NULL, 'nl', 1, '2021-10-26 11:39:22', '2021-10-26 11:39:22', NULL, 2, 247, NULL, NULL, 1, 1, 0),
(245, 'ed.van.hees@maastricht.nl', 'UITbalie', '$2y$10$oa.BoHuDgl03S/i6drQ2Lu4baBMj93gfzFWBPsc/U7o/XokkQu/UG', 'uitbalie', 'vrijthof', NULL, 'nl', 1, '2021-11-17 09:55:23', '2021-11-17 09:55:23', NULL, 3, 248, NULL, 239, 1, 0, 1),
(246, 'emielkuijk@digidact.nl', 'digidact_dedennen', '$2y$10$sW/IPMsorGkHnz.hwVhScOpy.pAJBWyi0ugAiNhcfxTxlG5ezreIq', 'Digidact', 'De Dennen', NULL, 'nl', 1, '2021-12-03 14:47:54', '2021-12-06 10:54:20', NULL, 2, 249, NULL, NULL, 1, 0, 0),
(247, 'kaan@screenimpact.nl', 'demonemo2021', '$2y$10$uq9vUEW4/mfn08V/Lkujfujmycbv83m5KX.xeUNmMulM9fB0kDWEG', 'Demo', 'Nemo2021', NULL, 'nl', 1, '2021-12-08 12:33:01', '2022-01-17 13:52:51', NULL, 2, 250, NULL, NULL, 1, 1, 0),
(248, 'marketing@theateraanhetvrijthof.nl', 'marketingvrijthof', '$2y$10$HYTvn8q7qqpezZMstBsHdeCuv.UlmL7S82KOEE1cgf/at3oFkZAJW', 'marketing', 'vrijthof', NULL, 'nl', 1, '2021-12-09 15:14:45', '2021-12-23 16:21:58', NULL, 3, 251, NULL, 238, 1, 1, 0),
(249, 'zakelijk@theateraanhetvrijthof.nl', 'zakelijkvrijthof', '$2y$10$pD.Bj2vobcH7ihD5QDfDk.VUUh07oJRR63zeb/EXcQidsBHe7X6SO', 'zakelijk', 'Vrijthof', NULL, 'en', 1, '2021-12-10 09:01:01', '2021-12-23 16:22:30', NULL, 3, 252, NULL, 238, 1, 1, 0),
(250, 'uitbalie@theateraanhetvrijthof.nl', 'uitbalievrijthof', '$2y$10$kn197i3.BM04Bqr/Pqz.f.A.vN7cchJAYhtoyI5FIChOKV0ux8sIC', 'uitbalie', 'Vrijthof', NULL, 'en', 1, '2021-12-10 09:03:07', '2021-12-23 16:22:52', NULL, 3, 253, NULL, 238, 1, 1, 0),
(251, 'techniek@theateraanhetvrijthof.nl', 'techniekvrijthof', '$2y$10$v6BHQhUASFM/i05Eh8eukuYO9UAKRotBkkvu2pyoOXheWTL8EoZCG', 'techniek', 'Vrijthof', NULL, 'en', 1, '2021-12-10 09:04:35', '2021-12-23 16:23:10', NULL, 3, 254, NULL, 238, 1, 1, 0),
(252, 'zakelijk@theateraanhetvrijthof.nl', 'zakelijkvrijthof_portrait', '$2y$10$lWK6DMZTE9IksngfAASm6.psb73cWxhrRyuZHRFLh.LWToqL/ENXC', 'zakelijk', 'Vrijthof', NULL, 'en', 1, '2021-12-10 09:01:01', '2021-12-23 16:22:36', NULL, 3, 252, NULL, 239, 1, 1, 0),
(253, 'marketing@theateraanhetvrijthof.nl', 'marketingvrijthof_portrait', '$2y$10$EgGIhZqEsoIhJY7N6YsA..k5QmDaJxdL0ds3Q07LWw2mRbDdpCf9S', 'marketing vrijthof', 'portrait', NULL, 'nl', 1, '2021-12-09 15:14:45', '2021-12-23 16:24:17', NULL, 3, 251, NULL, 239, 1, 1, 0),
(254, 'kranenburgh@test.nl', 'kranenburgh', '$2y$10$WU3vZUrbLpsQQKeWM8h8vuW/RyRnqoB8BKriTIvPJqG/GGU5jusNa', 'kranenburgh', 'landscape', NULL, 'nl', 1, '2022-01-06 09:01:46', '2022-01-14 15:20:55', NULL, 2, 255, NULL, NULL, 1, 1, 0),
(255, 'kranenburg@test.nl', 'kranenburgh_portrait', '$2y$10$wjyJSyRTb03XoqLGCR5WcOP9T9BWpfjPVLd2wtYRIwtq1zd1/Uz5i', 'kranenburgh', 'portrait', NULL, 'nl', 1, '2022-01-06 12:44:20', '2022-01-17 15:21:39', NULL, 2, 256, NULL, NULL, 1, 1, 0),
(256, 'sharon@stadsgehoorzaal.nl', 'stadsgehoorzaal', '$2y$10$dsSlpfJv13xB9rdfX.MgxeLabsU3l9m.2tGBhSm4VMz4w.pj7aQfW', 'stadsgehoorzaal', 'landscape', NULL, 'en', 1, '2022-01-11 15:02:24', '2022-01-11 15:21:26', NULL, 2, 257, NULL, NULL, 1, 1, 0),
(257, 'sharon@stadsgehoorzaal.nl', 'stadsgehoorzaal_portrait', '$2y$10$/sNLQCziQ4u7R0pNu3XY6ueOANDAJom43pC6wAya.Er57NlKPCke6', 'Stadsgehoorzaal', 'Portrait', NULL, 'nl', 1, '2022-01-11 15:03:43', '2022-01-13 14:03:18', NULL, 2, 258, NULL, NULL, 1, 1, 0),
(258, 'sharon@stadsgehoorzaal.nl', 's.breems', '$2y$10$.UyFh31DWphWIX4HQzJKLu1vjgHBBDCVgjj78B4uCUQ.gjIGYLOH.', 'Sharon', 'den Breems', NULL, 'nl', 1, '2022-01-17 12:56:59', '2022-01-17 12:56:59', NULL, 3, 259, NULL, 257, 1, 1, 0),
(259, 'publiciteit@stadsgehoorzaal.nl', 'publiciteit_stadsgehoorzaal', '$2y$10$wAhyV..YxySZWDQdgydtauxaQZNcLzXTJzMin.oq2ULU/lULG39Va', 'Publiciteit', 'Stadsgehoorzaal', NULL, 'nl', 1, '2022-01-17 13:06:07', '2022-01-17 13:06:07', NULL, 3, 260, NULL, 257, 1, 1, 0),
(260, 'info@stadsgehoorzaal.nl', 'floor_stadsgehoorzaal', '$2y$10$qsq0JfdneY4Uu6ZFRXZureSB7An/KIvL6cmB5JGp.wjKLtB5hS4mq', 'Floormanager', 'Stadsgehoorzaal', NULL, 'nl', 1, '2022-01-17 13:08:10', '2022-01-17 13:08:10', NULL, 3, 261, NULL, 257, 1, 1, 0),
(261, 'voorveghter@screenimpact.nl', 'voorveghter', '$2y$10$6ayxfPh9z/oa0vak8YxQxu7B3EoUDsDBrdFYAOSNU5A3rnKllRFXi', 'Theater', 'De Voorveghter', NULL, 'nl', 1, '2022-01-26 12:15:54', '2022-01-26 12:15:54', NULL, 2, 262, NULL, NULL, 1, 1, 0),
(262, 'max@screenimpact.nl', 'rocwidgets', '$2y$10$Q0Ljn4KsOeVPbcC..ijcGOYHPma9cNmtFi.cfC4FTZBvHzLSLWEuu', 'ROC', 'Widgets', NULL, 'nl', 1, '2022-01-27 08:57:16', '2022-01-27 08:57:16', NULL, 2, 263, NULL, NULL, 1, 1, 0),
(263, 'iris.reems@streams.city', 'streams_iris', '$2y$10$1WoS9VsSDsG51t6jK2oyyerno.YTMbsgOnCJaUZlhmSOWMjabyceW', 'Iris', 'reems', NULL, 'nl', 1, '2022-02-07 14:52:34', '2022-02-07 14:52:34', NULL, 3, 264, NULL, 235, 1, 1, 0),
(264, 'w.glaudemans@libema.nl', 'libema_1931', '$2y$10$6Hy.UGVLDUVG22kFE7Ku6.7kgatLqiwdm50iwbz8rXGSWuxMYTUNG', 'Libema', '1931', NULL, 'nl', 1, '2022-03-08 15:43:30', '2022-03-08 15:43:30', NULL, 2, 265, NULL, NULL, 1, 1, 0),
(265, 'w.glaudemans@libema.nl', '1931', '$2y$10$4VvL6TldUm5pU0GKEOSpsux9rcXLwMIeY6nDIBKyOpQDy0BYilSsO', 'Congrescentrum', '1931', NULL, 'nl', 1, '2022-03-08 15:48:01', '2022-06-01 07:28:35', NULL, 3, 266, NULL, 264, 1, 1, 0),
(266, 'test@gmail.com', 'bibliotheek_kennemer', '$2y$10$4oWwxjqeucSgobIFW8KOI.nWBBA2sr8SyOuqGzSDBxQ0pwrdaVv4y', 'Demo', 'Bibliotheek Zuid Kennemerland', NULL, 'nl', 1, '2021-04-28 13:04:14', '2022-03-18 09:25:07', NULL, 2, 231, NULL, NULL, 1, 1, 0),
(268, 'test@gmail.com', 'bibliotheek_kennemer_portrait', '$2y$10$KzyzL3eFQVsZOfNzpvtesebLDYPat3dJ49.KhBgug.D69.Nh50pF.', 'Bibliotheek', 'Zuid Kennemerland', NULL, 'nl', 1, '2022-03-18 13:39:48', '2022-03-18 13:39:48', NULL, 3, 267, NULL, 266, 1, 1, 0),
(269, 'client@screenimpact.nl', 'bibliotheek_kennemer_client', '$2y$10$QxMKXPnTQNKIyMitWtaN1eQMswyUUStNxoncijDRVxbShBXY8vwne', 'Kennemer', 'Client', NULL, 'nl', 1, '2022-03-18 14:24:58', '2022-03-18 14:24:58', NULL, 4, 268, NULL, 266, 0, 1, 0),
(270, 'devest@screenimpact.nl', 'grote_kerk_alkmaar', '$2y$10$IuYkdoW6.Gc7fPmK9np7Eu/2mgoMOGQsYN4j7MzJfpH/6Fd7gU4Om', 'Grote Kerk', 'Alkmaar', NULL, 'nl', 1, '2022-03-29 09:55:07', '2022-05-03 07:53:27', NULL, 3, 269, NULL, 233, 1, 1, 0),
(271, 'daphne@deventerschouwburg.nl', 'deventerschouwburg', '$2y$10$GIKwd5snuCKJ0C2iGQL.1.qpwipVNESfmTfx5fEoAMPh9AxC0vfmy', 'Deventer', 'Schouwburg', NULL, 'nl', 1, '2022-04-21 09:37:53', '2022-04-21 09:37:53', NULL, 2, 270, NULL, NULL, 1, 1, 0),
(272, 'daphne@deventerschouwburg.nl', 'deventerschouwburg_portrait', '$2y$10$GIKwd5snuCKJ0C2iGQL.1.qpwipVNESfmTfx5fEoAMPh9AxC0vfmy', 'Deventer', 'Schouwburg', NULL, 'nl', 1, '2022-04-21 09:37:53', '2022-04-21 09:37:53', NULL, 2, 270, NULL, NULL, 1, 1, 0),
(273, 'denieuwekolk@nep.mail', 'denieuwekolk', '$2y$10$I2i4MsuAA00LErKcsKOIxemopD0mYN1NLTqia.sKifL1pUHN.7W7.', 'de nieuwe kolk', 'portrait', NULL, 'en', 1, '2022-05-30 11:59:29', '2022-06-02 07:29:14', NULL, 2, 271, NULL, NULL, 1, 1, 0),
(274, 'max@screenimpact.nl', 'reumazorg', '$2y$10$XD5hqDxvL5QofzDKEiRFCO3SOLYSFDIgXApR7SL3OeP0EkFJOPvU6', 'Reumazorg', 'Admin', NULL, 'nl', 1, '2022-06-22 14:08:24', '2022-06-24 10:03:38', NULL, 2, 272, NULL, NULL, 1, 1, 0),
(275, 'beheer@buurtpunt.com', 'grootambacht', '$2y$10$a4EuvluEi/gij1OmZSAUEeTyHknMwKLJOZkhH4/nCw2PSiLK17psK', 'Buurtpunt', 'Groot Ambacht', NULL, 'nl', 1, '2022-07-12 12:01:59', '2022-07-12 12:01:59', NULL, 2, 273, NULL, NULL, 1, 1, 0),
(276, 'kaan@screenimpact.nl', 'syncplay', '$2y$10$foFMuaIUdCKzahaRwlBOLOou4nCNZr9jziwDfk5HhyphyVK1WafNW', 'kaan', 'aydin', NULL, 'en', 1, '2022-08-10 13:04:38', '2022-08-10 13:04:38', NULL, 2, 274, NULL, NULL, 1, 1, 0),
(277, 'w.bos@vesteda.com', 'wim', '$2y$10$YRem35ltw8p0ebv/euqFZub6HpLYe38LwZhHU6dAl4B.8i3TEA.XG', 'Wim', 'Bos', NULL, 'nl', 1, '2022-10-11 11:45:20', '2022-10-11 11:46:09', NULL, 4, 275, NULL, 162, 1, 1, 0),
(278, 'jrijnhout@space-expo.nl', 'spaceexpo', '$2y$10$xoJUXNYZcTmi58tixeesRuNacEcbMA5zePMocDnbPoJbqB2YU/LoK', 'Space Expo', 'Liggend', NULL, 'nl', 1, '2022-10-27 12:08:10', '2022-11-01 12:37:33', NULL, 2, 276, NULL, NULL, 1, 1, 0),
(279, 'jrijnhout@space-expo.nl', 'spaceexpo_portrait', '$2y$10$eqat0TfTQ88flWKGosOy4.5k2i2UrhRRcUO7DAXCMMUDhEcqW679u', 'Space Expo', 'Portrait', NULL, 'nl', 1, '2022-10-27 12:13:16', '2022-11-01 12:37:54', NULL, 2, 277, NULL, NULL, 1, 1, 0),
(280, 'lvschie@space-expo.nl', 'lvschie', '$2y$10$KWatwdQpLPWY1lzIxYcr.ebX3bRHqwW7Z.DJcZ703ZcHXhDgqUeDO', 'Lani van Schie', 'Landscape', NULL, 'nl', 1, '2022-11-08 11:03:11', '2022-11-08 11:03:11', NULL, 3, 278, NULL, 278, 1, 1, 0),
(281, 'mslooten@space-expo.nl', 'mslooten', '$2y$10$N6Pn52pcXvya705KPF2DOOwcGULYoNFXFoT6r7vXfS4dYxRHXo3F.', 'Marjolein Slooten', 'Landscape', NULL, 'nl', 1, '2022-11-08 11:04:34', '2022-11-08 11:04:34', NULL, 3, 279, NULL, 278, 1, 1, 0),
(282, 'cberkheij@space-expo.nl', 'cberkheij', '$2y$10$Zy38jBSYhhBVs0NANeZHNOO8ZzYcVmE0gHQKDC/K9/UO6lugBWMJO', 'Caroline Berkheij', 'Landscape', NULL, 'nl', 1, '2022-11-08 11:06:06', '2022-11-08 11:06:06', NULL, 3, 280, NULL, 278, 1, 1, 0),
(283, 'jwvdplas@space-expo.nl', 'jwvdplas', '$2y$10$NAkPYa27bK1qhkd3B75qBeyG97FdC5xEuOYqZpZvq51ay0qufx5Gi', 'Jan-Willem van der Plas', 'Landscape', NULL, 'nl', 1, '2022-11-08 11:07:11', '2022-11-08 11:07:11', NULL, 3, 281, NULL, 278, 1, 1, 0),
(284, 'jrijnhout@space-expo.nl', 'jrijnhout', '$2y$10$0PonSYNi9ZxAnVMWGF7ju.PXxGYYgtqSI0lKVJlrCJ.tU0RZPPdvO', 'Jelle Rijnhout', 'Landscape', NULL, 'nl', 1, '2022-11-08 11:08:00', '2022-11-08 11:08:00', NULL, 3, 282, NULL, 278, 1, 1, 0),
(285, 'lvschie@space-expo.nl', 'lvschie_portrait', '$2y$10$hCSBoP873h0.00kdIVWHo.tqVO/vV1GEb2r.cumRKHHemt3C3NOAu', 'Lani van Schie', 'Portrait', NULL, 'nl', 1, '2022-11-08 11:09:24', '2022-11-08 11:09:24', NULL, 3, 283, NULL, 279, 1, 1, 0),
(286, 'mslooten@space-expo.nl', 'mslooten_portrait', '$2y$10$I73Qh12XdvPPBAXsRiCTkOnqG1pEMSnbuy1IbxqLF6JWwgDTachDG', 'Marjolein Slooten', 'Portrait', NULL, 'nl', 1, '2022-11-08 11:10:27', '2022-11-08 11:10:27', NULL, 3, 284, NULL, 279, 1, 1, 0),
(287, 'cberkheij@space-expo.nl', 'cberkheij_portrait', '$2y$10$UomSULWaconaQZjEW4gGOOq94Uec1.DW.Fxenkkq1i4mhJ1tX2caK', 'Caroline Berkheij', 'Portrait', NULL, 'nl', 1, '2022-11-08 11:12:25', '2022-11-08 11:12:25', NULL, 3, 285, NULL, 279, 1, 1, 0),
(288, 'jwvdplas@space-expo.nl', 'jwvdplas_portrait', '$2y$10$pUdZmPmyHIhYBMDi78Soi.i0e.zX159IffZCRBWOvnO77fcRqkh4i', 'Jan-Willem van der Plas', 'Portrait', NULL, 'nl', 1, '2022-11-08 11:14:10', '2022-11-08 11:14:10', NULL, 3, 286, NULL, 279, 1, 1, 0),
(289, 'jrijnhout@space-expo.nl', 'jrijnhout_portrait', '$2y$10$ZI1nqyPamrBwrTqhOxADG.XJsSUEVFuJa41gvhm8MGGXZMOC4tjL2', 'Jelle Rijnhout', 'Portrait', NULL, 'nl', 1, '2022-11-08 11:15:27', '2022-11-08 11:15:27', NULL, 3, 287, NULL, 279, 1, 1, 0),
(290, 'mariekeduijst@musisenstadstheater.nl', 'musis', '$2y$10$wrCMj/T1jjgmQlOe53BT1.ned00A7jXK7esjPc07cljqKorObZEjm', 'Musis', 'Demo', NULL, 'nl', 1, '2022-12-07 09:19:40', '2022-12-07 09:19:40', NULL, 2, 288, NULL, NULL, 1, 1, 0),
(291, 'arjan@tree11.nl', 'tree11', '$2y$10$Sa7SNOwkscmQuOCqAGE5quu1JdtfqKmMP2OVxi..ZE1jYLCUgKkWi', 'Tree11', 'Admin', NULL, 'nl', 1, '2022-12-12 15:10:33', '2022-12-13 14:20:08', NULL, 2, 289, NULL, NULL, 1, 1, 0),
(292, 'poirters.praktijkmanager@gmail.com', 'poirters', '$2y$10$uE7SHPGql.xapTjNXhip0./Cpbo2Q79zR2BbsKhrLAD6xej8h7/Gq', 'Anne', 'Poirters', NULL, 'en', 1, '2022-12-15 10:57:02', '2022-12-15 10:57:02', NULL, 3, 290, NULL, 34, 1, 1, 0),
(293, 'wilmink muziekcentrum en kleine willem', 'wilmink muziekcentrum en kleine willem', '$2y$10$uE7SHPGql.xapTjNXhip0./Cpbo2Q79zR2BbsKhrLAD6xej8h7/Gq', 'Anne', 'wilmink muziekcentrum en kleine willem', NULL, 'wilmink muziekcentrum en kleine willem', 1, '2022-12-15 10:57:02', '2022-12-15 10:57:02', NULL, 3, 290, NULL, 34, 1, 1, 0),
(294, 'stedelijk', 'stedelijk museum\r\n', '$2y$10$uE7SHPGql.xapTjNXhip0./Cpbo2Q79zR2BbsKhrLAD6xej8h7/Gq', 'Anne', 'stedelijk museum\n', NULL, 'stedelijk museum\n', 1, '2022-12-15 10:57:02', '2022-12-15 10:57:02', NULL, 3, 290, NULL, 34, 1, 1, 0),
(295, 'hoge veluwe', 'hoge veluwe', '$2y$10$uE7SHPGql.xapTjNXhip0./Cpbo2Q79zR2BbsKhrLAD6xej8h7/Gq', 'hoge veluwe', 'hoge veluwe', NULL, 'hoge veluwe', 1, '2022-12-15 10:57:02', '2022-12-15 10:57:02', NULL, 3, 290, NULL, 34, 1, 1, 0),
(299, '', 'musis\r\n', '', '', '', NULL, 'en', 1, '2023-03-15 11:03:43', '2023-03-15 11:03:43', NULL, NULL, NULL, NULL, NULL, 1, 1, 0),
(300, 'info@screenimpact.nl', 'cvdks\r\n', '$2y$10$OjjXjdBiDRaCKjBr5o4NqeJvTzI29SQ3nmGrGk6m1uXHHH0caK7LG', 'Max', 'Miermans', NULL, 'en', 1, '2017-03-29 07:45:18', '2017-08-16 14:24:42', NULL, 1, 9, NULL, NULL, 1, 1, 0),
(301, 'info@screenimpact.nl', 'bijlmerpark theater', '$2y$10$OjjXjdBiDRaCKjBr5o4NqeJvTzI29SQ3nmGrGk6m1uXHHH0caK7LG', 'Max', 'Miermans', NULL, 'en', 1, '2017-03-29 07:45:18', '2017-08-16 14:24:42', NULL, 1, 9, NULL, NULL, 1, 1, 0),
(302, '', '0 ScreenImpact Vooraad', '', '', '', NULL, 'en', 1, '2023-03-22 08:50:34', '2023-03-22 08:50:34', NULL, NULL, NULL, NULL, NULL, 1, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pakket`
--
ALTER TABLE `pakket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screens_userid_foreign` (`userId`),
  ADD KEY `screens_screenshotfileid_foreign` (`screenshotFileId`),
  ADD KEY `screens_htmloverlayid_foreign` (`htmlOverlayId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_roleid_foreign` (`roleId`),
  ADD KEY `users_settingid_foreign` (`settingId`),
  ADD KEY `users_avatar_foreign` (`avatar`),
  ADD KEY `users_masterid_foreign` (`masterId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pakket`
--
ALTER TABLE `pakket`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screens`
--
ALTER TABLE `screens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pakket`
--
ALTER TABLE `pakket`
  ADD CONSTRAINT `pakket_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
