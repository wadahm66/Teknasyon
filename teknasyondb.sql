-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2021 at 11:10 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teknasyondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uID` bigint(20) UNSIGNED NOT NULL,
  `appID` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `osType` bigint(20) UNSIGNED NOT NULL,
  `client_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `uID`, `appID`, `language`, `osType`, `client_token`, `created_at`, `updated_at`) VALUES
(1, 1, 32, 'Arabic', 1, 'Bq4JocmU7qUv9hbKgFTUytyJEycQN4bsqRM', '2021-02-08 08:02:16', '2021-02-08 08:02:16'),
(2, 1, 323, 'Arabic', 1, '1nfCvt7StAOPCSABO0dvHJ4ZrPVt7mVgvnF', '2021-02-08 15:15:01', '2021-02-08 15:15:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_03_045542_create_device_table', 1),
(5, '2021_02_03_144444_create_purchase_table', 1),
(6, '2021_02_07_094332_subscriptions', 1);

-- --------------------------------------------------------

--
-- Table structure for table `os_type`
--

CREATE TABLE `os_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `os_type`
--

INSERT INTO `os_type` (`id`, `title`) VALUES
(1, 'Android'),
(2, 'IOS');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `status` bigint(20) UNSIGNED NOT NULL,
  `deviceID` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `purchaseDate`, `status`, `deviceID`, `created_at`, `updated_at`) VALUES
(7, '2021-02-08 14:17:56', 1, 1, '2021-02-08 08:17:56', '2021-02-08 08:17:56'),
(8, '2021-02-08 20:49:32', 1, 1, '2021-02-08 14:49:32', '2021-02-08 14:49:32'),
(9, '2021-02-08 20:50:06', 1, 1, '2021-02-08 14:50:06', '2021-02-08 14:50:06'),
(10, '2021-02-08 20:54:08', 1, 1, '2021-02-08 14:54:08', '2021-02-08 14:54:08'),
(11, '2021-02-08 20:54:20', 1, 1, '2021-02-08 14:54:20', '2021-02-08 14:54:20'),
(12, '2021-02-08 20:54:35', 1, 1, '2021-02-08 14:54:35', '2021-02-08 14:54:35'),
(13, '2021-02-08 20:54:59', 1, 1, '2021-02-08 14:54:59', '2021-02-08 14:54:59'),
(14, '2021-02-08 20:55:30', 1, 1, '2021-02-08 14:55:30', '2021-02-08 14:55:30'),
(15, '2021-02-08 20:55:37', 1, 1, '2021-02-08 14:55:37', '2021-02-08 14:55:37'),
(16, '2021-02-08 20:55:51', 1, 1, '2021-02-08 14:55:51', '2021-02-08 14:55:51'),
(17, '2021-02-08 21:07:00', 1, 1, '2021-02-08 15:07:00', '2021-02-08 15:07:00'),
(18, '2021-02-08 21:07:30', 1, 1, '2021-02-08 15:07:30', '2021-02-08 15:07:30'),
(19, '2021-02-08 21:09:48', 1, 1, '2021-02-08 15:09:48', '2021-02-08 15:09:48'),
(20, '2021-02-08 21:11:12', 1, 1, '2021-02-08 15:11:12', '2021-02-08 15:11:12'),
(21, '2021-02-08 21:13:33', 1, 1, '2021-02-08 15:13:33', '2021-02-08 15:13:33'),
(22, '2021-02-08 21:15:09', 1, 2, '2021-02-08 15:15:09', '2021-02-08 15:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_status`
--

CREATE TABLE `purchase_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_status`
--

INSERT INTO `purchase_status` (`id`, `title`) VALUES
(1, 'Started'),
(2, 'Renewed'),
(3, 'Canceled'),
(4, 'Expired'),
(5, 'Failed');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseID` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `expireDate` datetime NOT NULL,
  `deviceID` bigint(20) UNSIGNED NOT NULL,
  `subscriptionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_ostype_foreign` (`osType`),
  ADD KEY `device_uid_appid_ostype_index` (`uID`,`appID`,`osType`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_type`
--
ALTER TABLE `os_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_deviceid_foreign` (`deviceID`),
  ADD KEY `purchase_status_foreign` (`status`),
  ADD KEY `purchase_purchasedate_status_index` (`purchaseDate`,`status`);

--
-- Indexes for table `purchase_status`
--
ALTER TABLE `purchase_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_deviceid_foreign` (`deviceID`),
  ADD KEY `subscription_purchaseid_foreign` (`purchaseID`),
  ADD KEY `subscription_status_expiredate_subscriptiondate_index` (`status`,`expireDate`,`subscriptionDate`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `os_type`
--
ALTER TABLE `os_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `purchase_status`
--
ALTER TABLE `purchase_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_ostype_foreign` FOREIGN KEY (`osType`) REFERENCES `os_type` (`id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_deviceid_foreign` FOREIGN KEY (`deviceID`) REFERENCES `device` (`id`),
  ADD CONSTRAINT `purchase_status_foreign` FOREIGN KEY (`status`) REFERENCES `purchase_status` (`id`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `subscription_deviceid_foreign` FOREIGN KEY (`deviceID`) REFERENCES `device` (`id`),
  ADD CONSTRAINT `subscription_purchaseid_foreign` FOREIGN KEY (`purchaseID`) REFERENCES `purchase` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
