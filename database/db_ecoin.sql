-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2018 at 06:39 AM
-- Server version: 5.6.36-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_ecoin`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `activityID` int(11) NOT NULL AUTO_INCREMENT,
  `logInTimeDate` datetime NOT NULL,
  `urlVisited` varchar(255) NOT NULL,
  `urlVisitTimeDate` datetime NOT NULL,
  `logOutTimeDate` datetime DEFAULT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`activityID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=466 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activityID`, `logInTimeDate`, `urlVisited`, `urlVisitTimeDate`, `logOutTimeDate`, `userID`) VALUES
(182, '2018-01-09 05:58:33', '/eCoin/index.php', '2018-01-09 05:58:33', NULL, 38),
(183, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 05:59:40', NULL, 38),
(184, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 05:59:57', NULL, 38),
(185, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:14', NULL, 38),
(186, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:16', NULL, 38),
(187, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:35', NULL, 38),
(188, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:37', NULL, 38),
(189, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:50', NULL, 38),
(190, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:51', NULL, 38),
(191, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:08:53', NULL, 38),
(192, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:10:25', NULL, 38),
(193, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:10:35', NULL, 38),
(194, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:10:37', NULL, 38),
(195, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:13:23', NULL, 38),
(196, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:13:25', NULL, 38),
(197, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:13:38', NULL, 38),
(198, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:13:40', NULL, 38),
(199, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:14:08', NULL, 38),
(200, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:14:10', NULL, 38),
(201, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:14:18', NULL, 38),
(202, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:14:19', NULL, 38),
(203, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:15:07', NULL, 38),
(204, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:15:08', NULL, 38),
(205, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:15:49', NULL, 38),
(206, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:15:51', NULL, 38),
(207, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:17:02', NULL, 38),
(208, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:17:03', NULL, 38),
(209, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:17:14', NULL, 38),
(210, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:17:16', NULL, 38),
(211, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:20:07', NULL, 38),
(212, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:20:09', NULL, 38),
(213, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:48:33', NULL, 38),
(214, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:48:43', NULL, 38),
(215, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:48:44', NULL, 38),
(216, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:15', NULL, 38),
(217, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:17', NULL, 38),
(218, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:20', NULL, 38),
(219, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:40', NULL, 38),
(220, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:42', NULL, 38),
(221, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:55', NULL, 38),
(222, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:49:57', NULL, 38),
(223, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:50:23', NULL, 38),
(224, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 06:50:25', NULL, 38),
(225, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:17:45', NULL, 38),
(226, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:17:54', NULL, 38),
(227, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:21:29', NULL, 38),
(228, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:21:31', NULL, 38),
(229, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:23:49', NULL, 38),
(230, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:23:52', NULL, 38),
(231, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:24:20', NULL, 38),
(232, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:24:21', NULL, 38),
(233, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:24:24', NULL, 38),
(234, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:24:36', NULL, 38),
(235, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:24:38', NULL, 38),
(236, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:25:17', NULL, 38),
(237, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:25:40', NULL, 38),
(238, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:25:43', NULL, 38),
(239, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:55:49', NULL, 38),
(240, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:55:51', NULL, 38),
(241, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:56:45', NULL, 38),
(242, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:58:22', NULL, 38),
(243, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 07:58:24', NULL, 38),
(244, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:00:52', NULL, 38),
(245, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:00:53', NULL, 38),
(246, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:02:00', NULL, 38),
(247, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:02:02', NULL, 38),
(248, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:05:32', NULL, 38),
(249, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:05:51', NULL, 38),
(250, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:05:53', NULL, 38),
(251, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:08:20', NULL, 38),
(252, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:08:28', NULL, 38),
(253, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:08:30', NULL, 38),
(254, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:13:05', NULL, 38),
(255, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:13:07', NULL, 38),
(256, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:13:18', NULL, 38),
(257, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:13:19', NULL, 38),
(258, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:13:33', NULL, 38),
(259, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:28:49', NULL, 38),
(260, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:32:24', NULL, 38),
(261, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:32:50', NULL, 38),
(262, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:32:55', NULL, 38),
(263, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:33:04', NULL, 38),
(264, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:33:06', NULL, 38),
(265, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:33:36', NULL, 38),
(266, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:36:08', NULL, 38),
(267, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:36:32', NULL, 38),
(268, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:40:07', NULL, 38),
(269, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:40:11', NULL, 38),
(270, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:40:15', NULL, 38),
(271, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:40:47', NULL, 38),
(272, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:44:13', NULL, 38),
(273, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:44:26', NULL, 38),
(274, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:45:46', NULL, 38),
(275, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:45:55', NULL, 38),
(276, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:51:12', NULL, 38),
(277, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:53:36', NULL, 38),
(278, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:53:39', NULL, 38),
(279, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:54:02', NULL, 38),
(280, '2018-01-09 05:58:33', '/eCoin/index.php', '2018-01-09 08:54:14', NULL, 38),
(281, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:58:23', NULL, 38),
(282, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:58:25', NULL, 38),
(283, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 08:59:04', NULL, 38),
(284, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 09:00:48', NULL, 38),
(285, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 09:01:55', NULL, 38),
(286, '2018-01-09 05:58:33', '/eCoin/purchase.php', '2018-01-09 09:02:42', NULL, 38),
(287, '2018-01-09 05:58:33', '/eCoin/index.php', '2018-01-09 09:04:44', NULL, 38),
(288, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 09:36:02', NULL, 38),
(289, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:36:04', NULL, 38),
(290, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:36:09', NULL, 38),
(291, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:38:39', NULL, 38),
(292, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:38:41', NULL, 38),
(293, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:38:56', NULL, 38),
(294, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:38:59', NULL, 38),
(295, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:50:20', NULL, 38),
(296, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:50:23', NULL, 38),
(297, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:53:29', NULL, 38),
(298, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:53:32', NULL, 38),
(299, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:59:43', NULL, 38),
(300, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 09:59:47', NULL, 38),
(301, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:00:41', NULL, 38),
(302, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:00:50', NULL, 38),
(303, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:01:05', NULL, 38),
(304, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:01:07', NULL, 38),
(305, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:01:09', NULL, 38),
(306, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:01:32', NULL, 38),
(307, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:01:34', NULL, 38),
(308, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:01:36', NULL, 38),
(309, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:03:00', NULL, 38),
(310, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:03:02', NULL, 38),
(311, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:03:04', NULL, 38),
(312, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:03:41', NULL, 38),
(313, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:03:49', NULL, 38),
(314, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:11:11', NULL, 38),
(315, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:11:14', NULL, 38),
(316, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:13:24', NULL, 38),
(317, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:13:32', NULL, 38),
(318, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:13:34', NULL, 38),
(319, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:15:14', NULL, 38),
(320, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:15:25', NULL, 38),
(321, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:15:28', NULL, 38),
(322, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:18:02', NULL, 38),
(323, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:18:05', NULL, 38),
(324, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:20:27', NULL, 38),
(325, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:23:17', NULL, 38),
(326, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:23:28', NULL, 38),
(327, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:36:03', NULL, 38),
(328, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:37:10', NULL, 38),
(329, '2018-01-09 09:36:02', '/eCoin/register.php', '2018-01-09 10:37:15', NULL, 38),
(330, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:38:21', NULL, 38),
(331, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:38:30', NULL, 38),
(332, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:39:05', NULL, 38),
(333, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:39:27', NULL, 38),
(334, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:40:46', NULL, 38),
(335, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:40:54', NULL, 38),
(336, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:41:06', NULL, 38),
(337, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:41:43', NULL, 38),
(338, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:43:34', NULL, 38),
(339, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:43:37', NULL, 38),
(340, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:44:13', NULL, 38),
(341, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:45:01', NULL, 38),
(342, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:45:15', NULL, 38),
(343, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:45:29', NULL, 38),
(344, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:47:39', NULL, 38),
(345, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:52:33', NULL, 38),
(346, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:53:06', NULL, 38),
(347, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:56:15', NULL, 38),
(348, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:56:40', NULL, 38),
(349, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:57:28', NULL, 38),
(350, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:57:40', NULL, 38),
(351, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:57:44', NULL, 38),
(352, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:57:50', NULL, 38),
(353, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:57:54', NULL, 38),
(354, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:58:06', NULL, 38),
(355, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 10:58:18', NULL, 38),
(356, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 10:58:22', NULL, 38),
(357, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:02:07', NULL, 38),
(358, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:02:19', NULL, 38),
(359, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:02:48', NULL, 38),
(360, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:03:29', NULL, 38),
(361, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:04:08', NULL, 38),
(362, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:04:13', NULL, 38),
(363, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:04:22', NULL, 38),
(364, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:04:36', NULL, 38),
(365, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:06:02', NULL, 38),
(366, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:07:22', NULL, 38),
(367, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:11:27', NULL, 38),
(368, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:12:55', NULL, 38),
(369, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:13:47', NULL, 38),
(370, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:23:07', NULL, 38),
(371, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:23:19', NULL, 38),
(372, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:25:11', NULL, 38),
(373, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:25:18', NULL, 38),
(374, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:25:54', NULL, 38),
(375, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:25:55', NULL, 38),
(376, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:25:56', NULL, 38),
(377, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:26:30', NULL, 38),
(378, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:26:32', NULL, 38),
(379, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:26:33', NULL, 38),
(380, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:27:17', NULL, 38),
(381, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:27:24', NULL, 38),
(382, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:32:35', NULL, 38),
(383, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:32:37', NULL, 38),
(384, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:32:43', NULL, 38),
(385, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:32:50', NULL, 38),
(386, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:43:01', NULL, 38),
(387, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:45:52', NULL, 38),
(388, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:46:12', NULL, 38),
(389, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:47:19', NULL, 38),
(390, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:47:22', NULL, 38),
(391, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:49:45', NULL, 38),
(392, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:50:00', NULL, 38),
(393, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:50:05', NULL, 38),
(394, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:50:11', NULL, 38),
(395, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:51:23', NULL, 38),
(396, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:51:28', NULL, 38),
(397, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:56:17', NULL, 38),
(398, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 11:56:36', NULL, 38),
(399, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 11:57:14', NULL, 38),
(400, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:00:52', NULL, 38),
(401, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:00:56', NULL, 38),
(402, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:01:36', NULL, 38),
(403, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:01:48', NULL, 38),
(404, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:01:52', NULL, 38),
(405, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:05:04', NULL, 38),
(406, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:05:15', NULL, 38),
(407, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:05:19', NULL, 38),
(408, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:05:41', NULL, 38),
(409, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:05:45', NULL, 38),
(410, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:05:57', NULL, 38),
(411, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:06:01', NULL, 38),
(412, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:06:05', NULL, 38),
(413, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:09:49', NULL, 38),
(414, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:09:56', NULL, 38),
(415, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:10:56', NULL, 38),
(416, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:11:00', NULL, 38),
(417, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:12:08', NULL, 38),
(418, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:12:12', NULL, 38),
(419, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:14:31', NULL, 38),
(420, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:15:28', NULL, 38),
(421, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:15:31', NULL, 38),
(422, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:17:56', NULL, 38),
(423, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:17:59', NULL, 38),
(424, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:18:10', NULL, 38),
(425, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:25:26', NULL, 38),
(426, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:25:30', NULL, 38),
(427, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:27:36', NULL, 38),
(428, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:32:56', NULL, 38),
(429, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:33:03', NULL, 38),
(430, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:33:05', NULL, 38),
(431, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:33:07', NULL, 38),
(432, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:33:12', NULL, 38),
(433, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:33:18', NULL, 38),
(434, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:33:22', NULL, 38),
(435, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:34:38', NULL, 38),
(436, '2018-01-09 09:36:02', '/eCoin/purchase.php', '2018-01-09 12:34:45', NULL, 38),
(437, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:34:48', NULL, 38),
(438, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:39:45', NULL, 38),
(439, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:47:10', NULL, 38),
(440, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:48:40', NULL, 38),
(441, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:50:11', NULL, 38),
(442, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:51:07', NULL, 38),
(443, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:51:25', NULL, 38),
(444, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:51:57', NULL, 38),
(445, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:52:55', NULL, 38),
(446, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:53:53', NULL, 38),
(447, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:54:03', NULL, 38),
(448, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 12:54:48', NULL, 38),
(449, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:02:48', NULL, 38),
(450, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:03:36', NULL, 38),
(451, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:04:38', NULL, 38),
(452, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:05:59', NULL, 38),
(453, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:06:07', NULL, 38),
(454, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:07:40', NULL, 38),
(455, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:14:40', NULL, 38),
(456, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:16:22', NULL, 38),
(457, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:17:41', NULL, 38),
(458, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:18:02', NULL, 38),
(459, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:25:12', NULL, 38),
(460, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:28:10', NULL, 38),
(461, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:28:48', NULL, 38),
(462, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:32:54', NULL, 38),
(463, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:33:18', NULL, 38),
(464, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:33:46', NULL, 38),
(465, '2018-01-09 09:36:02', '/eCoin/index.php', '2018-01-09 13:33:56', NULL, 38);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE IF NOT EXISTS `card` (
  `cardID` int(11) NOT NULL AUTO_INCREMENT,
  `cardType` enum('American Express','Master Card','Visa Credit Card','Visa Debit Card') NOT NULL,
  `cardName` varchar(40) NOT NULL,
  `cardNumber` bigint(16) NOT NULL,
  `expiryDate` date NOT NULL,
  `securityCode` int(3) NOT NULL,
  `billingAddress` varchar(40) NOT NULL,
  `billingPostCode` varchar(20) NOT NULL,
  `addedDate` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`cardID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`cardID`, `cardType`, `cardName`, `cardNumber`, `expiryDate`, `securityCode`, `billingAddress`, `billingPostCode`, `addedDate`, `userID`) VALUES
(8, 'Master Card', 'Mohammed Jammeh', 4376, '2021-04-01', 432, '413 Beverley Road', 'HU5 1LX', '2018-01-09 09:02:42', 38),
(9, 'Visa Debit Card', 'Mohammed Jammeh', 4683, '2023-08-01', 234, '413 Beverley Road', 'HU5 1LX', '2018-01-09 11:07:22', 38);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `transactionDate` datetime NOT NULL,
  `transactionType` enum('in','out') NOT NULL,
  `transactorID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `transactorID` (`transactorID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionID`, `transactionDate`, `transactionType`, `transactorID`, `userID`) VALUES
(4, '2018-01-09 12:34:46', 'in', 1, 38);

-- --------------------------------------------------------

--
-- Table structure for table `transactor`
--

CREATE TABLE IF NOT EXISTS `transactor` (
  `transactorID` int(11) NOT NULL,
  `transactorName` varchar(40) NOT NULL,
  PRIMARY KEY (`transactorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactor`
--

INSERT INTO `transactor` (`transactorID`, `transactorName`) VALUES
(1, 'Mohammed Jammeh');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `secretCode` varchar(64) NOT NULL,
  `secretSalt` varchar(32) NOT NULL,
  `pubKey` varchar(800) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(40) NOT NULL,
  `postCode` varchar(20) NOT NULL,
  `joined` datetime NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `salt`, `secretCode`, `secretSalt`, `pubKey`, `name`, `email`, `phone`, `address`, `postCode`, `joined`) VALUES
(38, 'itsyourboymo', '6d9be7244158aa719e6b3946568a97a4a712d36e587852e24ae726c15cb653a6', '¼	xé}m3rÐ\Z…¤<êL×™µü4#ÜÄõ¢”Ñ5‰', '182a5fb56f24ddb7b76f958f5ac66c53d1187d9efedf7be1b002b19723639b28', 't?&/pt…MÕ5Dfåø_³‚÷èA}2ƒK¢¦ÌîÎ\n', '-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAuIbmSDOPVyZBSdhFqGLf\nyQkkHcbSoWzLwaWSaSSIkIbQxrNnPvYOd7LvQ8lpVdNjOloPFQ7NGxSQPG7xfo/d\nsSa2EuUYQ282srO42t5XVFJakJFhA+AIoQV7SlBOOcZSrRRKuMCq702hrAyLwPXy\nkUKp2DnvV8QEJ7HwvF0vhS4jotXPWqjufPmX+8QrkDQd6d5pN21glLdajGmfhDNQ\nyFvNBMASUhFOo7Krrfbsas2KLJMmT84BTvy1b3GdgIY0Iu1y3w7AJTpVBjKulVG4\nwqh9Xoyu8acoyOeB2MvLL1jwjpS6Nd03aBfve9QwQeGi5STEUjF2r8EVGIhyAst/\nq2iYXNBym+HtrwbWdZd7vY6nHJQT1rOWVfGkfgw620lpV0vVbudMJCOHD4/5+jnV\n20Bm5ip1q65D874Bw0EIlW4sVAtvcqcBqvnIpinK0RqVOjAWOZVdXRuiEGi+cui9\nN5fUM2jJJaoT01bNMalgy70UICzFZt/HRxSBOZxsrBX38+U1WEv3RGGSMqv9noe4\nOxpTozB15P4AuNBhXR4C2dLs25RYtem0cFwNgC6360St0xDWlHG6lGB8OCO04LHb\nFPOA8ANyyKCudl6/u797vZR5eQSnsium4dV5Ti4JRn93tNFLjhK610jV4gov6cP2\nHPAijdvvNl5MghDmwy+ij7kCAwEAAQ==\n-----END PUBLIC KEY-----\n', 'Mohammed Jammeh', 'mohammedjammeh@yahoo.com', '07506259330', '413 Beverley Road', 'HU5 1LX', '2018-01-09 05:35:48');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON UPDATE CASCADE;

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`transactorID`) REFERENCES `transactor` (`transactorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
