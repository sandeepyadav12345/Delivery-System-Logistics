-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2022 at 10:23 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Pick up created on Thu, Oct 28, 2021 11:14 AM by root', 1, 'App\\Pickup', 1, 'App\\User', '[]', '2021-10-28 05:29:07', '2021-10-28 05:29:07'),
(2, 'default', 'Shipment has been created', 1, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 06:49:15', '2021-10-28 06:49:15'),
(3, 'default', 'Shipment has been created', 2, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 06:56:27', '2021-10-28 06:56:27'),
(4, 'default', 'Shipment is out for delivery, (extra)', 2, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 07:06:59', '2021-10-28 07:06:59'),
(5, 'default', 'Shipment has been created', 3, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 07:48:36', '2021-10-28 07:48:36'),
(6, 'default', 'Shipment is out for delivery, (the delivery has been carried out. arriving soon)', 3, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 07:52:04', '2021-10-28 07:52:04'),
(7, 'default', 'Shipment delivered successfully!, (paid)', 3, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 07:53:18', '2021-10-28 07:53:18'),
(8, 'default', 'Shipment has been created', 4, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 10:24:33', '2021-10-28 10:24:33'),
(9, 'default', 'Shipment is out for delivery, ()', 4, 'App\\Shipment', 1, 'App\\User', '[]', '2021-10-28 10:26:23', '2021-10-28 10:26:23'),
(10, 'default', 'Pick up created on Sun, Nov 28, 2021 6:42 AM by root', 2, 'App\\Pickup', 1, 'App\\User', '[]', '2021-11-28 00:57:59', '2021-11-28 00:57:59'),
(11, 'default', 'Pickup is ready', 2, 'App\\Pickup', 3, 'App\\User', '[]', '2021-11-28 01:02:00', '2021-11-28 01:02:00'),
(12, 'default', 'Client will pass the pickup to the office', 2, 'App\\Pickup', 3, 'App\\User', '[]', '2021-11-28 01:02:17', '2021-11-28 01:02:17'),
(13, 'default', 'Pickup has been collected', 2, 'App\\Pickup', 3, 'App\\User', '[]', '2021-11-28 01:02:41', '2021-11-28 01:02:41'),
(14, 'default', 'Shipment has been created', 5, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-28 01:34:40', '2021-11-28 01:34:40'),
(15, 'default', 'Pick up created on Sun, Nov 28, 2021 7:23 AM by root', 3, 'App\\Pickup', 1, 'App\\User', '[]', '2021-11-28 01:38:35', '2021-11-28 01:38:35'),
(16, 'default', 'Shipment has been created', 6, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-29 08:30:28', '2021-11-29 08:30:28'),
(17, 'default', 'Shipment has been created', 7, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-30 01:55:18', '2021-11-30 01:55:18'),
(18, 'default', 'Pickup is ready', 1, 'App\\Pickup', 2, 'App\\User', '[]', '2021-11-30 02:01:44', '2021-11-30 02:01:44'),
(19, 'default', 'Client will pass the pickup to the office', 1, 'App\\Pickup', 2, 'App\\User', '[]', '2021-11-30 02:02:10', '2021-11-30 02:02:10'),
(20, 'default', 'Pickup has been collected', 1, 'App\\Pickup', 2, 'App\\User', '[]', '2021-11-30 02:04:17', '2021-11-30 02:04:17'),
(21, 'default', 'Shipment has been created', 8, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-30 08:59:21', '2021-11-30 08:59:21'),
(22, 'default', 'Shipment has been created', 9, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-30 09:00:41', '2021-11-30 09:00:41'),
(23, 'default', 'Shipment to be returned in new waybill (300000000)', 8, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-30 09:00:41', '2021-11-30 09:00:41'),
(24, 'default', 'Shipment created for returning waybill (100000070)', 9, 'App\\ReturnedShipment', 1, 'App\\User', '[]', '2021-11-30 09:00:42', '2021-11-30 09:00:42'),
(25, 'default', 'Shipment has been created', 10, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-30 09:13:22', '2021-11-30 09:13:22'),
(26, 'default', 'Shipment has been created', 11, 'App\\Shipment', 1, 'App\\User', '[]', '2021-11-30 13:34:07', '2021-11-30 13:34:07'),
(27, 'default', 'Shipment has been created', 12, 'App\\Shipment', 4, 'App\\User', '[]', '2021-12-02 01:42:41', '2021-12-02 01:42:41'),
(28, 'default', 'Pick up created on Thu, Dec 2, 2021 7:30 AM by root', 4, 'App\\Pickup', 1, 'App\\User', '[]', '2021-12-02 01:45:10', '2021-12-02 01:45:10'),
(29, 'default', 'Client will pass the pickup to the office', 4, 'App\\Pickup', 2, 'App\\User', '[]', '2021-12-02 01:47:39', '2021-12-02 01:47:39'),
(30, 'default', 'Shipment delivered successfully!, ()', 12, 'App\\Shipment', 1, 'App\\User', '[]', '2021-12-02 01:49:18', '2021-12-02 01:49:18'),
(31, 'default', 'Shipment has been created', 13, 'App\\Shipment', 4, 'App\\User', '[]', '2021-12-03 03:38:39', '2021-12-03 03:38:39'),
(32, 'default', 'Pick up created on Fri, Dec 3, 2021 9:26 AM by root', 5, 'App\\Pickup', 1, 'App\\User', '[]', '2021-12-03 03:41:36', '2021-12-03 03:41:36'),
(33, 'default', 'Pickup is ready, . (i am ready to collect)', 5, 'App\\Pickup', 2, 'App\\User', '[]', '2021-12-03 03:44:30', '2021-12-03 03:44:30'),
(34, 'default', 'Client will pass the pickup to the office', 5, 'App\\Pickup', 2, 'App\\User', '[]', '2021-12-03 03:48:26', '2021-12-03 03:48:26'),
(35, 'default', 'Pickup has been collected', 5, 'App\\Pickup', 2, 'App\\User', '[]', '2021-12-03 03:58:42', '2021-12-03 03:58:42'),
(36, 'default', 'Shipment has been created', 14, 'App\\Shipment', 4, 'App\\User', '[]', '2021-12-03 04:10:23', '2021-12-03 04:10:23'),
(37, 'default', 'Pick up created on Fri, Dec 3, 2021 9:57 AM by root', 6, 'App\\Pickup', 1, 'App\\User', '[]', '2021-12-03 04:12:04', '2021-12-03 04:12:04'),
(38, 'default', 'Client will pass the pickup to the office', 6, 'App\\Pickup', 1, 'App\\User', '[]', '2021-12-03 04:12:55', '2021-12-03 04:12:55'),
(39, 'default', 'Shipment is now ready to be delivered, ()', 13, 'App\\Shipment', 2, 'App\\User', '[]', '2021-12-03 04:20:31', '2021-12-03 04:20:31'),
(40, 'default', 'Shipment delivered successfully!, ()', 13, 'App\\Shipment', 2, 'App\\User', '[]', '2021-12-03 05:39:55', '2021-12-03 05:39:55'),
(41, 'default', 'Shipment has been created', 15, 'App\\Shipment', 4, 'App\\User', '[]', '2021-12-29 00:32:08', '2021-12-29 00:32:08'),
(42, 'default', 'Pick up created on Wed, Dec 29, 2021 6:22 AM by root', 7, 'App\\Pickup', 1, 'App\\User', '[]', '2021-12-29 00:37:47', '2021-12-29 00:37:47'),
(43, 'default', 'Pickup is ready', 7, 'App\\Pickup', 5, 'App\\User', '[]', '2021-12-29 00:43:41', '2021-12-29 00:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `zone_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sameday_price` double NOT NULL,
  `scheduled_price` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `zone_id`, `name`, `sameday_price`, `scheduled_price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'kathmandu', 50, 30, NULL, '2021-10-28 04:54:48', '2021-10-28 04:54:48'),
(2, 1, 'balhu', 50, 40, NULL, '2021-10-28 04:55:37', '2021-10-28 04:55:37'),
(3, 1, 'har har mahadev', 50, 30, NULL, '2021-10-28 04:56:00', '2021-10-28 04:56:00'),
(4, 2, 'kadaghari', 50, 30, NULL, '2021-10-28 04:57:49', '2021-10-28 04:57:49'),
(5, 2, 'putalisadak', 50, 30, NULL, '2021-10-28 04:58:09', '2021-10-28 04:58:09'),
(6, 3, 'Birgunj', 1000, 800, NULL, '2021-10-28 05:00:05', '2021-10-28 05:00:05'),
(7, 3, 'Dharan', 1500, 1200, NULL, '2021-10-28 05:00:21', '2021-10-28 05:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`id`, `type`, `url`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 'good', 'dfghjgfg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `author_id`, `name`, `type`, `path`, `url`, `created_at`, `updated_at`, `author_type`) VALUES
(1, 1, '2.jpg', 'jpg', 'C:\\xampp\\htdocs\\delivery\\storage\\app/public\\couriers/TRLspcLQ8FeYTzYXSa9EFzaiRiPdWJGRhggdxv7N.jpeg', '/storage/couriers/TRLspcLQ8FeYTzYXSa9EFzaiRiPdWJGRhggdxv7N.jpeg', '2021-10-28 05:03:25', '2021-10-28 05:03:25', 'App\\Courier'),
(2, 2, 'IMG_20201114_185218.jpg', 'jpg', 'C:\\xampp\\htdocs\\delivery\\storage\\app/public\\couriers/gmYnzrZc3V3SdqPBvuEX2kEEDDzsLmqDmk1f7OTj.jpeg', '/storage/couriers/gmYnzrZc3V3SdqPBvuEX2kEEDDzsLmqDmk1f7OTj.jpeg', '2021-10-28 05:15:36', '2021-10-28 05:15:36', 'App\\Courier'),
(3, 3, '24922 # Umesh Bhai.JPG', 'JPG', 'C:\\xampp\\htdocs\\delivery\\storage\\app/public\\couriers/S810lBJdjk2j2w22mcUEBFZbYw1g5jMzfrUhjqqx.jpeg', '/storage/couriers/S810lBJdjk2j2w22mcUEBFZbYw1g5jMzfrUhjqqx.jpeg', '2021-12-29 00:26:56', '2021-12-29 00:26:56', 'App\\Courier');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `address`, `is_main`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Gardens', 'gardens', 1, NULL, '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(2, 'balkhu', 'balkhu', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `account_number` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_sub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_maps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_pickup_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_pickup_maps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` int(10) UNSIGNED NOT NULL,
  `sector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` tinyint(4) DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `alerted` tinyint(1) NOT NULL DEFAULT 0,
  `national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipments_email_updates` tinyint(1) NOT NULL DEFAULT 0,
  `note_for_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `payment_method_price` double NOT NULL DEFAULT 0,
  `secondary_emails` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`account_number`, `name`, `trade_name`, `password`, `phone_number`, `email`, `address_country`, `address_city`, `address_sub`, `address_maps`, `address_pickup_text`, `address_pickup_maps`, `url_facebook`, `url_instagram`, `url_website`, `zone_id`, `sector`, `category`, `bank_name`, `bank_account_number`, `bank_holder_name`, `bank_iban`, `created_at`, `updated_at`, `deleted_at`, `alerted`, `national_id`, `swift_code`, `shipments_email_updates`, `note_for_courier`, `payment_method_id`, `payment_method_price`, `secondary_emails`) VALUES
(10000, 'SANDEEP', 'Grocery', 'vuha470', '9809288879', 'sy9843478094@gmail.com', 'NP', 'balkhu', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', NULL, NULL, NULL, 1, 'grocery', 1, 'nic asia', '1234567891234567788', 'sandeep yadav', '1234', '2021-10-28 05:23:04', '2021-10-30 02:00:15', NULL, 0, '234567', '123456', 1, 'please do not cancel delivery', 1, 10, NULL),
(10001, 'Sandeep Yadav', 'Shoes', 'yebo789', '9809288879', 'sy9843478094@outlook.com', 'NP', 'Kathmandu', 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', NULL, NULL, NULL, 1, 'grocery', 1, 'nic asia', '1234567891234567788', 'sandeep yadav', '1234', '2021-10-28 08:29:59', '2021-10-28 08:29:59', NULL, 0, '234567', '123456', 0, NULL, 1, 100, NULL),
(10002, 'rajeev stationary', 'book', 'xasi164', '9809288879', 'sy9843478094@outlook.com', 'NP', 'Kathmandu', 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', NULL, NULL, NULL, 1, 'book', 1, 'nic asia', '1234567891234567788', 'sandeep yadav', '1234', '2021-11-30 15:24:27', '2021-11-30 15:24:27', NULL, 0, '234567', '123456', 0, NULL, 3, 1000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_address`
--

CREATE TABLE `client_address` (
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL,
  `sameday_price` double DEFAULT NULL,
  `scheduled_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_address`
--

INSERT INTO `client_address` (`client_account_number`, `address_id`, `sameday_price`, `scheduled_price`, `created_at`, `updated_at`) VALUES
(1000, 1, 100, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_charged_for`
--

CREATE TABLE `client_charged_for` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_id` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Dumping data for table `client_charged_for`
--

INSERT INTO `client_charged_for` (`id`, `status_id`, `enabled`, `type`, `value`, `client_account_number`, `created_at`, `updated_at`, `options`) VALUES
(1, 1, 1, 'fixed', 100.00, 10000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_limits`
--

CREATE TABLE `client_limits` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(8,2) NOT NULL,
  `appliedOn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `client_service`
--

CREATE TABLE `client_service` (
  `service_id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `client_account_number` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_service`
--

INSERT INTO `client_service` (`service_id`, `price`, `client_account_number`) VALUES
(1, 1000, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `client_zone`
--

CREATE TABLE `client_zone` (
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `zone_id` int(10) UNSIGNED NOT NULL,
  `base_weight` double DEFAULT NULL,
  `charge_per_unit` double DEFAULT NULL,
  `extra_fees_per_unit` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_zone`
--

INSERT INTO `client_zone` (`client_account_number`, `zone_id`, `base_weight`, `charge_per_unit`, `extra_fees_per_unit`, `created_at`, `updated_at`) VALUES
(10000, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` tinyint(4) NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `password`, `phone_number`, `email`, `address`, `category`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sandeep Yadav', 'hofo656', '9809288879', 'sy9843478094@outlook.com', 'Kathmandu', 2, 'i an best courier', '2021-10-28 05:03:24', '2021-10-28 05:03:24', NULL),
(2, 'Rajeev yadav', 'kexu583', '9845861550', 'rajeevy396@gmail.com', 'balkhu', 2, 'i am best courier', '2021-10-28 05:15:36', '2021-10-28 05:15:36', NULL),
(3, 'sujeet yadav', 'nuya468', '9809288879', 'sy9843478@outlook.com', 'Kathmandu', 1, NULL, '2021-12-29 00:26:54', '2021-12-29 00:26:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courier_zone`
--

CREATE TABLE `courier_zone` (
  `courier_id` int(10) UNSIGNED NOT NULL,
  `zone_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courier_zone`
--

INSERT INTO `courier_zone` (`courier_id`, `zone_id`) VALUES
(1, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_addresses`
--

CREATE TABLE `custom_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `custom_zone_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sameday_price` double DEFAULT NULL,
  `scheduled_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_zones`
--

CREATE TABLE `custom_zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `zone_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_weight` double DEFAULT NULL,
  `charge_per_unit` double DEFAULT NULL,
  `extra_fees_per_unit` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 'shipment', 'your details', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'sandeep', 'do the courier', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` int(10) UNSIGNED NOT NULL,
  `trade_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(10) UNSIGNED DEFAULT NULL,
  `address_detailed` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('client','courier','guest') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` int(10) UNSIGNED NOT NULL,
  `from` timestamp NULL DEFAULT NULL,
  `until` timestamp NULL DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `decision_date` timestamp NULL DEFAULT NULL,
  `decision_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `type`, `target`, `from`, `until`, `discount`, `notes`, `created_at`, `updated_at`, `decision_date`, `decision_by`) VALUES
(1, 'client', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_062329_create_revisions_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_05_14_181407_create_clients_table', 1),
(5, '2018_05_14_181753_create_roles_table', 1),
(6, '2018_05_14_190442_create_attachments_table', 1),
(7, '2018_05_14_191455_create_couriers_table', 1),
(8, '2018_05_14_192453_create_pickups_table', 1),
(9, '2018_05_14_193758_create_shipments_table', 1),
(10, '2018_05_14_200250_create_pickup_shipment_table', 1),
(11, '2018_05_14_200828_create_zones_table', 1),
(12, '2018_05_14_201223_create_addresses_table', 1),
(13, '2018_05_14_202254_create_notes_table', 1),
(14, '2018_05_14_202816_create_services_table', 1),
(15, '2018_05_14_203212_create_client_service_table', 1),
(16, '2018_05_14_203906_create_client_zones_table', 1),
(17, '2018_05_14_204354_create_client_address_table', 1),
(18, '2018_05_14_204917_create_service_shipment_table', 1),
(19, '2018_05_14_210339_create_alerts_table', 1),
(20, '2018_05_14_210730_create_user_mails_table', 1),
(21, '2018_06_17_155024_create_user_templates_table', 1),
(22, '2018_06_17_161451_create_role_user_template_table', 1),
(23, '2018_06_17_220837_add_user_template_column', 1),
(24, '2018_06_27_183916_create_client_charged_for_table', 1),
(25, '2018_06_29_113847_create_statuses_table', 1),
(26, '2018_07_17_201359_create_guests_table', 1),
(27, '2018_08_17_105710_add_shipment_pieces_field', 1),
(28, '2018_08_17_160548_create_invoices_table', 1),
(29, '2018_08_18_180956_fix_client_charged_for_table', 1),
(30, '2018_08_29_231714_create_custom_zones_table', 1),
(31, '2018_08_29_231738_create_custom_addresses_table', 1),
(32, '2018_09_14_115054_fix_client_service_table', 1),
(33, '2018_09_16_213459_create_notifications_table', 1),
(34, '2018_09_16_233230_add_alerted_to_clients', 1),
(35, '2018_09_18_210026_waybill_index_to_shipments', 1),
(36, '2018_10_01_171456_add_reference_field_to_shipments', 1),
(37, '2018_10_01_200135_add_min_delivery_cost_to_clients', 1),
(38, '2018_10_04_234246_add_client_name_to_pickups', 1),
(39, '2018_10_05_112422_add_national_id_to_clients', 1),
(40, '2018_10_10_221704_add_prepaid_cash_to_pickups', 1),
(41, '2018_10_10_280000_add_is_guest_to_pickups', 1),
(42, '2018_10_11_211640_add_status_note_to_pickups', 1),
(43, '2018_10_14_215536_create_activity_log_table', 1),
(44, '2018_10_20_200744_create_client_limits_table', 1),
(45, '2018_11_08_185548_create_forms_table', 1),
(46, '2018_11_10_101225_add_author_type_to_attachments', 1),
(47, '2018_12_16_215635_create_courier_zone_table', 1),
(48, '2018_12_19_230244_add_swift_code_to_clients', 1),
(49, '2018_12_22_152039_add_shipments_email_updates_to_clients', 1),
(50, '2018_12_26_202222_add_note_for_courier_to_clients', 1),
(51, '2018_12_28_191443_create_payment_methods_table', 1),
(52, '2018_12_28_222600_add_payment_method_to_clients', 1),
(53, '2019_01_09_215627_add_address_data_to_guests', 1),
(54, '2019_01_09_231250_payment_method_price_default_val_in_clients', 1),
(55, '2019_02_13_205137_add_decision_to_invoices', 1),
(56, '2019_02_19_190636_create_branches_table', 1),
(57, '2019_02_19_191823_add_branch_to_shipments', 1),
(58, '2019_02_25_192330_add_created_by_in_shipments_table', 1),
(59, '2019_03_01_161016_add_secondary_email_to_clients', 1),
(60, '2019_03_01_170927_add_penalty_type_to_client_limits', 1),
(61, '2019_03_01_224652_create_pickup_statuses_table', 1),
(62, '2019_03_01_230838_pickup_statuses_relationship', 1),
(63, '2019_03_02_202834_createe_note_user_table', 1),
(64, '2019_03_07_224401_test_fix', 1),
(65, '2019_04_02_225712_create_emails_table', 1),
(66, '2019_04_13_181630_add_options_to_client_charged_for', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `text`, `private`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'welcome to delivery system that connects local shops and customers', 0, NULL, '2021-11-29 08:02:01', '2021-11-29 08:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `note_user`
--

CREATE TABLE `note_user` (
  `note_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `note_user`
--

INSERT INTO `note_user` (`note_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('1', 'courier', 'courier', 1, 'details', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('drtfcgvhjbkjn', 'tfgvhbh', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'cash', '2021-10-28 03:06:23', '2021-10-28 03:06:23'),
(2, 'bank_deposit', '2021-10-28 03:06:23', '2021-10-28 03:06:23'),
(3, 'bank_transfer', '2021-10-28 03:06:23', '2021-10-28 03:06:23'),
(4, 'exchange_shop_transfer', '2021-10-28 03:06:23', '2021-10-28 03:06:23'),
(5, 'zain_cash', '2021-10-28 03:06:23', '2021-10-28 03:06:23'),
(6, 'cash_from_office', '2021-10-28 03:06:23', '2021-10-28 03:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_account_number` int(10) UNSIGNED DEFAULT NULL,
  `courier_id` int(10) UNSIGNED DEFAULT NULL,
  `expected_packages_number` int(10) UNSIGNED NOT NULL,
  `actual_packages_number` int(10) UNSIGNED DEFAULT NULL,
  `pickup_fees` double DEFAULT 0,
  `available_time_start` datetime NOT NULL,
  `available_time_end` datetime NOT NULL,
  `notes_internal` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes_external` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_from` enum('client','customer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_address_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_address_maps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_fees_paid` tinyint(1) NOT NULL DEFAULT 0,
  `alerted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepaid_cash` double DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `guest_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_status_id` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `identifier`, `client_account_number`, `courier_id`, `expected_packages_number`, `actual_packages_number`, `pickup_fees`, `available_time_start`, `available_time_end`, `notes_internal`, `notes_external`, `phone_number`, `pickup_from`, `pickup_address_text`, `pickup_address_maps`, `is_fees_paid`, `alerted`, `created_at`, `updated_at`, `deleted_at`, `client_name`, `client_national_id`, `prepaid_cash`, `is_guest`, `guest_country`, `guest_city`, `status_note`, `pickup_status_id`) VALUES
(1, '3K21AA', 10000, 1, 12345, 123, 50, '2021-11-30 00:00:00', '2021-11-30 19:30:00', 'do not cancel delivery', NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-10-28 05:29:07', '2021-11-30 02:04:17', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', 10),
(2, 'QFK9FA', 10000, 2, 2, 1000, 500, '2021-11-28 00:00:00', '2021-11-28 12:00:00', 'do the courier', NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-11-28 00:57:59', '2021-11-28 01:02:41', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', 10),
(3, 'Q1Q7F6', 10000, 1, 123, NULL, 50, '2021-11-28 00:00:00', '2021-11-28 00:00:00', 'do the courier', NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-11-28 01:38:35', '2021-11-30 01:51:04', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1),
(4, 'Q8F8R5', 10000, 1, 100, NULL, 100, '2021-12-02 00:00:00', '2021-12-02 12:00:00', 'do the courier', NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-12-02 01:45:10', '2021-12-02 01:47:39', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', 4),
(5, 'KQ844O', 10000, 1, 10000, 10000, 50, '2021-12-03 00:00:00', '2021-12-03 23:00:00', 'do the courier properly', NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-12-03 03:41:36', '2021-12-03 03:58:42', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', 10),
(6, 'ARFVVF', 10000, 1, 10000, NULL, 50, '2021-12-03 00:00:00', '2021-12-03 21:30:00', NULL, NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-12-03 04:12:04', '2021-12-03 04:12:55', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', 4),
(7, 'V5Q958', 10000, 3, 100000, NULL, 80, '2021-12-29 12:00:00', '2021-12-29 23:30:00', 'do the courier properly', NULL, '9809288879', 'client', 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 0, 0, '2021-12-29 00:37:47', '2021-12-29 00:43:41', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_shipment`
--

CREATE TABLE `pickup_shipment` (
  `pickup_id` int(10) UNSIGNED NOT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pickup_shipment`
--

INSERT INTO `pickup_shipment` (`pickup_id`, `shipment_id`) VALUES
(1, 1),
(4, 12),
(5, 13),
(6, 14),
(7, 15);

-- --------------------------------------------------------

--
-- Table structure for table `pickup_statuses`
--

CREATE TABLE `pickup_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Dumping data for table `pickup_statuses`
--

INSERT INTO `pickup_statuses` (`id`, `name`, `options`, `created_at`, `updated_at`) VALUES
(1, 'created', '[]', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(2, 'ready', '{\"set_available_time\":true}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(3, 'rescheduled', '{\"select\":{\"rescheduled_by\":[\"By Client\",\"By Kangaroo\"]},\"set_available_time\":true,\"set_address\":true}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(4, 'pass_to_office', '[]', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(5, 'rejected', '{\"select\":{\"reason\":[\"Client didn\'t answer on arrival\",\"Client cancelled on arrival\",\"Client\'s mobile is switched off on arrival\",\"Client refused to pay cash on pick up\",\"Client didn\'t ask for pick up\",\"Client mobile is transferred\"]}}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(6, 'cancelled', '{\"select\":{\"reason\":[\"Client cancelled the pick up\",\"Client didn\'t ask for pick up\",\"By Kangaroo\"]},\"notes_required\":true}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(7, 'not_available', '{\"select\":{\"reason\":[\"Transferred calls\",\"Number blocked\",\"No answer\",\"Incorrect number\",\"Invalid number\",\"Number disconnected\",\"No signal\\/coverage\",\"Mobile switched off\"]}}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(8, 'failed', '{\"select\":{\"reason\":[\"Bad weather conditions\",\"Unreachable destination\"]}}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(9, 'on_hold', '{\"select\":{\"reason\":[\"Incomplete address\",\"No phone number\"]}}', '2021-10-28 03:06:22', '2021-10-28 03:06:22'),
(10, 'collected', '{\"prepaid_cash\":true,\"actual_packages\":true}', '2021-10-28 03:06:22', '2021-10-28 03:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'App\\Pickup', 1, 1, 'courier_id', NULL, '1', '2021-10-28 05:30:39', '2021-10-28 05:30:39'),
(2, 'App\\Shipment', 1, 1, 'extra_services', '', 'Courier service', '2021-10-28 06:49:15', '2021-10-28 06:49:15'),
(3, 'App\\Shipment', 2, 1, 'extra_services', '', 'Courier service', '2021-10-28 06:56:27', '2021-10-28 06:56:27'),
(4, 'App\\Shipment', 2, 1, 'external_notes', NULL, '(extra)', '2021-10-28 07:06:59', '2021-10-28 07:06:59'),
(5, 'App\\Shipment', 2, 1, 'status_id', '1', '6', '2021-10-28 07:06:59', '2021-10-28 07:06:59'),
(6, 'App\\Shipment', 2, 1, 'status_notes', NULL, '(extra)', '2021-10-28 07:06:59', '2021-10-28 07:06:59'),
(7, 'App\\Shipment', 3, 1, 'extra_services', '', 'Courier service', '2021-10-28 07:48:36', '2021-10-28 07:48:36'),
(8, 'App\\Shipment', 3, 1, 'external_notes', NULL, '(the delivery has been carried out. arriving soon)', '2021-10-28 07:52:04', '2021-10-28 07:52:04'),
(9, 'App\\Shipment', 3, 1, 'status_id', '1', '6', '2021-10-28 07:52:04', '2021-10-28 07:52:04'),
(10, 'App\\Shipment', 3, 1, 'status_notes', NULL, '(the delivery has been carried out. arriving soon)', '2021-10-28 07:52:04', '2021-10-28 07:52:04'),
(11, 'App\\Shipment', 3, 1, 'external_notes', '(the delivery has been carried out. arriving soon)', '(paid)', '2021-10-28 07:53:18', '2021-10-28 07:53:18'),
(12, 'App\\Shipment', 3, 1, 'actual_paid_by_consignee', NULL, '1000', '2021-10-28 07:53:18', '2021-10-28 07:53:18'),
(13, 'App\\Shipment', 3, 1, 'status_id', '6', '13', '2021-10-28 07:53:18', '2021-10-28 07:53:18'),
(14, 'App\\Shipment', 3, 1, 'status_notes', '(the delivery has been carried out. arriving soon)', '(paid)', '2021-10-28 07:53:18', '2021-10-28 07:53:18'),
(15, 'App\\Shipment', 4, 1, 'extra_services', '', 'Courier service', '2021-10-28 10:24:33', '2021-10-28 10:24:33'),
(16, 'App\\Shipment', 4, 1, 'external_notes', NULL, '()', '2021-10-28 10:26:23', '2021-10-28 10:26:23'),
(17, 'App\\Shipment', 4, 1, 'status_id', '1', '6', '2021-10-28 10:26:23', '2021-10-28 10:26:23'),
(18, 'App\\Shipment', 4, 1, 'status_notes', NULL, '()', '2021-10-28 10:26:23', '2021-10-28 10:26:23'),
(19, 'App\\Pickup', 2, 1, 'courier_id', NULL, '2', '2021-11-28 00:58:17', '2021-11-28 00:58:17'),
(20, 'App\\Pickup', 2, 3, 'pickup_status_id', '1', '2', '2021-11-28 01:02:00', '2021-11-28 01:02:00'),
(21, 'App\\Pickup', 2, 3, 'pickup_status_id', '2', '4', '2021-11-28 01:02:17', '2021-11-28 01:02:17'),
(22, 'App\\Pickup', 2, 3, 'actual_packages_number', NULL, '1000', '2021-11-28 01:02:41', '2021-11-28 01:02:41'),
(23, 'App\\Pickup', 2, 3, 'pickup_status_id', '4', '10', '2021-11-28 01:02:41', '2021-11-28 01:02:41'),
(24, 'App\\Pickup', 3, 1, 'courier_id', NULL, '2', '2021-11-28 01:38:56', '2021-11-28 01:38:56'),
(25, 'App\\Shipment', 6, 1, 'extra_services', '', 'lodging', '2021-11-29 08:30:28', '2021-11-29 08:30:28'),
(26, 'App\\Pickup', 3, 1, 'courier_id', '2', '1', '2021-11-30 01:51:04', '2021-11-30 01:51:04'),
(27, 'App\\Shipment', 7, 1, 'extra_services', '', 'lodging', '2021-11-30 01:55:18', '2021-11-30 01:55:18'),
(28, 'App\\Pickup', 1, 1, 'available_time_start', '2021-10-28 00:00:00', '2021-11-30 00:00:00', '2021-11-30 02:00:33', '2021-11-30 02:00:33'),
(29, 'App\\Pickup', 1, 1, 'available_time_end', '2021-10-28 19:30:00', '2021-11-30 19:30:00', '2021-11-30 02:00:33', '2021-11-30 02:00:33'),
(30, 'App\\Pickup', 1, 2, 'pickup_status_id', '1', '2', '2021-11-30 02:01:44', '2021-11-30 02:01:44'),
(31, 'App\\Pickup', 1, 2, 'pickup_status_id', '2', '4', '2021-11-30 02:02:10', '2021-11-30 02:02:10'),
(32, 'App\\Pickup', 1, 2, 'actual_packages_number', NULL, '123', '2021-11-30 02:04:17', '2021-11-30 02:04:17'),
(33, 'App\\Pickup', 1, 2, 'pickup_status_id', '4', '10', '2021-11-30 02:04:17', '2021-11-30 02:04:17'),
(34, 'App\\Shipment', 8, 1, 'extra_services', '', 'Courier service', '2021-11-30 08:59:21', '2021-11-30 08:59:21'),
(35, 'App\\Shipment', 10, 1, 'extra_services', '', 'Courier service', '2021-11-30 09:13:22', '2021-11-30 09:13:22'),
(36, 'App\\Shipment', 11, 1, 'extra_services', '', 'Courier service', '2021-11-30 13:34:07', '2021-11-30 13:34:07'),
(37, 'App\\Shipment', 12, 4, 'extra_services', '', 'Courier service', '2021-12-02 01:42:41', '2021-12-02 01:42:41'),
(38, 'App\\Pickup', 4, 1, 'courier_id', NULL, '1', '2021-12-02 01:45:28', '2021-12-02 01:45:28'),
(39, 'App\\Pickup', 4, 2, 'pickup_status_id', '1', '4', '2021-12-02 01:47:39', '2021-12-02 01:47:39'),
(40, 'App\\Shipment', 12, 1, 'external_notes', NULL, '()', '2021-12-02 01:49:18', '2021-12-02 01:49:18'),
(41, 'App\\Shipment', 12, 1, 'actual_paid_by_consignee', '0', '50', '2021-12-02 01:49:18', '2021-12-02 01:49:18'),
(42, 'App\\Shipment', 12, 1, 'status_id', '1', '13', '2021-12-02 01:49:18', '2021-12-02 01:49:18'),
(43, 'App\\Shipment', 12, 1, 'status_notes', NULL, '()', '2021-12-02 01:49:18', '2021-12-02 01:49:18'),
(44, 'App\\Shipment', 13, 4, 'extra_services', '', 'Courier service', '2021-12-03 03:38:39', '2021-12-03 03:38:39'),
(45, 'App\\Pickup', 5, 1, 'courier_id', NULL, '1', '2021-12-03 03:41:56', '2021-12-03 03:41:56'),
(46, 'App\\Pickup', 5, 2, 'notes_external', NULL, 'i am ready to collect', '2021-12-03 03:44:31', '2021-12-03 03:44:31'),
(47, 'App\\Pickup', 5, 2, 'pickup_status_id', '1', '2', '2021-12-03 03:44:31', '2021-12-03 03:44:31'),
(48, 'App\\Pickup', 5, 2, 'notes_external', 'i am ready to collect', NULL, '2021-12-03 03:48:26', '2021-12-03 03:48:26'),
(49, 'App\\Pickup', 5, 2, 'pickup_status_id', '2', '4', '2021-12-03 03:48:26', '2021-12-03 03:48:26'),
(50, 'App\\Pickup', 5, 2, 'actual_packages_number', NULL, '10000', '2021-12-03 03:58:42', '2021-12-03 03:58:42'),
(51, 'App\\Pickup', 5, 2, 'pickup_status_id', '4', '10', '2021-12-03 03:58:42', '2021-12-03 03:58:42'),
(52, 'App\\Shipment', 13, 1, 'courier_id', NULL, '1', '2021-12-03 04:01:16', '2021-12-03 04:01:16'),
(53, 'App\\Pickup', 6, 1, 'courier_id', NULL, '1', '2021-12-03 04:12:22', '2021-12-03 04:12:22'),
(54, 'App\\Pickup', 6, 1, 'pickup_status_id', '1', '4', '2021-12-03 04:12:55', '2021-12-03 04:12:55'),
(55, 'App\\Shipment', 13, 2, 'external_notes', NULL, '()', '2021-12-03 04:20:31', '2021-12-03 04:20:31'),
(56, 'App\\Shipment', 13, 2, 'status_id', '1', '7', '2021-12-03 04:20:31', '2021-12-03 04:20:31'),
(57, 'App\\Shipment', 13, 2, 'status_notes', NULL, '()', '2021-12-03 04:20:31', '2021-12-03 04:20:31'),
(58, 'App\\Shipment', 13, 2, 'actual_paid_by_consignee', NULL, '5000', '2021-12-03 05:39:55', '2021-12-03 05:39:55'),
(59, 'App\\Shipment', 13, 2, 'status_id', '7', '13', '2021-12-03 05:39:55', '2021-12-03 05:39:55'),
(60, 'App\\Pickup', 7, 1, 'courier_id', NULL, '3', '2021-12-29 00:38:01', '2021-12-29 00:38:01'),
(61, 'App\\Pickup', 7, 5, 'pickup_status_id', '1', '2', '2021-12-29 00:43:41', '2021-12-29 00:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `default`, `created_at`, `updated_at`) VALUES
(1, 'shipments', 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(2, 'clients', 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(3, 'couriers', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(4, 'pickups', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(5, 'notes', 3, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(6, 'zones', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(7, 'services', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(8, 'users', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(9, 'roles', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(10, 'mailing', 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(11, 'reporting', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(12, 'documents', 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(13, 'settings', 3, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(14, 'logs', 2, '2021-10-28 03:06:19', '2021-10-28 03:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_user_template`
--

CREATE TABLE `role_user_template` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_template_id` int(10) UNSIGNED NOT NULL,
  `value` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user_template`
--

INSERT INTO `role_user_template` (`role_id`, `user_template_id`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(2, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(3, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(4, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(5, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(6, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(7, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(8, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(9, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(10, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(11, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(12, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(13, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(14, 1, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(1, 2, 3, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(2, 2, 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(3, 2, 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(4, 2, 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(5, 2, 4, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(6, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(7, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(8, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(9, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(10, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(11, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(12, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(13, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(14, 2, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(1, 3, 3, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(2, 3, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(3, 3, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(4, 3, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(5, 3, 4, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(6, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(7, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(8, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(9, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(10, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(11, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(12, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(13, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(14, 3, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(1, 4, 3, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(2, 4, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(3, 4, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(4, 4, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(5, 4, 4, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(6, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(7, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(8, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(9, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(10, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(11, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(12, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(13, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(14, 4, 0, '2021-10-28 03:06:20', '2021-10-28 03:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Courier service', 1000, NULL, '2021-10-28 05:01:04', '2021-10-28 05:01:04'),
(2, 'lodging', 500, NULL, '2021-11-29 08:00:34', '2021-11-29 08:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `service_shipment`
--

CREATE TABLE `service_shipment` (
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_shipment`
--

INSERT INTO `service_shipment` (`shipment_id`, `service_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, NULL, NULL),
(2, 1, 1000, NULL, NULL),
(3, 1, 1000, NULL, NULL),
(4, 1, 1000, NULL, NULL),
(6, 2, 500, NULL, NULL),
(7, 2, 500, NULL, NULL),
(8, 1, 1000, NULL, NULL),
(10, 1, 1000, NULL, NULL),
(11, 1, 1000, NULL, NULL),
(12, 1, 1000, NULL, NULL),
(13, 1, 1000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('normal','guest','returned','prepaid') COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_account_number` int(10) UNSIGNED NOT NULL,
  `courier_id` int(10) UNSIGNED DEFAULT NULL,
  `waybill` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_date` datetime NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL,
  `address_sub_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_maps_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consignee_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_type` enum('nextday','sameday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_cost_lodger` enum('client','courier') COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_weight` double NOT NULL,
  `shipment_value` double NOT NULL,
  `price_of_address` double DEFAULT NULL,
  `base_weight_of_zone` double DEFAULT NULL,
  `charge_per_unit_of_zone` double DEFAULT NULL,
  `extra_fees_per_unit_of_zone` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `actual_paid_by_consignee` double DEFAULT 0,
  `status_id` tinyint(3) UNSIGNED NOT NULL,
  `sub_status_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `status_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courier_cashed` tinyint(1) NOT NULL DEFAULT 0,
  `client_paid` tinyint(1) NOT NULL DEFAULT 0,
  `returned_from` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pieces` int(11) NOT NULL,
  `waybill_index` int(10) UNSIGNED DEFAULT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `type`, `client_account_number`, `courier_id`, `waybill`, `delivery_date`, `address_id`, `address_sub_text`, `address_maps_link`, `consignee_name`, `phone_number`, `internal_notes`, `external_notes`, `service_type`, `delivery_cost_lodger`, `package_weight`, `shipment_value`, `price_of_address`, `base_weight_of_zone`, `charge_per_unit_of_zone`, `extra_fees_per_unit_of_zone`, `total_price`, `actual_paid_by_consignee`, `status_id`, `sub_status_id`, `status_notes`, `courier_cashed`, `client_paid`, `returned_from`, `deleted_at`, `created_at`, `updated_at`, `pieces`, `waybill_index`, `reference`, `branch_id`, `created_by`) VALUES
(1, 'normal', 10000, 1, '100000000', '2021-10-30 12:34:15', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9809288879', 'dear courier, please come to my place and delivery the product to customer', NULL, 'nextday', 'courier', 10, 100, 40, 25, 2, 0, 2000, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-10-28 06:49:15', '2021-10-28 06:49:15', 3, 0, NULL, NULL, 1),
(2, 'normal', 10000, 2, '100000011', '2021-10-28 12:41:27', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9809288879', 'please come and deliver', '(extra)', 'sameday', 'courier', 20, 3000, 50, 25, 2, 0, 50, NULL, 6, NULL, '(extra)', 0, 0, NULL, NULL, '2021-10-28 06:56:27', '2021-10-28 07:06:59', 2, 1, 'extra', NULL, 1),
(3, 'normal', 10000, 1, '100000022', '2021-10-28 13:33:36', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'rajeev yadav', '9809288879', 'I am here at balkhu near vayodha hospital come here and deliver to the customser at balkhu near yemale karyalay. you can use map that i have sent to you', '(paid)', 'sameday', 'client', 20, 1000, 50, 25, 2, 0, 2000, 1000, 13, NULL, '(paid)', 0, 0, NULL, NULL, '2021-10-28 07:48:36', '2021-10-28 07:53:18', 1, 2, NULL, NULL, 1),
(4, 'normal', 10000, 2, '100000033', '2021-10-28 16:09:33', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'rajeev yadav', '9809288879', NULL, '()', 'sameday', 'courier', 30, 5000, 50, 25, 2, 0, 50, NULL, 6, NULL, '()', 0, 0, NULL, NULL, '2021-10-28 10:24:33', '2021-10-28 10:26:23', 1, 3, NULL, NULL, 1),
(5, 'normal', 10000, 2, '100000044', '2021-11-29 07:19:40', 2, 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sujit yadav', '9809288879', NULL, NULL, 'nextday', 'client', 20, 0, 40, 25, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-11-28 01:34:40', '2021-11-28 01:34:40', 1, 4, NULL, NULL, 1),
(6, 'normal', 10000, 2, '100000055', '2021-11-30 14:15:28', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9809288879', 'deliver the things successfully', NULL, 'nextday', 'courier', 0.2, 0, 40, 25, 2, 0, 2000, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-11-29 08:30:28', '2021-11-29 08:30:28', 1, 5, NULL, NULL, 1),
(7, 'normal', 10000, 2, '100000066', '2021-12-01 07:40:18', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'shailendra', '9809288879', 'do the courier carefully', NULL, 'nextday', 'courier', 0.2, 1000, 40, 25, 2, 0, 40, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-11-30 01:55:18', '2021-11-30 01:55:18', 1, 6, NULL, NULL, 1),
(8, 'normal', 10000, 2, '100000070', '2021-11-30 14:44:21', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9809288879', 'do the courier', NULL, 'sameday', 'courier', 0.2, 0, 50, 25, 2, 0, 20, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-11-30 08:59:21', '2021-11-30 08:59:21', 1, 7, NULL, NULL, 1),
(9, 'returned', 10000, 2, '300000000', '2021-11-30 14:45:41', 2, 'balkhu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'SANDEEP', '9809288879', NULL, NULL, 'nextday', 'courier', 0.2, 0, 40, 25, 2, 0, NULL, 0, 2, NULL, NULL, 0, 0, 8, NULL, '2021-11-30 09:00:41', '2021-11-30 09:00:41', 1, 0, NULL, NULL, 1),
(10, 'normal', 10000, 2, '100000081', '2021-12-01 14:58:22', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9809288879', 'do the courier', NULL, 'nextday', 'courier', 0.2, 100, 40, 25, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-11-30 09:13:22', '2021-11-30 09:13:22', 1, 8, NULL, NULL, 1),
(11, 'normal', 10000, NULL, '100000092', '2021-11-30 19:19:07', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9809288879', 'do the courier', NULL, 'sameday', 'courier', 0.2, 20, 50, 25, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-11-30 13:34:07', '2021-11-30 13:34:07', 1, 9, NULL, NULL, 1),
(12, 'normal', 10000, NULL, '100000103', '2021-12-04 07:27:41', 2, 'near hospital', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Rajeev Yadav', '9843478094', 'do the courier', '()', 'nextday', 'courier', 0.2, 50, 40, 25, 2, 0, NULL, 50, 13, NULL, '()', 0, 0, NULL, NULL, '2021-12-02 01:42:41', '2021-12-02 01:49:18', 1, 10, NULL, NULL, 4),
(13, 'normal', 10000, 1, '100000114', '2021-12-03 09:23:39', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9843478094', 'do the courier', '()', 'sameday', 'courier', 0.2, 5000, 50, 25, 2, 0, NULL, 5000, 13, NULL, '()', 0, 0, NULL, NULL, '2021-12-03 03:38:39', '2021-12-03 05:39:55', 1, 11, NULL, NULL, 4),
(14, 'normal', 10000, NULL, '100000125', '2021-12-04 09:55:23', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9843478094', NULL, NULL, 'nextday', 'courier', 0.2, 1000, 40, 25, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-12-03 04:10:23', '2021-12-03 04:10:23', 1, 12, NULL, NULL, 4),
(15, 'normal', 10000, NULL, '100000136', '2021-12-30 06:17:08', 2, 'Kathmandu', 'https://www.google.com/maps/place/Balkhu,+Kathmandu+44600/@27.6864516,85.294014,18z/data=!3m1!4b1!4m5!3m4!1s0x39eb18418484f5cb:0x47248c3878873e24!8m2!3d27.6862726!4d85.2948778', 'Sandeep Yadav', '9843478094', 'do the courier', NULL, 'nextday', 'courier', 0.2, 10000, 40, 25, 2, 0, NULL, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2021-12-29 00:32:08', '2021-12-29 00:32:08', 1, 13, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `groups`, `options`, `created_at`, `updated_at`) VALUES
(1, 'picked_up', '[\"processing\"]', '[]', '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(2, 'received', '[\"processing\",\"returned\",\"pending\"]', '{\"set_branch\":true}', '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(3, 'departed', '[\"processing\",\"returned\",\"pending\"]', '{\"set_branch\":true}', '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(4, 'collect_from_office', '[\"in_transit\",\"returned\",\"pending\",\"courier\"]', '{\"set_branch\":true}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(5, 'collected_from_office', '[\"delivered\",\"returned\"]', '{\"set_branch\":true}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(6, 'out_for_delivery', '[\"in_transit\",\"returned\",\"pending\"]', '[]', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(7, 'ready', '[\"in_transit\",\"courier\",\"returned\",\"pending\"]', '{\"set_time\":true}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(8, 'rescheduled', '[\"in_transit\",\"courier\",\"returned\"]', '{\"select\":{\"rescheduled_by\":[\"By Consignee\",\"By Sender\",\"By Kangaroo\"]},\"set_delivery_date\":true}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(9, 'not_available', '[\"in_transit\",\"courier\",\"returned\"]', '{\"select\":{\"reason\":[\"Transferred calls\",\"Number blocked\",\"No answer\",\"Incorrect number\",\"Invalid number\",\"Number disconnected\",\"No signal\\/coverage\",\"Mobile switched off\"]}}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(10, 'cancelled', '[\"in_transit\",\"courier\"]', '{\"select\":{\"reason\":[\"Sender cancelled the shipment\",\"Consignee is not expecting the shipment\",\"Consignee wants to amend order before delivery\",\"Consignee changed his\\/her mind\",\"Repeated shipment\",\"Duplicate shipment\"]}}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(11, 'rejected', '[\"in_transit\",\"courier\",\"returned\"]', '{\"select\":{\"reason\":[\"Consignee didn\'t answer on arrival\",\"Consignee cancelled on arrival\",\"Consignee\'s mobile is switched off on arrival\",\"Incorrect\\/missing item\",\"Price issue\",\"Damaged\",\"Insufficient money\",\"Consignee refused to pay\",\"Consignee is not expecting shipment\",\"Consignee mobile is transferred\",\"Consignee wanted to receive shipment before paying\"]}}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(12, 'failed', '[\"in_transit\",\"courier\",\"returned\"]', '{\"select\":{\"reason\":[\"Bad weather conditions\",\"Unreachable destination\",\"Incomplete address\",\"No phone number\"]}}', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(13, 'delivered', '[\"delivered\",\"courier\",\"returned\"]', '[]', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(14, 'customs', '[\"processing\"]', '[]', '2021-10-28 03:06:21', '2021-10-28 03:06:21'),
(15, 'on_hold', '[\"in_transit\",\"returned\"]', '{\"select\":{\"reason\":[\"Consignee rescheduled\",\"Kangaroo rescheduled\",\"Sender rescheduled\",\"Consignee cancelled shipment, awaiting sender\'s instructions\",\"Consignee rejected shipment, awaiting sender\'s instructions\",\"Consignee not available, awaiting sender\'s instructions\",\"Delivery failed\",\"Consignee asked to collect shipment from office\",\"Incomplete address, awaiting admin instructions\",\"No phone number, awaiting admin instructions\",\"Consignee contacted to set delivery address\"]}}', '2021-10-28 03:06:21', '2021-10-28 03:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_template_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `identifier`, `remember_token`, `created_at`, `updated_at`, `user_template_id`) VALUES
(1, 'root', 'himoath@gmail.com', '$2y$10$pXgk7mcb0xEABPgmZsdSf.2chyac1TulYWuM9bij8n9GtJinENMVi', NULL, 'FBW2rZfn0lAcpdq9sHVde7VDp4f6fet0lbKOjDSMcaxGB9gu0UYVVAIq0ekr', '2021-10-28 03:06:20', '2021-10-28 03:06:20', 1),
(2, '0001', 'sy9843478094@outlook.com', '$2y$10$00xlOotmccbgqvYazYWQA.c1.skipSi.Mhxa/opcuBvH10c.4OUzm', 1, '8AWkBmsUPGTRsbMwUXYuOLCVETqfS0tgrSAdLOFKqCF63hXH5woIfLxF1jgo', '2021-10-28 05:03:24', '2021-10-28 05:03:24', 4),
(3, '0002', 'rajeevy396@gmail.com', '$2y$10$pYieKf5TuABFl/Zo//V2gOLsi8wALFZsXfwHPus5/JZyhd8uMjD42', 2, 'dgwF8V1etCn5MzslLXPwjvFV17ovK757dPY19IoY7G2VAUVJoYNKDGR6uY5K', '2021-10-28 05:15:36', '2021-10-28 05:15:36', 3),
(4, 'sandeep123', 'sandeep97062@gmail.com', '$2y$10$Q6VJQFnjDB7b9b84UXZji.0y/gsJzg/ob6FGKEjV1Odm4DZpGlyxK', NULL, 'UKDfeFwY666gPN7LQtlumpioo09RJi7VYXSEjjGO9ZeDySi0xYa91jvZl0Mx', '2021-10-28 14:44:37', '2021-10-28 14:44:37', 3),
(5, '0003', 'sy9843478@outlook.com', '$2y$10$xSGeKpMS6a25S7NXFjLPeOsoErWBeYaQHKZT3WnwHlcYWxlnm351.', 3, NULL, '2021-12-29 00:26:54', '2021-12-29 00:26:54', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_mails`
--

CREATE TABLE `user_mails` (
  `id` int(10) UNSIGNED NOT NULL,
  `trigger` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_templates`
--

CREATE TABLE `user_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `deletable` tinyint(1) NOT NULL DEFAULT 1,
  `editable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_templates`
--

INSERT INTO `user_templates` (`id`, `name`, `description`, `default`, `deletable`, `editable`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 0, 0, 0, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(2, 'employee', 'Employee', 1, 0, 1, '2021-10-28 03:06:19', '2021-10-28 03:06:19'),
(3, 'client', 'Client', 0, 0, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20'),
(4, 'courier', 'Courier', 0, 0, 1, '2021-10-28 03:06:20', '2021-10-28 03:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_weight` double NOT NULL,
  `charge_per_unit` double NOT NULL,
  `extra_fees_per_unit` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `base_weight`, `charge_per_unit`, `extra_fees_per_unit`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'A(within local place)', 25, 2, 0, NULL, '2021-10-28 04:53:15', '2021-10-28 04:53:15'),
(2, 'B (from one local place to another)', 25, 2, 0, NULL, '2021-10-28 04:57:18', '2021-10-28 04:57:18'),
(3, 'C (from one city to another)', 100, 3, 1, NULL, '2021-10-28 04:58:55', '2021-10-28 04:58:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`account_number`),
  ADD UNIQUE KEY `clients_trade_name_unique` (`trade_name`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courier_zone`
--
ALTER TABLE `courier_zone`
  ADD KEY `courier_zone_courier_id_foreign` (`courier_id`);

--
-- Indexes for table `custom_addresses`
--
ALTER TABLE `custom_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_zones`
--
ALTER TABLE `custom_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_decision_by_foreign` (`decision_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipments_waybill_unique` (`waybill`),
  ADD KEY `shipments_branch_id_foreign` (`branch_id`),
  ADD KEY `shipments_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_mails`
--
ALTER TABLE `user_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_templates`
--
ALTER TABLE `user_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_templates_name_unique` (`name`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `account_number` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;

--
-- AUTO_INCREMENT for table `client_charged_for`
--
ALTER TABLE `client_charged_for`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_limits`
--
ALTER TABLE `client_limits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_addresses`
--
ALTER TABLE `custom_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_zones`
--
ALTER TABLE `custom_zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pickup_statuses`
--
ALTER TABLE `pickup_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_mails`
--
ALTER TABLE `user_mails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_templates`
--
ALTER TABLE `user_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courier_zone`
--
ALTER TABLE `courier_zone`
  ADD CONSTRAINT `courier_zone_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `couriers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_decision_by_foreign` FOREIGN KEY (`decision_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `shipments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
