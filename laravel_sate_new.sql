-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 09:03 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_sate_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `name`, `roles`, `created_at`, `updated_at`) VALUES
(4, 'Intern', '[{\"id\":1,\"name\":\"Administracio\",\"guard_name\":\"api\",\"show\":null,\"created_at\":\"2020-10-08 02:26:28\",\"updated_at\":\"2020-10-08 02:26:28\",\"permission\":[\"read entities\",\"crud entities\",\"read roles\",\"crud roles\",\"read providers\",\"crud providers\",\"read tasks\",\"crud tasks\",\"read patients\",\"crud patients\",\"read referents\",\"crud referents\",\"crud patient_invoices\",\"read patient_invoices\"],\"permissions\":[{\"id\":1,\"name\":\"read entities\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:31\",\"updated_at\":\"2020-10-08 02:26:31\",\"pivot\":{\"role_id\":1,\"permission_id\":1}},{\"id\":2,\"name\":\"crud entities\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:31\",\"updated_at\":\"2020-10-08 02:26:31\",\"pivot\":{\"role_id\":1,\"permission_id\":2}},{\"id\":3,\"name\":\"read roles\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":3}},{\"id\":4,\"name\":\"crud roles\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":4}},{\"id\":5,\"name\":\"read providers\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":5}},{\"id\":6,\"name\":\"crud providers\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":6}},{\"id\":7,\"name\":\"read tasks\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":7}},{\"id\":8,\"name\":\"crud tasks\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":8}},{\"id\":9,\"name\":\"read patients\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":9}},{\"id\":10,\"name\":\"crud patients\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":10}},{\"id\":11,\"name\":\"read referents\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":11}},{\"id\":12,\"name\":\"crud referents\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":1,\"permission_id\":12}},{\"id\":15,\"name\":\"crud patient_invoices\",\"guard_name\":\"api\",\"created_at\":\"2020-11-24 13:22:44\",\"updated_at\":\"2020-11-24 13:22:44\",\"pivot\":{\"role_id\":1,\"permission_id\":15}},{\"id\":16,\"name\":\"read patient_invoices\",\"guard_name\":\"api\",\"created_at\":\"2020-11-24 13:22:44\",\"updated_at\":\"2020-11-24 13:22:44\",\"pivot\":{\"role_id\":1,\"permission_id\":16}}]},{\"id\":2,\"name\":\"Treballador\",\"guard_name\":\"api\",\"show\":\"treballador\",\"created_at\":\"2020-10-08 02:26:28\",\"updated_at\":\"2020-10-08 02:26:28\",\"permission\":[\"read entities\",\"read tasks\",\"crud tasks\",\"read patients\"],\"permissions\":[{\"id\":1,\"name\":\"read entities\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:31\",\"updated_at\":\"2020-10-08 02:26:31\",\"pivot\":{\"role_id\":2,\"permission_id\":1}},{\"id\":7,\"name\":\"read tasks\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":2,\"permission_id\":7}},{\"id\":8,\"name\":\"crud tasks\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":2,\"permission_id\":8}},{\"id\":9,\"name\":\"read patients\",\"guard_name\":\"api\",\"created_at\":\"2020-10-08 02:26:32\",\"updated_at\":\"2020-10-08 02:26:32\",\"pivot\":{\"role_id\":2,\"permission_id\":9}}]}]', '2020-12-31 16:04:53', '2021-03-17 19:30:56');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representative` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `cif`, `phone`, `representative`, `address`, `cp`, `email`, `map`, `created_at`, `updated_at`) VALUES
(1, 'SATE SERVEIS ASSISTENCIALS S.L.', 'B55576565', '620581494', 'ALEXANDRE BARRACHINA GISBERT', 'C/ SANT JOAN Nº8 BX', '43520', 'info@sateserveisassistencials.com', 'Sate serveis Assistencials', '2020-10-15 17:45:11', '2020-12-02 18:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `entities`
--

CREATE TABLE `entities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `population` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('residencia','tutela') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entities`
--

INSERT INTO `entities` (`id`, `name`, `cif`, `population`, `cp`, `province`, `address`, `phone`, `type`, `bank`, `iban`, `bic`, `created_at`, `updated_at`) VALUES
(7, 'Fundació Tutelar Terres de l\'Ebre', 'G43761832', 'Tortosa', '43500', 'Tarragona', 'C/ Barcelona nº52', '977597505', 'tutela', '0000', '0000000000000', '00000000000', '2021-01-11 08:12:14', '2021-02-10 07:20:04'),
(8, 'No Tutela', '****', '***', '***', '***', '***', '***', 'tutela', '***', '***', '***', '2021-02-10 07:56:33', '2021-02-10 08:54:17'),
(10, 'Domicili Particular', '***', '***', '***', '***', '***', '***', 'residencia', '***', '***', '***', '2021-02-10 07:58:32', '2021-02-10 08:59:00'),
(11, 'Particular', 'CIF', 'POBLACIO', 'CP', 'PROVINCIA', 'ADRECA', 'TELEFON', 'tutela', '***', '***', '***', '2021-02-10 08:10:01', '2021-04-19 10:55:51'),
(12, 'Fundació Mercè Pla SAR', '***', 'EMD Jesús', '43590', 'Tarragona', 'Carretera vella de Xerta', '1234', 'residencia', '***', '***', '***', '2021-02-11 11:33:47', '2021-02-26 08:17:29'),
(16, 'Hospital Sant Creu de Jesús', '***', 'EMD Jesús', '43590', 'Tarragona', '***', '***', 'residencia', '***', '***', '***', '2021-02-11 11:38:12', '2021-02-11 12:15:38'),
(17, 'Residència Diocesana Sant Miquel Arcàngel', '***', 'Tortosa', '43500', 'Tarragona', 'Francesc Vicent Garcia, 12', '977 441 147', 'residencia', '***', '***', '***', '2021-02-11 11:40:31', '2021-02-11 11:40:31'),
(18, 'Residencia L\'Onada Alcanar', '***', 'Alcanar', '43530', 'Tarragona', 'C/ Calig, nº 75', '977 73 11 34', 'residencia', '***', '***', '***', '2021-02-11 11:42:45', '2021-02-11 11:42:45'),
(19, 'Residencia L\'Onada Deltebre', '***', 'Deltebre', '43580', 'Tarragona', 'C/ Madrid s/n', '977 48 39 75', 'residencia', '***', '***', '***', '2021-02-11 11:44:46', '2021-02-11 11:44:46'),
(20, 'Residencia L\'Onada Gandesa', '***', 'Gandesa', '43780', 'Tarragona', 'Carretera de Bot, 3', '977 07 70 94', 'residencia', '***', '***', '***', '2021-02-11 11:45:59', '2021-02-11 11:45:59'),
(21, 'Residencia L\'Onada L\'Ametlla de Mar', '***', 'L\'Ametlla de Mar', '43860', 'Tarragona', 'Avinguda de l\'Ensenyament, s/n,', '877 01 68 78', 'residencia', '***', '***', '***', '2021-02-11 11:47:04', '2021-02-11 11:47:04'),
(22, 'Residencia L\'Onada La Sénia', '***', 'La Sénia', '43560', 'Tarragona', 'C/ Jaume I, nº 44', '977 57 53 49', 'residencia', '***', '***', '***', '2021-02-11 11:48:02', '2021-03-04 14:15:49'),
(23, 'Residencia L\'Onada Sant Carles de la Ràpita', '***', 'Carles de la Ràpita', '43540', 'Tarragona', 'Avda. Paisos Catalans, nº 30.', '977 74 44 36', 'residencia', '***', '***', '***', '2021-02-11 11:49:36', '2021-02-11 11:49:36'),
(24, 'Residencia L\'Onada Tortosa', '***', 'Tortosa', '43500', 'Tarragona', 'C/ Bisbe Serra, nº 6.', '977 44 32 00', 'residencia', '***', '***', '***', '2021-02-11 11:50:20', '2021-02-11 11:50:20'),
(25, 'Residencia L\'Onada Ulldecona', '***', 'Ulldecona', '43550', 'Tarragona', 'Avda. Generalitat, nº 14.', '977 57 32 00', 'residencia', '***', '***', '***', '2021-02-11 11:51:15', '2021-02-11 11:51:15'),
(26, 'Centres Vima', '***', 'Sant Carles de la Ràpita', '43540', 'Tarragona', 'Avgda. dels Esports, 27', '977 74 31 91', 'residencia', '***', '***', '***', '2021-02-11 12:00:19', '2021-02-11 12:00:19'),
(27, 'Residència d\'Avis \"Casa del Poble\" del Perelló', '***', 'El Perelló', '43519', 'Tarragona', 'Avinguda Catalunya, 2', '977 49 08 82', 'residencia', '***', '***', '***', '2021-02-11 12:02:43', '2021-02-11 12:02:43'),
(28, 'AJEM Residència Teresa Fernandez', '***', 'Móra d\'Ebre', '43740', 'Tarragona', 'C/ Barcelona, 31', '977 40 07 82', 'residencia', '***', '***', '***', '2021-02-11 12:11:19', '2021-02-11 12:14:19'),
(29, 'Residència d\'Avis d\'Ascó', '***', 'Ascó', '43791', 'Tarragona', 'Carrer de la Residencia, 2.', '977 40 55 16', 'residencia', '***', '***', '***', '2021-02-11 12:13:42', '2021-02-11 12:13:42'),
(30, 'APASA SAR L\'ULLAL', '***', 'Amposta', '43870', 'Tarragona', 'Poble Nou, 25-33', '977707608', 'residencia', '***', '***', '***', '2021-02-22 08:53:13', '2021-02-22 08:53:13'),
(31, 'Hospital Comarcal d\'Amposta HCA', '***', 'Amposta', '43870', 'Tarragona', 'C/ Jacint Verdaguer, 11-13', '977700050', 'residencia', '***', '***', '***', '2021-02-22 11:12:12', '2021-02-22 11:12:12'),
(32, 'Hospital Comarcal de Mora d\'Ebre', '***', 'Mora d\'Ebre', '43740', 'Tarragona', 'C/ Benet Messeguer s/n', '977401863', 'residencia', '***', '***', '***', '2021-02-22 11:15:56', '2021-02-22 11:15:56'),
(33, 'Hospital de Tortosa Verge de la Cinta', '***', 'Tortosa', '43500', 'Tarragona', 'Carrer de les Esplanetes, 14', '977519100', 'residencia', '***', '***', '***', '2021-02-22 11:17:58', '2021-02-22 11:17:58'),
(34, 'Residència d’Avis d’Amposta FUSSMONT', '***', 'Amposta', '43870', 'Tarragona', 'C/ Sant Cristòfol, 278-280', '977703308', 'residencia', '***', '***', '***', '2021-02-22 11:20:18', '2021-02-26 08:30:27'),
(35, 'Centre Residencial La Duna', '***', 'Deltebre', '43580', 'Tarragona', 'Av. de la Pau, 178', '977059266', 'residencia', '***', '***', '***', '2021-02-22 11:29:46', '2021-02-22 11:29:46'),
(36, 'Residencia per a gent gran Flix', '***', 'Flix', '43750', 'Tarragona', 'c/ de les escoles, 30', '977411761', 'residencia', '***', '***', '***', '2021-02-22 11:31:35', '2021-02-22 11:31:35'),
(37, 'La Tutela - Fundació privada catalana tutelar', '***', 'Reus', '43203', 'Tarragona', 'AV. Marià Fortuny, 87 3r 10', '977757759', 'tutela', '***', '***', '***', '2021-02-22 11:34:58', '2021-02-22 11:34:58'),
(38, 'Residencia Golden Beach', '****', 'Sant Carles de la Ràpita', '43570', 'Tarragona', '***************', '*****', 'residencia', '******', '******', '*****', '2021-03-04 15:08:11', '2021-03-04 15:08:11'),
(39, 'Tutela particular', '00000', 'roquetes', '43520', 'Tarragona', 'c/Sant Joan, 8', '000000000', 'tutela', '000000', '0000000', '000000000', '2021-03-23 11:17:20', '2021-03-23 11:17:20');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Km', 'Kilometres', '2021-02-06 17:45:28', '2021-02-06 17:45:28'),
(3, 'cafeteria', 'Cost de cafeteria', '2021-02-06 17:45:36', '2021-04-04 16:29:32'),
(4, 'Perruqueria', 'Cost de perruqueria', '2021-03-17 19:32:39', '2021-03-17 19:32:39');

-- --------------------------------------------------------

--
-- Table structure for table `expenses_task`
--

CREATE TABLE `expenses_task` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `expenses_id` bigint(20) UNSIGNED NOT NULL,
  `worker_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses_task`
--

INSERT INTO `expenses_task` (`id`, `task_id`, `expenses_id`, `worker_id`, `price`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 10.00, NULL, '2020-11-25 20:33:51', '2020-11-25 20:33:51'),
(4, 2, 3, 3, 12.00, NULL, '2021-02-06 17:46:46', '2021-02-06 17:46:46'),
(6, 4, 2, 3, 0.12, NULL, '2021-02-06 18:30:47', '2021-02-06 18:30:47'),
(8, 6, 2, 3, 3.00, NULL, '2021-02-13 16:46:55', '2021-02-13 16:46:55'),
(10, 7, 3, 3, 12.00, NULL, '2021-02-17 05:12:37', '2021-02-17 05:12:37'),
(16, 8, 2, 3, 12.00, NULL, '2021-02-26 11:47:57', '2021-02-26 11:47:57'),
(17, 8, 3, 3, 1.00, NULL, NULL, NULL),
(18, 8, 3, 3, 12.00, NULL, NULL, NULL),
(19, 10, 2, 3, 12.00, NULL, NULL, NULL),
(20, 10, 3, 3, 5.00, NULL, NULL, NULL),
(21, 13, 3, 8, 1.00, NULL, NULL, NULL),
(22, 28, 2, 4, 1.00, NULL, NULL, NULL),
(23, 28, 3, 4, 2.00, NULL, NULL, NULL),
(24, 28, 4, 4, 3.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `worker_id` bigint(20) UNSIGNED NOT NULL,
  `date_worked` date NOT NULL,
  `total_hours` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`id`, `task_id`, `worker_id`, `date_worked`, `total_hours`, `created_at`, `updated_at`) VALUES
(12, 13, 8, '2021-03-16', 1, '2021-03-16 09:15:30', '2021-03-16 09:15:30'),
(13, 28, 4, '2021-03-25', 1, '2021-03-25 10:08:19', '2021-03-25 10:08:19'),
(14, 28, 4, '2021-03-25', 2, '2021-03-25 10:08:23', '2021-03-25 10:08:23'),
(15, 28, 4, '2021-03-25', 3, '2021-03-25 10:08:28', '2021-03-25 10:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `base` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interests` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iva_0` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iva_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iva_10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iva_21` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `irpf` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Patient', 22, 'picture', 'background_ae', 'background_ae.jpg', 'image/jpeg', 'public', 91361, '[]', '[]', '[]', 1, '2021-01-31 07:31:12', '2021-01-31 07:31:12'),
(10, 'App\\Models\\Patient', 149, 'picture', '2_1', '2_1.jpg', 'image/jpeg', 'public', 24987, '[]', '[]', '[]', 8, '2021-03-02 10:16:17', '2021-03-02 10:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `text`, `user_id`, `chat_id`, `created_at`, `updated_at`) VALUES
(1, 'Hola', 1, 1, '2020-10-09 15:42:32', '2020-10-09 15:42:32'),
(2, 'Hola', 1, 2, '2020-10-09 15:44:09', '2020-10-09 15:44:09'),
(3, 'Hola', 2, 2, '2020-10-09 15:44:51', '2020-10-09 15:44:51'),
(4, 'hola', 1, 1, '2020-10-21 06:45:53', '2020-10-21 06:45:53'),
(5, 'que tal Eusebio ?', 1, 2, '2020-10-21 06:50:23', '2020-10-21 06:50:23'),
(6, 'Hola', 29, 3, '2020-11-25 20:33:08', '2020-11-25 20:33:08'),
(7, 'hola', 34, 4, '2020-12-31 16:05:03', '2020-12-31 16:05:03'),
(8, 'que tal joan', 32, 4, '2020-12-31 16:05:22', '2020-12-31 16:05:22'),
(9, 'hola', 38, 4, '2021-02-10 20:50:18', '2021-02-10 20:50:18'),
(10, 'Prueba', 38, 4, '2021-02-14 09:09:39', '2021-02-14 09:09:39'),
(11, 'hola', 32, 4, '2021-02-14 09:10:17', '2021-02-14 09:10:17'),
(12, 'hoal', 32, 4, '2021-02-15 12:28:19', '2021-02-15 12:28:19'),
(13, 'hola', 32, 4, '2021-02-15 12:28:20', '2021-02-15 12:28:20'),
(14, 'hola', 32, 4, '2021-02-16 12:26:25', '2021-02-16 12:26:25'),
(15, 'hola', 32, 4, '2021-02-16 19:48:26', '2021-02-16 19:48:26'),
(16, 'Hola', 32, 4, '2021-02-17 05:05:18', '2021-02-17 05:05:18'),
(17, 'Hola', 38, 4, '2021-02-17 05:05:46', '2021-02-17 05:05:46'),
(18, 'hola', 32, 4, '2021-02-20 17:00:11', '2021-02-20 17:00:11'),
(19, 'e', 32, 4, '2021-02-20 17:00:30', '2021-02-20 17:00:30'),
(20, 'hola', 38, 4, '2021-02-20 17:11:52', '2021-02-20 17:11:52'),
(21, 'Test', 1, 4, '2021-02-24 06:49:15', '2021-02-24 06:49:15'),
(22, 'hola', 32, 4, '2021-02-24 17:38:32', '2021-02-24 17:38:32'),
(23, 'hola', 1, 4, '2021-02-25 12:36:48', '2021-02-25 12:36:48'),
(24, 'Test Message', 1, 4, '2021-02-25 12:37:00', '2021-02-25 12:37:00'),
(25, 'hola', 32, 4, '2021-02-25 19:48:22', '2021-02-25 19:48:22'),
(26, 'Hola', 32, 4, '2021-02-25 19:48:59', '2021-02-25 19:48:59'),
(27, 'que tal', 38, 4, '2021-02-26 11:49:20', '2021-02-26 11:49:20'),
(28, 'Hola', 32, 4, '2021-02-26 11:51:44', '2021-02-26 11:51:44'),
(29, 'Hola', 32, 4, '2021-02-26 11:51:53', '2021-02-26 11:51:53'),
(30, 'que tal', 32, 4, '2021-03-17 19:31:08', '2021-03-17 19:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_09_19_091826_create_permission_tables', 1),
(9, '2019_10_01_014001_create_entities_table', 1),
(10, '2019_10_01_040639_create_referents_table', 1),
(11, '2019_10_02_232437_add_morph_types_to_users_table', 1),
(12, '2019_10_07_030505_create_patients_table', 1),
(13, '2019_10_07_032102_create_media_table', 1),
(14, '2019_10_07_032714_create_p_a_i_s_table', 1),
(15, '2019_10_22_094228_create_companies_table', 1),
(16, '2019_10_22_100732_create_providers_table', 1),
(17, '2019_10_22_102706_create_invoices_table', 1),
(18, '2019_11_12_063930_create_workers_table', 1),
(19, '2020_03_05_031234_create_tasks_table', 1),
(20, '2020_03_05_032827_create_task_worker_table', 1),
(21, '2020_03_27_154309_create_messages_table', 1),
(22, '2020_03_29_163359_create_chats_table', 1),
(23, '2020_04_20_011048_create_expenses_table', 1),
(24, '2020_05_28_231604_create_expenses_task_table', 1),
(25, '2020_09_07_213327_add_type_contract_to_patients_table', 1),
(26, '2020_10_03_050207_create_hours_table', 1),
(27, '2020_10_07_023653_add_cost_per_hours_to_workers', 1),
(28, '2020_10_07_032954_create_patient_invoices_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 32),
(1, 'App\\Models\\User', 33),
(1, 'App\\Models\\User', 39),
(1, 'App\\Models\\User', 84),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 80),
(2, 'App\\Models\\User', 81),
(2, 'App\\Models\\User', 86),
(2, 'App\\Models\\User', 87),
(2, 'App\\Models\\User', 89),
(2, 'App\\Models\\User', 90),
(2, 'App\\Models\\User', 92),
(2, 'App\\Models\\User', 93),
(3, 'App\\Models\\User', 79),
(3, 'App\\Models\\User', 91),
(4, 'App\\Models\\User', 50),
(5, 'App\\Models\\User', 35),
(5, 'App\\Models\\User', 36),
(5, 'App\\Models\\User', 42),
(5, 'App\\Models\\User', 44),
(5, 'App\\Models\\User', 45),
(5, 'App\\Models\\User', 46),
(5, 'App\\Models\\User', 47),
(5, 'App\\Models\\User', 48),
(5, 'App\\Models\\User', 53),
(5, 'App\\Models\\User', 55),
(5, 'App\\Models\\User', 57),
(5, 'App\\Models\\User', 59),
(5, 'App\\Models\\User', 61),
(5, 'App\\Models\\User', 63),
(5, 'App\\Models\\User', 65),
(5, 'App\\Models\\User', 67),
(5, 'App\\Models\\User', 69),
(5, 'App\\Models\\User', 71),
(5, 'App\\Models\\User', 73),
(5, 'App\\Models\\User', 75),
(5, 'App\\Models\\User', 77),
(5, 'App\\Models\\User', 94),
(5, 'App\\Models\\User', 97),
(6, 'App\\Models\\User', 40),
(6, 'App\\Models\\User', 41),
(6, 'App\\Models\\User', 43),
(6, 'App\\Models\\User', 51),
(6, 'App\\Models\\User', 52),
(6, 'App\\Models\\User', 54),
(6, 'App\\Models\\User', 56),
(6, 'App\\Models\\User', 58),
(6, 'App\\Models\\User', 60),
(6, 'App\\Models\\User', 62),
(6, 'App\\Models\\User', 64),
(6, 'App\\Models\\User', 66),
(6, 'App\\Models\\User', 68),
(6, 'App\\Models\\User', 70),
(6, 'App\\Models\\User', 72),
(6, 'App\\Models\\User', 74),
(6, 'App\\Models\\User', 76),
(6, 'App\\Models\\User', 78),
(6, 'App\\Models\\User', 95),
(6, 'App\\Models\\User', 96),
(7, 'App\\Models\\User', 98);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('004db1b881c97bc7b121db2e662d107666c813e05e1a2321a0370b47ae8a5463cab4206958c1c220', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-14 12:19:06', '2021-01-14 12:19:06', '2022-01-14 13:19:06'),
('00631f908e1676729ce4ad7079f8fcfdeee14118e155061e224e010382664a01debdb982b577c512', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 09:44:37', '2021-02-20 09:44:37', '2022-02-20 10:44:37'),
('0135ace26f6aa61726a9dbc68de229990604ee3ad59b3994b3507edf8c109e9c9a903675933384f1', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-05 19:41:31', '2021-01-05 19:41:31', '2022-01-05 19:41:31'),
('0161ea38bcd700445d10f462746fc8475fe89a7d1b31b7def333f4c74d4d935d2c390a29e0fd465f', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-18 11:05:00', '2021-02-18 11:05:00', '2022-02-18 12:05:00'),
('01620f58414529ca2985fd0bf7d0a0b21e89274bde6b9beaea968081a5dabaafcc5b6b929ee9d7f6', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 20:26:17', '2021-02-10 20:26:17', '2022-02-10 21:26:17'),
('028a7715513657d14ddcbd77e09c34a976ddd24b781179f01e5b949696d02d581c8093ab6dc5fede', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-21 05:15:43', '2021-01-21 05:15:43', '2022-01-21 06:15:43'),
('02e0656fe700b06a2f9ebe64768fd5078f2847d4fa651e360c059845434a8c0e858c313dee5ce54a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-06 17:26:02', '2021-02-06 17:26:02', '2022-02-06 18:26:02'),
('02f03a98406f46b7c571df25a39a5ec974354888ab6c1fd61fc6e2cb4a49b3c1e5014dab9f3c4a95', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-13 12:22:30', '2021-01-13 12:22:30', '2022-01-13 13:22:30'),
('037d4e8eb9ac36f002984bc9f91a982bfc43a3f7783a57ca5dfa724b5f438669bc8cc0ececf04a70', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-21 05:06:57', '2021-01-21 05:06:57', '2022-01-21 06:06:57'),
('047f6978e86aa1814fa05b7de1e6af9124627e7f115384e7803d800fb6819286ffdfe3791d766993', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-05 19:41:54', '2021-01-05 19:41:54', '2022-01-05 19:41:54'),
('04b5035e7826ca1af2d5f758923203c410ca0654b8f8085ad7b4f05f8f06e1c630997f39cf6226b4', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-21 12:34:27', '2021-01-21 12:34:27', '2022-01-21 13:34:27'),
('04fe173b2f54ca354ded49183d8376f0177195a9ee88d8513bd417c455deae2f8f97984347d59771', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 12:03:43', '2021-02-10 12:03:43', '2022-02-10 13:03:43'),
('052ab488ef4aa66095b917e90921ee558f0cf6ea3ce1a9e6c759ae7462eb155fd682b745dc16d138', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-05-03 04:10:05', '2021-05-03 04:10:05', '2022-05-03 09:40:05'),
('054432905171911db0378175b5dbeefbeacc9e9dfd5caf69cb23c8f8a0f35846d2251474caf41427', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 09:23:51', '2021-02-26 09:23:51', '2022-02-26 10:23:51'),
('06febd8205bed6128edf2a684d20ecfa1b295b8136452933ac03adce57d19e7e63aa06e3b3a2eb07', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 11:14:32', '2021-02-10 11:14:32', '2022-02-10 12:14:32'),
('0766caee7dfc6570edf59a4f86bec446019969f162a16224fc44d99a2974e630348589cc2d4f7a57', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-04 12:36:34', '2021-03-04 12:36:34', '2022-03-04 13:36:34'),
('076fc37e77caf89be0b402a1f52940db76afd81441c6f50b458ebb5c23e01006a34bc6eac90b0845', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-11 07:59:00', '2021-01-11 07:59:00', '2022-01-11 08:59:00'),
('07be48ffd9440169caebec3adaadc360630174d945d0534352ceaf3e4c1acd9323e6fb9f8fa3cfe0', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 10:54:14', '2021-02-20 10:54:14', '2022-02-20 11:54:14'),
('083684ccbeff18b16c7cfd5d8c3dea55321806ad18932ca45523c467aaab857bc0c18039d09157d4', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-16 15:26:47', '2020-10-16 15:26:47', '2021-10-16 17:26:47'),
('08589e3cda49eedc5ddebfcb5a39f9edec82874765d19914c40c501369b803423f401793b6cb0105', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-22 12:32:04', '2021-03-22 12:32:04', '2022-03-22 13:32:04'),
('0905f90c25344d896271dbb26e8509649baa01f8dc32f4b9375c0aaf39d3d3dfcf9137aa011f651d', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-25 19:48:46', '2021-02-25 19:48:46', '2022-02-25 20:48:46'),
('09db2b2a33d411aa893eace79c696422e8f537d214a7283a473d4cd4b6ccf5db141a5925557ac941', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-22 19:36:15', '2021-03-22 19:36:15', '2022-03-22 20:36:15'),
('0a94516172a707285e555ee78fc76369899077c73bcad7adb336eaa44af77f14df5bd2c672f773df', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:05', '2021-02-09 05:15:05', '2022-02-09 06:15:05'),
('0ab0d03bdfc3560411920c79f5b64d29ecf7d8aa832d00bf08950b05761a9e641740dc10f557af0d', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-15 05:43:33', '2021-03-15 05:43:33', '2022-03-15 06:43:33'),
('0ab63a8b4be80f477cef227b4b54c477d33ea76867c3d1fa773235a4401f9540e6954e23ca3fa001', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-24 21:01:29', '2020-11-24 21:01:29', '2021-11-24 21:01:29'),
('0b70572c101b1dfdd92c7031e4c4d0561a6c3c1d0468680d7bcb8ad03b87d85a69b74e74836a144e', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-20 17:13:11', '2021-02-20 17:13:11', '2022-02-20 18:13:11'),
('0bf1f9b2c2a9d83ddff480972766e4577a068c1750f0edf19a009a3d0480628904ceea120a0583ff', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-11 05:08:29', '2021-03-11 05:08:29', '2022-03-11 06:08:29'),
('0d1d5ee69153df49b50bf395350e36124f9f5663c190982a4965bc7a65ea54ff156ff3fe323f3c15', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-21 05:07:16', '2021-01-21 05:07:16', '2022-01-21 06:07:16'),
('0d352fee121ee36bf7d74d47210360706f47408d2fbf4d776abf610b82005002fd38053adcd84200', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-21 06:25:06', '2020-10-21 06:25:06', '2021-10-21 08:25:06'),
('0dcd5c9250a82fa7b958b5b2b5ed3ce7e572f9d96dd9550546e2f84a6bb76a008a4efe11009d6bc6', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-20 08:03:27', '2021-04-20 08:03:27', '2022-04-20 10:03:27'),
('0fb7956ec91809dec83ca764c8b273691b94d557d2b382ae2b80d15ab92bf41439a84dbf0fcaece6', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-13 10:36:06', '2021-03-13 10:36:06', '2022-03-13 11:36:06'),
('10724205c982211302dd89219df9c77cec45da3e1e42c58ab782c8647b3e9460cda28ba2b73583ef', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:13', '2021-01-29 10:48:13', '2022-01-29 11:48:13'),
('10c540604c185bea49d233bb0786fdc7befc47613e6f4d6ffcc767f03bba6d39a43320590ce0095e', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-06 18:19:20', '2021-04-06 18:19:20', '2022-04-06 20:19:20'),
('113f19c3c266007f2b6bc2c12648fc3da6a9d356cc1914e60d4657d738ef7f443efef719c85ee869', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-19 12:47:18', '2021-03-19 12:47:18', '2022-03-19 13:47:18'),
('1236f0e8a218bc1f5d951e4510bef3cab4f53fa119d7f025775bedd62e75b08169e434263fdfd74e', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:09:45', '2021-02-20 17:09:45', '2022-02-20 18:09:45'),
('129e6cee9dcbf353a441f3bbb259e1bee618dd521440c32524877add85b56f9881ae53660221bceb', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-25 13:36:43', '2021-01-25 13:36:43', '2022-01-25 14:36:43'),
('1355d589f2696c36b1cf511f0a060fe808266adbfc5e0e82c66273212d5a7fea8abc6a1f3501a951', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-22 11:00:27', '2021-04-22 11:00:27', '2022-04-22 13:00:27'),
('1359a52d95dbf6f08348769455014bc9c9390debe88ca8925f9460122e76110ad23c4e5c0e63e312', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-15 05:27:17', '2021-01-15 05:27:17', '2022-01-15 06:27:17'),
('137c40aa3047fcae14db68227b96329aba303c6a9083ae43bda71c969bfadc0981aea2701133f74a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:51', '2021-03-31 03:51:51', '2022-03-31 05:51:51'),
('138b95b201a578a4acd877437867c3f1a93a3ac800443b172f8e67ec6143214278748f672ca56239', 29, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-25 20:32:39', '2020-11-25 20:32:39', '2021-11-25 20:32:39'),
('14315e7e45b8628ffd7ce444bfefb6c35f59d7c4b67d6645ac6b27802abbe6b6eb7043a1a9e85dc6', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-11 05:05:03', '2021-03-11 05:05:03', '2022-03-11 06:05:03'),
('143c62262d57f15b9c03e7b8388f695687f5e0f4662b216e401e47f0b47e948694981de7c7007c95', 36, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-05 12:18:53', '2021-03-05 12:18:53', '2022-03-05 13:18:53'),
('157139019668f7a9c882bc967f616957e641e6f44e6a13dcf04823ecc2406315d9d44eb0e94cd435', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-26 04:39:09', '2021-03-26 04:39:09', '2022-03-26 05:39:09'),
('15b4bb94109284cf35e7a5985d55e2ae9ab089d747a017271c97dcd4270b89885cba010e9af9dea5', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:07:08', '2021-02-10 05:07:08', '2022-02-10 06:07:08'),
('168db01086299288c22e5966de637df2055a5b772348272d5950a5ad82b2e43c808cc9c542198db4', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-04-08 11:30:01', '2021-04-08 11:30:01', '2022-04-08 13:30:01'),
('16a1359f05e433321f9705b6d0c2b4621391101507fc5116ea1ef243c56c6f067b6fa0b18097ec50', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-06 10:51:51', '2021-04-06 10:51:51', '2022-04-06 12:51:51'),
('16b203e9c0828b70842cf55a2e65647445ce17540a6feba94e921a108bd54f5d7a7fff94348b37e7', 50, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 20:48:05', '2021-02-10 20:48:05', '2022-02-10 21:48:05'),
('173dc5cb3bdd6944beeaa31ebea46f6106b5eb495d5f66cce6c6732240a52e8721438b23e06e5e87', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 18:29:59', '2021-02-06 18:29:59', '2022-02-06 19:29:59'),
('1749f6f9986a345bd5f442fb834970fa97567481630180dcfbfafc9e67ca6c51433348e7c170071f', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-31 16:04:33', '2020-12-31 16:04:33', '2021-12-31 16:04:33'),
('17737787b1ae67fdd4d55b7bea93c59c124b666a9ea184316fedd327cea573f8c7d8afe505f66b31', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-08 17:21:14', '2021-03-08 17:21:14', '2022-03-08 18:21:14'),
('179ae15146165a2658fd07c41e3d3b73c99ed103875a51b68473ab5bd5a146ec15d3a1162430a072', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-17 12:00:34', '2021-02-17 12:00:34', '2022-02-17 13:00:34'),
('17e0eba4ec5bd6ee0a9e76e2b14e0d211278d0c6ca274eb9ba94338e91cad4af996da0b5e6669c63', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-29 04:09:57', '2021-04-29 04:09:57', '2022-04-29 09:39:57'),
('1829e779c3708508f87bc050fdcf11c6f541bf5ed631da41a4c966fc374c8e51e980a3f3bb77934a', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-13 06:00:23', '2021-02-13 06:00:23', '2022-02-13 07:00:23'),
('18695732a9b846c29476cb623d3f3a835a9c5b692642a216448798c9cf0c04375cef2a85d79350ea', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 09:47:40', '2021-02-10 09:47:40', '2022-02-10 10:47:40'),
('18b613953ed6cb962bd399cdf6cc443e74c7fcbe4250552d414cb351e563bd9c25f20c863ca47e76', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-30 05:48:03', '2021-03-30 05:48:03', '2022-03-30 07:48:03'),
('1952d406a6295edd49b54a55373ad741b349f805e9d2c97a8bd57b87aecc54b38f69692f41d4960b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-09 20:30:16', '2021-03-09 20:30:16', '2022-03-09 21:30:16'),
('19892fc47697c554fd287f17745d775539bfed2b6868099fee8db25c0dd3ece57cf6cbe91c737fcb', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-11 07:42:13', '2021-03-11 07:42:13', '2022-03-11 08:42:13'),
('19fc51a997992ae107452a0ac950ea55f3694bd5f371d2a5746a204055e0d2b102dcc489a02234c0', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-28 10:48:04', '2021-02-28 10:48:04', '2022-02-28 11:48:04'),
('1a248cc92bce8528196f5d54b2d325e35d48419a43578bfd46e2e7f25792b165ae29e266bb4753cc', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:14:43', '2021-02-20 17:14:43', '2022-02-20 18:14:43'),
('1a42fab0f9aad892bdb319d7e000fb859150eb6f6a05700f9982b280ea0ba9bc2cc3ad9290d5f12f', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-18 11:46:58', '2021-03-18 11:46:58', '2022-03-18 12:46:58'),
('1a4cfb48ab311358139efba01425f9b6849b63d107ae27bfdd6aaf0b0feaea184ab5f46a5febee89', 93, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-18 12:22:01', '2021-03-18 12:22:01', '2022-03-18 13:22:01'),
('1a9504e0c68a59f4f5266c3b70ca04b109663c6e8f854caed35dd52ab4c4393ed02286de57b86f92', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:14:56', '2021-02-09 05:14:56', '2022-02-09 06:14:56'),
('1ab57e04e778aa948a160d8bebf995fd1713797f125e9a952c754ccf1835894f31f9808233e7f571', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-01 18:09:07', '2020-12-01 18:09:07', '2021-12-01 18:09:07'),
('1b4ead032ce3f20e3e2116e84bc487ff2750f3f2eb37bc01b6f6223e7fa2ec143b5c48ea51c99efc', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-02 13:05:18', '2020-11-02 13:05:18', '2021-11-02 14:05:18'),
('1b9eef9a86268c8b3e9ad43220310c4fdebd7319370ab7e70a0eb9e5c2290ba46958a066d235ff67', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 16:58:55', '2021-02-20 16:58:55', '2022-02-20 17:58:55'),
('1bf69143d936c0e526cb3715ac80aad34aa3b2fadbd94cd76052aac36c345501a333d208ec8b3439', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-06 06:31:27', '2021-04-06 06:31:27', '2022-04-06 08:31:27'),
('1c2849610e733b7a039187a501eebde4d48d7b3f8eb91caf36ad650c84c09404186484adb758f80b', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-13 16:59:57', '2021-02-13 16:59:57', '2022-02-13 17:59:57'),
('1c948327f514226702834bcb180f8bce399cd52f389b41514a980dc5448e946b68604af6e18cd36b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:19', '2021-03-31 03:51:19', '2022-03-31 05:51:19'),
('1cf041d79c7a528228bbc99547ca5892fddf9997304cb41001dd413aedb3ed73fe397c01fd177176', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-04 06:45:21', '2021-04-04 06:45:21', '2022-04-04 08:45:21'),
('1d9e436d2b464bd8ff08f9270b7ef30919539692b339d0c4ba81d0f48ef3229226ee1cc645427cd6', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-23 18:20:25', '2020-12-23 18:20:25', '2021-12-23 18:20:25'),
('1e086c98861cc635e6d9cd0dd5dbf7e5784a83bc0ca4dcf186bc33f5f6b4332eeeacc6d003cdc9ff', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-21 07:37:28', '2020-11-21 07:37:28', '2021-11-21 08:37:28'),
('1eb80fa1da905933fb71845365c93b4a069798d7229b1de32f104c8326e8c07bb84117ff2ac98642', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-25 06:35:13', '2020-11-25 06:35:13', '2021-11-25 06:35:13'),
('20492cd6ffa867f4cee34acadd864ac14e86c3f3510f511bce981f118171d58fb7371f4516a7ca12', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-20 08:03:22', '2021-04-20 08:03:22', '2022-04-20 10:03:22'),
('210852ae9f5b6c2e96d066392a9d494835baec41f49377a39a52c0b3ff027a9169643195bf8df086', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-04 19:25:15', '2021-03-04 19:25:15', '2022-03-04 20:25:15'),
('215f28036de14bf41243c3cddf08716c97929c2a727af75a78200edacc0505e6f84c65d72f1cb620', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:46:07', '2021-02-26 11:46:07', '2022-02-26 12:46:07'),
('2203ec304f07ae96b5444ff76b3627b36532d04e058e6cef99464503e97bd1bad547cb38ed54cb21', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-25 14:54:39', '2021-02-25 14:54:39', '2022-02-25 15:54:39'),
('228b80a19020fd97f4323cc393e211432aaafb92d103fae0bdb936010841f3a8b6f4bc8e1552bcec', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:40:11', '2021-02-26 11:40:11', '2022-02-26 12:40:11'),
('2301dd3afc9868233bb96a49a2d0f106dbaf3f90920b58ba021fa0947088dab7b1a03d8bb9a75efc', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-05-08 04:10:29', '2021-05-08 04:10:29', '2022-05-08 09:40:29'),
('2308760a969f5cd0744dba319f9492e2513c04077c4be8f5708821d7f86652c81df4068dd5b489a9', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-05 08:39:52', '2021-03-05 08:39:52', '2022-03-05 09:39:52'),
('230d3dd803057c7d8f4cb8f59b05716756eb5350738150da9d9ede0d568152a01be2de9ee28b7a4f', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-27 12:41:28', '2021-01-27 12:41:28', '2022-01-27 13:41:28'),
('2382999d7c00fd801509ca721ecaf9c5fde6d7f450fc0b27b8ce18a7ba24d16cbbcf81674a490894', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-22 05:25:43', '2020-10-22 05:25:43', '2021-10-22 07:25:43'),
('23c0642ee2dd7bc0f4ad8603d7756750186aed86cc10b232213a66b7d2a700350814229b6ee9862b', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-14 09:11:29', '2021-02-14 09:11:29', '2022-02-14 10:11:29'),
('23e7811ed841d34f06f2887ea1e9dac3d72c0f02075dd1272f761e409bbf0f2dcf52b508a2f2014b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-08 17:38:46', '2021-04-08 17:38:46', '2022-04-08 19:38:46'),
('242d50c2692ea9d9cf92847ef4f8399d1df0a0f4c341f5eef7d204bee92901c33978e3b9da85a434', 40, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-13 12:27:36', '2021-01-13 12:27:36', '2022-01-13 13:27:36'),
('245d5e6b4f70d0497bd3362a5e2fe23a28fcd9a3bcbc698963345cc7ae939def72b5b7e0d63b32c7', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-08 03:01:55', '2020-10-08 03:01:55', '2021-10-08 05:01:55'),
('246d23e1299b2bf980a60ed2b68e2be25f0c85125c3d9751219b0a73baa41cd0e1795af061864f12', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-05 12:16:05', '2021-03-05 12:16:05', '2022-03-05 13:16:05'),
('24d675d6e9a2d816d7403a0369fc9b82e4929bb37dbe427493d7c253a3639d942130bcacdbebe8ee', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-29 17:03:32', '2020-12-29 17:03:32', '2021-12-29 17:03:32'),
('25888a0fb00fdb3da425954ab2cf4dba532fea2d7d9b7e2af4bfca715611f4ce99f4920e9a1dc8f2', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-01 17:28:29', '2021-03-01 17:28:29', '2022-03-01 18:28:29'),
('25eb499a0f4c286e39b9b1e625366282ec1428e0a7805a3f652d75a0497421f1a9fabe240e6f6b2d', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 11:06:13', '2021-02-06 11:06:13', '2022-02-06 12:06:13'),
('27cd817a2caf645ede17573d26cff107bc70818a9dbcec89c7632e6496ca6df39e4dd01ec49cebd8', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-05-08 00:18:16', '2021-05-08 00:18:16', '2022-05-08 05:48:16'),
('2941c219c6df08a2634f681216e304a44277002be91598ea3fa55c2b1aac8ba1f10dff8960335317', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-22 07:38:04', '2020-11-22 07:38:04', '2021-11-22 08:38:04'),
('297b9458d1aeba759c3d42af85a1b0817eab7b10348df204b6cf743d814492096072c6eaa6b11829', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-11 07:11:47', '2021-01-11 07:11:47', '2022-01-11 08:11:47'),
('2a2b565f09c6ac799e917812f0e334b761b10ede9610ba59b175f2bbdbc27b5ce7291d5f03bac907', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-01 14:50:02', '2021-03-01 14:50:02', '2022-03-01 15:50:02'),
('2bd02ac426fadacc05cfe6b0da3b8d19bc80ac52fa6c44a5a83f5aa21d6cc4d5fdf13db69987ba2a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:03', '2021-02-09 05:15:03', '2022-02-09 06:15:03'),
('2be5801405058acbe3982f26efb028d121219cbe69eecce24481fcef43e5757ff8b10590254fb6a4', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-30 11:40:19', '2021-01-30 11:40:19', '2022-01-30 12:40:19'),
('2ca31acade0a9c9d7fcfa64369494657c0ccd846c30559c329c21bd380fe51f08969e16b5be7ab77', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-03 18:36:34', '2020-12-03 18:36:34', '2021-12-03 18:36:34'),
('2ef0bbf5521a104655065dd141d1b8a4433bda996fd1e06e6a8b8ea8f8dba26fb40ab062cae617c7', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-24 12:49:03', '2021-02-24 12:49:03', '2022-02-24 13:49:03'),
('2ef5ecb72277085dcb8283fe33d594ab9a1a52e79c31264d4b4fcfb8fc2d66d7ba3990acdfa362c1', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-25 18:37:38', '2020-11-25 18:37:38', '2021-11-25 18:37:38'),
('2f4eede89a22b8adc7fc60880b0f40058fd7ee4f05e0c52fae3fcca0da64c1e4a0ab282a95f97969', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 11:35:29', '2021-02-10 11:35:29', '2022-02-10 12:35:29'),
('2fd28aa0e0939bc4dc4773903a438091f4fdebd3c6f8e5eb68b53274b0fb5df1ac801081d3f995bc', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-31 15:59:07', '2020-12-31 15:59:07', '2021-12-31 15:59:07'),
('31b136de11fa6ad1513a6e47ed69f42066efe3c2581bb9cc03f3828883133aecbc211a0b11ba2468', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-27 14:11:39', '2021-01-27 14:11:39', '2022-01-27 15:11:39'),
('31f605095d457c9af6b9a3d03959cecefb6ea8d8b489bef3aca6407e38f7fcd70f107b728047621c', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-13 04:44:09', '2021-01-13 04:44:09', '2022-01-13 05:44:09'),
('32e7505370c52b1aec5f824b93fb19693296a6804a2748e72b73f019d41cfaeb13782a78489187ca', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-25 12:34:16', '2021-02-25 12:34:16', '2022-02-25 13:34:16'),
('32f5fd86fb7882b14f53235f6aad69fadbaa3c36e127209fa2fcb8a34292711e2a8685ddaf51d66f', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-20 08:03:40', '2021-04-20 08:03:40', '2022-04-20 10:03:40'),
('3345cf5bdb7463a3dba2652d352b4b62538ce2a2e8a151e024f09ae873f1009b5f938f0943270faf', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-29 04:39:40', '2021-04-29 04:39:40', '2022-04-29 10:09:40'),
('33a91faa6f62496ad0fb41e5888ddba5be3b53553297d67539e47e0819bac96feb1a036fb890972c', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-18 14:45:11', '2021-04-18 14:45:11', '2022-04-18 16:45:11'),
('33db49abadde0936efeb8634b613ba1b6dd8d17b8da3d8947516a9610d1c815223f140f9c0d48880', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-15 12:19:24', '2021-02-15 12:19:24', '2022-02-15 13:19:24'),
('340f2b0ec0e21c9b939a7f99afa67ee694ae38e2ab0da37bc8568d059f2ebcd7a5ab0f94231bb2fb', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-16 08:48:46', '2021-03-16 08:48:46', '2022-03-16 09:48:46'),
('345d3986fd143cd848b0e65a2d3ebf85b6c417aacf0daf182a0180cd0fa8c214b8ec7133457fcb05', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:17:27', '2021-02-09 05:17:27', '2022-02-09 06:17:27'),
('34a23543dbcd732e67cbb64d4d51d8e392d7e38a1edf7bdd2befddc817ee84efec40b02678c03e54', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:43:19', '2021-02-26 11:43:19', '2022-02-26 12:43:19'),
('352c0e24e62606b4d831f0a19218aac16f50b393c1129df93087f6fec3e1ea52b24d2fadcae9b317', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-12 20:24:19', '2021-01-12 20:24:19', '2022-01-12 21:24:19'),
('3579cb093202d9a4ff35c702690caf4b0073c0c3ce698731cacd596901729b574855c62cb3c71055', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-31 07:39:58', '2021-01-31 07:39:58', '2022-01-31 08:39:58'),
('37c3a1ce15ba8f42c506b84b0d7ce24720451be8e911c6b7e9b886e865ba27e383d3660c1825a5b7', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-11 08:33:19', '2021-02-11 08:33:19', '2022-02-11 09:33:19'),
('399faf6a3aecdfcf7914dbbd195e4fdd4b181cc15431c28fe384f78de91e9efe0242e51141a017b2', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 12:25:08', '2021-02-10 12:25:08', '2022-02-10 13:25:08'),
('39d4d24344a189eb4b9be09fc2e1fbc3457e941938346a4e1a56c65cc9aef4e4361991cb655220c2', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-24 16:21:21', '2021-01-24 16:21:21', '2022-01-24 17:21:21'),
('3a123696998369024d23ee2c8ca61198841e78a284878454b5ede01e54b071b4b53abbe8efdfa1e3', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-08 20:02:20', '2021-02-08 20:02:20', '2022-02-08 21:02:20'),
('3babb7d4f949dc53629b8111af5f868ddfbd2ed66e515be2d3b9708f499e6b3f45e7d027389694e2', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-08 12:06:01', '2021-03-08 12:06:01', '2022-03-08 13:06:01'),
('3c69d391f3c30ebaa2deaac92493696be0371769ccf2c9dc6ff613aa2007d2126254ed2f85d5c30c', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-05 09:42:57', '2021-03-05 09:42:57', '2022-03-05 10:42:57'),
('3cec47baa50114108aaabc230976e7e3cc48fe9fe10846478b21fff29d1461d0b870952d38a3eb42', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-14 12:26:39', '2021-01-14 12:26:39', '2022-01-14 13:26:39'),
('3d0693c50b1945d3e1b9062bc3f275005515f2970b8b8f9db757423849c6c0a90eb580bff5ad4bba', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-24 17:48:59', '2021-02-24 17:48:59', '2022-02-24 18:48:59'),
('3d5740243426ab8da8dda9e0975fbe7c876ce0ab7c9f2847fa357a8bfe8d5e3522ffa29e8714d2cf', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-12 12:07:34', '2021-03-12 12:07:34', '2022-03-12 13:07:34'),
('3d87e7fec841093a26f7e32a68156849e746cbb4fb795766656a72a0f232fe48840841c926f570be', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-15 05:15:29', '2021-03-15 05:15:29', '2022-03-15 06:15:29'),
('3e7df9fbd4fbf36c9cc3ed723bbdfcf84725bd96b5e0c4f74f928fad532e48977a487935910b7822', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-01 09:45:07', '2021-04-01 09:45:07', '2022-04-01 11:45:07'),
('3f5379d3249d9c2af7dbb6527e755bc0119086f641e312604e657a781d72e585d15f0c2f8edeeb34', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 05:10:43', '2021-02-17 05:10:43', '2022-02-17 06:10:43'),
('3fefd93f5cd2757028b9544b30d0e3b272341f822cb7f6628b1ac3fac6122a8de95c7d4c901f2a69', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-24 17:51:41', '2021-02-24 17:51:41', '2022-02-24 18:51:41'),
('40237860c84b445315149e89d01ff9a7546f88d71fc7918b05110b379af83c15ab790464b4f27bdc', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 09:30:46', '2021-02-10 09:30:46', '2022-02-10 10:30:46'),
('408678d827042af7d30689746c4a9583b65360f856cb94504ea644892204effde3de0697fd1de9da', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-12 12:00:09', '2021-03-12 12:00:09', '2022-03-12 13:00:09'),
('41de86617a74520884c0ca1420581502ca1cb38a752802b33d90f3edc8c854ca39d23546998dd709', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-26 12:15:38', '2021-02-26 12:15:38', '2022-02-26 13:15:38'),
('4286033578a61f21c39558241d0d269d801610584096a897f20e34b0f9a85d88f23f325eebbf13fa', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-08 11:28:31', '2021-04-08 11:28:31', '2022-04-08 13:28:31'),
('43825e855bc7f434e3b750aa801295ae9b51c23c2e30916baec1f9e4b184bccd33e5e91baea7154e', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-15 09:20:01', '2020-11-15 09:20:01', '2021-11-15 10:20:01'),
('43d894d4395136099c6f45c0f39ba4e722a117d27f015380725a1b6b6bc0f01166822a88c0f3ade4', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-26 11:44:20', '2021-03-26 11:44:20', '2022-03-26 12:44:20'),
('4736345db0a4072f3bd4e0d22792103904d6ee104f7281026e4d3c43be7a95e97c5191211dfa0ece', 35, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-10 20:40:09', '2021-01-10 20:40:09', '2022-01-10 21:40:09'),
('47f7535349cf79310e10297aa0c9d6c6732cdb55e6925ab6f80c025745aac2d36247145c14d67927', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-24 18:47:51', '2020-11-24 18:47:51', '2021-11-24 18:47:51'),
('48147f9b1566a0cf685b0d13ac70d33c22ffffab07ec04c84fe0a4858dc5cf0826e0db9d979e1632', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 08:48:17', '2021-02-17 08:48:17', '2022-02-17 09:48:17'),
('482e3c0f038850ab26299a85529c82db8453455e774fbfed403791f20c39a7f2ef0339c2a16b4f40', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-16 19:47:19', '2021-02-16 19:47:19', '2022-02-16 20:47:19'),
('48c2e5d941c5a600b3eb51c90235d4fa1df87022f181dbc0b6ee63608241ffc1029291468b1c7c3e', 29, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-25 18:42:36', '2020-11-25 18:42:36', '2021-11-25 18:42:36'),
('49dca7cbff5986092353ed1dbe421ee895dbc7396ca9356a09456a387fc98e46d39267bf7a6b18d4', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 12:20:02', '2021-02-10 12:20:02', '2022-02-10 13:20:02'),
('4a63b3b2d014b4fc18b1c0ec71e5b9faef6f96a30887b69cf5f696375d662099ac84c17f91f21e3d', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 05:06:02', '2021-02-26 05:06:02', '2022-02-26 06:06:02'),
('4b185677d992ac2101e4bb1b93f33f8b85cdb3743d0f10df43ce2fe0311fcc4f5042bcaf0973acd3', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-25 03:00:51', '2020-11-25 03:00:51', '2021-11-25 03:00:51'),
('4d77a00c3d30dc6b9cc88a92d458e7feda5bae36f700eb74dc0778d09f921ab094b5697deb817d70', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:42:35', '2021-01-29 10:42:35', '2022-01-29 11:42:35'),
('4ddeeb011c6a3bc367f0b50249001e4564cb20852637b7da03e7d407c28a4102b1cddcf838a91e5c', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-08 12:33:51', '2021-02-08 12:33:51', '2022-02-08 13:33:51'),
('4e66123309a90b326b1c29eaad4e932d0f5ef7e6e34b50451df3bc08a602a51dbcce7b9f39b491fc', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-04-06 10:46:09', '2021-04-06 10:46:09', '2022-04-06 12:46:09'),
('4e9d640b2dc8d0d82db711146e1938efc08b0bbe1c330010a4873e869936d88a4a0e75a094696555', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-19 09:58:57', '2021-04-19 09:58:57', '2022-04-19 11:58:57'),
('4f46f630c27b31e9d70f1c76e261945e7de5f3020810d5fd939b46ca34a56772ec637884c993ba9a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-15 12:25:02', '2021-03-15 12:25:02', '2022-03-15 13:25:02'),
('4ff86ba3edee77cb25f141bf743c51d31d26b4b45dfa970ccefa1c873c5c61d5ba7bac9a57ed66ca', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-25 13:36:40', '2021-01-25 13:36:40', '2022-01-25 14:36:40'),
('503f904a55c4f94591a7fce02486b06b0a781dbf6017eee0e88712ac0c02960c8456eedb458d00c9', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-31 07:40:58', '2021-01-31 07:40:58', '2022-01-31 08:40:58'),
('5139d3b9a6dd26561c4cb0771856c807daee330da9449f8cc948aab9e3fe0afb635f405cade570ae', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 12:04:12', '2021-02-10 12:04:12', '2022-02-10 13:04:12'),
('517d70e0a6fea3d45790b74592c3ee6a9e400e452f7b6a56bf81e187d48fd5d94e3b3b2d01e32e16', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-25 16:57:47', '2020-11-25 16:57:47', '2021-11-25 16:57:47'),
('51ba9f106c2b5fa0a47d56bbe2f9c03e46183df243ef0f88e209f6a4ba66e2664c8e5084396587fb', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:46:49', '2021-02-26 11:46:49', '2022-02-26 12:46:49'),
('5411262b1b509bb291a2bf6e6ef223818094289cc7bdb98cf019cc55e090fa9d58c96db5975de846', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-26 11:42:55', '2021-03-26 11:42:55', '2022-03-26 12:42:55'),
('5471dcddb6ee893cda2ae9995beed2af69f0f80fa8e38c5a7c684b168be2aa64d7332cef96c831d3', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-09 20:17:54', '2021-03-09 20:17:54', '2022-03-09 21:17:54'),
('557af1db6d239ec41f7a97d7d3477b8853865ba03d7a214033d68fde7beac5f22f15b357ae56ee36', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-04 12:33:40', '2021-03-04 12:33:40', '2022-03-04 13:33:40'),
('55aa0164b0a250543c7fb7bfc472917ea016f06fa2a4a66662dcf07936c54d0c7e5b0d44fd19aa59', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-16 12:53:14', '2021-02-16 12:53:14', '2022-02-16 13:53:14'),
('55f488d681d7e99fc2bcc9994a2fc0c11035dc2817b88474d865f3f0bcb0c96365cfe1896f7c371c', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-24 19:23:59', '2020-11-24 19:23:59', '2021-11-24 19:23:59'),
('56ada2222f9cc609e74bdde61975fa3b9c9e225cff596116b0634ff79164ee7712072958e990b9b0', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-31 07:38:25', '2021-01-31 07:38:25', '2022-01-31 08:38:25'),
('56f75f3ab842792ff10cf280baa0e194cc66ff5f31bf4874aef0ec809a7deca503b168a00a043966', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-31 07:47:24', '2021-01-31 07:47:24', '2022-01-31 08:47:24'),
('56fba8b1886fd5254074eb64a2328a267161e8d3fd755296e438d6ede39573d8da92a54557f7361d', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-24 18:48:17', '2020-11-24 18:48:17', '2021-11-24 18:48:17'),
('5a691c255106fc551450550481e6d7bdb01bd7546893b8d06ebf87d0f900d660d7bf03ce38ac1085', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-11 09:03:51', '2021-01-11 09:03:51', '2022-01-11 10:03:51'),
('5c3508754299d3a72e711e0487079e5ff0af96e56cf3bd83107e3dfdeab271557813d5ff1d853fd7', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-25 19:50:22', '2021-02-25 19:50:22', '2022-02-25 20:50:22'),
('5d7e065c03d3c3443c495ae081b292cc94612d649d90a3bfeab41b28feb86075212258e2e53b3587', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-27 20:35:04', '2020-11-27 20:35:04', '2021-11-27 20:35:04'),
('5da280e1273ecc3db0a70aa37e9f890f551830d1aa43828e73c4ca7b515bcacb6b7e71ccaca87120', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-20 17:05:39', '2021-02-20 17:05:39', '2022-02-20 18:05:39'),
('5de5102ab589dd2c3c2723958e55a8649fe2a6d36a4b2c3fc5515233005c8eb65e1e3102193b8450', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-15 04:41:26', '2021-01-15 04:41:26', '2022-01-15 05:41:26'),
('5df58fd74d1075a470d57d62b2f554d5343af4787aa42070d4860f16280605c86b677bb719301f2b', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-05 18:45:23', '2021-01-05 18:45:23', '2022-01-05 18:45:23'),
('5e8e53a86b395b261374630c6e629e6bfe499aafcd3faba9e871cd284e2a01652c48a2c29a700413', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-31 07:37:31', '2021-01-31 07:37:31', '2022-01-31 08:37:31'),
('5f829809b44ae6d16f3f94f7461c8f4f5b66e58e8715ab455554b07c60ad05acc65d30d8f73045ba', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-01 20:04:03', '2020-12-01 20:04:03', '2021-12-01 20:04:03'),
('5fc67af0a4730ce0a99306cd2aa9ae6b1c34c6f138d7604fe6c4a517f2486f39031022fe3ff244ea', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:10:52', '2021-02-20 17:10:52', '2022-02-20 18:10:52'),
('5ffe24298afa7bc587bbfcc1a825e5312c598857838cafe2b0e54344277174ad88e1cd1ffce3b6ec', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-29 18:41:04', '2020-12-29 18:41:04', '2021-12-29 18:41:04'),
('602206940484ded2f042f79b7e5fc400598c2a51dc6647a86e55f57cdbfec91ecf4b2115ea16e48b', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-22 11:51:10', '2021-02-22 11:51:10', '2022-02-22 12:51:10'),
('60443a83463f3685cb1cdc50e3e72fb95bea78e295f9a25c0cb238fe015a589b0c727c699aece364', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-25 11:33:24', '2021-03-25 11:33:24', '2022-03-25 12:33:24'),
('6087df4e4453e674c9b3ed8d5c9aa2af8b1319161184a5f75ad3fe873ac56a7240203095451dfa27', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-24 19:30:29', '2020-11-24 19:30:29', '2021-11-24 19:30:29'),
('60d16f4e4b597a1dd3cb50c09a752dc6126d28764ddfb2bb4c3cb77385d8ecda0d58819c993bee8c', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-20 11:24:35', '2021-02-20 11:24:35', '2022-02-20 12:24:35'),
('6170579bd1a797e6802e19753ef78e3133514376dfbe1d9556795def305e7639caf8f967a909984e', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-19 12:17:06', '2021-02-19 12:17:06', '2022-02-19 13:17:06'),
('623b0391aa9a842e2dcdc12d134c2b22f0cdf1c5a7eede6da5512a467e926fa6e2a552c2dbed0bbe', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-01 08:36:41', '2021-03-01 08:36:41', '2022-03-01 09:36:41'),
('648c6896f57acc8f5193a53303b0489d8cb727eff8d04d04403c089f2fe49ec3490bd8d14597d699', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-14 07:56:22', '2020-11-14 07:56:22', '2021-11-14 08:56:22'),
('64b36309f7ecab5afb91a6bc880437ed9fb25cb20bf5c30571182c314c8e8776ba25a5a9ce3cfafa', 40, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-13 12:27:37', '2021-01-13 12:27:37', '2022-01-13 13:27:37'),
('64c2c308cbb2edf0823da16115d9ffdd31eb68f22590385f93dc6eccf9141448483fb456a36a41e6', 27, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-27 20:23:45', '2020-11-27 20:23:45', '2021-11-27 20:23:45'),
('6527d42bc384e9efe5f73d9b914d5a88584f56395b3ff0da2ac330a382a6a23935c6613cbdc57805', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:42:37', '2021-01-29 10:42:37', '2022-01-29 11:42:37'),
('6610a1c8c31f8316bea2856ab02197c0a140bdaf1b4ce2c151f55cc9a4d858bbd0df601e81096f0f', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-30 09:34:07', '2021-03-30 09:34:07', '2022-03-30 11:34:07'),
('68d0c5bc15488d6769508a8b8ad1d9daacfd37b9e7f0d5f052340a3e18e234f043a76224529fd4d7', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:32', '2021-02-09 05:15:32', '2022-02-09 06:15:32'),
('6945712bcd9cd59e493218a5c316cd88975f4dd4cd51e24af29252cd2491d9e5db67b8110668a369', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-27 12:51:54', '2020-12-27 12:51:54', '2021-12-27 12:51:54'),
('6b51c31c73de6babfeceff1780a5fb347c02e68db092c81b353522deb608542e4b137f1a78940d66', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-29 18:41:16', '2020-12-29 18:41:16', '2021-12-29 18:41:16'),
('6b639292d5b5092c6c46c446f7f0a96a703983d392dd262f4b46234706f65460bfb507e2db765929', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-13 12:26:21', '2021-01-13 12:26:21', '2022-01-13 13:26:21'),
('6d488194e450d8e839fc32666c4b082858625a8aadd0005f769e160f62cc7458699716be2233a642', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-04-06 09:47:13', '2021-04-06 09:47:13', '2022-04-06 11:47:13'),
('6d7db8461f7e89a87a62e553d1e2fdf8373dec7975f265136e7c48493bc30c0c23303742858c8a99', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-29 09:58:54', '2020-10-29 09:58:54', '2021-10-29 10:58:54'),
('6d7ddadb3e9b0c7c03aa03ab8b05f62ca036f8e42b889fe38129d36115be286ff629f91c3a46794e', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:18', '2021-03-31 03:51:18', '2022-03-31 05:51:18'),
('6db78083e51b5a102cec3fc1c2a9b674452890b26dead3b7028bec04c034b5632c13666bf3eb11eb', 30, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-27 19:56:54', '2020-11-27 19:56:54', '2021-11-27 19:56:54'),
('6efd75dcd476686686b5e9448f2bf77a2fabc47e54129853de494a6aae952485b2700d2597ca5e93', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:10:35', '2021-02-20 17:10:35', '2022-02-20 18:10:35'),
('70851f6600df299fc97134d50c9328c61af80fe59e2ff8468c48b5b3c1f3fb1d47f2fc04bab829b5', 93, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-22 19:36:52', '2021-03-22 19:36:52', '2022-03-22 20:36:52'),
('7089cfb87911e33daff6e47db9ea8da45d058a494eaffe4bce3478b8b997da6c2d30c80de7b53a1a', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-05 03:48:39', '2021-04-05 03:48:39', '2022-04-05 05:48:39'),
('7180f258c4eacd0efe23be563d6ba2c28577e2d328357c412ff52ea79d41ab3a04dcc749ea6aa193', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-12 09:53:30', '2021-03-12 09:53:30', '2022-03-12 10:53:30'),
('71ff71904988f721bde36cc477d1166b349cce68ef1249dd83c4591a100fc3d4c3775fb8dab23762', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 20:49:21', '2021-02-10 20:49:21', '2022-02-10 21:49:21'),
('720c427e86a8c415968a062f88d4503fadca0dc9b90fd2001c859dff6e3feb0ad9442e9f90192d98', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-01 18:13:56', '2020-12-01 18:13:56', '2021-12-01 18:13:56'),
('7329bb9425893f6a2e557d93d7497a38ca1930296c6a4c40aef0c2ef96d34e525e03aad22ebe5259', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-19 05:31:26', '2021-03-19 05:31:26', '2022-03-19 06:31:26'),
('7387ac4a62e0b86f7f5936bd32ae5042b0eee4bd757bc0d7af178241bb1f05dfd482ec1e5185aad6', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-19 11:48:46', '2021-03-19 11:48:46', '2022-03-19 12:48:46'),
('73ecf571668602e0017406a46b983f1fbfd5ee6ad3e0ed23ee768d06b525597e282ffe600ee9740e', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-23 05:38:58', '2021-04-23 05:38:58', '2022-04-23 11:08:58'),
('741bbb049a320f29342fe7bff08d0b72336cb4f9cd52dd197c21ebdc9c07cb57a5d744eb2282c7e9', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-15 07:26:08', '2021-03-15 07:26:08', '2022-03-15 08:26:08'),
('74267587fc7d6e485582c3a822d6edfd0606548330191cea51523317431ade0e3b8ef4da3a50ff3d', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 07:05:50', '2021-02-09 07:05:50', '2022-02-09 08:05:50'),
('746957c4f429f916097c23cd12662d9d10a36c1bebb377b9fade67bcda94101752467ed65112c7d4', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-15 17:22:01', '2021-01-15 17:22:01', '2022-01-15 18:22:01'),
('75a58c02ee2d74800b5092a3dcafe3a14cbf483863106c98e030a62109a82b7d660de0025650e72c', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-29 18:44:28', '2020-12-29 18:44:28', '2021-12-29 18:44:28'),
('76514b5d30cde70dc0c5508a30649404ab430256b4393906837949154e6004cde0dfd7566af2e13e', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-30 20:49:14', '2020-12-30 20:49:14', '2021-12-30 20:49:14'),
('765bfc14c0783a4aaf1f722972c8f5d1280d77cb3310522e1766ade9b74cdbefb890cc6407e5dcae', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-15 12:22:56', '2021-03-15 12:22:56', '2022-03-15 13:22:56'),
('76cb66a1a6ebbb6501c1c6fdd119be4fb9b6e138d49a71eeaf4e1476779197849a97b73f4bda0781', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 05:11:25', '2021-02-17 05:11:25', '2022-02-17 06:11:25'),
('77b07c783c2bedb55d2c2f6df27dce75367eb34eb5e5475122cbd641020eb8d0ca8afb2bfb93d545', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-28 12:04:59', '2021-01-28 12:04:59', '2022-01-28 13:04:59'),
('79cef7ff781902d0e65153554418a5b773432899f2d49df1271006bb20608595a643194727f4d52a', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-06 11:23:43', '2021-04-06 11:23:43', '2022-04-06 13:23:43'),
('7a8bbd2e909265b96d663cb6ec58a85bc47558afbebfb8c6b69470090ab4942a94f9aaa8fecfc050', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-13 20:06:15', '2020-11-13 20:06:15', '2021-11-13 21:06:15'),
('7ac779921d802b6547585bd8492929b648e9a83dec8b91dc78cb3bd51650ca1b3c0a99573bfc42d4', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-02 09:02:45', '2020-12-02 09:02:45', '2021-12-02 09:02:45'),
('7c9feed526f0583fd48a0d618316a907772ebc5515d9854a7adf5ee35885c70dc178ab36e4926fa0', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-19 12:39:31', '2021-03-19 12:39:31', '2022-03-19 13:39:31'),
('7cb1b8aa49106ef6d4a155cb805b272781a955af3cd76be33a32f592d1c10c0ca71734cad606ea60', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 05:08:36', '2021-02-09 05:08:36', '2022-02-09 06:08:36'),
('7cb9f2c84e01fc7b6a17d4b5fbc4f646e46adef12f7eef053ad95d6168b7bcf83a343a1295522398', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-05-01 06:03:40', '2021-05-01 06:03:40', '2022-05-01 11:33:40'),
('7cd22d94e65f901d2475756eca29365f495ae09dd5e8072703206316f4186545807ec768903a87a6', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:55', '2021-03-31 03:51:55', '2022-03-31 05:51:55'),
('7daf291a5270e98a117395fd6665ae875f572fb229a3dccfe841e3475a1b1447a2e35b47e2a23a13', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 04:18:38', '2021-02-10 04:18:38', '2022-02-10 05:18:38'),
('807374cfd55f9fc51b08659cdda9972bec1b6750416040d00fbec1e713023bf66106fadbe3f5efdc', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-05-04 23:30:53', '2021-05-04 23:30:53', '2022-05-05 05:00:53'),
('81bd8c428ab190afc983c23d2f96177ec7015b9493df0fcd8eaad6fb9f887c34aa24206766a3b263', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-01 09:16:11', '2021-03-01 09:16:11', '2022-03-01 10:16:11'),
('81d3edd4bf887739e7423879626ad3beba4e77c29b9bbeb177a3fed71ae924c0feee03cf7ebe963b', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-17 12:27:34', '2021-03-17 12:27:34', '2022-03-17 13:27:34'),
('832bcdaa5ff02c011a8836d0adb076a27c8a3be326b66bc693b8a0e36a2769881ca958ee5443c25f', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-13 17:00:19', '2021-02-13 17:00:19', '2022-02-13 18:00:19'),
('837bb38cc35a44e56cbc0193f4b70d61b6812103941c0f5a591dec4c131f1758e2053ee99a3f6859', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-17 19:54:52', '2021-03-17 19:54:52', '2022-03-17 20:54:52'),
('8532f8465045da9f27af3805f0ee1aeb5d43e739c42d3e3e6b3f3fee455b747edcad4c91ccaa3d9f', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-30 13:30:23', '2020-11-30 13:30:23', '2021-11-30 13:30:23'),
('8557d8767c4a0e6ad79b622e977496d6e005418481213559ab6e5768423c50c402be288ce62bab11', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-08 12:32:52', '2021-02-08 12:32:52', '2022-02-08 13:32:52'),
('8643b9b0dccc8c94d927d23ec2b68fcfed506a2cf6268b53003d2c901ef457cc009c0d19deeb8591', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:43:05', '2021-02-26 11:43:05', '2022-02-26 12:43:05'),
('8723f7a4b66f0c1e6e3589108bb3c25fa71f6cae0779aca8bc6e3f197ec4322f3f3e9acc4ab0b173', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:53', '2021-03-31 03:51:53', '2022-03-31 05:51:53'),
('885cf2a3d7285db46e483ef4f99e9c895e3237243f239ac19ab9e8e9320cd4ec3d7fffb9c4499d7f', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-22 19:35:42', '2021-03-22 19:35:42', '2022-03-22 20:35:42'),
('88b19d625cd0c6822d52cc48a307ceb89725d49aa7b154c5f993902e67d303bbd7c74cf137d5e55a', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-03 22:20:54', '2021-03-03 22:20:54', '2022-03-03 23:20:54'),
('8937f6cc8ea3f1677eb60a01f6be7217b159cad8f740f712952dc15ab50cbe7e2ae74e2632c48c83', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:05', '2021-02-09 05:15:05', '2022-02-09 06:15:05'),
('8986682314f25cac10c9c4542af2891bff2bb23e6c12cd24282250eea5d904bfda706dfbf8e90dfb', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-31 07:34:59', '2021-01-31 07:34:59', '2022-01-31 08:34:59'),
('8a90c48c20875ff5a198c04b7de57cffcf390ac5b6ac7edaa79c40c564a609672759a435ff57cab8', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:07', '2021-01-29 10:48:07', '2022-01-29 11:48:07'),
('8aa949a2373c452f7ead4ef53969065bd5028b8ba1d727ea70a4ae92998ad231f5a8279e26b091b1', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-08 18:47:28', '2021-01-08 18:47:28', '2022-01-08 19:47:28'),
('8b1ec943aca337b2941968335e86de581396059c5e6174295070f48ef86c037c24b80daa1d6c8b10', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-02 17:26:09', '2021-03-02 17:26:09', '2022-03-02 18:26:09'),
('8b784aab7ec82d4ea35fcf7b15745e5ce0b6eff199f74f5ab305b4b1a95959324ee5c8cbab845594', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-08 18:15:48', '2021-02-08 18:15:48', '2022-02-08 19:15:48'),
('8b89ba4f2e4ef6453548ec8896abfc55a74622d6aed56b8cc603158447f25202b06ef91a977c578b', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:19:00', '2021-02-20 17:19:00', '2022-02-20 18:19:00'),
('8c20aec447f90d90d9bfa73562717cd11a0050378b2e633dcd3d3e4ba7ed888791ae52e7ffafa71c', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-16 12:31:27', '2020-11-16 12:31:27', '2021-11-16 13:31:27'),
('8c30f0ac05c6bcb49c53e6750a02f17603bc809a376b50db918a8f4016409cb26cf79f413dec1346', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:06:51', '2021-02-10 05:06:51', '2022-02-10 06:06:51'),
('8cf992ca14ed79589d7576f2a034299863fd10b6c0e09f3efb62e9291abff0b24a00042aa89404bc', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-02 12:36:28', '2020-12-02 12:36:28', '2021-12-02 12:36:28'),
('8dc54fcb1f7175b7486f9207887214b53ff4a8872a6255a31cb952e342254b84427adb33d4f50bd2', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-06 05:39:27', '2021-02-06 05:39:27', '2022-02-06 06:39:27'),
('8e1d918942df3773715ca4cb76eaf592b410501690c98f67adad2270524c77286e4f3232bbf5a287', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-18 12:32:59', '2021-03-18 12:32:59', '2022-03-18 13:32:59'),
('8ea05a2f6ca40603075c90903b7aaf7cb2b8c886927a5842d1e13ce561567f5c6e8b1cbc05d5fac6', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:42:38', '2021-01-29 10:42:38', '2022-01-29 11:42:38'),
('8ef92ca890d7803b3d05fe81fdabd2cf9c77430b49acd37cda4da86f981203caa50eef54857d3c0d', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-20 05:53:58', '2021-03-20 05:53:58', '2022-03-20 06:53:58'),
('90c5e3cbfed43def6504c749b1a014fe9bdb3d8aa5a51037e8335ae96bbcbb662e07c743d8edfbe9', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-10 19:57:24', '2021-01-10 19:57:24', '2022-01-10 20:57:24'),
('9189f7d4a96e2e57b5a4f6688642209d013ad1234e923a412610b04b61dce959f7091c640f2d8ce3', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-27 13:20:05', '2020-11-27 13:20:05', '2021-11-27 13:20:05'),
('93175abf9a2d35874cb436b23e8dc65a076b456ec2b8742446a8075ccf8035f876fb40da7c045267', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-23 12:02:10', '2021-03-23 12:02:10', '2022-03-23 13:02:10'),
('936fc8708ff1fa65bc61f404d1a87f9585652bd0f629ffa8b8c4277847b13017e47ff980684ce2b1', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 05:18:31', '2021-02-10 05:18:31', '2022-02-10 06:18:31'),
('957d5ad77e0f2ca41f95db9519f9614fd0d0664b4d0ebc7d6bf80e7a7823ab2152df69749d82031e', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-21 16:50:05', '2021-03-21 16:50:05', '2022-03-21 17:50:05'),
('958f46af3f54413d35228ac4f31411aafb9279395495ca47b358103301a022e8862840bcbe8fc9e8', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-18 12:21:47', '2021-02-18 12:21:47', '2022-02-18 13:21:47'),
('97deb2649d480f86e817c8cfe2eb86f6532a4e74a1fcd17fa9dc88279cc75b88597067fc063fe522', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-04 19:19:44', '2021-03-04 19:19:44', '2022-03-04 20:19:44'),
('9845d423c7f2f0ad967f4317b5227a2fe7808e6874a02ea15b3e883bc851ee7f8e9c6f0f15151ae2', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-25 12:53:10', '2021-01-25 12:53:10', '2022-01-25 13:53:10'),
('98f46cf51ab54fbaf08104c63b28cde0f846485fafccf24e31de91650888c7ee6a4add53a1a3f237', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-17 20:24:55', '2021-03-17 20:24:55', '2022-03-17 21:24:55'),
('99d69b17df4bdea6bef596a3b478687bc94a4c6db9b3bcdc98e887d824a677fc7e3e9ea233f32dbc', 2, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-09 15:43:29', '2020-10-09 15:43:29', '2021-10-09 17:43:29'),
('9a499c8690320279461c53a057955b679624f80501ce764058bb857443078cffbfed79737be646dc', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-24 17:38:10', '2021-02-24 17:38:10', '2022-02-24 18:38:10');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('9aa02a05f46760bea8b7c2e424c9cbe890cd56b5f37d3ab66030e65ee02bf180eb4e0e3853e3b8c3', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-30 06:26:16', '2021-04-30 06:26:16', '2022-04-30 11:56:16'),
('9b17ad523c353b8750aa20b5318dd3ad73da42122242b5798a6e614cea792dc191c7e9466bd4c4b0', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 07:10:03', '2021-02-17 07:10:03', '2022-02-17 08:10:03'),
('9bd6ce228c1f0135488a8ef7a444ab4a323998f228f6d81cecf1241caacfcb8f82877cd80d97ad3a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-25 09:27:37', '2021-01-25 09:27:37', '2022-01-25 10:27:37'),
('9cf5bd9868cb1195be63d0d837742b7a9c0a2104718ece01f0a05811563a36efaed952f04650d9fb', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:16', '2021-01-29 10:48:16', '2022-01-29 11:48:16'),
('9d9a0f8682b5f66cd566eff7e95152ac593c1c2d5ba815825932504b3c0cd3b21cfdd10d02597813', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 05:15:40', '2021-02-09 05:15:40', '2022-02-09 06:15:40'),
('9e3215203fb7c3178972d5d972d7e276c0283a60a7fd35986475cb7d9814e7089e4ced5f3aee14e0', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-20 10:05:05', '2020-10-20 10:05:05', '2021-10-20 12:05:05'),
('9ee22071401388362d2ef0c1c5d2ee829d0311c6bf280c473089b9559ba38dd937d8b3e17573e160', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-05 19:36:27', '2021-01-05 19:36:27', '2022-01-05 19:36:27'),
('9f3018789e58056e8706a7ad10669f85c27614eb61e64e93e23c1fc416230020ae308f83593f632a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:22', '2021-03-31 03:51:22', '2022-03-31 05:51:22'),
('a02f6164db19a81c3e18482ee18819639377812f8fac3a74388538a4d990a116fb20a77de6eb26ae', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 09:14:06', '2021-02-26 09:14:06', '2022-02-26 10:14:06'),
('a0d2f84a6931e60ee0824b10c9eb971023336e1e124ea43a0409ac1dc26d230a30ee73ed0ffd6ecd', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-06 06:31:28', '2021-04-06 06:31:28', '2022-04-06 08:31:28'),
('a26c4550841828d222541610b763464a3f230477e52bd47029f9ebdf3cc97004571d070fe5669f6a', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-27 20:44:41', '2020-11-27 20:44:41', '2021-11-27 20:44:41'),
('a2770eda890346423ad30e5e4a57565b817101cbfd6d9171d132680f813f9a96ce0679c7787de988', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-13 16:32:37', '2021-02-13 16:32:37', '2022-02-13 17:32:37'),
('a2e015d54ebba6f15a2e125eac35967964168bfb03cafd8e67f2634e9aa87c54aa8fd629183e1dfa', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:16:15', '2021-02-09 05:16:15', '2022-02-09 06:16:15'),
('a4e2674ec929a479d44ba571c818ab430454c0351cfe968a7f081474a91dbaa0a9fb7f3600257167', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-15 17:41:25', '2020-10-15 17:41:25', '2021-10-15 19:41:25'),
('a5af11b4c1259f2743cb1577d69cae0fbda03c8bde0ad87d8ac8e6bfc80707e82698c833932062a7', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-04 19:18:30', '2021-03-04 19:18:30', '2022-03-04 20:18:30'),
('a5c33679db073a8cceccdfa1f4634c2908751d96d214c62ca4ea935e36bd68ffa098874dbcc61d3b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-23 17:52:22', '2020-12-23 17:52:22', '2021-12-23 17:52:22'),
('a6c2a4fe52576edd56413afc89c3e57b17a549b6fbd32365fc4d52fea192c3452ace04ccab9406a9', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-29 18:50:19', '2020-12-29 18:50:19', '2021-12-29 18:50:19'),
('a7227d107b00fc7638b12eb596bd30e227f82102cee0d3492d850178c2f6a3c41a450444bf92bde2', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 05:10:32', '2021-02-09 05:10:32', '2022-02-09 06:10:32'),
('a7454275ab8b66e7161749a00980683a4b8adce63f8a6558d24497712feb5c1bbe7579115edb9e92', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 18:24:59', '2021-02-06 18:24:59', '2022-02-06 19:24:59'),
('a778d0505027e8e80861efe4ed593da9b11ec54ed3996a052a16e3368332f6aaf4c82531c8e2b5db', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-14 17:39:32', '2020-10-14 17:39:32', '2021-10-14 19:39:32'),
('a7e0d55a9efb7907247cd101ab5890ef96ce4bf57433fc4db23d13efbbc3fe308818414ebf7b2cb6', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-05-04 00:26:55', '2021-05-04 00:26:55', '2022-05-04 05:56:55'),
('a7ebbf000607f02dcb18817423bf3fc4002774ed2347f296708160be7da5873eaa3cb8b9e8751690', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-01 20:02:11', '2020-12-01 20:02:11', '2021-12-01 20:02:11'),
('a867ba01e28c0c5bd2c738e21d9ac0cada0cb3fc1b0c8dca243825a5bc90e7ea25b203f98f1b6c22', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-25 09:27:38', '2021-01-25 09:27:38', '2022-01-25 10:27:38'),
('a8cbe121d83e9962ab6f7f54c970ab525f3cfb7e704505859f7007242537b41a40281af4e6b007bc', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-27 19:58:20', '2020-11-27 19:58:20', '2021-11-27 19:58:20'),
('a9e17b1d43d944ab456fb1b69f29cdd6ae2af0adc2ab2abeeb540cd530dd65f292671dcf47e65115', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:08:27', '2021-02-10 05:08:27', '2022-02-10 06:08:27'),
('aaa3d6026bc558ee73c1ca114e53e1ff09ee144b3c21c659484def84e8ff608ff60f8fb06ecc2a59', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-11 07:10:38', '2021-01-11 07:10:38', '2022-01-11 08:10:38'),
('aae31f746b6f67fdf3a9d4f28b373b0af22b70df3bb5cb63570f808142d7897fd31f31a50fb91f3b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-12 20:24:59', '2021-01-12 20:24:59', '2022-01-12 21:24:59'),
('ab48746d4b4399b324c90b72ea04b749f72388d37bf94ab2564d416c85af83f5ea7d12e6525360b2', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-27 23:19:53', '2021-04-27 23:19:53', '2022-04-28 04:49:53'),
('aba737dcbf0c6b6bb14374d582c8f0a9848ee1445260e0e38cd3bc28c03b9955e41a713ba1b6b604', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-19 03:14:41', '2021-04-19 03:14:41', '2022-04-19 05:14:41'),
('abcbbc5fcc02a2b5e2d26dc5e3e96c08e8fa736b9fd37cd39766b154a6b21b071016be500f6f3864', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:09:56', '2021-02-10 05:09:56', '2022-02-10 06:09:56'),
('abd594626fcf2f60e12fd4a946924175caddb1969fe9d68c96ca030746266c9d0e5cc30ae5369ad3', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-22 11:00:21', '2021-04-22 11:00:21', '2022-04-22 13:00:21'),
('ac784f24c565320c634d9a45699e3b1bb4c70268b88447a73113326c380b9d1138b9f6396f728894', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-27 14:11:39', '2021-01-27 14:11:39', '2022-01-27 15:11:39'),
('aced81423d67836ca17fe526369b0ee99b60aae293241fa426d41db591ea40402e270ae38f4100fa', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-21 08:55:04', '2020-10-21 08:55:04', '2021-10-21 10:55:04'),
('ada0274ec1376c2a9de7176b6ef0ac7b3dd046b83df191349d84a70f8840a12310fa1d4779b1fdc0', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:01', '2021-01-29 10:48:01', '2022-01-29 11:48:01'),
('ae0d36cf22a9eb8f245cbf9fd3ee4da23d3283e5ec28dc935eaf9551792e90d47e12743b087f3599', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:10:50', '2021-02-10 05:10:50', '2022-02-10 06:10:50'),
('aed6db6acbb15dc3e918eeb18add7d16a6a1e693f657cb544bef02555a992323875de9ee23731ec4', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-08 02:51:28', '2020-10-08 02:51:28', '2021-10-08 04:51:28'),
('af55dd8e5c67054b5571232c2f198a2e3b3dc25212fbb95566486d438294dcaa304e4bf41dfdf824', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-17 14:25:39', '2021-03-17 14:25:39', '2022-03-17 15:25:39'),
('af8c0341e92cb8e4837fc22c0adc311e081a5cc3d04089122ea9e8383418ba8569f5044c8c19ea5e', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-27 20:37:03', '2020-11-27 20:37:03', '2021-11-27 20:37:03'),
('afe4c73883d01142770742d28bdfc578fb2eabe6303edfeeccaa7ebda56bbbf1351c7a749a03bfe6', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-08 10:03:40', '2020-10-08 10:03:40', '2021-10-08 12:03:40'),
('b0c6426db1b58bdf47916917e865ec22c647860d717df02bf6e92be6e536d86b7b4bc54d2d1b2e02', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-26 09:23:49', '2021-02-26 09:23:49', '2022-02-26 10:23:49'),
('b13c2392f7f3bd399c2c50f7710e70175ae7f5b4384932785431dc81d164d08dd5863536f9ba0a95', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-11 10:17:43', '2021-03-11 10:17:43', '2022-03-11 11:17:43'),
('b2b36e754315c6780e6360dc35f3865888113c2c8d0e78f372ed9d6b5d4cab4da3c5e01a10bca605', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:07:52', '2021-02-20 17:07:52', '2022-02-20 18:07:52'),
('b2baa57c23d71738d2b8976076d1214f92872561b6eec74d46296e6ccca353e8d384ccb69d4130de', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-07 06:01:04', '2021-01-07 06:01:04', '2022-01-07 06:01:04'),
('b3556567b5368aa47fdbca8552d93bd0ccd916133ecf08367cbee6c978ef43012a1b244ef4300427', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-27 19:58:35', '2020-11-27 19:58:35', '2021-11-27 19:58:35'),
('b39658364cd6e58b0c16feb3e273a93a40ee06878ee4d83946279c604d0acf2d4a345e1225bab635', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:03', '2021-02-09 05:15:03', '2022-02-09 06:15:03'),
('b3ccfb61d5b0d55681073dae993fac83574636af4254474333f209104d4f89b02c8f4e647c470b3b', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-14 18:00:22', '2020-10-14 18:00:22', '2021-10-14 20:00:22'),
('b3faa68ec8c036551e84c1b875e641e932e1c22745a3912208bd785e7602c48f6f5d7a7b24e25cb8', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-22 11:00:17', '2021-04-22 11:00:17', '2022-04-22 13:00:17'),
('b43093e8384debfe8ba429348c263e98cc4a897c3173251ce0da50b82cef20c4ccc354b49e3c655b', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-08 02:33:38', '2020-10-08 02:33:38', '2021-10-08 04:33:38'),
('b440a94264a4e52946eb4b7453edf5d285fd6095eff0617db5b884e4e8c4f37502696695aaa3a19f', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-08 09:38:52', '2021-03-08 09:38:52', '2022-03-08 10:38:52'),
('b4a80518ba5b0e2ce8f12c4fe9437d62d94c7607c9ba9c944d21829319f744fc207bbaa776507673', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-14 13:19:50', '2020-11-14 13:19:50', '2021-11-14 14:19:50'),
('b5e910d6ee55b2c8132d3f4b9d0592d982a7d0b971b57b53583063e12ce58573aceffc7ebd05af2b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-25 11:39:24', '2020-12-25 11:39:24', '2021-12-25 11:39:24'),
('b7151bd800a50814b137209d93efd76db72fdc04468d4fa6f3448ea6a732b09a9127db08f99aae2b', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-15 12:24:38', '2021-03-15 12:24:38', '2022-03-15 13:24:38'),
('b71adf8cd9d88d56c2a160268d76e2f24f38629635a4a6a98b2bbd5fc662db7c61a1eb19056393e1', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 07:30:09', '2021-02-17 07:30:09', '2022-02-17 08:30:09'),
('b7a1daad42aba7834b2bc9e7c34850f805a51ec6df137208949cfd4d6a69028a686b78bb5ebe9640', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-21 12:35:00', '2021-01-21 12:35:00', '2022-01-21 13:35:00'),
('b8e23015efe08aef233ae2e82e3d6df6c472e00ebe9925ca2ad0d16a271edbb18be86994655b18a6', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-20 08:03:51', '2021-04-20 08:03:51', '2022-04-20 10:03:51'),
('b94b2dcc966c479205f05834e70a1c48f2cf3038e46ebd825b299de4fb45e66ad703250b914d4885', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 18:05:16', '2021-02-06 18:05:16', '2022-02-06 19:05:16'),
('b9f14ce4a9e076e37a75edf3873d4382b8fd8cf759e923bd5482864136b9df62c60f68422db2b88a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-28 12:05:15', '2021-01-28 12:05:15', '2022-01-28 13:05:15'),
('baae06333291246908b98fd8c6398ae8b8d88ef0b9d99b00ceff7618755d9f594ecfb1602d451e51', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-01 09:21:57', '2021-03-01 09:21:57', '2022-03-01 10:21:57'),
('bc4470c016b464354a49d5e5b41d80c8ff516137890dfe5e915d5b05d9b136a83bcc76efa1371e3b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 04:18:35', '2021-02-10 04:18:35', '2022-02-10 05:18:35'),
('bc50915f4ee017af5e21dd689795b4bb81dbd4bd147a10ec6e3d70d217599dd14a5284e0f2b8b384', 79, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-16 07:46:39', '2021-03-16 07:46:39', '2022-03-16 08:46:39'),
('bcacf3fa7b619743207af6959345f9851403562c392f10306a9a5150e3ea3113e3ab930ec7972564', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-20 08:03:30', '2021-04-20 08:03:30', '2022-04-20 10:03:30'),
('bcdc0e59695e942bf76de3b676539b7586edde960e4f6c7970277cc3e96ad8163e6b3fc79c40cea8', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-29 17:06:41', '2020-12-29 17:06:41', '2021-12-29 17:06:41'),
('bd5c6fca09c41311294947a8d6be264026d2495a4c28ad134fdad0511e00324fb9b9a200762ab310', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-10 20:40:33', '2021-01-10 20:40:33', '2022-01-10 21:40:33'),
('be88f9ae5b9161d101066313d433d99e1526e3b6fb20cc538ff5f71ed57fddf024813c9df01fb345', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-26 09:15:17', '2021-02-26 09:15:17', '2022-02-26 10:15:17'),
('bec9cad9ef68bc73235af43e7c37186ade73dec86e3553dcec3fb6310fd46c1f378342fb5083d231', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-17 20:24:09', '2021-03-17 20:24:09', '2022-03-17 21:24:09'),
('bf83565c4eb36088e743b379ebdacf40f48b381d7407f51d006596871c71f3a6c9a288fa15854a12', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:40:38', '2021-02-26 11:40:38', '2022-02-26 12:40:38'),
('c05fbe8adaa2d67686cbac8a822d8203169b559a7b0d5341fc8c62fa0606d8f4503b448b35bb48a3', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-06 10:32:30', '2021-04-06 10:32:30', '2022-04-06 12:32:30'),
('c0b406589d97c7273bf37be353cb0948f1c98a34cf71d1a8353eab609fd43845a8884455c843217d', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-29 05:43:42', '2021-01-29 05:43:42', '2022-01-29 06:43:42'),
('c1b8a3ee755c8ca4852f8ed8e4db1213fc9084120178602f1c729807504005d316f03d3087ed89b9', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-27 20:36:13', '2020-11-27 20:36:13', '2021-11-27 20:36:13'),
('c1fb2c50ee69a21eafaa98ac09aeed983508b4a6127db5dea5e15c9f720b7f024b6c5396c1cf677c', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-06 17:47:05', '2020-11-06 17:47:05', '2021-11-06 18:47:05'),
('c2dd3b298dee86653f7283bf9ee700e5f447517c9e23793180d07c102a9e8e61c773a23dd3819858', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-25 09:56:13', '2021-02-25 09:56:13', '2022-02-25 10:56:13'),
('c2e3f6c091de9a9d7ad022ced295d04082d3ad572e6582f81a96c6a761a713a95293b7ff241e1672', 33, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 07:17:26', '2021-02-10 07:17:26', '2022-02-10 08:17:26'),
('c318f208e858a535d22443bb797066848699a5833a0005a24c8b40a4b530830e034cd51af370a2fb', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-13 16:46:03', '2021-02-13 16:46:03', '2022-02-13 17:46:03'),
('c3333513819111454c6261db6ac2d09d44e391b9687d8c2f0caf9509c4eaaf57cee0a574fedc2c5a', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 09:52:27', '2021-03-31 09:52:27', '2022-03-31 11:52:27'),
('c4807ace3a6b1eabbf53fe337e7117075163a15f51dc2ff2db7f8a5034d59ebe49b807400a99a138', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:15', '2021-01-29 10:48:15', '2022-01-29 11:48:15'),
('c65dbe12fd39ea582d9acc86c1aeca0d08e472ebd6a28ec87876fb7b97bfe4b88b814133d94b40ad', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-24 11:40:29', '2021-03-24 11:40:29', '2022-03-24 12:40:29'),
('c694e00be10f6bf44cf9e21a70a7203bfebbb33c1b589d3fc83bd390d85fd6d70cb739e05cd46b48', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-30 20:49:06', '2020-12-30 20:49:06', '2021-12-30 20:49:06'),
('c748467bed664a7f8228da750e41c0b7f3235562053a3b904248d304fb4966297f5069af3c983ac2', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 17:44:24', '2021-02-06 17:44:24', '2022-02-06 18:44:24'),
('c87a180b8efa4deb20ae8fa6ff2a5c1545693c26c7b27722117ab0cd012b3098cbfe92615e12184a', 35, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-10 20:41:19', '2021-01-10 20:41:19', '2022-01-10 21:41:19'),
('c96ee0d05e4c04e62643ab65791e5635e2d24e35a3950d5141845aebec42acf5dd2e8aa23d01014d', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-28 05:13:33', '2021-01-28 05:13:33', '2022-01-28 06:13:33'),
('c97edee836bd5a962a508fc84aadd1b2301fe716c0fc72ae8130dee3de5a87532f13092a91ec3e72', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:14:20', '2021-02-10 05:14:20', '2022-02-10 06:14:20'),
('c991dc0a7fcf2b713309a1a1a83cc4e8804e7d257c9da67f9ba6f49e52d28a60bb59285e5d25bc94', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-04 19:27:00', '2021-03-04 19:27:00', '2022-03-04 20:27:00'),
('ca4ca916a5fd07dc937a91856a1e9066dbbc9e4444b1a210cbd90c6aa97b0d958087f4cc745b19f2', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 05:05:36', '2021-02-17 05:05:36', '2022-02-17 06:05:36'),
('ca659036a26eda4feb1a0c85e1475c99f217a1e30aafe99c7ebf31b6d6a125dc8667c4d8272f9543', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-20 17:26:37', '2021-02-20 17:26:37', '2022-02-20 18:26:37'),
('cad7d0077268d3b523170d93ad70944484c7664e71c0d0245180eb624f862b1555b52a9b72bcba63', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-05-04 08:25:37', '2021-05-04 08:25:37', '2022-05-04 13:55:37'),
('cae78fdfc208f74d5ee5a182638cda1b5c24cf85ec52b09b8e320d4adefbedb65655e672f49dc1e6', 50, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 11:43:24', '2021-02-10 11:43:24', '2022-02-10 12:43:24'),
('cb6eac5480dbe53c2f1926bc3f93f0c299ae19ba520fadef7fe4adaba94aa1a60204aaee108bcd9c', 2, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-27 13:21:10', '2020-11-27 13:21:10', '2021-11-27 13:21:10'),
('cb9ec3960a02500a6ca4864afda735e0f049bd4f9b5d9d26e910c7503186d181aa5fd3be21f8f53f', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-04 19:21:08', '2021-03-04 19:21:08', '2022-03-04 20:21:08'),
('cbd6c4e4f0a04debf5d680b633a504f3a2864f86f4a7885f49eedfb7786b570f3f7cb86e910997fd', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 18:28:42', '2021-02-06 18:28:42', '2022-02-06 19:28:42'),
('cc1ffefe489ccea5b35ade860a6e04d052e1518f73f35747e461d6bf69263056fd514537f2c69acc', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-08 15:30:21', '2020-10-08 15:30:21', '2021-10-08 17:30:21'),
('ccfc3171c27a78697702840e16cae6c037ed408fc8019a264148d8549a8ba1170b1951457e300850', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 09:56:32', '2021-02-09 09:56:32', '2022-02-09 10:56:32'),
('cd354f5f9f16a223bb247ad7c459dca0b06321bce902e1cee3f227cdf30de5375dbac2536bb68fc8', 36, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 11:42:25', '2021-02-26 11:42:25', '2022-02-26 12:42:25'),
('ce8a52a438ed9e6474dfe045c29695708ff7f9084fadf11971bff0b0321db73f3c57b43bf42e41ab', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-24 21:03:17', '2020-11-24 21:03:17', '2021-11-24 21:03:17'),
('cfb98c7e954197ef3fd14af6770969b778a15508d845c969e27e43b3c1623928e6ca31faf8eb7c5f', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-22 19:26:21', '2021-03-22 19:26:21', '2022-03-22 20:26:21'),
('d018729ff41df68d3a87c4babec1e5f79d7e2eb8d639bc2c76e21232e1aadc4c5bbc81d9fb37995e', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-11 05:05:51', '2021-03-11 05:05:51', '2022-03-11 06:05:51'),
('d0545da4851e8bc2535882dbb273a3719c0c31f0d3e39286a7b890e52abc9cad77a2d2426e3a644d', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:27', '2021-03-31 03:51:27', '2022-03-31 05:51:27'),
('d0cb49d7cde9415301394e0eaf3a1ee0af0804a1b3636f3862fe7bf06408db6115a136e1687f3bef', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:42:36', '2021-01-29 10:42:36', '2022-01-29 11:42:36'),
('d1005e3364adb52bf4f7590afc26a4803ba95bcdba0f5ebdd6d0789da49fa6e58ba9c85abf484535', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-20 17:07:04', '2021-02-20 17:07:04', '2022-02-20 18:07:04'),
('d1c1fae76993396e995e7001f3a831e07e6a65c39a5fbb3eec3d0815398d5683faaba23cf78b07a4', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-17 20:23:37', '2021-03-17 20:23:37', '2022-03-17 21:23:37'),
('d2302dda8b1bedadb3b3d173b2eaea2412030231b3b457ccb327ca417aedaacb33af6b3a99559942', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-08 20:01:36', '2021-02-08 20:01:36', '2022-02-08 21:01:36'),
('d237386468a01a32493555416f8b1fe242ab6ae2bdb74526dc28a49797bbf9c0c542ef653d68984d', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-13 10:22:05', '2021-04-13 10:22:05', '2022-04-13 12:22:05'),
('d28f7a93125b3db6502b30e53b31ee66887a9324a3b21a445de79793a9ec8b136fba0ad105922879', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-25 05:50:35', '2021-01-25 05:50:35', '2022-01-25 06:50:35'),
('d3f2c63b9b5447b04c0868928d95ab315f5db15a11a7c0fad9dca378c2c592f1b450510fbdbc6e50', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-24 11:41:23', '2021-03-24 11:41:23', '2022-03-24 12:41:23'),
('d40edb203cdd8f831fef87bdc81901188ea42baedf8cd0078c1cd0dd7b4fcbb103a9006d8ac78aa6', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-27 19:43:29', '2020-11-27 19:43:29', '2021-11-27 19:43:29'),
('d41f6bcf0b0cef383bddbc2dcff53b46efe7cd8e70ce13c30cc660aeb3593aa46abf8bb14d7281c5', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-13 03:05:25', '2021-04-13 03:05:25', '2022-04-13 05:05:25'),
('d48bb5a9b728e10686f698043ccb50f93135c5fb251702340eb091171db45a1d2d574b98ad4b179c', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 20:49:05', '2021-02-10 20:49:05', '2022-02-10 21:49:05'),
('d4adee09b36d4320e28bf7f6275ebd22ac7d4a3a3a445a82100f9b1c4d08f43afe37326f6d95d96b', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-24 20:44:19', '2020-11-24 20:44:19', '2021-11-24 20:44:19'),
('d5767c7e9ecd84fc8de6a0f5a677c78b7ad04175c3fdc855497401d04e80fabb2b53b1e801487ddb', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-15 17:21:47', '2021-01-15 17:21:47', '2022-01-15 18:21:47'),
('d5fd08c5f7bc24a42804fea798835e53f9a2f72e21320120f13235f5e828c98ae38ee70ab2d7db67', 93, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-17 20:24:26', '2021-03-17 20:24:26', '2022-03-17 21:24:26'),
('d6003014ac521e0ed3aac97b8fa1d15625f7aa75884045a8e7eb3ba099086599db0368e048601d41', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-24 17:51:23', '2021-02-24 17:51:23', '2022-02-24 18:51:23'),
('d610ddc216482df5c0cef2fc59977850fad3844962f86df433d6af9b5ab34e41dae0f68b442d5495', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-25 20:27:03', '2020-11-25 20:27:03', '2021-11-25 20:27:03'),
('d62ad74b4f7e458ac6c593035ec5a213fb8c0cc746d12e5f205e1336d9e7f223d2e91ad984ff6459', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-21 06:25:16', '2020-10-21 06:25:16', '2021-10-21 08:25:16'),
('d63b154fdb484478cdbe8e4fe8d3d90235a04a8f1238aac70956791c7e50d198905ee85c5b4b41dd', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-23 04:22:57', '2021-04-23 04:22:57', '2022-04-23 09:52:57'),
('d667b1ec39db66418959badd8afadbae8b004573e300b5cb220b65af6a413ee5a885ec83d6254076', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-05 09:28:31', '2021-03-05 09:28:31', '2022-03-05 10:28:31'),
('d8a7cd9deb0b1a09338f730f2fa23e881d5eeadd023856190b7dcfcc584308d6e6c067ba53ca5704', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-15 02:53:26', '2020-10-15 02:53:26', '2021-10-15 04:53:26'),
('da1d0e0fc1d4d04c401a2f9b91177c7fcf4c7fc263866baa9682a59fd3352cd60bbb0bc5492c8450', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-04 19:20:50', '2021-03-04 19:20:50', '2022-03-04 20:20:50'),
('db48ccc70a39781c8d83a2afea6d2883fbd1b3fd6764aa10562b3f88a414ee63500caf8d7caeff56', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-08 18:15:38', '2021-02-08 18:15:38', '2022-02-08 19:15:38'),
('db7673d27167693e6f02401f100d825fc6e11cf5d3796b5f24bbaa1707b6312798d9fdd22e007246', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:03', '2021-01-29 10:48:03', '2022-01-29 11:48:03'),
('dd3b842a2a6a50d288b9baae6a61515e5435775f07fcfd8aca4c3bde2571413fc14fc389f16fcb68', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-22 10:14:51', '2021-04-22 10:14:51', '2022-04-22 12:14:51'),
('dd453fcc1f00fc122df0d1118f8f5d8115468cd93375d17883d7f7d5584ce2136bbbb6f3a109c245', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-05 06:28:55', '2021-04-05 06:28:55', '2022-04-05 08:28:55'),
('ddae58119bcb6c40a829bc9f1b1963a37b3f2c7f4e4e66895fa7f17aa930f18e28cc26a726299b82', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-04 12:36:33', '2021-03-04 12:36:33', '2022-03-04 13:36:33'),
('de80ea04568ace3d1132c846516c704ab5fc3559ce6a0849364ddf4357f00a9c124a9054d22e9dc8', 93, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-22 19:36:00', '2021-03-22 19:36:00', '2022-03-22 20:36:00'),
('e0148a1a6f83359e9559f003a3dda3c4c9ddeaad5c8df42f2f560cdbe5849ae80b5628891c3c6bc6', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-25 13:36:38', '2021-01-25 13:36:38', '2022-01-25 14:36:38'),
('e0ee83da19989702b7e698eb878440de806475c82014e6d03f1c9b05335d908d34d1e4322ad7490f', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:26', '2021-03-31 03:51:26', '2022-03-31 05:51:26'),
('e1355c913a6aa7bf9acebea11634746e41c580ec83614bd3709c81cdd708fe6a894604fdd9d0120f', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-25 14:16:44', '2020-11-25 14:16:44', '2021-11-25 14:16:44'),
('e208cffcdc8ab8676396542864b4b472301b63600e11f662d8f3e9e1ebe9e4bf9bffea008162a76c', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-22 06:56:08', '2020-10-22 06:56:08', '2021-10-22 08:56:08'),
('e27e15f2e9a2366f1a0a7fee7dbf628e3e72608c7b48fc8c8507e9ba60a4285b038ecef15104423e', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-09 20:27:40', '2021-03-09 20:27:40', '2022-03-09 21:27:40'),
('e3484581d5a1aa5e1ad7f9e0ade78d1b4bcd68347c97344d64234f96c0171cc4f30e80490edaf761', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-02 09:12:45', '2020-12-02 09:12:45', '2021-12-02 09:12:45'),
('e3b0f74a24650741a2532a1518ebe9d696533af91ed7b79aad79bb561e73302a42b2dc2d5b40ae43', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-08 18:37:39', '2020-10-08 18:37:39', '2021-10-08 20:37:39'),
('e52d16b2d6e9dcb36c63317663ed888273169facb5943b21632296d9d44b3152af6d3191ae658557', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-11-24 19:39:31', '2020-11-24 19:39:31', '2021-11-24 19:39:31'),
('e569755428cd82a671b6bb831015ad7adfe1edc1c025e4cf669003b14a3de4f68bde4e3461cd63ad', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-27 11:50:55', '2021-01-27 11:50:55', '2022-01-27 12:50:55'),
('e5dad5d3b832499a89d7522e324e3348a4825261309d8b61d1f76d25f010ab88fed64f9874b5f76e', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-20 05:28:57', '2021-03-20 05:28:57', '2022-03-20 06:28:57'),
('e5dd50d2845613b93cb47e65729f700ceab0c5ba06188a250bb25bddb69369d316c6a0b5507b08ac', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-17 12:00:04', '2021-02-17 12:00:04', '2022-02-17 13:00:04'),
('e629e01fdffc843278f95259aceaf689bb9f8a88b7b09e4331cae974dfe9c711c3798eaf566952c2', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-12 12:01:14', '2021-03-12 12:01:14', '2022-03-12 13:01:14'),
('e65c588e2431c03bf0a4e28a12580382effe4397eb1f33ae91c2d1b32ad9971e43341afcb0b66fa0', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-26 05:06:39', '2021-02-26 05:06:39', '2022-02-26 06:06:39'),
('e6897faf2c1605b1f08fee2781a7386e9202d54ed303764feaa9960f3e289d72017fa9ea00da6d46', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-26 05:05:38', '2021-02-26 05:05:38', '2022-02-26 06:05:38'),
('e6bcc472a91cb3e00530e3328d59a1f0d2964bec17dab732dd63bcf9b9878f96b297e23622ca31fb', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:24', '2021-02-09 05:15:24', '2022-02-09 06:15:24'),
('e768d1130bdcd150e43ca7a04fd30f3813dc9fd9285ac72825bbdbd2d89e30c10d564ecc8eb97334', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-10 20:41:53', '2021-01-10 20:41:53', '2022-01-10 21:41:53'),
('e7793b758364cc7e4a233b7790c852982ec122c9718545bc87b9f3f21b02822a2c74768df1ad2998', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-08 12:13:08', '2021-03-08 12:13:08', '2022-03-08 13:13:08'),
('e81b609f4bf3dde93ac568b85c9d343a5004b8e12d7038fb43ddf7bbbaa04531bdd223c43e5e3995', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-18 11:48:29', '2021-03-18 11:48:29', '2022-03-18 12:48:29'),
('e84c742e4127bf0bce08dfca2ef26ab782d5b0091fe16247c51726578790e159bd0c22b5e3a1ad1d', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:54', '2021-03-31 03:51:54', '2022-03-31 05:51:54'),
('e8c1b149a475db396469d7269bf58242c081f7ab1166d70acdcd173cad488fd113cc45ac186a3e28', 93, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-23 05:05:04', '2021-03-23 05:05:04', '2022-03-23 06:05:04'),
('e914fd4fbc31cb7b06ee1d1c72bad8152ab02cb856f249ec04e750cedddc2c53d84c5c9d0fa0a2e8', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-20 08:03:52', '2021-04-20 08:03:52', '2022-04-20 10:03:52'),
('e9150a2fe4110ee0c2dd73a256b5b64f653b1be934fc8fb687c5af65d79c5293678fb5745c4fb679', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-04 12:33:38', '2021-03-04 12:33:38', '2022-03-04 13:33:38'),
('ea6963807300d613656ae52e0895a32f18e60c22e4d3a7406dca106f387cfa72ca271a70bd13a909', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 19:31:27', '2021-02-09 19:31:27', '2022-02-09 20:31:27'),
('ec652520d66198d5c769dab5b81e15e59fcc4c65aa88d7dfdb607ef23ecdcbcbe35506e48bb4ff55', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-08 02:51:32', '2020-10-08 02:51:32', '2021-10-08 04:51:32'),
('ed33455bf27b77da970ed8aee2c56976f6bd99fb46800c32e97f2a39b3d43f12003265c9209358db', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-15 17:12:55', '2020-12-15 17:12:55', '2021-12-15 17:12:55'),
('ed3e93ea4720ce051b412637fb790684224f3796f3185906b02dfd956f73f72ac837d0baf489b34b', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 05:00:32', '2021-02-09 05:00:32', '2022-02-09 06:00:32'),
('ee23ee2d01c8f58feb85f9c11f8a6b4ce97067afe8033db44f2d6eef9754b54ade65d9c3bb3e0a1a', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-21 10:04:04', '2021-04-21 10:04:04', '2022-04-21 12:04:04'),
('ee437b263f44fdc1890c66fe81a8bf550e73f6c95d1607187cb224ebdf1fba44cb44934428d7e6d2', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:28', '2021-03-31 03:51:28', '2022-03-31 05:51:28'),
('eee518203a0173c73c898afb8120018145d86d0ebe58b0b52c90b52323cdf552a994fe503b1093db', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 20:24:39', '2021-02-10 20:24:39', '2022-02-10 21:24:39'),
('ef6cf13b2b0a767c920847ae942457cdb2a97c324d38b0396ca7e396a0d03697b3834a24cbc806d2', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-11-25 03:05:28', '2020-11-25 03:05:28', '2021-11-25 03:05:28'),
('f00b132d383ac934fccd08ab56e8845dcd1a53e5884043d8a4dc2b97240912618fe1bcb018eda53f', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-27 09:35:04', '2021-01-27 09:35:04', '2022-01-27 10:35:04'),
('f07fe3c346aea52c610ea9ba8028315de986386971351bc1585a1c293e89d212bc0f271a046be459', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-01 12:36:04', '2021-02-01 12:36:04', '2022-02-01 13:36:04'),
('f0aedc8fa10032389dccf4914d0f9bac2be7bac0a1874b628e4073ca2c1a1720e15830d717b5cc02', 40, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-02 17:35:45', '2021-03-02 17:35:45', '2022-03-02 18:35:45'),
('f0d3709949db075ec59df878179b97a304eddebcc84f9e25d8ebb82e3f608ec54aee74b06dd475bb', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2020-10-23 07:48:02', '2020-10-23 07:48:02', '2021-10-23 09:48:02'),
('f28ce134f4683a8b242d2e5fddd0a9ca0f12a645c130087e547f0428abaea451705b13da010dd225', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 12:17:46', '2021-02-09 12:17:46', '2022-02-09 13:17:46'),
('f291a2a6ce81a2cc091129a8e04f81444b345616f8c01f987ba67fdf5feeb46252ea60dd2ecaa359', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-16 07:07:13', '2021-03-16 07:07:13', '2022-03-16 08:07:13'),
('f2b6c689d86a466d31756cdf60e609b5c09147bc021e3e6c7599cef9f5ab546da649eb893f426634', 38, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-29 10:48:16', '2021-01-29 10:48:16', '2022-01-29 11:48:16'),
('f333c7cde9425cba159b2ac41ad475cabc0d14f09c465ceb23fef47b0337c380b4202028afc58953', 34, 2, 'Laravel Password Grant Client', '[]', 1, '2020-12-31 16:03:50', '2020-12-31 16:03:50', '2021-12-31 16:03:50'),
('f39d6f994d4f83156ff8866fdfd1280e5a020e92d9398dee963f83520ec2db5a8f659b3375e4387d', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-13 16:49:22', '2021-02-13 16:49:22', '2022-02-13 17:49:22'),
('f4777140dd84e2994bd809798e59e42023c70679dcc6205765bb4d41dfee750a921b8c4c34e0e4c8', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-06 18:10:52', '2021-02-06 18:10:52', '2022-02-06 19:10:52'),
('f61d1ae722679818e3973a658101a6065b6a49e0a53fb60cc64d3edd0edf4a834de0119bc238ebcc', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-13 12:26:37', '2021-01-13 12:26:37', '2022-01-13 13:26:37'),
('f65a587e73a85b472064fd9f9af649c1771bd32490a512b6a572acd07e1b3c9ba136cfb74c465a81', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-19 12:17:03', '2021-02-19 12:17:03', '2022-02-19 13:17:03'),
('f66b4acc877a925108a314c8e49adcff0bdebdf19d15e96eb5fba3637f27140c68f653658e9d495f', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-10 20:49:03', '2021-02-10 20:49:03', '2022-02-10 21:49:03'),
('f6d3568952925f69ca94d0b8d7630ae7bba31843475c8ceb684cfcf77999098a900aca5f92f96c8c', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-25 14:37:42', '2021-02-25 14:37:42', '2022-02-25 15:37:42'),
('f71b7c60604e879c752891656bad785fbccb88afe729f3900ce4d0cfcd47939747c9aaf750f09435', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 05:10:15', '2021-02-10 05:10:15', '2022-02-10 06:10:15'),
('f79c32f6059c7340380d3c2b7d82b2574467b5ef084360080a40b7248fb16a4564cce8ffd52e16b1', 50, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-10 20:25:00', '2021-02-10 20:25:00', '2022-02-10 21:25:00'),
('f7a7b74b75dd38a6fb599d5a07227eff56ecdbc0d391f4696a66f6407e1817ba101f55dc770a778d', 1, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-25 12:49:37', '2021-01-25 12:49:37', '2022-01-25 13:49:37'),
('f8d16f8cd245b342deebee3ddfbdfcdf4530debab2e07e685f68e76b0de9f3921d5c47c72e75a867', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-24 15:04:56', '2020-12-24 15:04:56', '2021-12-24 15:04:56'),
('f8dc07adbcdc1547b077302572346543cb164638169c6744b0f8200785eb418b35026a70825f07d4', 32, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-04 19:20:32', '2021-03-04 19:20:32', '2022-03-04 20:20:32'),
('f8fcd6d3fc02042aade37a4b735f999fa42e8c75f108e74acbc87f273c07889a10cda6824f780721', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2020-12-29 10:31:26', '2020-12-29 10:31:26', '2021-12-29 10:31:26'),
('fa07d3b1ca7e61bcb3a74b8dbf82557e82d6bce731cc90f5736401dce39d6c246ef04528e5660b67', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-09 04:29:40', '2021-04-09 04:29:40', '2022-04-09 06:29:40'),
('fbc16834d209ec03ba921b5776839d198fc75274e9f0215cc4b453d7f21e62000051769d0ad49a83', 93, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-17 19:56:03', '2021-03-17 19:56:03', '2022-03-17 20:56:03'),
('fc2b4240eaef7ef17fd7329f09c036e16320c2fe96167d78bf33dfe709c2aa09e62a8ae6cb9c9435', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-11 17:25:43', '2021-01-11 17:25:43', '2022-01-11 18:25:43'),
('fc4eb5713a260565200de2a060a19fd8d36488d8dc418273102f3c766d445f06f991479ff0c7a1dc', 81, 2, 'Laravel Password Grant Client', '[]', 1, '2021-03-16 07:50:30', '2021-03-16 07:50:30', '2022-03-16 08:50:30'),
('fc50f8af53b1c4ff18eeb573a0eaa391cfbd5c9a04182151a9baa0cccb0955ba4edac5acaad8cc58', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-31 03:51:27', '2021-03-31 03:51:27', '2022-03-31 05:51:27'),
('fc565f8d6b1bb8faedefd644ad733286cf571e389f5146484db8f8458fb11ecec78dbdee8de3de32', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-12 13:06:40', '2021-03-12 13:06:40', '2022-03-12 14:06:40'),
('fc9a568fdc7cedd475503067c29eb0b33fa758391e15fa86444b53f008a5e800ae6e72b0955eb21b', 38, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-09 05:05:32', '2021-02-09 05:05:32', '2022-02-09 06:05:32'),
('fd4e79701d5d26cd426225db2b6ad6b200acce7aef43fbc2cf82ff5d038269d4cac4663690cc4213', 37, 2, 'Laravel Password Grant Client', '[]', 1, '2021-01-11 09:24:19', '2021-01-11 09:24:19', '2022-01-11 10:24:19'),
('fd53d1f6f32822926f9c599613311a619747bd0404d1f4b3085b48445ed4c60f2fac0f7d1e4d5e22', 40, 2, 'Laravel Password Grant Client', '[]', 1, '2021-02-14 09:15:05', '2021-02-14 09:15:05', '2022-02-14 10:15:05'),
('fd864c9f3a5c3bd487b4bc47fde9978248062648c3d6271a80f9516777609ed3a73b63e6557c5e23', 1, 2, 'Laravel Password Grant Client', '[]', 0, '2020-10-09 03:05:33', '2020-10-09 03:05:33', '2021-10-09 05:05:33'),
('fdaddfa9196d9fb25b724f61bde4dbbd1de33e4d07d9b961903c44e9f4d3444ce0e7c55e30ff6968', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-02-09 05:15:05', '2021-02-09 05:15:05', '2022-02-09 06:15:05'),
('fdfa4c87dabd8122efb7165379938eebd9586e8e26d59750ae103c58515e0a8efa35c455f78dc149', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-03-08 05:10:57', '2021-03-08 05:10:57', '2022-03-08 06:10:57'),
('fe4f6ed8b3e3377a4b76ce5c565798c60768ab1954f16dd5401646966390ce5e0bc929362bbe405b', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-04-08 09:43:47', '2021-04-08 09:43:47', '2022-04-08 11:43:47'),
('febdba518b3c503d887bddd6128b4e1cbd32ef84990751bffe151526341f06f4b5e21463027694d6', 33, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-11 07:09:10', '2021-01-11 07:09:10', '2022-01-11 08:09:10'),
('fee9fc14b5fc4be108f9bd92535e8fad0de848b28bf89f16f61d11daea306aa9ddee9632f3c54d0d', 32, 2, 'Laravel Password Grant Client', '[]', 0, '2021-01-12 20:18:20', '2021-01-12 20:18:20', '2022-01-12 21:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'admin', 'fdl7at1RblDq8dohtCfuUlGEdNSapwqE9nv5XMwl', 'http://localhost', 1, 0, 0, '2020-10-08 02:26:28', '2020-10-08 02:26:28'),
(2, NULL, 'Sate Personal Access Client', 'MDgXUFVWFDmJAOn5nVjfpLGvsaydXqDq0OcJgIck', 'http://localhost', 1, 0, 0, '2020-10-08 02:26:39', '2020-10-08 02:26:39'),
(3, NULL, 'Sate Password Grant Client', 'btBZ04mfIuic5k3yZEJETcx8RBJ3WoGwZY6bV9fH', 'http://localhost', 0, 1, 0, '2020-10-08 02:26:40', '2020-10-08 02:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-08 02:26:28', '2020-10-08 02:26:28'),
(2, 2, '2020-10-08 02:26:40', '2020-10-08 02:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `dni` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tis` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `situation` enum('tutela','curatela','no tutela') COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence` enum('Domicili Particular','Domicili Institucio') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `bank` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardianship` int(11) DEFAULT NULL,
  `residency` int(11) DEFAULT NULL,
  `referent_economic_guardianship_id` bigint(20) UNSIGNED NOT NULL,
  `referent_social_guardianship_id` bigint(20) UNSIGNED NOT NULL,
  `referent_economic_residence_id` bigint(20) UNSIGNED DEFAULT NULL,
  `referent_social_residence_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_contract` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `types` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residence_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `last_name`, `description`, `active`, `dni`, `tis`, `situation`, `residence`, `birth_date`, `bank`, `iban`, `bic`, `reason`, `guardianship`, `residency`, `referent_economic_guardianship_id`, `referent_social_guardianship_id`, `referent_economic_residence_id`, `referent_social_residence_id`, `created_at`, `updated_at`, `type_contract`, `types`, `residence_address`, `cp`, `population`) VALUES
(22, 'Montserrat', 'Ferrer Mercader', NULL, 0, '46639984D', '010101234', 'tutela', 'Domicili Particular', '1944-01-01', '1213', 'ES210054236521254652', '000', 'client donat de baixa', 11, 7, 28, 66, 29, 27, '2021-01-13 12:24:58', '2021-04-21 10:05:36', '2', 'Compte Bancari,Claus', 'Av. Cornella 76 2 2', '08950', 'Esplugues de Llo'),
(23, 'Juan', 'Salas', NULL, 1, '47824811-Z', '123456', 'no tutela', 'Domicili Particular', '2021-02-01', '123456', '123456', '123456', 'Exitus', NULL, NULL, 37, 36, 37, 36, '2021-02-10 11:19:15', '2021-02-24 17:44:55', '0', 'Compte Bancari', NULL, NULL, NULL),
(27, 'Ana Maria', 'Fernandez Garcia', NULL, 1, '43671282D', 'FEGA1650630009', 'curatela', 'Domicili Particular', '1965-06-30', '***', '***', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-11 08:48:42', '2021-03-04 14:47:24', '1', 'Consentiment', 'Carrer Sabadell, 8', '43500', 'Tortosa'),
(29, 'Angel', 'Alcón Pellicer', NULL, 1, '18319092Y', 'ALPE0380516001', 'tutela', 'Domicili Institucio', '1938-05-16', '***', '***', '***', NULL, 7, 22, 29, 34, 41, 40, '2021-02-11 08:52:42', '2021-03-04 14:21:29', '2', 'Consentiment', 'null', 'null', 'null'),
(30, 'Angel', 'Funez Queralt', NULL, 1, '46546629B', 'FUQU0760724007', 'tutela', 'Domicili Institucio', '1976-07-24', '***', '***', '***', NULL, 7, 30, 29, 34, 43, 42, '2021-02-11 08:55:14', '2021-03-04 14:40:29', '2', 'Consentiment', 'null', 'null', 'null'),
(32, 'Antonio', 'Ferrer Fernandez', NULL, 1, '37472437D', '37472437D', 'tutela', 'Domicili Institucio', '1935-03-31', '***', '***', '***', NULL, 7, 26, 29, 34, 47, 46, '2021-02-11 09:00:23', '2021-03-04 14:43:38', '2', 'Consentiment', 'null', 'null', 'null'),
(33, 'Antonio', 'Iturat Moreso', NULL, 1, '40901686G', '40901686G', 'tutela', 'Domicili Institucio', '1950-06-03', '***', '***', '***', NULL, 7, 17, 29, 32, 49, 48, '2021-02-11 09:02:58', '2021-03-04 14:44:44', '2', 'Consentiment', 'null', 'null', 'null'),
(35, 'Antonio', 'Montesó Cid', NULL, 1, '40008013L', '40008013L', 'tutela', 'Domicili Institucio', '1944-09-15', '***', '***', '***', NULL, 7, 16, 31, 27, 45, 44, '2021-02-11 09:06:57', '2021-03-04 14:45:20', '2', 'Consentiment', 'null', 'null', 'null'),
(41, 'Carmen Josefa', 'Arayo Vidal', NULL, 1, '77879183X', 'ARVI1490117008', 'tutela', 'Domicili Particular', '1949-01-17', '***', '***', '***', NULL, 7, 10, 31, 27, 39, 36, '2021-02-11 09:16:37', '2021-03-04 14:48:40', '2', 'Consentiment', 'Carrer Logroño 4, 3er. 3ra', '43500', 'Amposta'),
(42, 'Carmen', 'Ruiz Fuentes', NULL, 1, '47623443B', 'RUFU1770809009', 'tutela', 'Domicili Particular', '1977-08-09', '***', '***', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-11 09:19:22', '2021-03-04 14:49:43', '2', 'Medicacio,Injectables', 'Passeig Joan Moreira 8 1er 1er', '43500', 'Tortosa'),
(43, 'Carmen', 'Sagrista Monteso', NULL, 1, '39993812D', 'SAMO1280306001', 'no tutela', 'Domicili Institucio', '1928-03-06', '***', '***', '***', NULL, 8, 17, 28, 35, 49, 48, '2021-02-11 09:21:09', '2021-03-04 14:51:46', '0', 'Consentiment', 'null', 'null', 'null'),
(55, 'Elisabeth', 'Vidiella Fosch', NULL, 1, '47858415S', 'VIFO1901003008', 'curatela', 'Domicili Particular', '1990-10-03', '***', '***', '***', NULL, 7, 10, 31, 27, 39, 36, '2021-02-11 09:42:42', '2021-03-04 14:53:18', '2', 'Consentiment', 'C/Mare de Deu de la Fontcalda, núm. 2, 1er B', '*****', 'Gandesa'),
(57, 'Elvira', 'Caballer Molano', NULL, 1, '77300507Z', 'CAMO1660121001', 'tutela', 'Domicili Institucio', '1966-01-21', '***', '***', '***', NULL, 7, 30, 29, 34, 43, 42, '2021-02-11 09:46:50', '2021-03-04 14:54:09', '2', 'Consentiment', '****', '****', '****'),
(62, 'Estefanía', 'Gonzalez Pinar', NULL, 1, '47860469E', 'GOPI1950602006', 'curatela', 'Domicili Particular', '1995-06-02', '***', '***', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-11 09:55:19', '2021-03-04 14:56:54', '2', 'Consentiment', 'Passeig Joan Moreira 8 1er 1er', '43500', 'Tortosa'),
(64, 'Fernando', 'Fores Rodriguez', NULL, 1, '47861050M', 'FORO0910212005', 'tutela', 'Domicili Institucio', '1991-02-12', '***', '***', '***', NULL, 7, 35, 29, 27, 53, 52, '2021-02-12 08:54:15', '2021-03-04 15:11:30', '2', 'Consentiment', 'null', 'null', 'null'),
(70, 'Francisco', 'Bernal Sabaté', NULL, 1, '40928901X', 'BESA0650807004', 'tutela', 'Domicili Institucio', '1965-08-07', '***', '***', '***', NULL, 7, 16, 31, 27, 45, 44, '2021-02-12 09:05:52', '2021-03-04 15:12:00', '2', 'Consentiment', 'null', 'null', 'null'),
(72, 'Francisco', 'Lana Puertolas', NULL, 1, '47624578L', 'LAPU0490814018', 'tutela', 'Domicili Institucio', '1949-08-14', '***', '***', '***', NULL, 7, 30, 29, 34, 43, 42, '2021-02-12 09:18:03', '2021-03-04 15:12:30', '2', 'Consentiment', 'null', 'null', 'null'),
(75, 'Gabriel', 'Pierre Escafit', NULL, 1, '*****', '***', 'no tutela', 'Domicili Particular', '2021-02-12', '***', '***', '***', NULL, NULL, NULL, 28, 34, 28, 34, '2021-02-12 09:22:12', '2021-02-12 09:22:12', '2', NULL, NULL, NULL, NULL),
(76, 'Gerónimo', 'Hernandez López', NULL, 1, '77528997E', 'HELO0510611004', 'tutela', 'Domicili Institucio', '1951-06-11', '***', '***', '***', NULL, 7, 34, 29, 34, 55, 54, '2021-02-12 09:23:52', '2021-03-04 15:13:14', '2', 'Consentiment', 'null', 'null', 'null'),
(77, 'Gloria', 'Arasa Capllonch', NULL, 1, '40008249W', 'ARCA1420418002', 'no tutela', 'Domicili Particular', '1942-04-18', '***', '***', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-12 09:27:36', '2021-03-04 15:16:16', '2', 'Consentiment', 'Carretera Simpática,25', '43500', 'Tortosa'),
(78, 'Gloria', 'Jornet Miro', NULL, 1, '*****', '***', 'no tutela', 'Domicili Particular', '2021-02-12', '***', '***', '***', NULL, NULL, NULL, 28, 34, 28, 34, '2021-02-12 09:28:49', '2021-02-12 09:28:49', '2', NULL, NULL, NULL, NULL),
(79, 'Gregorio', 'San Juan Funes', NULL, 1, '17082568P', 'SAFU0370421006', 'curatela', 'Domicili Particular', '1937-04-21', '***', '***', '***', NULL, 7, 10, 31, 27, 39, 36, '2021-02-12 09:30:25', '2021-03-23 14:29:05', '2', 'Consentiment', 'C/ Major, 57', '****', '****'),
(81, 'Isabel', 'Rodriguez Reverte', NULL, 1, '40932036V', 'RORE1670913006', 'tutela', 'Domicili Particular', '1967-09-13', '***', '***', '***', NULL, 7, 35, 29, 27, 53, 52, '2021-02-20 12:01:46', '2021-03-04 15:18:21', '2', 'Consentiment', 'null', 'null', 'null'),
(83, 'Iuel', 'Stanici', NULL, 1, 'X6845366Z', 'X6845366Z', 'tutela', 'Domicili Particular', '1954-10-22', '***', '***', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-20 12:08:35', '2021-03-04 15:18:55', '2', 'Consentiment', 'C/ DEL VALL 20 1R PIS PORTA 2', '43500', 'Tortosa'),
(84, 'Jaume', 'Subirats Freixa', NULL, 1, '40930244L', 'SUFR0660730003', 'tutela', 'Domicili Particular', '1966-07-30', '***', '***', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-20 12:11:10', '2021-03-04 15:19:53', '2', 'Consentiment', 'Passeig Joan Moreira 8 1er 1er', '43500', 'Tortosa'),
(85, 'Javier', 'Sabaté Sabaté', NULL, 1, '39909375M', 'SASA0880521009', 'tutela', 'Domicili Particular', '1958-05-21', '***', '***', '***', NULL, 7, 35, 29, 27, 53, 52, '2021-02-20 12:13:07', '2021-03-04 15:20:16', '2', 'Consentiment', 'null', 'null', 'null'),
(86, 'Javier', 'Sol Clua', NULL, 1, '52600757X', 'SOCL0690826002', 'tutela', 'Domicili Institucio', '1969-08-26', '***', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 12:14:53', '2021-03-04 15:32:52', '2', 'Consentiment', 'null', 'null', 'null'),
(87, 'Jesús', 'Mendieta Vázquez', NULL, 1, '40902764R', 'MEVA0510120019', 'tutela', 'Domicili Institucio', '1951-01-21', '***', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 12:16:32', '2021-03-04 15:33:27', '2', 'Consentiment', 'null', 'null', 'null'),
(88, 'Jordi', 'Beltran López', NULL, 1, '47625038L', 'BELO0810314003', 'tutela', 'Domicili Institucio', '1981-03-14', '***', '**', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-20 12:19:02', '2021-03-04 15:34:14', '2', 'Consentiment', 'null', 'null', 'null'),
(89, 'Jordi', 'Moreso Rodriguez', NULL, 1, '52607009Y', 'MORO0751210007', 'tutela', 'Domicili Particular', '1975-12-10', '***', '**', '**', NULL, 7, 35, 29, 27, 53, 52, '2021-02-20 12:20:13', '2021-03-04 15:34:55', '2', 'Consentiment', 'null', 'null', 'null'),
(90, 'Jose Antonio', 'Moreno Moreno', NULL, 1, '47481662W', 'MOMO0920614008', 'tutela', 'Domicili Institucio', '1992-06-14', '**', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 12:22:03', '2021-03-04 15:35:26', '2', 'Consentiment', 'null', 'null', 'null'),
(92, 'Jose Maria', 'Vernet Castellvi', NULL, 1, '39824864L', 'VECA0480713008', 'curatela', 'Domicili Institucio', '1948-07-13', '***', '***', '**', NULL, 7, 23, 29, 34, 65, 64, '2021-02-20 12:27:01', '2021-03-04 15:38:22', '2', 'Consentiment', 'null', 'null', 'null'),
(93, 'Juan', 'Mola Codorniu', NULL, 1, '40014821L', 'MOCO0490508007', 'tutela', 'Domicili Institucio', '1949-05-08', '***', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 12:29:40', '2021-03-04 15:38:46', '2', 'Consentiment', 'null', 'null', 'null'),
(94, 'Liberta', 'Martinez Arasa', NULL, 1, '39997818J', 'MAAR1371102007', 'tutela', 'Domicili Institucio', '1936-11-02', '***', '****', '**', NULL, 7, 16, 31, 27, 45, 44, '2021-02-20 12:31:24', '2021-03-04 15:39:06', '2', 'Consentiment', 'null', 'null', 'null'),
(95, 'Luís', 'Auxach Carles', NULL, 1, '40926011H', 'AUCA0650715025', 'curatela', 'Domicili Particular', '1965-06-15', '***', '***', '***', NULL, 7, 10, 29, 34, 39, 36, '2021-02-20 12:32:50', '2021-03-04 15:39:26', '2', 'Consentiment', 'null', 'null', 'null'),
(96, 'Manolo', 'Curto Ardit', NULL, 1, '40904585M', 'CUAR0500423006', 'tutela', 'Domicili Institucio', '1950-04-23', '***', '***', '***', NULL, NULL, NULL, 31, 32, 31, 32, '2021-02-20 12:34:14', '2021-02-20 12:34:14', '2', NULL, NULL, NULL, NULL),
(97, 'Maria Assunción', 'Herraiz López', NULL, 1, '17668985V', 'HELO1400210005', 'tutela', 'Domicili Institucio', '1940-02-10', '***', '***', '***', NULL, 7, 23, 29, 34, 65, 64, '2021-02-20 12:35:58', '2021-03-04 15:40:26', '2', 'Consentiment', 'null', 'null', 'null'),
(98, 'Maria Jesús', 'Navarro Mostalac', NULL, 1, '40908855C', 'NAMO1540413008', 'tutela', 'Domicili Institucio', '1954-04-13', '***', '***', '***', NULL, NULL, NULL, 31, 32, 31, 32, '2021-02-20 12:40:11', '2021-02-20 12:40:11', '2', NULL, NULL, NULL, NULL),
(99, 'Maria Luisa', 'Lamela Bertolaja', NULL, 1, '47764938X', 'LABE1390529010', 'tutela', 'Domicili Institucio', '1939-05-29', '***', '***', '***', NULL, NULL, NULL, 31, 27, 31, 27, '2021-02-20 12:42:27', '2021-02-20 12:42:27', '2', NULL, NULL, NULL, NULL),
(100, 'Maria', 'Mendieta Vàzquez', NULL, 1, '77884033F', 'MEVA1510120009', 'tutela', 'Domicili Institucio', '1951-01-20', '***', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 12:43:58', '2021-03-04 15:42:02', '2', 'Consentiment', 'null', 'null', 'null'),
(101, 'Maria Rosa', 'Lopez Llafrenca', NULL, 1, '36832417-X', 'LOLL1370813002', 'tutela', 'Domicili Institucio', '1937-08-13', '***', '***', '***', NULL, 7, 21, 29, 34, 51, 50, '2021-02-20 12:45:28', '2021-03-04 15:42:27', '2', 'Consentiment', 'null', 'null', 'null'),
(102, 'Mercedes', 'Nicolas Marti', NULL, 1, '38063127J', 'NIMA1590201007', 'tutela', 'Domicili Institucio', '1959-02-01', '***', '***', '***', NULL, 7, 16, 31, 27, 45, 44, '2021-02-20 12:46:52', '2021-03-04 15:43:01', '2', 'Consentiment', 'null', 'null', 'null'),
(103, 'Miguel', 'Ruiz Garcia', NULL, 1, '05598859S', 'RUGA0440219009', 'tutela', 'Domicili Institucio', '1944-02-19', '***', '***', '***', NULL, NULL, NULL, 31, 27, 31, 27, '2021-02-20 12:48:19', '2021-02-20 12:48:19', '2', NULL, NULL, NULL, NULL),
(104, 'Pedro Antonio', 'Caro Torrecilla', NULL, 1, '40095847Q', 'CATO0210725003', 'tutela', 'Domicili Institucio', '2021-07-25', '***', '***', '***', NULL, 7, 25, 29, 34, 29, 34, '2021-02-20 12:50:05', '2021-03-04 15:43:37', '2', 'Consentiment', 'null', 'null', 'null'),
(105, 'Pedro', 'García Fernández', NULL, 1, '36490552V', 'GAFE 0 461212003', 'tutela', 'Domicili Institucio', '1946-12-12', '***', '***', '***', NULL, 7, 16, 31, 27, 45, 44, '2021-02-20 12:51:18', '2021-03-04 15:44:14', '2', 'Consentiment', 'null', 'null', 'null'),
(106, 'Providencia', 'Fibla Royo', NULL, 1, '78578202J', 'FIRO1621126009', 'tutela', 'Domicili Institucio', '1962-11-26', '***', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 12:52:50', '2021-03-04 15:44:42', '2', 'Consentiment', 'null', 'null', 'null'),
(107, 'Santiago', 'Masdeu Roiget', NULL, 1, '77882205L', 'MARO0530615013', 'tutela', 'Domicili Institucio', '1956-06-15', '***', '***', '***', NULL, 7, 34, 29, 34, 55, 54, '2021-02-20 12:54:23', '2021-03-04 15:45:08', '2', 'Consentiment', 'null', 'null', 'null'),
(108, 'Susana Estela', 'Serrano Usach', NULL, 1, 'Serrano Usach', 'SEUS1790525007', 'tutela', 'Domicili Particular', '1979-05-25', '***', '***', '***', NULL, 7, 10, 31, 32, 39, 36, '2021-02-20 12:56:35', '2021-03-04 15:45:27', '2', 'Consentiment', 'null', 'null', 'null'),
(109, 'Ursula', 'Schindler', NULL, 1, 'X3442859N', 'SHI1380120017', 'tutela', 'Domicili Institucio', '1938-01-20', '***', '***', '***', NULL, 7, 19, 29, 34, 57, 56, '2021-02-20 12:58:23', '2021-03-04 15:45:50', '2', 'Consentiment', 'null', 'null', 'null'),
(110, 'Vicente', 'Fortea Puertos', NULL, 1, '40003396W', 'FOPU0410426002', 'tutela', 'Domicili Particular', '1941-04-26', '***', '***', '***', NULL, 7, 10, 29, 27, 39, 36, '2021-02-20 12:59:44', '2021-03-04 15:46:09', '2', 'Consentiment', 'null', 'null', 'null'),
(111, 'Vicent', 'Fauli Conde', NULL, 1, '18826435S', 'FACO0360408000', 'tutela', 'Domicili Institucio', '1936-04-08', '***', '***', '***', NULL, 7, 26, 29, 34, 47, 46, '2021-02-20 13:01:10', '2021-03-04 15:46:36', '2', 'Consentiment', 'null', 'null', 'null'),
(112, 'Victoria', 'Stanici', NULL, 1, 'X8671302A', 'STAN1680904005', 'tutela', 'Domicili Institucio', '1968-09-04', '***', '***', '***', NULL, NULL, NULL, 31, 32, 31, 32, '2021-02-20 13:03:07', '2021-02-20 13:03:07', '2', NULL, NULL, NULL, NULL),
(113, 'Xavier', 'Muntane Adell', NULL, 1, '77828681Q', 'MUAD0500119001', 'tutela', 'Domicili Particular', '1950-01-19', '***', '***', '***', NULL, 7, 32, 31, 27, 31, 27, '2021-02-20 13:04:33', '2021-03-04 15:47:27', '2', 'Consentiment', 'null', 'null', 'null'),
(114, 'Josefa', 'Marmaneu Cases', NULL, 1, '37767626Q', 'MACA1490418001', 'tutela', 'Domicili Institucio', '1949-04-18', '***', '***', '***', NULL, NULL, NULL, 29, 34, 29, 34, '2021-02-20 13:07:58', '2021-02-20 13:07:58', '2', NULL, NULL, NULL, NULL),
(115, 'Juan Manuel', 'Lleixa Muñoz', NULL, 1, '40008122J', 'LLMU0450327007', 'tutela', 'Domicili Institucio', '1945-03-27', '***', '***', '***', NULL, NULL, NULL, 29, 34, 29, 34, '2021-02-20 13:09:38', '2021-02-20 13:09:38', '2', NULL, NULL, NULL, NULL),
(116, 'Julia', 'Molano Molano', NULL, 1, '06809368B', 'MOMO1350509009', 'tutela', 'Domicili Institucio', '1935-05-09', '***', '***', '***', NULL, 7, 34, 29, 34, 55, 54, '2021-02-20 13:11:27', '2021-03-04 15:50:54', '2', 'Consentiment', 'null', 'null', 'null'),
(117, 'María Magdalena', 'Salazar Avila', NULL, 1, '24761407K', 'SAAV1260426007', 'tutela', 'Domicili Institucio', '1926-04-26', '***', '***', '***', NULL, 7, 34, 29, 34, 55, 54, '2021-02-20 13:12:50', '2021-03-04 15:50:18', '2', 'Consentiment', 'null', 'null', 'null'),
(118, 'Maria Presentación', 'Lozano Redó', NULL, 1, '40910181N', 'LORE1550810001', 'tutela', 'Domicili Institucio', '1955-08-10', '***', '***', '***', NULL, 7, 12, 31, 32, 63, 62, '2021-02-20 13:15:58', '2021-03-04 15:49:46', '2', 'Consentiment', 'null', 'null', 'null'),
(119, 'Mercedes', 'Arajo Caballe', NULL, 1, '39636959R', 'ARCA1500919003', 'no tutela', 'Domicili Institucio', '1950-09-19', '***', '****', '***', NULL, NULL, NULL, 29, 34, 29, 34, '2021-02-20 13:17:27', '2021-02-20 13:17:27', '2', NULL, NULL, NULL, NULL),
(120, 'Rafaela', 'Lopez Puerto', NULL, 1, '30158717J', 'LOPU1400327000', 'tutela', 'Domicili Institucio', '1940-03-27', '***', '***', '***', NULL, NULL, NULL, 31, 32, 31, 32, '2021-02-20 13:18:38', '2021-02-20 13:18:38', '2', NULL, NULL, NULL, NULL),
(121, 'Roberto', 'Burgues Domenech', NULL, 1, '40020213Y', 'BUDO 0 340823 00 9', 'tutela', 'Domicili Institucio', '1934-08-23', '***', '***', '***', NULL, 7, 16, 31, 27, 45, 44, '2021-02-20 13:20:00', '2021-03-04 15:48:50', '2', 'Consentiment', 'null', 'null', 'null'),
(122, 'Toni', 'Sabaté Sabaté', NULL, 1, '39909376Y', 'SASA0890703001', 'tutela', 'Domicili Particular', '1989-07-03', '***', '***', '***', NULL, NULL, NULL, 29, 27, 29, 27, '2021-02-20 13:21:04', '2021-02-20 13:21:04', '2', NULL, NULL, NULL, NULL),
(123, 'Adelaida', 'Curto Magin', NULL, 1, '39994646B', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES08 0182 1747 72 0201693411', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:11:45', '2021-03-04 15:55:12', '0', 'Compte Bancari', 'C/ PORTS DE CARO 29 1º', '43520', 'Roquetes'),
(124, 'Àngeles', 'Herrero Úbeda', NULL, 1, '37074388K', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES44 2100 3502 9021 0043 6076', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:12:50', '2021-03-08 12:12:07', '0', 'Compte Bancari', 'C/ PARE ROMANYA 8 2ª', '43520', 'ROQUETES'),
(125, 'Antonio', 'Marin Ruiz', NULL, 1, '00533521J', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES66 0182 1747 71 0201688439', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:13:48', '2021-03-08 12:14:16', '0', 'Compte Bancari', 'C/ MONTCARO 4 2ª', '43520', 'ROQUETES'),
(126, 'Dolores', 'Gasol Caballé', NULL, 1, '39994427A', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES85 0182 1461 34 0201792092', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:14:49', '2021-03-08 12:13:58', '0', 'Compte Bancari', 'C/ PARE RODES 10', '43520', 'ROQUETES'),
(127, 'Emilia', 'Miro Concogostrina', NULL, 1, '40025963Y', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES38 2100 0178 78 0100891033', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:15:54', '2021-03-08 12:15:16', '0', 'Compte Bancari', 'C/ PARRA 13', '43520', 'ROQUETES'),
(128, 'Fermin', 'Gombau Gilabert', NULL, 1, '40007715C', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'Endosament generalitat', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:17:03', '2021-03-08 12:15:49', '0', 'Compte Bancari', 'null', 'null', 'null'),
(129, 'Javier', 'Rodriguez Domingo', NULL, 1, '40047045C', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'Endosament generalitat', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:18:01', '2021-03-08 12:16:17', '0', 'Compte Bancari', 'null', 'null', 'null'),
(130, 'Josep', 'Portillo Borrell', NULL, 1, '37403316A', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES84 2100 3502 9321 0045 9362', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:19:00', '2021-03-08 12:17:35', '0', 'Compte Bancari', 'C/ PARE ROMANYA 8 2ª', '43520', 'ROQUETES'),
(131, 'Juan', 'Gavalda Nogues', NULL, 1, '40094616G', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES60 2100 0199 6901 0037 2533', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:20:20', '2021-03-08 12:18:59', '0', 'Compte Bancari', 'C/ ST. FABIÀ 11', '43520', 'PAÜLS'),
(132, 'Juan Ramon', 'Gilabert Llosa', NULL, 1, '40917012N', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES76 2100 1411 46 0100134098', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:21:26', '2021-03-08 12:19:27', '0', 'Compte Bancari', 'null', 'null', 'L\'ALDEA'),
(133, 'Manuela', 'Balaguer Achell', NULL, 1, '39991035S', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '**', 'Endosament generalitat', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:22:42', '2021-03-08 12:20:20', '0', 'Compte Bancari', 'null', 'null', 'CAMARLES'),
(134, 'Manuela', 'Ferrer Falo', NULL, 1, '40103769A', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', '***', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:23:41', '2021-03-08 12:21:14', '0', 'Compte Bancari', 'null', 'null', 'FERRERIES'),
(135, 'Mercedes', 'Aragonés Grifoll', NULL, 1, '39992297N', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', '2100 0178 70 0100409208', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:24:58', '2021-03-08 12:22:02', '0', 'Compte Bancari', 'C/ PORTS DE CARA 20 1º', '43520', 'ROQUETES'),
(136, 'Maria', 'Escobar Romero', NULL, 1, '40066806R', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', '2100 0720 63 0100684200', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:26:02', '2021-03-08 12:22:53', '0', 'Compte Bancari', 'null', '43870', 'AMPOSTA'),
(137, 'Maria', 'Pedragosa Bajarte', NULL, 1, '40048728R', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES08 2100 0086 15 0100961340', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:27:08', '2021-03-08 12:23:45', '0', 'Compte Bancari', 'null', '43870', 'AMPOSTA'),
(138, 'Mercedes', 'Vidal Sebastià', NULL, 1, '40016988R', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES05 0182 1747 72 0201711216', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:28:02', '2021-03-08 12:24:39', '0', 'Compte Bancari', 'C/ GAYA 27', '43520', 'null'),
(139, 'Pilar', 'Solé Dellà', NULL, 1, '40916785S', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES62 2100 1085 99 0100774382', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:29:04', '2021-03-08 12:25:41', '0', 'Compte Bancari', 'C/ ARGILAGA 35 ELS PILANS', '43520', 'ROQUETES'),
(140, 'Roger', 'Garriga Puig', NULL, 1, '409806669M', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'Endosament generalitat', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:30:00', '2021-03-08 12:26:17', '0', 'Compte Bancari', 'null', 'null', 'ALCANAR'),
(141, 'Rosa', 'Castellà Rué', NULL, 1, '40001287D', '***', 'no tutela', 'Domicili Particular', '2021-02-24', '***', 'ES16 2100 0178 71 0101620630', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-02-24 12:32:17', '2021-03-08 12:27:07', '0', 'Compte Bancari', 'C/ ULLDECONA 14', '43520', 'ROQUETES'),
(142, 'Lolita', 'Valls Ferri', NULL, 1, '***', '***', 'no tutela', 'Domicili Particular', '2021-02-26', 'efectiu', '***', '***', NULL, NULL, NULL, 39, 36, 39, 36, '2021-03-01 14:58:18', '2021-03-01 14:58:18', '2', 'Compte Bancari', 'C/ Pau 21 1º', NULL, NULL),
(143, 'Tomasa', 'Campos Asensio', NULL, 1, '15855446-M', '***', 'no tutela', 'Domicili Particular', '2021-02-26', '***', 'ES17 2100 3091 1823 0006 0547', '***', NULL, NULL, NULL, 39, 36, 39, 36, '2021-03-01 15:00:51', '2021-03-01 15:00:51', '1', 'Compte Bancari', 'CARRER MURILLO 50-54 1b - Amposta', NULL, NULL),
(144, 'Conchita', '***', NULL, 1, '***', '***', 'no tutela', 'Domicili Particular', '2021-02-26', '***', '***', '***', NULL, NULL, NULL, 39, 36, 39, 36, '2021-03-01 15:02:47', '2021-03-01 15:02:47', '1', 'Compte Bancari', 'AVINGUDA REMOLINS 5-7 1º5a. - Tortosa', NULL, NULL),
(145, 'Carmem', '***', NULL, 1, '***', '****', 'no tutela', 'Domicili Particular', '2021-02-26', '***', '0182 6894 24 0201786418', '***', NULL, NULL, NULL, 39, 36, 39, 36, '2021-03-01 15:03:58', '2021-03-01 15:03:58', '1', 'Compte Bancari', '***', NULL, NULL),
(146, 'Amador', 'Muñoz Bailach', NULL, 1, '40089895K', '***', 'no tutela', 'Domicili Particular', '2021-02-26', '***', 'transferencia', '***', NULL, NULL, NULL, 39, 36, 39, 36, '2021-03-01 15:05:15', '2021-03-01 15:05:15', '1', 'Compte Bancari', 'C/ sebastià Joan Arbó, nº6 esc B  3r-6ª - Tortosa', NULL, NULL),
(147, 'Rodriguez Miro', '***', NULL, 1, '39991853-M', '***', 'no tutela', 'Domicili Particular', '2021-02-26', '***', 'ES32 2100 0696 01 0100605950', '***', NULL, NULL, NULL, 39, 36, 39, 36, '2021-03-01 15:06:50', '2021-03-01 15:06:50', '1', 'Compte Bancari', 'Carrer N7 JS, nº14 - Jesús', NULL, NULL),
(148, 'Jose Ramon', 'Torrent Juan', NULL, 1, '78576293-J', '***', 'no tutela', 'Domicili Institucio', '2021-02-26', '***', 'ES37 2013 3058 14 0210424072', '***', NULL, NULL, 10, 29, 34, 39, 36, '2021-03-01 15:08:23', '2021-03-19 11:33:38', '1', 'Compte Bancari', 'Carrer Salvador Vidal, núm. 19 - Ulldecona', 'null', 'null'),
(149, 'Yadav', 'Shivam', NULL, 1, '1234567S', '12', 'curatela', 'Domicili Particular', '2021-03-10', '89898989898988989898', '1234567890', '12312', NULL, 11, 12, 67, 66, 38, 36, '2021-03-02 10:16:17', '2021-04-15 09:29:00', '1', 'Claus,Injectables,Compte Bancari,Cures,Consentiment,Medicacio', 'Indore', '11111', '22222'),
(150, 'Angels', 'Cit', NULL, 1, '1456987I', '5622195213', 'no tutela', 'Domicili Particular', '1983-05-04', '0000', '0000', '0000', NULL, 8, 12, 61, 60, 38, 62, '2021-03-16 07:28:12', '2021-03-16 07:28:12', '1', 'Medicacio', 'Llar Alcanar', '43530', 'Alcanar'),
(151, 'Esteban', 'Fores Ferreres', NULL, 1, '****', '***', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '****', '***', NULL, 11, 12, 67, 66, 63, 62, '2021-03-22 14:50:10', '2021-03-23 11:24:50', '1', 'Consentiment', 'null', 'null', 'null'),
(152, 'Israel', 'Gonzalez Carballo', NULL, 1, '***', '***', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '****', '****', NULL, 7, 19, 29, 34, 57, 56, '2021-03-22 14:51:51', '2021-03-23 11:26:13', '2', 'Consentiment', '***', '****', '****'),
(153, 'Joana', 'Pitarch', NULL, 1, '***', '****', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '***', '***', NULL, 7, 16, 29, 34, 45, 44, '2021-03-22 14:53:14', '2021-03-22 14:53:14', '2', 'Consentiment', '***', '***', '***'),
(154, 'Jose Luis', 'Naves Solé', NULL, 1, '***', '***', 'tutela', 'Domicili Particular', '2021-03-22', '****', '***', '***', NULL, 7, 10, 29, 34, 39, 36, '2021-03-22 14:54:25', '2021-03-22 14:54:25', '2', 'Consentiment', '***', '***', '***'),
(155, 'Josefa', 'Figueres Miro', NULL, 1, '***', '***', 'tutela', 'Domicili Particular', '2021-03-22', '****', '***', '***', NULL, 7, 10, 29, 34, 39, 36, '2021-03-22 14:55:59', '2021-03-22 15:07:42', '2', 'Consentiment', '***', '***', '***'),
(156, 'Maite', 'Borrego', NULL, 1, '***', '***', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '***', '***', NULL, 7, 12, 29, 34, 63, 62, '2021-03-22 14:57:43', '2021-03-22 15:07:03', '2', 'Consentiment', '***', '***', '***'),
(157, 'Maria Angeles', 'Diaz Isar', NULL, 1, '***', '***', 'tutela', 'Domicili Particular', '2021-03-22', '***', '***', '***', NULL, 7, 10, 29, 34, 39, 36, '2021-03-22 14:59:33', '2021-03-22 15:06:38', '2', 'Consentiment', '***', '***', '***'),
(158, 'Maria Carmen', 'Gonzalez Mateo', NULL, 1, '***', '***', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '***', '***', NULL, 7, 30, 29, 34, 43, 42, '2021-03-22 15:01:23', '2021-03-22 15:06:10', '2', 'Consentiment', '***', '***', '***'),
(160, 'Rosa', 'Silvestre Mirales', NULL, 1, '***', '***', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '***', '***', NULL, 7, 26, 29, 34, 47, 46, '2021-03-22 15:04:43', '2021-03-22 15:04:43', '2', 'Consentiment', '***', '***', '***'),
(161, 'Josefa', 'Alonso Lopez', NULL, 1, '***', '**', 'tutela', 'Domicili Institucio', '2021-03-22', '***', '***', '***', NULL, 7, 26, 29, 34, 47, 46, '2021-03-22 15:10:14', '2021-03-22 15:10:14', '2', 'Consentiment', '***', '***', '***'),
(162, 'Agusti', 'Roda', NULL, 1, '18720196-J', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '****', 'ES32 0182 1461 34 0201558306', '***', NULL, 7, 34, 29, 34, 55, 54, '2021-03-23 13:57:05', '2021-03-23 13:57:05', '2', 'Consentiment,Compte Bancari', 'RESIDENCIA D\'AVIS D\'AMPOSTA', '43870', 'AMPOSTA'),
(163, 'Angel', 'Alvarez Bonet', NULL, 1, '39860476G', '***', 'tutela', 'Domicili Particular', '2021-03-23', '***', 'ES43 0182 0268 61 0201594416', '***', NULL, 7, 10, 29, 34, 39, 36, '2021-03-23 14:00:11', '2021-03-23 14:00:11', '2', 'Consentiment,Compte Bancari', 'AVD Diputacio Nº14', '43740', 'Mora D\'Ebre'),
(164, 'ANGELES', 'HUEROS', NULL, 1, '73378748-P', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', '***', '***', NULL, 7, 34, 29, 34, 55, 54, '2021-03-23 14:02:02', '2021-03-23 14:02:02', '2', 'Consentiment', 'RESIDENCIA AVIS AMPOSTA C/SANT CRISTÒFOL 278-280', '43870', 'AMPOSTA'),
(165, 'ANNA', 'CALLIS FRANCO', NULL, 1, '**', '***', 'tutela', 'Domicili Institucio', '2021-03-23', '***', '***', '***', NULL, 7, 12, 29, 34, 63, 62, '2021-03-23 14:03:27', '2021-03-23 14:03:27', '2', 'Consentiment', '***', '***', '***'),
(166, 'ANTONIA', 'ARGENTO ZARAGOZA', NULL, 1, '40066819-Z', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES71 2100 1439 55 0100486785', '****', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:05:15', '2021-03-23 14:05:15', '2', 'Consentiment', 'RESIDENCIA D\'AVIS AMPOSTA', '43870', 'Amposta'),
(167, 'ARMONIA', 'ALMO', NULL, 1, '40048520-T', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES67 2100 57262101 0022 3248', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:07:32', '2021-03-23 14:07:32', '2', 'Consentiment', '***', '***', '***'),
(168, 'Assumpta', 'Sabate Ibarz', NULL, 1, '17211338-R', '***', 'tutela', 'Domicili Particular', '2021-03-23', '***', '****', '****', NULL, 7, 10, 29, 34, 39, 36, '2021-03-23 14:09:24', '2021-03-23 14:09:24', '2', 'Consentiment', 'Av. Diputació, 14', '43740', 'Móra d\'Ebre'),
(169, 'AURELIO', 'SORRIBES', NULL, 1, '***', '***', 'no tutela', 'Domicili Particular', '2021-03-23', '***', '***', '**', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:10:31', '2021-03-23 14:10:31', '2', 'Consentiment', '***', '**', '***'),
(170, 'CARMEN', 'GISBERT', NULL, 1, '***', '***', 'no tutela', 'Domicili Particular', '2021-03-23', '***', '***', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:11:49', '2021-03-23 14:11:49', '2', 'Consentiment', '***', '***', '***'),
(171, 'CINTA', 'SALVADOR GOMBAU', NULL, 1, '40038529-Z', '****', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', '***', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:13:24', '2021-03-23 14:13:24', '2', 'Consentiment', '***', '***', '***'),
(172, 'CRISTINA', 'CABRERA', NULL, 1, '40902272-S', '****', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES75 2013 3076 5102 0003 1781', '****', NULL, 8, 16, 61, 60, 45, 44, '2021-03-23 14:20:01', '2021-03-23 14:20:01', '2', 'Consentiment,Compte Bancari', 'Pg. de Mossèn Valls, 1', '43590', 'Jesús-Tortosa'),
(173, 'DAMIÀ', 'CHAVARRIA', NULL, 1, '40906155-B', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES55 2013 3028 86 0200084721', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:21:55', '2021-03-23 14:21:55', '2', 'Consentiment,Compte Bancari', '***', '**', '***'),
(174, 'DANIEL', 'LLIVERIA', NULL, 1, '***', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', '***', '***', NULL, 8, 17, 61, 60, 49, 48, '2021-03-23 14:23:42', '2021-03-23 14:23:42', '2', 'Consentiment', '***', '***', '***'),
(175, 'Ramon', 'Gaya Olsina', NULL, 1, '40017669-S', '***', 'no tutela', 'Domicili Particular', '2021-03-01', 'CAIXA BANK', 'ES54 2100 0178 75 0100771000º', 'CAIXESBBXXX', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:24:34', '2021-03-23 14:24:34', '0', 'Compte Bancari', 'URBANITZACIÓ TORRE D\'EN GIL, 3', '43520', 'Roquetes'),
(176, 'DELIA', 'FLEITAS', NULL, 1, '**', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', '***', '***', NULL, 8, 16, 61, 60, 45, 44, '2021-03-23 14:24:49', '2021-03-23 14:24:49', '2', 'Consentiment', '***', '***', '***'),
(177, 'ENRIC', 'TORT', NULL, 1, '***', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', '***', '***', NULL, 8, 12, 61, 60, 63, 62, '2021-03-23 14:26:24', '2021-03-23 14:26:24', '2', 'Consentiment', '***', '**', '***'),
(178, 'EUDOSIA', 'GONDAR', NULL, 1, '16281204-X', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', '***', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:27:41', '2021-03-23 14:27:41', '2', 'Consentiment', '**', '***', '***'),
(179, 'FLOR', 'MARINA CARVAJAL', NULL, 1, '**', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', '***', '***', NULL, 8, 16, 61, 60, 45, 44, '2021-03-23 14:28:43', '2021-03-23 14:28:43', '2', 'Consentiment', '***', '***', '**'),
(180, 'FRANCISCO', 'ACCENSI CID', NULL, 1, '040056826-A', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES85 0182 2468 76 0200002996', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:30:13', '2021-03-23 14:30:13', '2', 'Consentiment', '***', '***', '***'),
(181, 'FRANCISCO', 'ALFONSO PEPIOL', NULL, 1, '37424196-E', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '****', 'ES76 2100 0177 26 0100722421', '**', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:31:29', '2021-03-23 14:31:29', '2', 'Consentiment', '***', '***', '***'),
(182, 'Salvador', 'Gracia Reyes', NULL, 1, '25536673-A', '***', 'no tutela', 'Domicili Particular', '2021-03-23', 'BBVA', 'ES16 0182 1747 71 0201651121', 'BBVAESMMXXX', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:32:54', '2021-03-23 14:32:54', '0', 'Compte Bancari', 'C/ SANT RAMÓN,12. 3r2a', '43520', 'Roquetes'),
(183, 'FRANCISCO', 'CASANOVA', NULL, 1, '***', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', '***', '****', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:33:19', '2021-03-23 14:33:19', '2', 'Consentiment', 'C/SANT CRISTÒFOL 278-280', '***', '***'),
(184, 'GABRIEL', 'ROCA CID', NULL, 1, '40007703-P', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES41 0182 1747 70 0201641311', '***', NULL, 8, 12, 61, 60, 63, 62, '2021-03-23 14:35:57', '2021-03-23 14:35:57', '2', 'Consentiment', '***', '***', '**'),
(185, 'Lourdes', 'Gas Benet', NULL, 1, '40008782-Y', '***', 'no tutela', 'Domicili Particular', '2021-03-23', 'Banco Sabadell', 'ES81 0081 0130 09 0006789792', 'BSABESBB', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:36:40', '2021-03-23 14:36:40', '0', 'Compte Bancari', 'C/ Sagrat Cor, 52q', '43520', 'Roquetes'),
(186, 'JOAN', 'I CARMEN', NULL, 1, '***', '****', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', '***', '***', NULL, 8, 12, 61, 60, 63, 62, '2021-03-23 14:37:08', '2021-03-23 14:37:08', '2', 'Consentiment', '***', '****', '***'),
(187, 'JOAQUIM', 'ALMUNI', NULL, 1, '40092646-N', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', '0081 2470 19 2394021723', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:38:20', '2021-03-23 14:38:20', '2', 'Consentiment', '***', '***', '***'),
(188, 'JOAQUIN', 'GRAU MARTELL', NULL, 1, '77883885-C', '***', 'tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES04 2013 3057 53 0200008594', '***', NULL, 7, 28, 29, 34, 68, 69, '2021-03-23 14:39:31', '2021-03-23 14:39:31', '2', 'Consentiment', '****', '****', '***'),
(189, 'Juana', 'Gui Grau', NULL, 1, '40007336-D', '***', 'no tutela', 'Domicili Particular', '2021-03-23', '****', '******', '*****', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:39:57', '2021-03-23 14:39:57', '0', 'Compte Bancari', 'Plaça Raval Nova, 6', '43520', 'Roquetes'),
(190, 'JOSE', 'PRINCEP', NULL, 1, '***', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', '***', '***', NULL, 8, 17, 61, 60, 49, 48, '2021-03-23 14:40:20', '2021-03-23 14:40:20', '2', 'Consentiment', '***', '***', '**'),
(191, 'JOSEFA', 'ESQUERE', NULL, 1, '40063173-W', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES32 2100 0086 17 0101101363', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:41:30', '2021-03-23 14:41:30', '2', 'Consentiment', '***', '***', '**'),
(192, 'JUAN', 'JOSE BORRULL', NULL, 1, '38760070-X', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES53 0182 0251 73 0201519323', '***', NULL, 8, 16, 61, 60, 45, 44, '2021-03-23 14:42:53', '2021-03-23 14:42:53', '2', 'Consentiment,Compte Bancari', '**', '**', '**'),
(193, 'JUAN', 'LUIS BARRERA', NULL, 1, '39996218-T', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES56 0049 4615 15 2795706264', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:44:05', '2021-03-23 14:44:05', '2', 'Consentiment', '***', '***', '***'),
(194, 'MARIA ANGELS', 'CID', NULL, 1, '**', '***', 'tutela', 'Domicili Institucio', '2021-03-23', '**', 'ES6030587457182720800295', '***', NULL, 7, 12, 29, 34, 63, 62, '2021-03-23 14:45:45', '2021-03-23 14:45:45', '2', 'Consentiment', 'C/Barcelona, 52', '43500', 'Tortosa'),
(195, 'MARIA', 'CINTA MONTAÑES', NULL, 1, '***', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '****', 'ES61 2100 0219 11 0100499681', 'CAIXESBBXXX', NULL, 8, 12, 61, 60, 63, 62, '2021-03-23 14:46:51', '2021-03-23 14:46:51', '2', 'Consentiment,Compte Bancari', '***', '***', '**'),
(196, 'MARIA MONTSERRAT', 'RODRIGUEZ MIRO', NULL, 1, '39991853-M', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES32 2100 0696 01 0100605950', '***', NULL, 8, 10, 61, 60, 39, 36, '2021-03-23 14:48:05', '2021-03-23 14:48:05', '2', 'Consentiment,Compte Bancari', '***', '***', '***'),
(197, 'RAMON', 'MARTÍNEZ BAUTISTA', NULL, 1, '75076915-Q', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', 'ES35 2100 0696 03 0100628884', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:49:10', '2021-03-23 14:49:10', '2', 'Consentiment,Compte Bancari', '***', '**', '**'),
(198, 'ROBERT', 'ETIENNIE GOMEZ', NULL, 1, 'x-070174305-S', '**', 'no tutela', 'Domicili Institucio', '2021-03-23', '***', 'ES54 0182 0246 20 0291507985', '***', NULL, 8, 34, 61, 60, 55, 54, '2021-03-23 14:50:24', '2021-03-23 14:50:24', '2', 'Consentiment,Compte Bancari', 'C/SANT CRISTÒFOL 278-280', '***', '***'),
(199, 'VICENTE', 'PEPIOL', NULL, 1, '77877674-L', '***', 'no tutela', 'Domicili Institucio', '2021-03-23', '**', 'ES06 0182 0299 29 0202021609', '***', NULL, 8, 12, 61, 60, 63, 62, '2021-03-23 14:51:28', '2021-03-23 14:55:28', '2', 'Consentiment,Compte Bancari', '***', '***', '***');

-- --------------------------------------------------------

--
-- Table structure for table `patient_invoices`
--

CREATE TABLE `patient_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(8,2) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_invoices`
--

INSERT INTO `patient_invoices` (`id`, `patient_id`, `due_date`, `created_at`, `updated_at`, `title`, `description`, `total`, `paid`, `type`) VALUES
(5, 21, '2021-01-05', '2021-01-05 19:39:12', '2021-01-05 19:39:12', 'PRE_20210105_HE2LUPZF3B', '', 0.00, 0, 2),
(6, 22, '2021-01-21', '2021-01-21 12:36:47', '2021-03-16 09:26:11', 'PRE_20210121_JUA7W1TKUM', '', 303.76, 1, 2),
(13, 23, '2021-02-20', '2021-02-20 17:05:12', '2021-03-25 04:20:23', '2021_0009', '', 213.72, 0, 1),
(14, 23, '2021-02-26', '2021-02-26 09:26:16', '2021-02-26 09:26:16', 'PRE_2021022613', '', 104.00, 0, 2),
(15, 22, '2021-02-26', '2021-02-26 09:46:38', '2021-02-26 09:46:38', 'PRE_2021022614', '', 1.10, 0, 2),
(16, 22, '2021-02-26', '2021-02-26 09:47:39', '2021-02-26 09:47:39', 'PRE_2021_15', '', 1.10, 0, 2),
(17, 22, '2021-03-21', '2021-03-21 16:44:40', '2021-03-21 16:44:40', 'PRE_2021_16', '', 10.40, 0, 2),
(18, 149, '2021-03-25', '2021-03-25 04:25:54', '2021-03-25 04:25:54', 'FAC_2021_0018', '', 104.00, 0, 1),
(19, 23, '2021-03-30', '2021-03-30 09:35:57', '2021-03-30 09:35:57', 'PRE_2021_18', '', 0.00, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `patient_invoices_item`
--

CREATE TABLE `patient_invoices_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_invoice_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_invoices_item`
--

INSERT INTO `patient_invoices_item` (`id`, `patient_invoice_id`, `title`, `price`, `quantity`, `tax`, `created_at`, `updated_at`) VALUES
(8, 5, 'Pressupost', 0.00, 0, '4.00', '2021-01-05 19:39:12', '2021-01-05 19:39:12'),
(31, 14, 'Test', 10.00, 10, '4.00', '2021-02-26 09:26:16', '2021-02-26 09:26:16'),
(32, 15, '1', 1.00, 1, '10.00', '2021-02-26 09:46:38', '2021-02-26 09:46:38'),
(33, 16, '1', 1.00, 1, '10.00', '2021-02-26 09:47:39', '2021-02-26 09:47:39'),
(41, 6, 'Prueba', 12.00, 12, '4.00', '2021-03-16 09:26:11', '2021-03-16 09:26:11'),
(42, 6, 'hola hola', 14.00, 10, '10.00', '2021-03-16 09:26:11', '2021-03-16 09:26:11'),
(52, 17, 'paseo diario', 10.00, 1, '4.00', '2021-03-21 16:44:40', '2021-03-21 16:44:40'),
(59, 18, 'Title', 10.00, 10, '4.00', '2021-03-25 04:25:54', '2021-03-25 04:25:54'),
(66, 13, 'PASSEIG', 12.00, 1, '21.00', '2021-05-08 02:22:45', '2021-05-08 02:22:45'),
(67, 13, 'prueba', 12.00, 12, '21.00', '2021-05-08 02:22:45', '2021-05-08 02:22:45'),
(68, 13, 'visita medica', 12.00, 2, '4.00', '2021-05-08 02:22:45', '2021-05-08 02:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'read entities', 'api', '2020-10-08 02:26:31', '2020-10-08 02:26:31'),
(2, 'crud entities', 'api', '2020-10-08 02:26:31', '2020-10-08 02:26:31'),
(3, 'read roles', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(4, 'crud roles', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(5, 'read providers', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(6, 'crud providers', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(7, 'read tasks', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(8, 'crud tasks', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(9, 'read patients', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(10, 'crud patients', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(11, 'read referents', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(12, 'crud referents', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(13, 'read workers', 'api', '2020-10-08 02:26:32', '2020-10-08 02:26:32'),
(14, 'crud workers', 'api', '2020-10-08 02:26:33', '2020-10-08 02:26:33'),
(15, 'crud patient_invoices', 'api', '2020-11-24 13:22:44', '2020-11-24 13:22:44'),
(16, 'read patient_invoices', 'api', '2020-11-24 13:22:44', '2020-11-24 13:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('bank','provider','state') COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cif` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `population` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('cash','transfer','bank') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `type`, `active`, `name`, `cif`, `phone`, `mobile`, `address`, `cp`, `population`, `email`, `contact_person`, `payment_method`, `entity`, `iban`, `bic`, `created_at`, `updated_at`) VALUES
(1, 'provider', 1, 'Appexpres', '46639984D', '977', '655530089', 'ortuella', '43520', 'roquetes', 'soporte@appexpres.com', 'Eusebio', 'transfer', '000', '000', '000', '2020-10-15 17:45:59', '2021-04-04 16:59:00'),
(3, 'state', 1, 'Shivam Yadav', 'CIF', '7974682508', '8959070299', '505 Naulakha', 'CP', 'POBLACIO', 'shivamyadav8959@gmaill.com', 'LOREM IPSUM', NULL, NULL, NULL, NULL, '2021-04-19 10:54:26', '2021-04-19 10:54:26'),
(4, 'provider', 1, 'Krishna Yadav', 'CIF', '8959070299', '7974682508', 'ADRECA', 'CP', 'POBLACIO', 'shivamyadav8959@gmail.com', 'persona de contacte', 'cash', 'ENTITAT1', 'IBAN1', 'BIC1', '2021-04-21 10:16:13', '2021-04-23 04:56:48'),
(5, 'provider', 1, 'New', 'CIF', '4345435', '424234', 'Adreca', 'CP', 'POBLACIA', 'shivamyadav8959@gmail.com', 'PERSONA DE CONTACTE', 'cash', 'ENTITIAT', 'IBON', 'BIC', '2021-04-23 04:58:50', '2021-04-23 04:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `p_a_i_s`
--

CREATE TABLE `p_a_i_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `background` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diabetes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hypertension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surgical_interventions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnostics` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allergies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treatment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medication` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_express` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medication_complimentary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toxics` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exercise` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `care_aspect` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hygiene` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roaming` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recognizes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daily_hygiene` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dress_up` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bathroom` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `food` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clean_up` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_tech` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobbies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religious` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interests` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orientation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recognizes_friends` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_concept` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compression` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `behavior` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delusions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hallucinations` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mood` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shows_emotions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_emotions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_issues` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curiosity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `somatic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_relations` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transportation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inappropriate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aggressiveness` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spare_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_satisfaction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedules` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_activities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autonomous` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goals` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objects` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_work` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `follow_up` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_a_i_s`
--

INSERT INTO `p_a_i_s` (`id`, `background`, `diabetes`, `hypertension`, `surgical_interventions`, `diagnostics`, `allergies`, `treatment`, `medication`, `can_express`, `medication_complimentary`, `diet`, `toxics`, `exercise`, `care_aspect`, `hygiene`, `roaming`, `support`, `recognizes`, `daily_hygiene`, `dress_up`, `bathroom`, `food`, `buy`, `cook`, `clean_up`, `new_tech`, `hobbies`, `religious`, `interests`, `orientation`, `short`, `long`, `storm`, `recognizes_friends`, `self_concept`, `language`, `compression`, `behavior`, `delusions`, `hallucinations`, `mood`, `shows_emotions`, `manage_emotions`, `manage_issues`, `curiosity`, `somatic`, `social_relations`, `family`, `activities`, `transportation`, `inappropriate`, `aggressiveness`, `spare_time`, `personal_satisfaction`, `schedules`, `alternative_activities`, `autonomous`, `goals`, `objects`, `provision`, `to_work`, `follow_up`, `observation`, `patient_id`, `created_at`, `updated_at`) VALUES
(22, 'Si te', 'diabetis alta', 'Si te', 'Si', 'alta', 'No', 'Molts', 'Si', 'si', 'si', 'Normal', 'No', 'Camina', 'Bona', 'bona', 'si', 'Bastons, muletes', 'Si', 'Si', 'Si', 'Si', 'si', 'Si', 'Si', 'Si', 'No', 'Cap', 'Cap', 'Cap', 'Si', 'Si', 'Si', 'Si', 'Si', 'Si', 'Be', 'Bona', 'No', 'No', 'No', 'Normal', 'Si', 'Si', 'Si', 'No', 'No', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'paseo', 'estudio general', 'si', 22, '2021-01-13 12:24:58', '2021-03-17 12:40:02'),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, '2021-02-10 11:19:15', '2021-02-10 11:19:15'),
(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, '2021-02-11 08:48:42', '2021-02-11 08:48:42'),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, '2021-02-11 08:52:42', '2021-02-11 08:52:42'),
(30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, '2021-02-11 08:55:14', '2021-02-11 08:55:14'),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, '2021-02-11 09:00:23', '2021-02-11 09:00:23'),
(33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, '2021-02-11 09:02:58', '2021-02-11 09:02:58'),
(35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, '2021-02-11 09:06:57', '2021-02-11 09:06:57'),
(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, '2021-02-11 09:16:37', '2021-02-11 09:16:37'),
(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, '2021-02-11 09:19:22', '2021-02-11 09:19:22'),
(43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, '2021-02-11 09:21:09', '2021-02-11 09:21:09'),
(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, '2021-02-11 09:42:42', '2021-02-11 09:42:42'),
(57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, '2021-02-11 09:46:50', '2021-02-11 09:46:50'),
(62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, '2021-02-11 09:55:19', '2021-02-11 09:55:19'),
(64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, '2021-02-12 08:54:15', '2021-02-12 08:54:15'),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, '2021-02-12 09:05:52', '2021-02-12 09:05:52'),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, '2021-02-12 09:18:03', '2021-02-12 09:18:03'),
(75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, '2021-02-12 09:22:12', '2021-02-12 09:22:12'),
(76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, '2021-02-12 09:23:52', '2021-02-12 09:23:52'),
(77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, '2021-02-12 09:27:36', '2021-02-12 09:27:36'),
(78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, '2021-02-12 09:28:49', '2021-02-12 09:28:49'),
(79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, '2021-02-12 09:30:25', '2021-02-12 09:30:25'),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, '2021-02-20 12:01:46', '2021-02-20 12:01:46'),
(83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, '2021-02-20 12:08:35', '2021-02-20 12:08:35'),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, '2021-02-20 12:11:10', '2021-02-20 12:11:10'),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, '2021-02-20 12:13:07', '2021-02-20 12:13:07'),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, '2021-02-20 12:14:53', '2021-02-20 12:14:53'),
(87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, '2021-02-20 12:16:32', '2021-02-20 12:16:32'),
(88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, '2021-02-20 12:19:02', '2021-02-20 12:19:02'),
(89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, '2021-02-20 12:20:13', '2021-02-20 12:20:13'),
(90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, '2021-02-20 12:22:03', '2021-02-20 12:22:03'),
(92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, '2021-02-20 12:27:01', '2021-02-20 12:27:01'),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, '2021-02-20 12:29:40', '2021-02-20 12:29:40'),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, '2021-02-20 12:31:24', '2021-02-20 12:31:24'),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, '2021-02-20 12:32:50', '2021-02-20 12:32:50'),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, '2021-02-20 12:34:14', '2021-02-20 12:34:14'),
(97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, '2021-02-20 12:35:58', '2021-02-20 12:35:58'),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, '2021-02-20 12:40:11', '2021-02-20 12:40:11'),
(99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, '2021-02-20 12:42:27', '2021-02-20 12:42:27'),
(100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, '2021-02-20 12:43:58', '2021-02-20 12:43:58'),
(101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, '2021-02-20 12:45:28', '2021-02-20 12:45:28'),
(102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, '2021-02-20 12:46:52', '2021-02-20 12:46:52'),
(103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, '2021-02-20 12:48:19', '2021-02-20 12:48:19'),
(104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, '2021-02-20 12:50:05', '2021-02-20 12:50:05'),
(105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, '2021-02-20 12:51:18', '2021-02-20 12:51:18'),
(106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, '2021-02-20 12:52:50', '2021-02-20 12:52:50'),
(107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, '2021-02-20 12:54:23', '2021-02-20 12:54:23'),
(108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, '2021-02-20 12:56:35', '2021-02-20 12:56:35'),
(109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, '2021-02-20 12:58:23', '2021-02-20 12:58:23'),
(110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, '2021-02-20 12:59:44', '2021-02-20 12:59:44'),
(111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, '2021-02-20 13:01:10', '2021-02-20 13:01:10'),
(112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, '2021-02-20 13:03:07', '2021-02-20 13:03:07'),
(113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, '2021-02-20 13:04:33', '2021-02-20 13:04:33'),
(114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, '2021-02-20 13:07:58', '2021-02-20 13:07:58'),
(115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, '2021-02-20 13:09:38', '2021-02-20 13:09:38'),
(116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, '2021-02-20 13:11:27', '2021-02-20 13:11:27'),
(117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, '2021-02-20 13:12:50', '2021-02-20 13:12:50'),
(118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, '2021-02-20 13:15:58', '2021-02-20 13:15:58'),
(119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, '2021-02-20 13:17:27', '2021-02-20 13:17:27'),
(120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, '2021-02-20 13:18:38', '2021-02-20 13:18:38'),
(121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, '2021-02-20 13:20:00', '2021-02-20 13:20:00'),
(122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, '2021-02-20 13:21:04', '2021-02-20 13:21:04'),
(123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, '2021-02-24 12:11:45', '2021-02-24 12:11:45'),
(124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, '2021-02-24 12:12:50', '2021-02-24 12:12:50'),
(125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 125, '2021-02-24 12:13:48', '2021-02-24 12:13:48'),
(126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 126, '2021-02-24 12:14:49', '2021-02-24 12:14:49'),
(127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 127, '2021-02-24 12:15:54', '2021-02-24 12:15:54'),
(128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 128, '2021-02-24 12:17:03', '2021-02-24 12:17:03'),
(129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 129, '2021-02-24 12:18:01', '2021-02-24 12:18:01'),
(130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130, '2021-02-24 12:19:00', '2021-02-24 12:19:00'),
(131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131, '2021-02-24 12:20:20', '2021-02-24 12:20:20'),
(132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 132, '2021-02-24 12:21:26', '2021-02-24 12:21:26'),
(133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 133, '2021-02-24 12:22:42', '2021-02-24 12:22:42'),
(134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 134, '2021-02-24 12:23:41', '2021-02-24 12:23:41'),
(135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, '2021-02-24 12:24:58', '2021-02-24 12:24:58'),
(136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 136, '2021-02-24 12:26:02', '2021-02-24 12:26:02'),
(137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 137, '2021-02-24 12:27:08', '2021-02-24 12:27:08'),
(138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 138, '2021-02-24 12:28:02', '2021-02-24 12:28:02'),
(139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 139, '2021-02-24 12:29:04', '2021-02-24 12:29:04'),
(140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 140, '2021-02-24 12:30:00', '2021-02-24 12:30:00'),
(141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 141, '2021-02-24 12:32:17', '2021-02-24 12:32:17'),
(142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 142, '2021-03-01 14:58:18', '2021-03-01 14:58:18'),
(143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 143, '2021-03-01 15:00:51', '2021-03-01 15:00:51'),
(144, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 144, '2021-03-01 15:02:47', '2021-03-01 15:02:47'),
(145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 145, '2021-03-01 15:03:58', '2021-03-01 15:03:58'),
(146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 146, '2021-03-01 15:05:15', '2021-03-01 15:05:15'),
(147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 147, '2021-03-01 15:06:50', '2021-03-01 15:06:50'),
(148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 148, '2021-03-01 15:08:23', '2021-03-01 15:08:23'),
(149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 149, '2021-03-02 10:16:17', '2021-03-02 10:16:17'),
(150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150, '2021-03-16 07:28:12', '2021-03-16 07:28:12'),
(151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 151, '2021-03-22 14:50:10', '2021-03-22 14:50:10'),
(152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 152, '2021-03-22 14:51:51', '2021-03-22 14:51:51'),
(153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 153, '2021-03-22 14:53:14', '2021-03-22 14:53:14'),
(154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 154, '2021-03-22 14:54:25', '2021-03-22 14:54:25'),
(155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 155, '2021-03-22 14:55:59', '2021-03-22 14:55:59'),
(156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 156, '2021-03-22 14:57:43', '2021-03-22 14:57:43'),
(157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 157, '2021-03-22 14:59:33', '2021-03-22 14:59:33'),
(158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 158, '2021-03-22 15:01:23', '2021-03-22 15:01:23'),
(160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 160, '2021-03-22 15:04:43', '2021-03-22 15:04:43'),
(161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 161, '2021-03-22 15:10:14', '2021-03-22 15:10:14'),
(162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 162, '2021-03-23 13:57:05', '2021-03-23 13:57:05'),
(163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 163, '2021-03-23 14:00:11', '2021-03-23 14:00:11'),
(164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 164, '2021-03-23 14:02:02', '2021-03-23 14:02:02'),
(165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 165, '2021-03-23 14:03:27', '2021-03-23 14:03:27'),
(166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 166, '2021-03-23 14:05:15', '2021-03-23 14:05:15'),
(167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 167, '2021-03-23 14:07:32', '2021-03-23 14:07:32'),
(168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 168, '2021-03-23 14:09:24', '2021-03-23 14:09:24'),
(169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 169, '2021-03-23 14:10:31', '2021-03-23 14:10:31'),
(170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170, '2021-03-23 14:11:49', '2021-03-23 14:11:49'),
(171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 171, '2021-03-23 14:13:24', '2021-03-23 14:13:24'),
(172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 172, '2021-03-23 14:20:01', '2021-03-23 14:20:01'),
(173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 173, '2021-03-23 14:21:55', '2021-03-23 14:21:55'),
(174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 174, '2021-03-23 14:23:42', '2021-03-23 14:23:42');
INSERT INTO `p_a_i_s` (`id`, `background`, `diabetes`, `hypertension`, `surgical_interventions`, `diagnostics`, `allergies`, `treatment`, `medication`, `can_express`, `medication_complimentary`, `diet`, `toxics`, `exercise`, `care_aspect`, `hygiene`, `roaming`, `support`, `recognizes`, `daily_hygiene`, `dress_up`, `bathroom`, `food`, `buy`, `cook`, `clean_up`, `new_tech`, `hobbies`, `religious`, `interests`, `orientation`, `short`, `long`, `storm`, `recognizes_friends`, `self_concept`, `language`, `compression`, `behavior`, `delusions`, `hallucinations`, `mood`, `shows_emotions`, `manage_emotions`, `manage_issues`, `curiosity`, `somatic`, `social_relations`, `family`, `activities`, `transportation`, `inappropriate`, `aggressiveness`, `spare_time`, `personal_satisfaction`, `schedules`, `alternative_activities`, `autonomous`, `goals`, `objects`, `provision`, `to_work`, `follow_up`, `observation`, `patient_id`, `created_at`, `updated_at`) VALUES
(175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 175, '2021-03-23 14:24:34', '2021-03-23 14:24:34'),
(176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 176, '2021-03-23 14:24:49', '2021-03-23 14:24:49'),
(177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 177, '2021-03-23 14:26:24', '2021-03-23 14:26:24'),
(178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 178, '2021-03-23 14:27:41', '2021-03-23 14:27:41'),
(179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 179, '2021-03-23 14:28:43', '2021-03-23 14:28:43'),
(180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 180, '2021-03-23 14:30:13', '2021-03-23 14:30:13'),
(181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 181, '2021-03-23 14:31:29', '2021-03-23 14:31:29'),
(182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 182, '2021-03-23 14:32:54', '2021-03-23 14:32:54'),
(183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 183, '2021-03-23 14:33:19', '2021-03-23 14:33:19'),
(184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 184, '2021-03-23 14:35:57', '2021-03-23 14:35:57'),
(185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 185, '2021-03-23 14:36:40', '2021-03-23 14:36:40'),
(186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 186, '2021-03-23 14:37:08', '2021-03-23 14:37:08'),
(187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 187, '2021-03-23 14:38:20', '2021-03-23 14:38:20'),
(188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 188, '2021-03-23 14:39:31', '2021-03-23 14:39:31'),
(189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 189, '2021-03-23 14:39:57', '2021-03-23 14:39:57'),
(190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 190, '2021-03-23 14:40:20', '2021-03-23 14:40:20'),
(191, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 191, '2021-03-23 14:41:30', '2021-03-23 14:41:30'),
(192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 192, '2021-03-23 14:42:53', '2021-03-23 14:42:53'),
(193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 193, '2021-03-23 14:44:05', '2021-03-23 14:44:05'),
(194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 194, '2021-03-23 14:45:45', '2021-03-23 14:45:45'),
(195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195, '2021-03-23 14:46:51', '2021-03-23 14:46:51'),
(196, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 196, '2021-03-23 14:48:05', '2021-03-23 14:48:05'),
(197, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 197, '2021-03-23 14:49:10', '2021-03-23 14:49:10'),
(198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 198, '2021-03-23 14:50:24', '2021-03-23 14:50:24'),
(199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 199, '2021-03-23 14:51:28', '2021-03-23 14:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `referents`
--

CREATE TABLE `referents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `population` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `dni` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grau_de_parentiu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referents`
--

INSERT INTO `referents` (`id`, `cp`, `population`, `province`, `address`, `phone`, `entity_id`, `dni`, `grau_de_parentiu`, `created_at`, `updated_at`) VALUES
(27, '43500', 'Tortosa', 'Tarragona', 'c/ Barcelona nº52', '637310746', 7, '7', '7', '2021-01-11 08:17:20', '2021-01-11 08:17:20'),
(28, '43520', 'Roquetes', 'Tarragona', 'Ortuella', '123', 11, '46639984D', 'Fill', '2021-01-13 12:23:31', '2021-04-21 10:04:46'),
(29, '43500', 'Tortosa', 'Tarragona', 'C/Barcelona, 52', '977597505', 7, '7', '7', '2021-02-10 07:37:30', '2021-02-10 07:37:30'),
(30, '43500', 'Tortosa', 'Tarragona', 'C/ Barcelona, 52', '977597505', 7, '7', '7', '2021-02-10 07:39:22', '2021-02-10 07:39:22'),
(31, '43500', 'Tortosa', 'Tarragona', 'C/Barcelona,52', '977597505', 7, '7', '7', '2021-02-10 07:41:51', '2021-02-10 07:41:51'),
(32, '43500', 'Tortosa', 'Tarragona', 'C/Barcelona, 52', '977597505', 7, '7', '7', '2021-02-10 07:43:17', '2021-02-10 07:43:17'),
(33, '43500', 'Tortosa', 'Tarragona', 'C/ Barcelona, 52', '977597505', 7, '7', '7', '2021-02-10 07:44:44', '2021-02-10 07:44:44'),
(34, '43500', 'Tortosa', 'Tarragona', 'C/ Barcelona, 52', '977597505', 7, '7', '7', '2021-02-10 07:45:58', '2021-02-10 07:45:58'),
(35, '43500', 'Tortosa', 'Tarragona', 'C/ Barcelona, 52', '977597505', 7, '7', '7', '2021-02-10 07:48:22', '2021-02-10 07:48:22'),
(36, '***', '***', '***', '***', '***', 10, '7', '7', '2021-02-10 08:10:01', '2021-02-25 14:46:09'),
(38, '43500', 'Tortosa', 'Tarragona', '***', '0000', 12, '7', '7', '2021-02-23 11:45:31', '2021-02-23 11:45:31'),
(39, '525', '452', '***', '***', '***', 10, '7', '7', '2021-02-25 14:49:04', '2021-02-25 14:49:04'),
(40, '****', '***', '***', '***', '***', 22, '7', '7', '2021-03-04 14:17:21', '2021-03-04 14:17:21'),
(41, '*****', '****', '****', '****', '****', 22, '7', '7', '2021-03-04 14:20:57', '2021-03-04 14:20:57'),
(42, '***', '***', '****', '****', '***', 30, '7', '7', '2021-03-04 14:23:10', '2021-03-04 14:23:10'),
(43, '***', '***', '***', '***', '***', 30, '7', '7', '2021-03-04 14:23:47', '2021-03-04 14:23:47'),
(44, '***', '***', '***', '***', '***', 16, '7', '7', '2021-03-04 14:25:00', '2021-03-04 14:25:00'),
(45, '5569', '456', '***', '***', '***', 16, '7', '7', '2021-03-04 14:29:17', '2021-03-04 14:29:17'),
(46, '***', '***', '****', '****', '***', 26, '7', '7', '2021-03-04 14:31:01', '2021-03-04 14:31:01'),
(47, '***', '***', '***', '***', '***', 26, '7', '7', '2021-03-04 14:31:47', '2021-03-04 14:31:47'),
(48, '*****', '****', '***', '***', '****', 17, '7', '7', '2021-03-04 14:34:08', '2021-03-04 14:34:08'),
(49, '***', '***', '***', '****', '***', 17, '7', '7', '2021-03-04 14:35:46', '2021-03-04 14:35:46'),
(50, '***', '***', '***', '***', '***', 21, '7', '7', '2021-03-04 14:37:02', '2021-03-04 14:37:02'),
(51, '***', '****', '***', '****', '***', 21, '7', '7', '2021-03-04 14:38:45', '2021-03-04 14:38:45'),
(52, '****', '****', '****', '****', '****', 35, '7', '7', '2021-03-04 14:58:25', '2021-03-04 14:58:25'),
(53, '***', '***', '***', '***', '***', 35, '7', '7', '2021-03-04 14:59:01', '2021-03-04 14:59:01'),
(54, '***', '***', '***', '***', '****', 34, '7', '7', '2021-03-04 15:00:03', '2021-03-04 15:00:03'),
(55, '****', '****', '***', '****', '***', 34, '7', '7', '2021-03-04 15:02:04', '2021-03-04 15:02:04'),
(56, '****', '****', '****', '****', '****', 19, '7', '7', '2021-03-04 15:03:16', '2021-03-04 15:03:16'),
(57, '****', '****', '****', '****', '****', 19, '7', '7', '2021-03-04 15:04:51', '2021-03-04 15:04:51'),
(58, '****', '****', '****', '****', '****', 38, '7', '7', '2021-03-04 15:09:46', '2021-03-04 15:09:46'),
(59, '***', '****', '****', '****', '****', 38, '7', '7', '2021-03-04 15:10:25', '2021-03-04 15:10:25'),
(60, '***', '***', '****', '****', '****', 8, '7', '7', '2021-03-04 15:15:07', '2021-03-04 15:15:07'),
(61, '***', '****', '****', '****', '****', 8, '7', '7', '2021-03-04 15:15:50', '2021-03-04 15:15:50'),
(62, '****', '****', '****', '****', '****', 12, '7', '7', '2021-03-04 15:30:58', '2021-03-04 15:30:58'),
(63, '*****', '****', '****', '****', '****', 12, '7', '7', '2021-03-04 15:31:37', '2021-03-04 15:31:37'),
(64, '****', '****', '****', '****', '****', 23, '7', '7', '2021-03-04 15:37:17', '2021-03-04 15:37:17'),
(65, '****', '****', '****', '***', '****', 23, '7', '7', '2021-03-04 15:37:45', '2021-03-04 15:37:45'),
(66, '43520', 'Roquetes', 'Tarratgona', 'Sant joan 8', '000000', 11, '7', '7', '2021-03-23 11:18:56', '2021-03-23 11:23:30'),
(67, '43520', 'roquetes', 'tarragona', 'sant joan 8', '000000', 11, '7', '7', '2021-03-23 11:22:51', '2021-03-23 11:22:51'),
(68, '****', '****', '***', '****', '****', 28, '7', '7', '2021-03-23 14:16:38', '2021-03-23 14:16:38'),
(69, '***', '***', '***', '***', '***', 28, '7', '7', '2021-03-23 14:17:28', '2021-03-23 14:17:28'),
(70, 'CP', 'POBLACIO', 'PROVINCIA', 'ADRECA', '7974682508', 11, '76543210', 'GRAU DE PARENTIU', '2021-04-19 10:05:18', '2021-04-19 10:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` enum('treballador','referent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `show`, `created_at`, `updated_at`) VALUES
(1, 'Administracio', 'api', 'treballador', '2020-10-08 02:26:28', '2021-01-11 08:58:59'),
(2, 'Treballador', 'api', 'treballador', '2020-10-08 02:26:28', '2020-10-08 02:26:28'),
(3, 'Coordinacio', 'api', 'treballador', '2020-10-08 02:26:28', '2020-10-08 02:26:28'),
(4, 'Facturacio', 'api', 'treballador', '2020-10-08 02:26:28', '2020-10-08 02:26:28'),
(5, 'Referent social', 'api', 'referent', '2020-10-08 02:26:28', '2020-10-08 02:26:28'),
(6, 'Referent economic', 'api', 'referent', '2020-10-08 02:26:29', '2020-10-08 02:26:29'),
(7, 'Particular', 'api', 'referent', '2020-10-08 02:26:29', '2020-10-08 02:26:29'),
(8, 'super Admin', 'api', NULL, '2020-10-21 06:57:21', '2020-12-23 17:53:06'),
(9, 'Director', 'api', 'referent', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 8),
(2, 1),
(2, 4),
(2, 8),
(3, 1),
(3, 8),
(4, 1),
(4, 8),
(5, 1),
(5, 4),
(5, 8),
(6, 1),
(6, 4),
(6, 8),
(7, 1),
(7, 2),
(7, 4),
(7, 5),
(7, 8),
(8, 1),
(8, 2),
(8, 5),
(8, 8),
(9, 1),
(9, 2),
(9, 4),
(9, 5),
(9, 6),
(9, 8),
(10, 1),
(10, 8),
(11, 1),
(11, 4),
(11, 8),
(12, 1),
(12, 4),
(12, 8),
(15, 1),
(15, 4),
(15, 8),
(16, 1),
(16, 4),
(16, 6),
(16, 8);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `cost_per_hour` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `user_id`, `cost_per_hour`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Service 1', NULL, 15, '2021-04-08 11:38:55', NULL, NULL),
(2, 'Service 2', NULL, 12, '2021-04-08 11:38:55', '2021-04-08 06:18:28', NULL),
(3, 'service 3', NULL, 10, '2021-04-08 06:18:17', '2021-04-08 06:18:17', NULL),
(5, 'Service 4', 1, 15, '2021-04-08 07:15:28', '2021-04-08 07:15:28', NULL),
(6, 'Service 2', 1, 23, '2021-04-08 08:25:55', '2021-04-08 08:25:55', NULL),
(7, 'Passeig', 32, 10, '2021-04-08 11:49:01', '2021-04-08 11:49:01', NULL),
(8, 'Visita medica', 32, 12, '2021-04-08 11:49:14', '2021-04-08 11:49:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dates` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `start_date`, `end_date`, `status`, `description`, `visit_type`, `dates`, `service_id`, `patient_id`, `created_at`, `updated_at`) VALUES
(12, '2021-03-15 16:00:00', '2021-06-30 16:00:00', 'asignades', 'Passeig Providencia', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"day_of_week\":1,\"number\":\"2\"},\"type\":\"weeks\"}}', 7, 106, '2021-03-16 07:32:59', '2021-04-21 18:08:22'),
(13, '2021-03-15 16:00:00', '2021-06-30 16:00:00', 'asignades', 'Passeig Javier sol Clua', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"2\"},\"type\":\"days\"}}', NULL, 86, '2021-03-16 07:36:55', '2021-03-19 12:26:57'),
(14, '2021-03-18 15:00:00', '2021-06-30 15:00:00', 'asignades', 'Passeig Estefanía Gonzalez', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"2\",\"day_of_week\":2},\"type\":\"weeks\"}}', NULL, 62, '2021-03-16 09:06:09', '2021-03-16 09:56:14'),
(15, '2021-03-18 15:00:00', '2021-06-30 15:00:00', 'asignades', 'Passeig Jaume Subirats', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"1\",\"day_of_week\":4},\"type\":\"weeks\"}}', NULL, 84, '2021-03-16 09:58:49', '2021-03-16 09:59:01'),
(16, '2021-03-18 16:00:00', '2021-06-30 16:00:00', 'asignades', 'Passeig Carmen Ruiz', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"1\",\"day_of_week\":4},\"type\":\"weeks\"}}', NULL, 42, '2021-03-16 10:01:24', '2021-03-16 10:02:04'),
(17, '2021-03-18 16:00:00', '2021-06-30 16:00:00', 'asignades', 'Passeig Susana', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"1\",\"day_of_week\":4},\"type\":\"weeks\"}}', NULL, 108, '2021-03-16 10:03:56', '2021-03-16 10:04:09'),
(18, '2021-03-19 10:00:00', '2021-06-30 09:30:00', 'asignades', 'Passeig Antonio Iturat', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\"}}}}', NULL, 33, '2021-03-16 10:11:55', '2021-03-16 10:12:09'),
(19, '2021-03-24 10:00:00', '2021-03-24 12:00:00', 'asignades', 'Passeig Antonio Iturat', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\"}}}}', NULL, 33, '2021-03-16 10:14:55', '2021-03-23 12:03:25'),
(20, '2021-03-16 15:00:00', '2021-06-30 15:00:00', 'asignades', 'Passeig Estefanía Gonzalez', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"2\",\"day_of_week\":2},\"type\":\"weeks\"}}', 7, 62, '2021-03-16 10:21:20', '2021-04-21 18:08:05'),
(21, '2021-06-30 15:00:00', '2021-06-30 16:00:00', 'pendents', 'Passeig Carmen Ruiz', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"2\",\"day_of_week\":2},\"type\":\"weeks\"}}', NULL, 42, '2021-03-16 10:33:29', '2021-03-16 10:33:29'),
(22, '2021-03-16 16:00:00', '2021-06-30 16:00:00', 'asignades', 'Passeig Susana', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-06-30\"},\"number\":\"2\",\"day_of_week\":2},\"type\":\"weeks\"}}', NULL, 108, '2021-03-16 10:35:50', '2021-03-25 09:51:27'),
(25, '2021-03-23 09:00:00', '2021-03-23 18:01:00', 'asignades', 'Passeig', 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2022-01-02\"},\"number\":\"1\"},\"type\":null}}', 7, 22, '2021-03-22 19:35:13', '2021-04-08 09:51:58'),
(26, '2021-03-22 23:04:00', '2021-03-22 23:06:00', 'asignades', 'cambio', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-03-23\"},\"number\":\"1\"},\"type\":\"days\"}}', NULL, 149, '2021-03-23 04:38:43', '2021-04-06 18:20:23'),
(27, '2021-03-23 23:01:00', '2021-03-23 23:01:00', 'asignades', 'passeig', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\"}},\"type\":null}}', NULL, 149, '2021-03-23 05:22:20', '2021-03-25 09:51:55'),
(28, '2021-03-25 00:01:00', '2021-03-26 00:00:00', 'completades', 'Lorem ipsum', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-03-26\"},\"number\":\"1\"},\"type\":\"days\"}}', NULL, 149, '2021-03-25 09:53:44', '2021-03-25 10:07:15'),
(29, '2021-03-24 23:01:00', '2021-03-24 23:59:00', 'pendents', 'Lorem ipsum', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-03-25\"},\"number\":\"1\"},\"type\":\"days\"}}', NULL, 22, '2021-03-25 10:06:21', '2021-03-25 10:06:21'),
(30, '2021-04-05 22:00:00', '2021-04-05 22:00:00', 'pendents', 'Passeig diari', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-04-06\"},\"number\":\"12\"},\"type\":\"days\"}}', 7, 149, '2021-04-06 06:30:38', '2021-04-08 09:51:14'),
(31, '2021-04-08 16:01:00', '2021-04-08 17:30:00', 'asignades', NULL, 'Activitats', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\"}}}}', 7, 22, '2021-04-08 09:50:30', '2021-04-08 09:50:53'),
(32, '2021-04-07 23:00:00', '2021-04-08 00:00:00', 'pendents', 'lorem ipsum', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\"}}}}', 6, 149, '2021-04-08 11:31:41', '2021-04-08 11:31:41'),
(33, '2021-05-02 18:31:00', '2021-05-03 19:34:00', 'pendents', 'Lorem ipsum', 'Visita mèdica', '{\"periodic\":{\"frequency\":{\"end\":{\"type\":\"date\",\"date\":\"2021-05-04\"},\"number\":\"2\"},\"type\":\"days\"}}', 1, 149, '2021-05-03 04:36:23', '2021-05-03 04:36:23');

-- --------------------------------------------------------

--
-- Table structure for table `task_worker`
--

CREATE TABLE `task_worker` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `worker_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_worker`
--

INSERT INTO `task_worker` (`id`, `task_id`, `worker_id`, `created_at`, `updated_at`) VALUES
(6, 4, 3, NULL, NULL),
(7, 5, 3, NULL, NULL),
(8, 6, 3, NULL, NULL),
(9, 7, 3, NULL, NULL),
(10, 8, 3, NULL, NULL),
(11, 9, 3, NULL, NULL),
(12, 10, 3, NULL, NULL),
(13, 12, 8, NULL, NULL),
(14, 13, 8, NULL, NULL),
(15, 14, 7, NULL, NULL),
(16, 15, 7, NULL, NULL),
(17, 16, 7, NULL, NULL),
(18, 17, 7, NULL, NULL),
(19, 18, 7, NULL, NULL),
(22, 23, 20, NULL, NULL),
(23, 24, 3, NULL, NULL),
(24, 24, 17, NULL, NULL),
(25, 25, 20, NULL, NULL),
(26, 26, 14, NULL, NULL),
(27, 19, 3, NULL, NULL),
(28, 26, 4, NULL, NULL),
(29, 26, 5, NULL, NULL),
(30, 26, 6, NULL, NULL),
(31, 26, 7, NULL, NULL),
(32, 22, 4, NULL, NULL),
(33, 22, 5, NULL, NULL),
(34, 22, 6, NULL, NULL),
(35, 27, 5, NULL, NULL),
(36, 28, 4, NULL, NULL),
(37, 28, 5, NULL, NULL),
(38, 28, 6, NULL, NULL),
(39, 28, 7, NULL, NULL),
(40, 28, 3, NULL, NULL),
(41, 31, 3, NULL, NULL),
(42, 20, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `workable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workable_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `workable_type`, `workable_id`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2020-10-08 02:26:28', '2020-10-08 02:26:28', NULL, NULL),
(28, 'Laura Blasco', 'laurablasco2011@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2020-10-20 10:08:53', '2020-10-20 10:08:53', NULL, NULL),
(32, 'Eusebio Blasco ', 'soporte@appexpres.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2020-11-27 20:35:04', '2020-11-27 20:35:04', NULL, NULL),
(33, 'Administrador', 'soport@sategest.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2020-11-27 20:36:13', '2020-11-27 20:36:13', NULL, NULL),
(35, 'Eusebio Blasco', 'referent@sategest.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-01-10 20:39:48', '2021-01-10 20:39:48', 'App\\Models\\Referent', 26),
(36, 'Marta Masià', 'mmasià@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-01-11 08:17:20', '2021-02-26 05:05:53', 'App\\Models\\Referent', 27),
(37, 'Alba', 'gestio@sateserveisassistencials.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-01-11 08:27:27', '2021-01-11 08:27:27', NULL, NULL),
(38, 'Margarita', 'bovallsm@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-01-11 08:29:42', '2021-03-16 08:00:51', NULL, NULL),
(39, 'Alba', 'alballeixa22@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-01-11 08:56:40', '2021-03-16 08:03:18', NULL, NULL),
(40, 'Eusebio Blasco Ferrer', 'eusebio@appexpres.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-01-13 12:23:31', '2021-04-09 09:43:44', 'App\\Models\\Referent', 28),
(41, 'Josep March', 'jmarch@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:37:30', '2021-02-10 07:37:30', 'App\\Models\\Referent', 29),
(42, 'Christian Sebastian', 'csebastian@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:39:22', '2021-02-10 07:39:22', 'App\\Models\\Referent', 30),
(43, 'Alba Trilla', 'atrilla@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:41:51', '2021-02-10 07:41:51', 'App\\Models\\Referent', 31),
(44, 'Eva Sanchez', 'esanchez@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:43:17', '2021-02-10 07:43:17', 'App\\Models\\Referent', 32),
(45, 'Thais Farnos', 'tfarnos@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:44:44', '2021-02-10 07:44:44', 'App\\Models\\Referent', 33),
(46, 'Maite Donnay', 'mdonnay@tutelarebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:45:58', '2021-02-10 07:45:58', 'App\\Models\\Referent', 34),
(47, 'Yolanda Cardona', 'ycardona@tutelaebre.org', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 07:48:22', '2021-02-10 07:48:22', 'App\\Models\\Referent', 35),
(48, 'L\'usuari Social', '123@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 08:10:01', '2021-02-10 11:14:18', 'App\\Models\\Referent', 36),
(50, 'Juan', 'joansalasr@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-10 11:43:08', '2021-03-16 08:06:49', NULL, NULL),
(51, 'Referent Econòmic FMP', 'fpons@fmp.cat', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-23 11:45:31', '2021-02-26 08:41:06', 'App\\Models\\Referent', 38),
(52, 'L\'usuari econòmic Particular', '1234@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-02-25 14:49:04', '2021-02-26 08:34:23', 'App\\Models\\Referent', 39),
(53, 'L\'usuari Social', 'sate@1234.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:17:21', '2021-03-04 14:17:21', 'App\\Models\\Referent', 40),
(54, 'L\'usuari Econòmic', 'sate1234@sate.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:20:57', '2021-03-04 14:20:57', 'App\\Models\\Referent', 41),
(55, 'L\'usuari Social', 'sateg@12.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:23:10', '2021-03-04 14:23:10', 'App\\Models\\Referent', 42),
(56, 'L\'usuari Econòmic', '1234@sate.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:23:47', '2021-03-04 14:23:47', 'App\\Models\\Referent', 43),
(57, 'L\'usuari Social', '****@12.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:25:00', '2021-03-04 14:25:00', 'App\\Models\\Referent', 44),
(58, 'L\'usuari EConòmic', '1234@1323.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:29:17', '2021-03-04 14:29:17', 'App\\Models\\Referent', 45),
(59, 'L\'usuari Social', '12334@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:31:01', '2021-03-04 14:31:01', 'App\\Models\\Referent', 46),
(60, 'L\'usuari Econòmic', '12341@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:31:47', '2021-03-04 14:31:47', 'App\\Models\\Referent', 47),
(61, 'L\'usuari Social', '123114@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:34:08', '2021-03-04 14:34:08', 'App\\Models\\Referent', 48),
(62, 'L\'usuari Econòmic', '11134@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:35:46', '2021-03-04 14:35:46', 'App\\Models\\Referent', 49),
(63, 'L\'usuari Social', '123434@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:37:02', '2021-03-04 14:37:02', 'App\\Models\\Referent', 50),
(64, 'L\'usuari Econòmic', '1098234@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:38:45', '2021-03-04 14:38:45', 'App\\Models\\Referent', 51),
(65, 'L\'usuari Social', '1234@126793.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:58:25', '2021-03-04 14:58:25', 'App\\Models\\Referent', 52),
(66, 'L\'usuari Econòmic', '12384@12763.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 14:59:01', '2021-03-04 14:59:01', 'App\\Models\\Referent', 53),
(67, 'L\'usuari Social', '12334564@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:00:03', '2021-03-04 15:00:03', 'App\\Models\\Referent', 54),
(68, 'L\'usuari Econòmic', '1234@120983.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:02:04', '2021-03-04 15:02:04', 'App\\Models\\Referent', 55),
(69, 'L\'usuari Social', '13893234@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:03:16', '2021-03-04 15:03:16', 'App\\Models\\Referent', 56),
(70, 'L\'usuari Econòmic', '12300324@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:04:51', '2021-03-04 15:04:51', 'App\\Models\\Referent', 57),
(71, 'L\'usuari Social', '1234@19802223.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:09:46', '2021-03-04 15:09:46', 'App\\Models\\Referent', 58),
(72, 'L\'usuari Econòmic', '1234@12095613.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:10:25', '2021-03-04 15:10:25', 'App\\Models\\Referent', 59),
(73, 'L\'usuari Social', '12234@145623.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:15:07', '2021-03-04 15:15:07', 'App\\Models\\Referent', 60),
(74, 'L\'usuari Econòmic', '12001134@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:15:50', '2021-03-04 15:15:50', 'App\\Models\\Referent', 61),
(75, 'L\'usuari Social', '12398784@123.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:30:58', '2021-03-04 15:30:58', 'App\\Models\\Referent', 62),
(76, 'L\'usuari Econòmic', '1234@1234523.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:31:36', '2021-03-04 15:31:37', 'App\\Models\\Referent', 63),
(77, 'L\'usuari Social', '1234@1234943.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:37:17', '2021-03-04 15:37:17', 'App\\Models\\Referent', 64),
(78, 'L\'usuari Econòmic', '1234@112345523.sate', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-04 15:37:45', '2021-03-04 15:37:45', 'App\\Models\\Referent', 65),
(79, 'Alba', 'afrallo92@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-11 08:23:51', '2021-03-16 08:11:05', NULL, NULL),
(80, 'Montse', 'montsefb97@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-11 08:54:41', '2021-03-16 08:14:34', NULL, NULL),
(81, 'Marimar', 'margc08@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-11 09:11:33', '2021-03-16 07:50:11', NULL, NULL),
(84, 'Alex', 'Administració@sateserveisassistencials.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 07:40:08', '2021-03-16 08:17:11', NULL, NULL),
(86, 'Antonia', 'Tonyicorpas10tc@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 08:03:18', '2021-03-16 08:24:54', NULL, NULL),
(87, 'Maria Cinta', 'mjfduib@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 08:11:30', '2021-03-16 08:51:46', NULL, NULL),
(89, 'Lorena', 'lorenaroca.alberto@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 08:55:15', '2021-03-16 08:29:46', NULL, NULL),
(90, 'Maria Magdalena', 'magdarcos2015@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 09:38:35', '2021-03-16 08:37:08', NULL, NULL),
(91, 'Marta', 'mmasaltes@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 09:57:26', '2021-03-16 08:39:57', NULL, NULL),
(92, 'Ohiane', 'ohianemendez@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 10:42:57', '2021-03-16 08:46:51', NULL, NULL),
(93, 'Mariam', 'mariamhamadidi2@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-15 10:50:38', '2021-03-17 19:55:36', NULL, NULL),
(94, 'Tutela particular', 'mail@mail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-23 11:18:56', '2021-03-23 11:18:56', 'App\\Models\\Referent', 66),
(95, 'Tutela Particular', 'mail2@mail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-23 11:22:51', '2021-03-23 11:22:51', 'App\\Models\\Referent', 67),
(96, 'L\'usuari econòmic', 'sate1233@sate44.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-23 14:16:38', '2021-03-23 14:16:38', 'App\\Models\\Referent', 68),
(97, 'L\'usuari social', '2sate33@4555.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-03-23 14:17:28', '2021-03-23 14:17:28', 'App\\Models\\Referent', 69),
(98, 'Shivam Yadav', 'shivamyadav8959@gmail.com', NULL, '$2y$10$25OT3Diy/t71D.37UsS8xesKGJrAQhuFkN7Nze69piO/KyDkE/rMS', NULL, '2021-04-19 10:05:18', '2021-04-19 10:36:56', 'App\\Models\\Referent', 70);

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `population` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date NOT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banking_entity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_training` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_experience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_contract` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_date` date NOT NULL,
  `renewal_date` date NOT NULL,
  `contract_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `import` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `irpf` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_import` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cost_per_hours` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `user_id`, `last_name`, `dni`, `active`, `address`, `cp`, `population`, `phone`, `mobile`, `birth_date`, `company_email`, `banking_entity`, `iban`, `bic`, `academic_training`, `work_experience`, `type_of_contract`, `working_day`, `initial_date`, `renewal_date`, `contract_duration`, `category`, `import`, `irpf`, `total_import`, `created_at`, `updated_at`, `cost_per_hours`) VALUES
(3, 38, 'Bo Valls', '48520364ñ', 1, 'carrer sant joan 8', '43901', 'Deltebre', '697961210', '697961210', '1965-05-08', 'bovallsm@gmail.com', 'La caixa', '15452464485521458', '45412', NULL, NULL, 'Indefinit', 'mitja', '2017-08-23', '2018-02-01', 'Indefinit', 'Treballadora familiar', '6', '2', '602', '2021-01-11 08:29:42', '2021-02-20 17:28:59', 5.00),
(4, 39, 'Lleixà Muria', '47936792P', 1, 'c/ Pare Romanyà nº26', '43520', 'Roquetes', '607823204', '607823204', '1992-07-22', 'gestio@sateserveisassistencials.com', 'Caixa banc', 'ES3721000178740100946537', 'Caixesbbxxx', 'Grau mitja', 'Administracio', 'Indefinit', 'Mitjana', '2016-05-02', '2017-02-02', 'Indefinit', 'Administració', '6', '0', '600', '2021-01-11 08:56:40', '2021-01-28 12:22:58', 6.00),
(5, 50, 'Salas', '47824811-Z', 1, 'C/ major', '43520', 'Roquetes', '647206299', '647206299', '1985-06-23', 'facturacio@sateserveisassistencials.com', 'Caixa Bank', 'ES015478965875998', '5455444', 'CFGS Administració i finançes', 'Administratiu a la FTTE', 'Indefinit', 'Mitja', '2021-02-01', '2021-02-01', 'indefinit', 'Administratiu', '100', '10', '110', '2021-02-10 11:43:08', '2021-02-11 12:20:42', 7.00),
(6, 79, 'Franch Llobet', '47829609M', 1, 'Carrer Sant Joan Nº8 baix', '43500', 'Tortosa', '693760243', '693760243', '1992-10-23', 'afrallo92@gmail.com', 'La Caixa', 'ES45 2100 0019 4801 0590 0289', 'CAIXESBBXXX', 'APD,Integració Social', NULL, 'Indefinit', 'Mitja', '2016-10-08', '2040-03-07', 'Indefinit', 'Coordinadora', '000', '00', '0000', '2021-03-11 08:23:51', '2021-03-16 08:11:05', 0.00),
(7, 80, 'Fort Beniaiges', '40929049C', 1, 'C/ Marquesa de laRoca  Nº16', '43500', 'Tortosa', '619251899', '619251899', '1967-11-01', 'montsefb97@gmail.com', 'BBVA', 'ES90 0182 4332 8702 0855 2837', 'BBVAESMMXXX', NULL, NULL, 'Indefinit', 'Mitjana', '2018-01-23', '2043-02-11', 'Indefinit', 'Treballadora', '000', '00', '0000', '2021-03-11 08:54:41', '2021-03-16 08:14:34', 0.00),
(8, 81, 'Gonzalez Campos', '40926629S', 1, 'C/ Sant Joan Nº8', '43500', 'Tortosa', '000000000', '000000000', '1969-05-07', 'margc08@gmail.com', 'BBVA', 'ES02 0182 4332 8602 0031 5096', 'BBVAESMMXXX', NULL, NULL, 'Indefinit', 'Mitja', '2016-09-20', '2041-06-05', 'Indefinit', 'Treballadora', '5000', '1000', '6000', '2021-03-11 09:11:33', '2021-03-16 09:18:52', 0.00),
(11, 84, 'Barrachina Gisbert', '53224227L', 1, 'C/Sant Joan nº8', '43500', 'Roquetes', '620581494', '620581494', '1981-07-27', 'Administració@sateserveisassistencials.com', '000', '000', '000', 'Grau d\'administració', 'SATE', 'Indefinit', '000', '2012-07-01', '2038-04-08', 'Indefinit', '000', '000', '000', '0000', '2021-03-15 07:40:09', '2021-03-16 08:17:11', 0.00),
(13, 86, 'Corpas Martin', '38559832X', 1, 'c/Sant Joan nº8', '43163', 'El Vendrell', '321654985', '321654985', '1972-06-30', 'Tonyicorpas10tc@gmail.com', '000', '000', '000', NULL, NULL, 'Indefinit', 'mitja', '2021-02-01', '2025-05-22', 'Indefinit', '000', '000', '000', '000', '2021-03-15 08:03:18', '2021-03-16 08:24:54', 0.00),
(14, 87, 'Utges Fabregat', '40925427D', 1, 'C/ Sant Joan nº8', '43500', 'Tortosa', '022555444', '022555444', '1966-02-07', 'mjfduib@gmail.com', '000', '000', '000', NULL, NULL, 'Indefinit', 'Mitja', '2016-02-02', '2025-12-15', 'Indefinit', '000', '000', '000', '000', '2021-03-15 08:11:30', '2021-03-16 08:51:46', 0.00),
(16, 89, 'Roca Segarra', '47628847X', 1, 'c/ Sant Joan nº8', '43136', 'Sant Carles de la Ràpita', '622444279', '622444279', '1988-09-06', 'lorenaroca.alberto@gmail.com', '000', '000', '00', NULL, NULL, 'Indefinit', 'Mitjana', '2021-01-25', '2028-05-10', 'Indefinit', '000', '000', '000', '000', '2021-03-15 08:55:15', '2021-03-16 08:29:46', 0.00),
(17, 90, 'Arcos Moyolema', '54686586S', 1, 'C/ Sant Joan nº8', '43500', 'Tortosa', '123459760', '123459760', '1970-05-13', 'magdarcos2015@gmail.com', '000', '000', '000', NULL, NULL, 'Indefinit', 'Mitja', '2020-08-03', '2026-09-02', 'Indefinit', '000', '000', '000', '000', '2021-03-15 09:38:35', '2021-03-16 08:37:08', 0.00),
(18, 91, 'Masia Altes', '47856666Z', 1, 'c/ Sant Domènech, nº8A000', '43597', 'Arnes', '661088681', '661088681', '1984-11-11', 'mmasaltes@gmail.com', '000', '000', '000', 'Batxiller,Postgrau en Direcció i Gestió de Residències i Serveis per la Gent Gran,Títol de Diplomat en Treball Social,Tècnic en animació geriàtrica', 'Treballadora social,SATE', 'Indefinit', 'Mitja', '2021-01-12', '2034-05-10', 'Indefinida', '000', '000', '000', '000', '2021-03-15 09:57:26', '2021-03-16 08:39:57', 0.00),
(19, 92, 'Méndez Bellés', '73403608M', 1, 'C/ Freginals nº5', '12596', 'Torreblanca', '684026844', '684026844', '2003-04-29', 'ohianemendez@gmail.com', '000', '000', '000', NULL, NULL, 'Pràctiques', 'Mitja', '2020-12-14', '2021-03-19', '220h', 'Pràctiques', '000', '000', '000', '2021-03-15 10:42:57', '2021-03-16 08:46:51', 0.00),
(20, 93, 'Hama Didi', '49635775G', 1, 'C/ Valencia nº1 p.1', '43500', 'Tortosa', '643889681', '643889681', '2002-01-01', 'mariamhamadidi2@gmail.com', '000', '000', '000', 'prova 1', 'netejadora', 'Pràctiques', 'Mitja', '2021-02-16', '2021-05-11', '220 hores', 'Pràctiques', '000', '000', '000', '2021-03-15 10:50:38', '2021-04-04 16:26:55', 6.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entities`
--
ALTER TABLE `entities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_task`
--
ALTER TABLE `expenses_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hours_task_id_foreign` (`task_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_invoices`
--
ALTER TABLE `patient_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_invoices_item`
--
ALTER TABLE `patient_invoices_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `p_a_i_s`
--
ALTER TABLE `p_a_i_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_a_i_s_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `referents`
--
ALTER TABLE `referents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referents_entity_id_foreign` (`entity_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_worker`
--
ALTER TABLE `task_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workers_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entities`
--
ALTER TABLE `entities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses_task`
--
ALTER TABLE `expenses_task`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `patient_invoices`
--
ALTER TABLE `patient_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patient_invoices_item`
--
ALTER TABLE `patient_invoices_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `p_a_i_s`
--
ALTER TABLE `p_a_i_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `referents`
--
ALTER TABLE `referents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `task_worker`
--
ALTER TABLE `task_worker`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `p_a_i_s`
--
ALTER TABLE `p_a_i_s`
  ADD CONSTRAINT `p_a_i_s_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `referents`
--
ALTER TABLE `referents`
  ADD CONSTRAINT `referents_entity_id_foreign` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
