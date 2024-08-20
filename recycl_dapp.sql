-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 16, 2023 at 06:56 PM
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
-- Database: `recycl_dapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `imageUrl`, `createdAt`, `updatedAt`) VALUES
(1, 'Paper', 'This group is for paper waste materials', './paperImages/image1.jpg', '2023-01-01 14:35:55', '2023-01-01 14:35:55'),
(2, 'Building Materials', 'This group is for building waste materials like bricks, doors, roof tops etc', './buildingImages/image8.jpg', '2023-01-01 14:37:21', '2023-01-01 14:40:33'),
(3, 'Glass Waste Materials', 'This group is for glass waste materials like bottles', './glassImages/image3.jpg', '2023-01-01 14:38:21', '2023-01-01 14:38:21'),
(4, 'Cloths Waste Materials', 'Clothing waste materials ', './glassImages/image11.jpg', '2023-01-01 14:42:01', '2023-01-01 14:42:01'),
(6, 'Laptops for Recycling', 'We are disposing 100kg of laptops for recycling', './glassImages/image17.jpg', '2023-01-01 14:42:07', '2023-01-01 15:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `materialGroups`
--

CREATE TABLE `materialGroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `materialGroupId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletterSubscriptions`
--

CREATE TABLE `newsletterSubscriptions` (
  `id` int(11) NOT NULL,
  `dateOfSubscription` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `totalQuantity` int(11) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservedProductModels`
--

CREATE TABLE `reservedProductModels` (
  `id` int(11) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `postedProductId` int(11) DEFAULT NULL,
  `reserverUserId` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservedProductModels`
--

INSERT INTO `reservedProductModels` (`id`, `imageUrl`, `postedProductId`, `reserverUserId`, `description`, `createdAt`, `updatedAt`) VALUES
(1, './images/image1.jp', NULL, NULL, '100 kg glass waste sale in Johannesburg', '2023-01-02 01:43:46', '2023-01-02 01:43:46'),
(2, './reservedProductsImages/image22.jp', 3, 3, 'Reserve testing ', '2023-01-02 01:50:26', '2023-01-02 01:50:26'),
(3, './reservedProductsImages/image45.jp', 3, 2, 'Reserve waste bottles for Coca cola', '2023-01-02 01:49:15', '2023-01-02 01:49:15'),
(5, './reservedProductsImages/image45.jp', 3, 2, 'Reserve waste bottles for Coca cola', '2023-01-02 01:50:47', '2023-01-02 01:50:47'),
(6, './reservedProductsImages/image45.jp', 5, 124, 'Reserve waste bottles for Coca cola', '2023-01-12 17:42:27', '2023-01-12 17:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userPostedProductId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesTransactions`
--

CREATE TABLE `salesTransactions` (
  `id` int(11) NOT NULL,
  `sellerId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  `unitPrice` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesTransactions`
--

INSERT INTO `salesTransactions` (`id`, `sellerId`, `buyerId`, `unitPrice`, `quantity`, `units`, `productId`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 1, 3, 15, NULL, 'tonnes', 4, 'Samsung buys Standard Bank waste bricks', '2023-01-02 00:42:26', '2023-01-02 00:42:26'),
(2, 1, 3, 15, 200, 'tonnes', 4, 'Samsung buys Standard Bank waste bricks', '2023-01-02 00:45:17', '2023-01-02 00:45:17'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-02 16:46:26', '2023-01-02 16:46:26'),
(5, NULL, NULL, NULL, 10, '5', NULL, 'Motorola', '2023-01-05 11:46:55', '2023-01-05 11:46:55'),
(6, NULL, NULL, NULL, 10, '4', NULL, 'Recicling dapp', '2023-01-05 23:00:26', '2023-01-05 23:00:26'),
(7, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:09:12', '2023-01-05 23:09:12'),
(8, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:09:28', '2023-01-05 23:09:28'),
(9, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:09:51', '2023-01-05 23:09:51'),
(10, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:11:17', '2023-01-05 23:11:17'),
(11, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:11:42', '2023-01-05 23:11:42'),
(12, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:11:44', '2023-01-05 23:11:44'),
(13, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:11:50', '2023-01-05 23:11:50'),
(14, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:12:54', '2023-01-05 23:12:54'),
(15, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:12:55', '2023-01-05 23:12:55'),
(16, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:12:58', '2023-01-05 23:12:58'),
(17, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:12:59', '2023-01-05 23:12:59'),
(18, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:13:17', '2023-01-05 23:13:17'),
(19, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:13:33', '2023-01-05 23:13:33'),
(20, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:13:43', '2023-01-05 23:13:43'),
(21, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:13:45', '2023-01-05 23:13:45'),
(22, NULL, NULL, NULL, 12, '5', NULL, 'Administrateur', '2023-01-05 23:13:51', '2023-01-05 23:13:51'),
(23, NULL, NULL, NULL, 12, '6', NULL, 'Administrateur', '2023-01-05 23:14:16', '2023-01-05 23:14:16'),
(24, NULL, NULL, NULL, 12, '6', NULL, 'Administrateur', '2023-01-05 23:30:25', '2023-01-05 23:30:25'),
(25, NULL, NULL, NULL, 12, '6', NULL, 'Administrateur', '2023-01-05 23:30:34', '2023-01-05 23:30:34'),
(26, NULL, NULL, NULL, 8, 'kg', NULL, 'Agents', '2023-01-06 00:18:24', '2023-01-06 00:18:24'),
(27, NULL, NULL, NULL, 10, '10', NULL, 'je viens d\'ajouter pour la deuxieme fois', '2023-01-06 00:26:22', '2023-01-06 00:26:22'),
(28, NULL, NULL, NULL, 10, 'kg', NULL, 'Ubuntu est une systeme open osource', '2023-01-06 01:21:16', '2023-01-06 01:21:16'),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-12 17:20:07', '2023-01-12 17:20:07'),
(30, 1, 124, 15, NULL, 'kg', 5, 'XYZ purchased 100kg of paper plastic from bernaard', '2023-01-12 17:44:35', '2023-01-12 17:44:35'),
(31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:31', '2023-02-26 11:55:31'),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:31', '2023-02-26 11:55:31'),
(33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:31', '2023-02-26 11:55:31'),
(34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:49', '2023-02-26 11:55:49'),
(35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:49', '2023-02-26 11:55:49'),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:49', '2023-02-26 11:55:49'),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:53', '2023-02-26 11:55:53'),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:53', '2023-02-26 11:55:53'),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:55:53', '2023-02-26 11:55:53'),
(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:56:05', '2023-02-26 11:56:05'),
(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:56:05', '2023-02-26 11:56:05'),
(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:56:05', '2023-02-26 11:56:05'),
(43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:58:14', '2023-02-26 11:58:14'),
(44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:58:14', '2023-02-26 11:58:14'),
(45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:58:14', '2023-02-26 11:58:14'),
(46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:59:43', '2023-02-26 11:59:43'),
(47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 11:59:43', '2023-02-26 11:59:43'),
(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:01:06', '2023-02-26 12:01:06'),
(49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:01:06', '2023-02-26 12:01:06'),
(50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:01:06', '2023-02-26 12:01:06'),
(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:01:12', '2023-02-26 12:01:12'),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:01:12', '2023-02-26 12:01:12'),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:01:12', '2023-02-26 12:01:12'),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:02:34', '2023-02-26 12:02:34'),
(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:02:34', '2023-02-26 12:02:34'),
(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:02:34', '2023-02-26 12:02:34'),
(57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:02:37', '2023-02-26 12:02:37'),
(58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:02:37', '2023-02-26 12:02:37'),
(59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:02:37', '2023-02-26 12:02:37'),
(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:26', '2023-02-26 12:04:26'),
(61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:26', '2023-02-26 12:04:26'),
(62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:26', '2023-02-26 12:04:26'),
(63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:28', '2023-02-26 12:04:28'),
(64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:28', '2023-02-26 12:04:28'),
(65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:28', '2023-02-26 12:04:28'),
(66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:51', '2023-02-26 12:04:51'),
(67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:51', '2023-02-26 12:04:51'),
(68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:04:51', '2023-02-26 12:04:51'),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:09:25', '2023-02-26 12:09:25'),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:09:25', '2023-02-26 12:09:25'),
(71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:15:28', '2023-02-26 12:15:28'),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:15:28', '2023-02-26 12:15:28'),
(73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:15:40', '2023-02-26 12:15:40'),
(74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:15:40', '2023-02-26 12:15:40'),
(75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:15:41', '2023-02-26 12:15:41'),
(76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:15:41', '2023-02-26 12:15:41'),
(77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:16:44', '2023-02-26 12:16:44'),
(78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:16:44', '2023-02-26 12:16:44'),
(79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:17:04', '2023-02-26 12:17:04'),
(80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:17:04', '2023-02-26 12:17:04'),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:17:56', '2023-02-26 12:17:56'),
(82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-26 12:17:56', '2023-02-26 12:17:56'),
(83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:54:13', '2023-02-27 01:54:13'),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:54:13', '2023-02-27 01:54:13'),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:54:13', '2023-02-27 01:54:13'),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:55:48', '2023-02-27 01:55:48'),
(87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:55:48', '2023-02-27 01:55:48'),
(88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:55:48', '2023-02-27 01:55:48'),
(89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:56:44', '2023-02-27 01:56:44'),
(90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:56:44', '2023-02-27 01:56:44'),
(91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 01:56:44', '2023-02-27 01:56:44'),
(92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 02:06:47', '2023-02-27 02:06:47'),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 02:06:47', '2023-02-27 02:06:47'),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 02:06:47', '2023-02-27 02:06:47'),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 02:06:47', '2023-02-27 02:06:47'),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 02:06:47', '2023-02-27 02:06:47'),
(97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-27 02:06:47', '2023-02-27 02:06:47'),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 17:36:00', '2023-02-28 17:36:00'),
(99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 17:36:00', '2023-02-28 17:36:00'),
(100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 17:36:00', '2023-02-28 17:36:00'),
(101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:26:37', '2023-02-28 18:26:37'),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:26:37', '2023-02-28 18:26:37'),
(103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:26:37', '2023-02-28 18:26:37'),
(104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:26:37', '2023-02-28 18:26:37'),
(105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:32:29', '2023-02-28 18:32:29'),
(106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:32:29', '2023-02-28 18:32:29'),
(107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:32:29', '2023-02-28 18:32:29'),
(108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 18:32:29', '2023-02-28 18:32:29'),
(109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:15:35', '2023-03-02 17:15:35'),
(110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:15:35', '2023-03-02 17:15:35'),
(111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:15:35', '2023-03-02 17:15:35'),
(112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:15:35', '2023-03-02 17:15:35'),
(113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:16:58', '2023-03-02 17:16:58'),
(114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:16:58', '2023-03-02 17:16:58'),
(115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:16:58', '2023-03-02 17:16:58'),
(116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:16:58', '2023-03-02 17:16:58'),
(117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:16:58', '2023-03-02 17:16:58'),
(118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:16:58', '2023-03-02 17:16:58'),
(119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:08', '2023-03-02 17:40:08'),
(120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:08', '2023-03-02 17:40:08'),
(121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:08', '2023-03-02 17:40:08'),
(122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:08', '2023-03-02 17:40:08'),
(123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:38', '2023-03-02 17:40:38'),
(124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:38', '2023-03-02 17:40:38'),
(125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:38', '2023-03-02 17:40:38'),
(126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:40:38', '2023-03-02 17:40:38'),
(127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:46', '2023-03-02 17:42:46'),
(128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:46', '2023-03-02 17:42:46'),
(129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:46', '2023-03-02 17:42:46'),
(130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:46', '2023-03-02 17:42:46'),
(131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:50', '2023-03-02 17:42:50'),
(132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:50', '2023-03-02 17:42:50'),
(133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:50', '2023-03-02 17:42:50'),
(134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-02 17:42:50', '2023-03-02 17:42:50');

-- --------------------------------------------------------

--
-- Table structure for table `userGroups`
--

CREATE TABLE `userGroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` varchar(200) DEFAULT NULL,
  `updatedAt` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userGroups`
--

INSERT INTO `userGroups` (`id`, `name`, `description`, `level`, `type`, `createdAt`, `updatedAt`) VALUES
(1, 'Enterprise', 'Enterprise waster paper collectors', 1, 'paper', '2023-01-01 16:35:26', '2023-01-01 14:58:44.243000'),
(3, 'Household', 'This group is for people and small companies selling waste', 1, 'metal', '2023-01-01 14:49:06.789000', '2023-01-01 14:49:06.789000'),
(4, 'Household', 'This group is for people and small companies selling waste', 2, 'metal', '2023-01-01 14:52:47.064000', '2023-01-01 14:52:47.064000'),
(5, 'Household', 'This group is for people and small companies selling waste', 1, 'metal', '2023-01-02 08:27:12.102000', '2023-01-02 08:27:12.102000');

-- --------------------------------------------------------

--
-- Table structure for table `userPostedProducts`
--

CREATE TABLE `userPostedProducts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('Sale','Reserved','Sold') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userPostedProducts`
--

INSERT INTO `userPostedProducts` (`id`, `title`, `description`, `price`, `quantity`, `units`, `imageUrl`, `categoryId`, `userId`, `createdAt`, `updatedAt`, `status`) VALUES
(29, 'sardine anny', 'Anny est une marque de sardines traditionnelles pleines de saveurs répondant à des', 100, 10, 'kg', './laptopsImages/image19.jpg', 4, 3, '2023-01-14 21:10:12', '2023-01-14 21:10:12', 'Sale'),
(31, 'bouteille lavie', 'Découvrez nos purificateurs d\'eau LaVie. Un produit innovant qui permet d\'enlever le goût du chlore de l\'eau de votre robinet.', 20, 10000, 'tonnes', './laptopsImages/image19.jpg', 2, 3, '2023-01-14 21:26:56', '2023-01-14 21:26:56', 'Sale'),
(41, 'Glass', 'Glass test', 100, 21, 'KL', './laptopsImages/image19.jpg', 3, 3, '2023-01-30 08:44:13', '2023-01-30 08:44:13', 'Sale'),
(44, 'Shred-Tech\'s FATSO', 'Shred-Tech\'s approach to the Fatso design has been to use successful legacy products as a benchmark', 90000, 100, 'KL', './laptopsImages/image19.jpg', 2, 3, '2023-03-02 17:37:53', '2023-03-02 17:37:53', 'Sale');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `digitalAddress` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `registerId` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `provinceOrState` varchar(255) DEFAULT NULL,
  `townOrCity` varchar(255) DEFAULT NULL,
  `streetAddress` text DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `latlong` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usersGroupsId` int(11) DEFAULT NULL,
  `newsletterSubscriptionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company`, `digitalAddress`, `email`, `registerId`, `phone`, `imageUrl`, `password`, `country`, `provinceOrState`, `townOrCity`, `streetAddress`, `zipCode`, `latlong`, `createdAt`, `updatedAt`, `usersGroupsId`, `newsletterSubscriptionId`) VALUES
(1, 'Standard Bank', '786', NULL, 2343, '+27731820631', NULL, '12345', 'South Africa', 'Gauteng', 'Johanesburg', '76 Kind Street', '8700', '-26.2681212,28.0506406', '2023-01-01 11:45:42', '2023-01-01 11:45:42', NULL, NULL),
(2, 'Coca Cola', '7816', NULL, 234233, '+27731820632', NULL, '123456', 'South Africa', 'Gauteng', 'Johanesburg', '45 Fortune Street', '2100', '-26.0145589,28.1273711', '2023-01-01 11:48:10', '2023-01-01 11:48:10', NULL, NULL),
(3, 'Samsung', '7216', NULL, 2324233, '+27731820632', NULL, '128456', 'South Africa', 'Gauteng', 'Johanesburg', '097 Gilbert Street', '2100', '-26.0145589,28.1273711', '2023-01-01 11:52:36', '2023-01-01 11:52:36', NULL, NULL),
(5, 'Green Hills Restuarant', '7216', NULL, 2324233, '+27731820632', NULL, '128456', 'South Africa', 'Gauteng', 'Johanesburg', '097 Gilbert Street', '2100', '-26.0145589,28.1273711', '2023-01-01 11:59:21', '2023-01-01 15:10:19', 4, NULL),
(28, 'Samsung', '7216', NULL, 2324233, '+27731820632', './images/image3.jpg', '128456', 'South Africa', 'Gauteng', 'Johanesburg', '097 Gilbert Street', '2100', '-26.0145589,28.1273711', '2023-01-02 13:50:26', '2023-01-02 13:50:26', 4, NULL),
(39, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:16:45', '2023-01-02 14:16:45', 1, NULL),
(40, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:17:34', '2023-01-02 14:17:34', 1, NULL),
(41, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:20:43', '2023-01-02 14:20:43', 1, NULL),
(42, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:20:56', '2023-01-02 14:20:56', 1, NULL),
(43, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:20:57', '2023-01-02 14:20:57', 1, NULL),
(44, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:23:17', '2023-01-02 14:23:17', 1, NULL),
(45, 'tobb', '345', 'besi@tobb.co.za', 123, '9943747484847', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:23:18', '2023-01-02 14:23:18', 1, NULL),
(47, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:25:11', '2023-01-02 14:25:11', 1, NULL),
(48, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:25:29', '2023-01-02 14:25:29', 1, NULL),
(49, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:25:41', '2023-01-02 14:25:41', 1, NULL),
(50, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:26:00', '2023-01-02 14:26:00', 1, NULL),
(51, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:26:16', '2023-01-02 14:26:16', 1, NULL),
(52, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:26:46', '2023-01-02 14:26:46', 1, NULL),
(53, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:33:49', '2023-01-02 14:33:49', 1, NULL),
(54, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:34:06', '2023-01-02 14:34:06', 1, NULL),
(55, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:34:09', '2023-01-02 14:34:09', 1, NULL),
(56, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:34:13', '2023-01-02 14:34:13', 1, NULL),
(57, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:34:36', '2023-01-02 14:34:36', 1, NULL),
(58, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:34:38', '2023-01-02 14:34:38', 1, NULL),
(59, 'uuuuu', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, '1234', NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:36:59', '2023-01-02 14:36:59', 1, NULL),
(61, 'sdcss', '345444', 'besi@tobb.co.za', 1232222, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:39:34', '2023-01-02 14:39:34', 1, NULL),
(62, 'sdcss', '345444', 'besi@tobb.co.za', 1232222, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:41:04', '2023-01-02 14:41:04', 1, NULL),
(63, 'sdcss', '345444', 'besi@tobb.co.za', 1232222, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:41:10', '2023-01-02 14:41:10', 1, NULL),
(64, 'sdcss', '345444', 'besi@tobb.co.za', 1232222, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:41:13', '2023-01-02 14:41:13', 1, NULL),
(65, 'sdcss', '345444', 'besi@tobb.co.za', 1232222, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:42:00', '2023-01-02 14:42:00', 1, NULL),
(66, 'sdcss', '345444', 'besi@tobb.co.za', 1232222, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:42:04', '2023-01-02 14:42:04', 1, NULL),
(67, 'sdcss', '345444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:43:16', '2023-01-02 14:43:16', 1, NULL),
(68, 'sdcss', '345444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:43:20', '2023-01-02 14:43:20', 1, NULL),
(69, 'sdcss', '345444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:43:22', '2023-01-02 14:43:22', 1, NULL),
(70, 'sdcss', '345444', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 14:43:25', '2023-01-02 14:43:25', 1, NULL),
(71, 'Mercer', '4437216', NULL, 234424233, '+277431820632', './images/image5.jpg', '1228456', 'South Africa', 'Gauteng', 'Johanesburg', '997 Musa Street', '2100', '-26.0145539,28.1278711', '2023-01-02 14:47:51', '2023-01-02 16:56:38', 1, NULL),
(72, 'tobb', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 16:57:53', '2023-01-02 16:57:53', 1, NULL),
(73, 'wims', '7216', 'cto@wims.io', 2324233, '+27731820632', './images/image3.jpg', '128456', 'South Africa', 'Gauteng', 'Johanesburg', '097 Gilbert Street', '2100', '-26.0145589,28.1273711', '2023-01-02 17:24:04', '2023-01-02 17:24:04', 4, NULL),
(74, 'tobb', '345444', 'besi@tobb.co.za', 1232222, '9943747484847333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 17:25:26', '2023-01-02 17:25:26', 1, NULL),
(75, 'Recyclidng Dapp', '345444666', 'cto@wims.io', 2147483647, '9943747484847333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0,0', '2023-01-02 17:34:45', '2023-01-02 17:34:45', 1, NULL),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-06 09:46:42', '2023-01-06 09:46:42', NULL, NULL),
(82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-06 09:49:10', '2023-01-06 09:49:10', NULL, NULL),
(83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-06 10:12:40', '2023-01-06 10:12:40', NULL, NULL),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-06 10:24:29', '2023-01-06 10:24:29', NULL, NULL),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-06 10:25:50', '2023-01-06 10:25:50', NULL, NULL),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-07 17:02:31', '2023-01-07 17:02:31', NULL, NULL),
(87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-07 17:04:00', '2023-01-07 17:04:00', NULL, NULL),
(88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:10:30', '2023-01-08 16:10:30', NULL, NULL),
(89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:13:46', '2023-01-08 16:13:46', NULL, NULL),
(90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:13:49', '2023-01-08 16:13:49', NULL, NULL),
(91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:13:51', '2023-01-08 16:13:51', NULL, NULL),
(92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:23:24', '2023-01-08 16:23:24', NULL, NULL),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:24:48', '2023-01-08 16:24:48', NULL, NULL),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:25:16', '2023-01-08 16:25:16', NULL, NULL),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 16:25:18', '2023-01-08 16:25:18', NULL, NULL),
(96, 'Samsung', '7216', 'besi@tobb.co.za', 2324233, '+27731820632', './images/image3.jpg', '128456', 'South Africa', 'Gauteng', 'Johanesburg', '097 Gilbert Street', '2100', '-26.0145589,28.1273711', '2023-01-08 17:44:07', '2023-01-08 17:44:07', 4, NULL),
(97, 'Tobb Technologies', 'DE43222', 'besi@tobb.co.za', 2324233, '+27731820632', './images/image7.jpg', '47464646', 'South Africa', 'Gauteng', 'Johanesburg', '465 Testing Street', '2100', '-26.0145589,28.1273711', '2023-01-08 17:47:03', '2023-01-08 17:47:03', 4, NULL),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 17:48:59', '2023-01-08 17:48:59', NULL, NULL),
(99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 17:49:17', '2023-01-08 17:49:17', NULL, NULL),
(100, ' Samsung', ' 7216', NULL, 2324233, ' +27731820632', NULL, ' 128456', ' South Africa', ' Gauteng', ' Johanesburg', ' 097 Gilbert Street', ' 2100', ' -26.014558928.1273711', '2023-01-08 17:49:26', '2023-01-08 17:49:26', 4, NULL),
(101, ' Samsung', ' 7216', NULL, 2324233, ' +27731820632', NULL, ' 128456', ' South Africa', ' Gauteng', ' Johanesburg', ' 097 Gilbert Street', ' 2100', ' -26.014558928.1273711', '2023-01-08 17:49:40', '2023-01-08 17:49:40', 4, NULL),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 17:49:45', '2023-01-08 17:49:45', NULL, NULL),
(103, ' Samsung', ' 7216', NULL, 2324233, ' +27731820632', NULL, ' 128456', ' South Africa', ' Gauteng', ' Johanesburg', ' 097 Gilbert Street', ' 2100', ' -26.014558928.1273711', '2023-01-08 17:49:52', '2023-01-08 17:49:52', 4, NULL),
(104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-08 17:53:50', '2023-01-08 17:53:50', NULL, NULL),
(105, ' Samsung', ' 7216', NULL, 2324233, ' +27731820632', NULL, ' 128456', ' South Africa', ' Gauteng', ' Johanesburg', ' 097 Gilbert Street', ' 2100', ' -26.014558928.1273711', '2023-01-08 17:54:47', '2023-01-08 17:54:47', 4, NULL),
(106, 'UPDEV', '10477', 'gentilakili98@gmail.com', 77668, '+243977748166', 'undefined', '1234', 'undefined', 'Goma', 'Gauteng', 'undefined', '2100', '-26.014558928.1273711', '2023-01-08 18:34:31', '2023-01-08 18:34:31', 4, NULL),
(107, 'ISDRGL', '10477', 'gentilakili98@gmail.com', 27354, '+243977748166', 'undefined', '12345', 'undefined', 'Goma', 'Gauteng', 'undefined', '2100', '-26.014558928.1273711', '2023-01-08 18:36:27', '2023-01-08 18:36:27', 4, NULL),
(108, 'UPDEV', '10477', 'gentilakili98@gmail.com', 433333, '+243977748166', 'undefined', '1234', 'undefined', 'Goma', 'Gauteng', 'undefined', '2100', '-26.014558928.1273711', '2023-01-08 18:37:10', '2023-01-08 18:37:10', 4, NULL),
(109, 'UPDEV', '10477', 'gentilakili98@gmail.com', 0, '+243977748166', 'undefined', 'undefined', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'undefined', '57664', '-26.014558928.1273711', '2023-01-08 19:45:35', '2023-01-08 19:45:35', 4, NULL),
(110, 'UPDEV', '10477', 'gentilakili98@gmail.com', 0, '+243977748166', 'undefined', 'undefined', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'undefined', '57664', '-26.014558928.1273711', '2023-01-08 19:45:48', '2023-01-08 19:45:48', 4, NULL),
(111, 'UPDEV', '10477', 'gentilakili98@gmail.com', 0, '+243977748166', 'undefined', 'undefined', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'undefined', '57664', '-26.014558928.1273711', '2023-01-08 19:49:22', '2023-01-08 19:49:22', 4, NULL),
(112, 'UPDEV', '10477', 'gentilakili98@gmail.com', 0, '+243977748166', 'undefined', 'undefined', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'undefined', '57664', '-26.014558928.1273711', '2023-01-08 19:49:41', '2023-01-08 19:49:41', 4, NULL),
(113, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 19:50:13', '2023-01-08 19:50:13', 4, NULL),
(114, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 19:50:35', '2023-01-08 19:50:35', 4, NULL),
(115, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 19:51:03', '2023-01-08 19:51:03', 4, NULL),
(116, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 19:51:16', '2023-01-08 19:51:16', 4, NULL),
(117, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 20:18:45', '2023-01-08 20:18:45', 4, NULL),
(118, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 20:24:51', '2023-01-08 20:24:51', 4, NULL),
(119, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', '1234', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'undefined', '57664', '-26.014558928.1273711', '2023-01-08 20:32:02', '2023-01-08 20:32:02', 4, NULL),
(120, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-08 20:45:31', '2023-01-08 20:45:31', 4, NULL),
(121, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', '1234', 'Congo - Kinshasa', 'undefined', 'GOMA', '10477', '57664', '-26.014558928.1273711', '2023-01-08 20:45:59', '2023-01-08 20:45:59', 4, NULL),
(122, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', 'AKim12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'Q. katido', '57664', '-26.014558928.1273711', '2023-01-09 11:25:58', '2023-01-09 11:25:58', 4, NULL),
(123, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', 'undefined', 'Congo - Kinshasa', 'GOMA', 'GOMA', '10477, av. des écoles', '57664', '-26.014558928.1273711', '2023-01-09 17:21:38', '2023-01-09 17:21:38', 4, NULL),
(124, 'Recycling Promoters', '877665', NULL, 87654, '+27731255441820632', './images/profileImage.jpg', '98765', 'Canada', 'Gauteng', 'Johanesburg', '98 Gilbert Street', '2100', '-26.0145589,28.1273711', '2023-01-12 17:29:23', '2023-01-12 17:29:23', 1, NULL),
(125, 'UPDEV', '10477', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', '10477, av. des écoles', '57664', '-26.014558928.1273711', '2023-01-15 11:25:58', '2023-01-15 11:25:58', 4, NULL),
(126, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', '1234', 'Congo - Kinshasa', 'GOMA', 'GOMA', '125353', '57664', '-26.014558928.1273711', '2023-01-16 18:40:11', '2023-01-16 18:40:11', 4, NULL),
(127, 'UPDEV', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'undefined', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'Goma town', '57664', '-26.014558928.1273711', '2023-01-23 18:05:32', '2023-01-23 18:05:32', 4, NULL),
(128, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-23 18:11:31', '2023-01-23 18:11:31', 4, NULL),
(129, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', '1234', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-23 21:06:01', '2023-01-23 21:06:01', 4, NULL),
(130, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-30 08:02:04', '2023-01-30 08:02:04', 4, NULL),
(131, 'ddd', 'ddd', 'ddd', 0, 'ddd', 'Akim', '1234', 'ddd', 'ddd', 'ddd', 'ddd', '222', '-26.014558928.1273711', '2023-01-31 22:48:20', '2023-01-31 22:48:20', 4, NULL),
(132, 'ww', 'www', 'ww', 0, 'ww', 'Akim', 'eee', 'ww', 'ww', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-01-31 22:53:13', '2023-01-31 22:53:13', 4, NULL),
(133, 'UPDEV', '10477', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', 'AKim', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', '57664', '-26.014558928.1273711', '2023-02-02 17:15:27', '2023-02-02 17:15:27', 4, NULL),
(134, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-02-02 20:46:47', '2023-02-02 20:46:47', 4, NULL),
(135, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-02-02 20:47:14', '2023-02-02 20:47:14', 4, NULL),
(136, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-02-02 20:51:34', '2023-02-02 20:51:34', 4, NULL),
(137, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '111', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'MAISON BLUE', '57664', '-26.014558928.1273711', '2023-02-02 20:56:04', '2023-02-02 20:56:04', 4, NULL),
(138, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '111', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'MAISON BLUE', '57664', '-26.014558928.1273711', '2023-02-02 20:56:38', '2023-02-02 20:56:38', 4, NULL),
(139, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '11', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'MAISON BLUE', '57664', '-26.014558928.1273711', '2023-02-02 20:57:23', '2023-02-02 20:57:23', 4, NULL),
(140, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '11', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'MAISON BLUE', '57664', '-26.014558928.1273711', '2023-02-02 20:59:13', '2023-02-02 20:59:13', 4, NULL),
(141, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '11', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'MAISON BLUE', '57664', '-26.014558928.1273711', '2023-02-02 21:00:10', '2023-02-02 21:00:10', 4, NULL),
(142, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-02-02 21:05:46', '2023-02-02 21:05:46', 4, NULL),
(143, 'UPDEV', '10477', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', '57664', '-26.014558928.1273711', '2023-02-02 21:06:52', '2023-02-02 21:06:52', 4, NULL),
(144, 'UPDEV', '10477', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', '57664', '-26.014558928.1273711', '2023-02-02 21:07:33', '2023-02-02 21:07:33', 4, NULL),
(145, 'UPDEV', '10477', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', '57664', '-26.014558928.1273711', '2023-02-02 21:09:06', '2023-02-02 21:09:06', 4, NULL),
(146, 'UPDEV', '10477', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', '57664', '-26.014558928.1273711', '2023-02-02 21:09:40', '2023-02-02 21:09:40', 4, NULL),
(147, 'undefined', 'undefined', 'undefined', 0, 'undefined', 'Akim', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', '-26.014558928.1273711', '2023-02-02 21:12:57', '2023-02-02 21:12:57', 4, NULL),
(148, 'UPDEV', '10477', 'gentilakili98@gmail.com', 0, '+243977748166', 'Akim', 'undefined', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'undefined', 'undefined', '-26.014558928.1273711', '2023-02-02 21:16:37', '2023-02-02 21:16:37', 4, NULL),
(149, 'Neurohub', 'addr1q92hdtdlzvmacet9u52emkx2x4r9ezgvfcm0l8qytneevp2wwz7ctmyc2apr9jp7fkyyed8r5nah4h9fwxj0ju4gwncqum8dyl', 'gentilakili98@gmail.com', 1294, '+243977748166', 'Akim', '12345', 'Congo - Kinshasa', 'GOMA', 'GOMA', 'MAISON BLUE', '57664', '-26.014558928.1273711', '2023-02-02 21:28:03', '2023-02-02 21:28:03', 4, NULL),
(153, 'RD-COM-470', '506662', 'besi@tobb.co.za', 4896, '0739999999', 'Akim', '123456', 'South Africa', 'Guateng', 'Johannesburg', 'Kind Street', '3300', '-26.014558928.1273711', '2023-03-15 04:04:51', '2023-03-15 04:04:51', 4, NULL),
(154, 'RD-COM-362', '474111', 'besi@tobb.co.za', 4800, '0739999999', 'Akim', '123456', 'South Africa', 'Guateng', 'Johannesburg', 'Kind Street', '6799', '-26.014558928.1273711', '2023-03-15 04:13:05', '2023-03-15 04:13:05', 4, NULL),
(155, 'RD-COM-783', '208418', 'besi@tobb.co.za', 3445, '0739999999', 'Akim', '123456', 'South Africa', 'Guateng', 'Johannesburg', 'Kind Street', '9045', '-26.014558928.1273711', '2023-03-15 04:18:02', '2023-03-15 04:18:02', 4, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materialGroups`
--
ALTER TABLE `materialGroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materialGroupId` (`materialGroupId`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletterSubscriptions`
--
ALTER TABLE `newsletterSubscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservedProductModels`
--
ALTER TABLE `reservedProductModels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userPostedProductId` (`userPostedProductId`);

--
-- Indexes for table `salesTransactions`
--
ALTER TABLE `salesTransactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userGroups`
--
ALTER TABLE `userGroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userPostedProducts`
--
ALTER TABLE `userPostedProducts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersGroupsId` (`usersGroupsId`),
  ADD KEY `newsletterSubscriptionId` (`newsletterSubscriptionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `materialGroups`
--
ALTER TABLE `materialGroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletterSubscriptions`
--
ALTER TABLE `newsletterSubscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservedProductModels`
--
ALTER TABLE `reservedProductModels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesTransactions`
--
ALTER TABLE `salesTransactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `userGroups`
--
ALTER TABLE `userGroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userPostedProducts`
--
ALTER TABLE `userPostedProducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`materialGroupId`) REFERENCES `materialGroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userPostedProductId`) REFERENCES `userPostedProducts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `userPostedProducts`
--
ALTER TABLE `userPostedProducts`
  ADD CONSTRAINT `userPostedProducts_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userPostedProducts_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`usersGroupsId`) REFERENCES `userGroups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`newsletterSubscriptionId`) REFERENCES `newsletterSubscriptions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
