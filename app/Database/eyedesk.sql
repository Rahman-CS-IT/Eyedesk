-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 05:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eyedesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `DOB` date NOT NULL,
  `age` int(2) NOT NULL,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobile_no` int(20) NOT NULL,
  `img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_id`, `name`, `email`, `username`, `password`, `gender`, `DOB`, `age`, `address`, `mobile_no`, `img`, `created_at`, `updated_at`) VALUES
(1, '', 'asdasdas', 'asdasd', 'asd', 'asd', 'male', '2022-09-28', 23, 'asdasd', 231231, 'asdasd', '2022-09-09 15:36:33', '2022-09-09 15:36:33'),
(2, '', 'admin', 'admin@gmail.com', 'admin', 'admin', 'male', '2001-03-27', 21, 'test', 987002931, 'test', '2022-11-03 17:03:29', '2022-11-03 17:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `advice`
--

CREATE TABLE `advice` (
  `id` int(30) NOT NULL,
  `advice_id` varchar(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `management_plan` varchar(30) NOT NULL,
  `personal_comment` varchar(30) NOT NULL,
  `followup_date` varchar(30) NOT NULL,
  `followup_location` varchar(30) NOT NULL,
  `followup_doctor` varchar(30) NOT NULL,
  `followup_time` varchar(30) NOT NULL,
  `followup_appointmentType` varchar(30) NOT NULL,
  `followup_appointmentCategory` varchar(30) NOT NULL,
  `Advice_text` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advice_medication`
--

CREATE TABLE `advice_medication` (
  `id` int(30) NOT NULL,
  `medication_id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Quantity` varchar(30) NOT NULL,
  `Frequency` varchar(30) NOT NULL,
  `Duration_count` varchar(30) NOT NULL,
  `Duration_Days` varchar(30) NOT NULL,
  `Taper_id` varchar(30) NOT NULL,
  `Eye` varchar(30) NOT NULL,
  `Instruction` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advice_medication_taper`
--

CREATE TABLE `advice_medication_taper` (
  `id` int(30) NOT NULL,
  `Taper_id` varchar(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Days` varchar(30) NOT NULL,
  `start_time` varchar(30) NOT NULL,
  `end_time` varchar(30) NOT NULL,
  `Frequency` varchar(30) NOT NULL,
  `interval` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advice_procedures`
--

CREATE TABLE `advice_procedures` (
  `id` int(30) NOT NULL,
  `procedure_id` varchar(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `eye_region` varchar(30) NOT NULL,
  `Procedure` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE `allergies` (
  `id` int(30) NOT NULL,
  `drug_type` varchar(300) NOT NULL,
  `drug_comment` varchar(300) NOT NULL,
  `contact_type` varchar(300) NOT NULL,
  `contact_comment` varchar(300) NOT NULL,
  `food_type` varchar(300) NOT NULL,
  `food_comment` varchar(300) NOT NULL,
  `other_comment` varchar(300) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allergies`
--

INSERT INTO `allergies` (`id`, `drug_type`, `drug_comment`, `contact_type`, `contact_comment`, `food_type`, `food_comment`, `other_comment`, `created_at`, `updated_at`) VALUES
(1, 'nsaid', 'ok', 'nsaid', 'ok', 'ok', 'ok', 'no', '2022-11-01 14:08:23', '2022-11-01 14:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `my_key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `my_key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'taibah123456', 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `app_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` enum('walkin','appointment') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appoint_date` date NOT NULL,
  `time` time NOT NULL,
  `location` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `specialities_available` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visit_type` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `progress_location` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `adverse_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token_no` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `app_id`, `patient_id`, `type`, `appoint_date`, `time`, `location`, `specialities_available`, `doctor_id`, `visit_type`, `category`, `status`, `progress_location`, `adverse_id`, `token_no`, `created_at`, `updated_at`) VALUES
(1, '0001', '1111', '', '0000-00-00', '00:00:00', '', '', '1001', '', '', '', '', '', 0, '2022-10-03 13:22:38', '2022-10-03 13:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `appoit`
--

CREATE TABLE `appoit` (
  `id` int(11) NOT NULL,
  `pat_id` varchar(55) NOT NULL,
  `appointmenttype` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_date` varchar(100) NOT NULL,
  `appointment_start_time` datetime NOT NULL,
  `appointment_end` datetime NOT NULL,
  `location` varchar(50) NOT NULL,
  `consultant` varchar(50) NOT NULL,
  `appointmentreason` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointmentcategory` varchar(50) NOT NULL,
  `created_at` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appoit`
--

INSERT INTO `appoit` (`id`, `pat_id`, `appointmenttype`, `appointment_date`, `appointment_start_time`, `appointment_end`, `location`, `consultant`, `appointmentreason`, `appointmentcategory`, `created_at`) VALUES
(80, 'AlI-P_01', 'Walk-in', '', '2023-02-16 00:00:00', '2023-02-16 01:00:00', 'aeh', 'Manchester', 'consultation', 'none', '2023-02-02 12:38:14'),
(81, 'AlI-P_01', 'Walk-in', '', '2023-02-11 00:00:00', '2023-02-11 01:00:00', 'aeh', 'Manchester', 'consultation', 'none', '2023-02-02 12:40:23'),
(82, 'AlI-P_01', 'Walk-in', '', '2023-02-02 13:01:00', '2023-02-02 14:01:00', 'aeh', 'Manchester', 'consultation', 'none', '2023-02-02 12:43:59'),
(83, 'Bil-P_03', 'Walk-in', '', '2023-02-02 13:01:00', '2023-02-02 14:01:00', 'aeh', 'Manchester', 'consultation', 'none', '2023-02-02 13:08:45'),
(84, 'Bil-P_05', 'Walk-in', '', '2023-02-03 14:02:00', '2023-02-03 15:02:00', 'aeh', 'NOOR ALAM KHAN', 'consultation', 'none', '2023-02-02 13:10:50'),
(85, '', 'Walk-in', '', '2023-02-15 00:00:00', '2023-02-15 01:00:00', 'aeh', 'BILAL SHAIKH', 'consultation', 'none', ''),
(86, '', 'Walk-in', '', '2023-02-16 00:00:00', '2023-02-16 01:00:00', 'aeh', 'BILAL SHAIKH', 'checkup', 'routine', ''),
(87, '', 'Walk-in', '', '2023-02-12 14:00:00', '2023-02-12 15:00:00', 'aeh', 'bilal', 'consultation', 'comprehensive', ''),
(88, '', 'Walk-in', '', '2023-02-13 00:00:00', '2023-02-13 01:00:00', 'aeh', 'Manchester', 'checkup', 'comprehensive', ''),
(89, 'Khalid-p-144', 'walkin', '2023-02-23', '0000-00-00 00:00:00', '2023-02-23 10:00:00', 'aec', 'Bilal', 'walkin', 'comprehensive', '2023-02-23 08:03:23'),
(90, 'Khalid-p-145', 'appointment', '2023-02-24', '0000-00-00 00:00:00', '2023-02-24 10:00:00', 'saf', 'Noor', 'walkin', 'comprehensive', '2023-02-23 08:04:16'),
(91, '', 'Walk-in', '', '2023-02-17 00:00:00', '2023-02-17 01:00:00', 'aec', 'Manchester', 'checkup', 'comprehensive', ''),
(92, '', 'Walk-in', '', '2023-02-02 00:00:00', '2023-02-02 01:00:00', 'aeh', 'Manchester', 'consultation', 'comprehensive', ''),
(93, 'Khalid-p-147', 'walkin', '2023-02-26', '0000-00-00 00:00:00', '2023-02-26 10:00:00', 'aec', 'Bilal', 'consultation', 'routine', '2023-02-26 08:58:47'),
(94, 'Khalid-p-149', 'walkin', '2023-02-16', '0000-00-00 00:00:00', '2023-02-16 10:00:00', 'aeh', 'Noor', 'consultation', 'routine', '2023-02-26 08:59:42'),
(95, 'wasif-p-152', 'appointment', '2023-02-26', '0000-00-00 00:00:00', '2023-02-26 10:00:00', 'aec', 'Bilal', 'review', 'comprehensive', '2023-02-26 09:31:46'),
(96, 'Khalid-p-153', 'walkin', '2023-02-15', '0000-00-00 00:00:00', '2023-02-15 10:00:00', 'aeh', 'Bilal', 'walkin', 'routine', '2023-02-26 14:59:55'),
(97, '', 'Walk-in', '', '2023-02-27 00:00:00', '2023-02-27 01:00:00', 'aeh', 'TEst', 'checkup', 'routine', ''),
(98, '', 'Walk-in', '', '2023-02-21 00:00:00', '2023-02-21 01:00:00', 'aeh', 'Bilal', 'checkup', 'comprehensive', ''),
(99, '', 'Walk-in', '', '2023-02-27 00:00:00', '2023-02-27 01:00:00', 'aec', 'Bilal', 'checkup', 'routine', ''),
(100, 'Khalid-p-154', 'walkin', '2023-03-01', '0000-00-00 00:00:00', '2023-03-01 12:00:00', 'aec', 'TEst', 'consultation', 'comprehensive', '2023-03-20 16:45:13'),
(101, '', 'Walk-in', '', '2023-02-09 02:00:00', '2023-02-09 03:00:00', 'aeh', 'Noor', 'checkup', 'routine', ''),
(102, 'Khalid-p-156', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 06:15:49'),
(103, 'disladh-p-157', 'walkin', '2023-04-08', '0000-00-00 00:00:00', '2023-04-08 10:00:00', 'aeh', 'Noor', 'review', 'routine', '2023-04-07 06:19:14'),
(104, 'Khalid-p-166', 'walkin', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 06:21:39'),
(105, 'Khalid-p-167', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:16'),
(106, 'Khalid-p-168', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:19'),
(107, 'Khalid-p-169', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:19'),
(108, 'Khalid-p-170', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:19'),
(109, 'Khalid-p-171', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:20'),
(110, 'Khalid-p-172', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:24'),
(111, 'Khalid-p-173', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'BILAL SHAIKH', 'review', 'comprehensive', '2023-04-07 06:23:39'),
(112, 'Khalid-p-174', 'walkin', '2023-04-08', '0000-00-00 00:00:00', '2023-04-08 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 06:25:40'),
(113, 'Khalid-p-175', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 10:55:16'),
(114, 'Khalid-p-176', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 10:56:03'),
(115, 'Khalid-p-177', 'walkin', '2023-04-06', '0000-00-00 00:00:00', '2023-04-06 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 10:58:58'),
(116, 'Khalid-p-178', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:00:54'),
(117, 'Khalid-p-180', 'walkin', '2023-04-29', '0000-00-00 00:00:00', '2023-04-29 10:00:00', 'aeh', 'TEst', 'review', 'comprehensive', '2023-04-07 11:07:43'),
(118, 'Khalid-p-182', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 11:09:54'),
(119, 'Khalid-p-183', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'lens', '2023-04-07 11:12:57'),
(120, 'Khalid-p-184', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:13:35'),
(121, 'Khalid-p-185', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'lens', '2023-04-07 11:16:10'),
(122, 'Khalid-p-186', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:43:09'),
(123, 'Khalid-p-187', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:43:21'),
(124, 'Khalid-p-188', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:47:09'),
(125, 'Khalid-p-189', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:47:16'),
(126, 'Khalid-p-190', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 11:50:05'),
(127, 'Khalid-p-191', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 11:52:38'),
(128, 'Khalid-p-192', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:53:11'),
(129, 'Khalid-p-193', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 11:55:43'),
(130, 'Khalid-p-194', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 12:00:31'),
(131, 'Khalid-p-195', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 12:00:41'),
(132, 'Khalid-p-196', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 12:02:04'),
(133, 'Khalid-p-197', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 12:04:47'),
(134, 'Khalid-p-198', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-07 12:06:19'),
(135, 'Khalid-p-199', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 12:14:30'),
(136, 'Khalid-p-200', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-07 12:16:05'),
(137, 'wasif -p-201', 'walkin', '2023-04-28', '0000-00-00 00:00:00', '2023-04-28 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-09 10:54:54'),
(138, 'bilal-p-202', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-09 11:04:46'),
(139, 'bilal-p-203', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-09 11:04:46'),
(140, 'razi-p-204', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'saf', 'Bilal', 'review', 'comprehensive', '2023-04-09 11:36:05'),
(141, '', 'Walk-in', '', '2023-04-10 00:00:00', '2023-04-10 01:00:00', 'aeh', 'Bilal', 'checkup', 'routine', ''),
(142, 'wasif-p-205', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-10 20:16:29'),
(143, 'Khalid-p-211', 'walkin', '2023-04-27', '0000-00-00 00:00:00', '2023-04-27 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 06:00:47'),
(144, 'Khalid-p-212', 'walkin', '2023-04-27', '0000-00-00 00:00:00', '2023-04-27 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 06:01:13'),
(145, 'Khalid-p-213', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'lens', '2023-04-20 06:05:09'),
(146, 'Khalid-p-216', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 06:14:04'),
(147, 'Khalid-p-217', 'walkin', '2023-05-05', '0000-00-00 00:00:00', '2023-05-05 10:00:00', 'aec', 'Bilal', 'review', 'routine', '2023-04-20 06:20:33'),
(148, 'Khalid-p-218', 'walkin', '2023-05-04', '0000-00-00 00:00:00', '2023-05-04 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 06:28:34'),
(149, 'Khalid-p-219', 'walkin', '2023-04-08', '0000-00-00 00:00:00', '2023-04-08 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 06:33:26'),
(150, 'Khalid-p-220', 'walkin', '2023-04-28', '0000-00-00 00:00:00', '2023-04-28 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 06:36:45'),
(151, 'Khalid-p-227', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 06:56:42'),
(152, 'Khalid-p-230', 'walkin', '2023-04-28', '0000-00-00 00:00:00', '2023-04-28 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 07:12:05'),
(153, 'Khalid-p-231', 'walkin', '2023-04-08', '0000-00-00 00:00:00', '2023-04-08 10:00:00', 'aeh', 'Bilal', 'review', 'lens', '2023-04-20 07:14:28'),
(154, 'Khalid-p-232', 'walkin', '2023-04-28', '0000-00-00 00:00:00', '2023-04-28 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 07:18:12'),
(155, 'Khalid-p-233', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 07:22:04'),
(156, 'Khalid-p-237', 'walkin', '2023-05-05', '0000-00-00 00:00:00', '2023-05-05 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 07:32:41'),
(157, 'Khalid-p-238', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 07:36:29'),
(158, 'Khalid-p-239', 'walkin', '2023-05-06', '0000-00-00 00:00:00', '2023-05-06 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 07:38:25'),
(159, 'abdullah-p-240', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 08:36:58'),
(160, 'AEH-wa-241', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 08:45:26'),
(161, 'AEH-nas-242', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 08:54:39'),
(162, 'AEH-Kha-243', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 08:58:03'),
(163, 'AEH-dil-244', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 09:08:53'),
(164, 'AEH-don-245', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 09:10:34'),
(165, 'AEH-mal-246', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 09:17:01'),
(166, 'AEH-Kha-247', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 09:19:04'),
(167, 'AEH-Kha-248', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 09:21:46'),
(168, 'AEH-mkm-249', 'walkin', '2023-04-20', '0000-00-00 00:00:00', '2023-04-20 10:00:00', 'aeh', 'bilal', 'review', 'comprehensive', '2023-04-20 09:26:59'),
(169, 'AEH-Kha-250', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 09:36:20'),
(170, 'AEH-Kha-251', 'walkin', '2023-04-07', '0000-00-00 00:00:00', '2023-04-07 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 09:37:28'),
(171, 'AEH-Kha-252', 'walkin', '2023-04-05', '0000-00-00 00:00:00', '2023-04-05 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 09:38:07'),
(172, 'AEH-Kha-255', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-20 12:52:31'),
(173, 'AEH-Kha-256', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 12:56:22'),
(174, 'AEH-Kha-257', 'walkin', '2023-04-06', '0000-00-00 00:00:00', '2023-04-06 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-20 13:03:53'),
(175, 'AEH-Kha-258', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-21 09:42:40'),
(176, 'AEH-raz-262', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-21 10:05:55'),
(177, 'AEH-Kha-300', 'walkin', '2023-04-07', '0000-00-00 00:00:00', '2023-04-07 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-24 14:42:41'),
(178, 'AEH-Kha-301', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-24 14:45:54'),
(179, 'AEH-Kha-302', 'walkin', '2023-04-08', '0000-00-00 00:00:00', '2023-04-08 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-24 14:53:45'),
(180, 'AEH-Kha-314', 'walkin', '2023-04-15', '0000-00-00 00:00:00', '2023-04-15 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-24 16:50:59'),
(181, 'AEH-Kha-317', 'walkin', '2023-04-08', '0000-00-00 00:00:00', '2023-04-08 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-24 16:58:40'),
(182, 'AEH-Kha-322', 'walkin', '2023-04-21', '0000-00-00 00:00:00', '2023-04-21 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-24 17:53:36'),
(183, 'AEH-Kha-323', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'lens', '2023-04-24 18:00:11'),
(184, 'AEH-Kha-324', 'walkin', '2023-04-06', '0000-00-00 00:00:00', '2023-04-06 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-24 18:07:52'),
(185, 'AEH-was-325', 'walkin', '2023-04-05', '0000-00-00 00:00:00', '2023-04-05 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-24 18:09:13'),
(186, 'AEH-Kha-326', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-27 14:08:40'),
(187, 'AEH-Kha-327', 'walkin', '2023-04-07', '0000-00-00 00:00:00', '2023-04-07 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-27 14:10:09'),
(188, 'AEH-Kha-328', 'walkin', '2023-04-07', '0000-00-00 00:00:00', '2023-04-07 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-27 14:10:09'),
(189, 'AEH-Kha-329', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'lens', '2023-04-27 14:12:14'),
(190, 'AEH-Kha-332', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-27 14:18:24'),
(191, 'AEH-Kha-333', 'walkin', '2023-04-22', '0000-00-00 00:00:00', '2023-04-22 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-27 14:21:04'),
(192, 'AEH-Kha-334', 'walkin', '2023-04-13', '0000-00-00 00:00:00', '2023-04-13 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-27 14:29:24'),
(193, 'AEH-Kha-335', 'appointment', '2023-04-07', '0000-00-00 00:00:00', '2023-04-07 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-27 14:36:20'),
(194, 'AEH-Kha-336', 'walkin', '2023-04-14', '0000-00-00 00:00:00', '2023-04-14 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-27 14:43:48'),
(195, 'AEH-Kha-337', 'walkin', '2023-04-06', '0000-00-00 00:00:00', '2023-04-06 10:00:00', 'aeh', 'Bilal', 'review', 'comprehensive', '2023-04-27 15:00:13'),
(196, 'AEH-Was-338', 'walkin', '2023-04-06', '0000-00-00 00:00:00', '2023-04-06 10:00:00', 'aeh', 'Bilal', 'review', 'routine', '2023-04-27 15:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `invoice_type` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `service` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(5) NOT NULL,
  `amount` int(11) NOT NULL,
  `comment` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` enum('paid','unpaid') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `doctor_id` varchar(200) NOT NULL,
  `problem_id` varchar(200) NOT NULL,
  `diagnosis_comment` varchar(200) NOT NULL,
  `user_comment` varchar(200) NOT NULL,
  `ICD-1010CMCODE` varchar(200) NOT NULL,
  `staff_id` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `provisional_comment` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_commondiagnosis`
--

CREATE TABLE `diagnosis_commondiagnosis` (
  `id` int(30) NOT NULL,
  `commondiagnosis_id` varchar(30) NOT NULL,
  `admin_id` varchar(30) NOT NULL,
  `diagnosis_name` varchar(30) NOT NULL,
  `staff_id` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_listofproblems`
--

CREATE TABLE `diagnosis_listofproblems` (
  `id` int(30) NOT NULL,
  `problem_id` varchar(30) NOT NULL,
  `commondiagnosis_id` varchar(30) NOT NULL,
  `problem_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_data`
--

CREATE TABLE `dynamic_data` (
  `id` int(10) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `duration_unit` varchar(100) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dynamic_data`
--

INSERT INTO `dynamic_data` (`id`, `patient_id`, `name`, `duration`, `duration_unit`, `comment`, `created_at`, `updated_at`) VALUES
(1, '', 'EYE SURGERY', '2', '2', 'no comments', '2023-04-07 17:32:04', '2023-04-07 17:32:04'),
(2, '', 'UVETIES', '2', '1', 'test', '2023-04-07 17:32:04', '2023-04-07 17:32:04'),
(3, '', 'SMOKING TOBACCO', '4', '4', 'test', '2023-04-07 17:32:04', '2023-04-07 17:32:04'),
(4, '', 'EYE SURGERY', '2', '2', 'no comments', '2023-04-07 17:32:04', '2023-04-07 17:32:04'),
(5, '', 'UVETIES', '2', '1', 'test', '2023-04-07 17:32:04', '2023-04-07 17:32:04'),
(6, '', 'SMOKING TOBACCO', '4', '4', 'test', '2023-04-07 17:32:04', '2023-04-07 17:32:04'),
(7, 'K', 'GLASS DISEASE', '2', '2', 'no comments', '2023-04-07 17:34:47', '2023-04-07 17:34:47'),
(8, 'h', 'GLASS DISEASE', '2', '2', 'no comments', '2023-04-07 17:34:47', '2023-04-07 17:34:47'),
(9, 'Khalid-p-198', 'GLASS DISEASE', '1', '2', 'no comments', '2023-04-07 17:36:19', '2023-04-07 17:36:19'),
(10, 'Khalid-p-198', 'GLASS DISEASE', '1', '2', 'no comments', '2023-04-07 17:36:19', '2023-04-07 17:36:19'),
(11, 'Khalid-p-199', 'RETINAL DETACHMENT', '3', '3', 'no comments', '2023-04-07 17:44:30', '2023-04-07 17:44:30'),
(12, 'Khalid-p-200', 'GLASS DISEASE', '2', '2', 'no comments', '2023-04-07 17:46:05', '2023-04-07 17:46:05'),
(13, 'Khalid-p-200', 'SMOKING TOBACCO', '4', '3', 'no comments', '2023-04-07 17:46:05', '2023-04-07 17:46:05'),
(14, 'Khalid-p-200', 'ANTIVIRAL AGENTS', '3', '2', 'no comments', '2023-04-07 17:46:05', '2023-04-07 17:46:05'),
(15, 'Khalid-p-200', 'BETADINE', '2', '2', 'no comments', '2023-04-07 17:46:05', '2023-04-07 17:46:05'),
(16, 'Khalid-p-200', 'SHELLFISH', '1', '1', 'no comments', '2023-04-07 17:46:05', '2023-04-07 17:46:05'),
(17, 'wasif -p-201', 'GLASS DISEASE', '3', '3', 'no comments', '2023-04-09 16:24:54', '2023-04-09 16:24:54'),
(18, 'wasif -p-201', 'HYPTHYRODISM CIRRHOSIS', '1', '3', 'no comments', '2023-04-09 16:24:54', '2023-04-09 16:24:54'),
(19, 'wasif -p-201', 'MILK', '2', '4', 'no comments', '2023-04-09 16:24:54', '2023-04-09 16:24:54'),
(20, 'bilal-p-202', 'EYE DISEASE', '4', '1', 'no comments', '2023-04-09 16:34:46', '2023-04-09 16:34:46'),
(21, 'bilal-p-203', 'EYE DISEASE', '4', '1', 'no comments', '2023-04-09 16:34:46', '2023-04-09 16:34:46'),
(22, 'razi-p-204', 'RETINAL DETACHMENT', '3', '1', 'no comments', '2023-04-09 17:06:05', '2023-04-09 17:06:05'),
(23, 'wasif-p-205', 'EYE DISEASE', '2', '1', 'no comments', '2023-04-11 01:46:29', '2023-04-11 01:46:29'),
(24, 'Khalid-p-212', 'EYE DISEASE', '2', '2', 'no comments', '2023-04-20 11:31:13', '2023-04-20 11:31:13'),
(25, 'Khalid-p-213', 'EYE SURGERY', '5', '2', 'no comments', '2023-04-20 11:35:09', '2023-04-20 11:35:09'),
(26, 'Khalid-p-216', 'EYE DISEASE', '2', '2', 'no comments', '2023-04-20 11:44:04', '2023-04-20 11:44:04'),
(27, 'Khalid-p-217', 'EYE SURGERY', '1', '1', 'no comments', '2023-04-20 11:50:33', '2023-04-20 11:50:33'),
(28, 'Khalid-p-218', 'EYE DISEASE', '4', '2', 'no comments', '2023-04-20 11:58:34', '2023-04-20 11:58:34'),
(29, 'Khalid-p-219', 'GLASS DISEASE', '4', '2', 'no comments', '2023-04-20 12:03:26', '2023-04-20 12:03:26'),
(30, 'Khalid-p-220', 'EYE SURGERY', '1', '1', 'no comments', '2023-04-20 12:06:45', '2023-04-20 12:06:45'),
(31, 'Khalid-p-227', 'EYE DISEASE', '3', '2', 'no comments', '2023-04-20 12:26:42', '2023-04-20 12:26:42'),
(32, 'Khalid-p-230', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-20 12:42:05', '2023-04-20 12:42:05'),
(33, 'Khalid-p-231', 'EYE DISEASE', '2', '2', 'no comments', '2023-04-20 12:44:28', '2023-04-20 12:44:28'),
(34, 'Khalid-p-232', 'EYE DISEASE', '2', '1', 'no comments', '2023-04-20 12:48:12', '2023-04-20 12:48:12'),
(35, 'Khalid-p-233', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-20 12:52:04', '2023-04-20 12:52:04'),
(36, 'Khalid-p-237', 'EYE SURGERY', '2', '2', 'no comments', '2023-04-20 13:02:41', '2023-04-20 13:02:41'),
(37, 'Khalid-p-238', 'RETINAL DETACHMENT', '3', '3', 'no comments', '2023-04-20 13:06:29', '2023-04-20 13:06:29'),
(38, 'Khalid-p-239', 'EYE SURGERY', '4', '2', 'no comments', '2023-04-20 13:08:25', '2023-04-20 13:08:25'),
(39, 'abdullah-p-240', 'RETINAL DETACHMENT', '4', '2', 'no comments', '2023-04-20 14:06:58', '2023-04-20 14:06:58'),
(40, 'AEH-wa-241', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-20 14:15:26', '2023-04-20 14:15:26'),
(41, 'AEH-nas-242', 'EYE DISEASE', '1', '2', 'no comments', '2023-04-20 14:24:39', '2023-04-20 14:24:39'),
(42, 'AEH-Kha-243', 'GLASS DISEASE', '3', '1', 'no comments', '2023-04-20 14:28:03', '2023-04-20 14:28:03'),
(43, 'AEH-dil-244', 'RETINAL LASER', '1', '1', 'no comments', '2023-04-20 14:38:53', '2023-04-20 14:38:53'),
(44, 'AEH-don-245', 'ANTIFUNGAL AGENTS', '2', '1', 'no comments', '2023-04-20 14:40:34', '2023-04-20 14:40:34'),
(45, 'AEH-mal-246', 'GLASS DISEASE', '4', '2', 'no comments', '2023-04-20 14:47:01', '2023-04-20 14:47:01'),
(46, 'AEH-Kha-247', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-20 14:49:04', '2023-04-20 14:49:04'),
(47, 'AEH-Kha-248', 'GLASS DISEASE', '2', '1', 'no comments', '2023-04-20 14:51:46', '2023-04-20 14:51:46'),
(48, 'AEH-mkm-249', 'GLASS DISEASE', '2', '1', 'no comments', '2023-04-20 14:56:59', '2023-04-20 14:56:59'),
(49, 'AEH-Kha-250', 'GLASS DISEASE', '2', '1', 'no comments', '2023-04-20 15:06:20', '2023-04-20 15:06:20'),
(50, 'AEH-Kha-251', 'EYE DISEASE', '3', '1', 'no comments', '2023-04-20 15:07:28', '2023-04-20 15:07:28'),
(51, 'AEH-Kha-252', 'GLASS DISEASE', '1', '1', 'no comments', '2023-04-20 15:08:07', '2023-04-20 15:08:07'),
(52, 'AEH-Kha-255', 'RETINAL DETACHMENT', '1', '1', 'no comments', '2023-04-20 18:22:31', '2023-04-20 18:22:31'),
(53, 'AEH-Kha-255', 'ANTIFUNGAL AGENTS', '3', '1', 'no comments', '2023-04-20 18:22:31', '2023-04-20 18:22:31'),
(54, 'AEH-Kha-256', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-20 18:26:22', '2023-04-20 18:26:22'),
(55, 'AEH-Kha-256', 'ANTIFUNGAL AGENTS', '2', '2', 'no comments', '2023-04-20 18:26:22', '2023-04-20 18:26:22'),
(56, 'AEH-Kha-257', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-20 18:33:53', '2023-04-20 18:33:53'),
(57, 'AEH-Kha-257', 'RETINAL LASER', 'select', 'select', '', '2023-04-20 18:33:53', '2023-04-20 18:33:53'),
(58, 'AEH-Kha-257', 'ANTIFUNGAL AGENTS', '2', '1', 'no comments', '2023-04-20 18:33:53', '2023-04-20 18:33:53'),
(59, 'AEH-Kha-258', 'RETINAL DETACHMENT', '4', '2', 'no comments', '2023-04-21 15:12:40', '2023-04-21 15:12:40'),
(60, 'AEH-Kha-258', 'BETADINE', '2', '3', 'no comments', '2023-04-21 15:12:40', '2023-04-21 15:12:40'),
(61, 'AEH-raz-262', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-21 15:35:55', '2023-04-21 15:35:55'),
(62, 'AEH-abd-280', 'GLASS DISEASE', '2', '1', 'no comments', '2023-04-23 11:54:51', '2023-04-23 11:54:51'),
(63, 'AEH-Kha-281', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-23 11:58:26', '2023-04-23 11:58:26'),
(64, 'AEH-Kha-281', 'CORN', '2', '1', 'no comments', '2023-04-23 11:58:26', '2023-04-23 11:58:26'),
(65, 'AEH-Kha-282', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-23 12:04:25', '2023-04-23 12:04:25'),
(66, 'AEH-Kha-282', 'ANTIFUNGAL AGENTS', '3', '2', 'no comments', '2023-04-23 12:04:25', '2023-04-23 12:04:25'),
(67, 'AEH-Kha-283', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-23 12:04:27', '2023-04-23 12:04:27'),
(68, 'AEH-Kha-283', 'ANTIFUNGAL AGENTS', '3', '2', 'no comments', '2023-04-23 12:04:27', '2023-04-23 12:04:27'),
(69, 'AEH-Kha-284', 'RETINAL LASER', '2', '1', 'no comments', '2023-04-23 12:20:49', '2023-04-23 12:20:49'),
(70, 'AEH-Kha-284', 'ANTIFUNGAL AGENTS', '2', '2', 'no comments', '2023-04-23 12:20:49', '2023-04-23 12:20:49'),
(71, 'AEH-Kha-285', 'EYE DISEASE', '2', '1', 'no comments', '2023-04-23 12:22:30', '2023-04-23 12:22:30'),
(72, 'AEH-Kha-285', 'NSAIDS AGENTS', '4', '3', 'no comments', '2023-04-23 12:22:30', '2023-04-23 12:22:30'),
(73, 'AEH-Kha-286', 'GLAUCOMA', '3', '2', 'no comments', '2023-04-23 12:39:07', '2023-04-23 12:39:07'),
(74, 'AEH-Kha-286', 'ANTIMICROBIAL', '1', '2', 'no comments', '2023-04-23 12:39:07', '2023-04-23 12:39:07'),
(75, 'AEH-Kha-287', 'GLAUCOMA', '3', '2', 'no comments', '2023-04-23 12:39:07', '2023-04-23 12:39:07'),
(76, 'AEH-Kha-287', 'ANTIMICROBIAL', '1', '2', 'no comments', '2023-04-23 12:39:07', '2023-04-23 12:39:07'),
(77, 'AEH-Kha-288', 'RETINAL DETACHMENT', '1', '2', 'no comments', '2023-04-23 13:01:31', '2023-04-23 13:01:31'),
(78, 'AEH-Kha-288', 'ANTIFUNGAL AGENTS', '3', '1', 'no comments', '2023-04-23 13:01:31', '2023-04-23 13:01:31'),
(79, 'AEH-Kha-289', 'GLASS DISEASE', '2', '1', 'no comments', '2023-04-23 13:08:47', '2023-04-23 13:08:47'),
(80, 'AEH-Kha-289', 'ANTIFUNGAL AGENTS', '1', '2', 'no comments', '2023-04-23 13:08:47', '2023-04-23 13:08:47'),
(81, 'AEH-Kha-290', 'RETINAL DETACHMENT', '3', '1', 'no comments', '2023-04-23 13:14:51', '2023-04-23 13:14:51'),
(82, 'AEH-Kha-290', 'ANTIFUNGAL AGENTS', '2', '1', 'no comments', '2023-04-23 13:14:51', '2023-04-23 13:14:51'),
(83, 'AEH-Kha-291', 'GLAUCOMA', '2', '3', 'no comments', '2023-04-23 13:26:06', '2023-04-23 13:26:06'),
(84, 'AEH-Kha-292', 'GLAUCOMA', '2', '3', 'no comments', '2023-04-23 13:28:34', '2023-04-23 13:28:34'),
(85, 'AEH-Kha-293', 'GLAUCOMA', '2', '3', 'no comments', '2023-04-23 13:28:51', '2023-04-23 13:28:51'),
(86, 'AEH-Kha-296', 'GLASS DISEASE', '2', '1', 'no comments', '2023-04-23 13:40:31', '2023-04-23 13:40:31'),
(87, 'AEH-Kha-297', 'RETINAL DETACHMENT', '4', '3', 'no comments', '2023-04-23 13:54:29', '2023-04-23 13:54:29'),
(88, 'AEH-Kha-297', 'MUSHROOM', '2', '2', 'no comments', '2023-04-23 13:54:29', '2023-04-23 13:54:29'),
(89, 'AEH-Kha-298', 'RETINAL DETACHMENT', '3', '3', 'no comments', '2023-04-23 13:59:04', '2023-04-23 13:59:04'),
(90, 'AEH-Kha-298', 'ANTIFUNGAL AGENTS', '1', '2', 'no comments', '2023-04-23 13:59:04', '2023-04-23 13:59:04'),
(91, 'AEH-Kha-299', 'RETINAL DETACHMENT', '2', '1', 'no comments', '2023-04-24 20:04:43', '2023-04-24 20:04:43'),
(92, 'AEH-Kha-299', 'ANTIMICROBIAL', '2', '2', 'no comments', '2023-04-24 20:04:43', '2023-04-24 20:04:43'),
(93, 'AEH-Kha-300', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-24 20:12:40', '2023-04-24 20:12:40'),
(94, 'AEH-Kha-301', 'GLASS DISEASE', '1', '3', 'no comments', '2023-04-24 20:15:54', '2023-04-24 20:15:54'),
(95, 'AEH-Kha-301', 'ASTHMA', '1', '1', 'no comments', '2023-04-24 20:15:54', '2023-04-24 20:15:54'),
(96, 'AEH-Kha-301', 'ANTIFUNGAL AGENTS', '1', '2', 'no comments', '2023-04-24 20:15:54', '2023-04-24 20:15:54'),
(97, 'AEH-Kha-302', 'RETINAL DETACHMENT', '1', '3', 'no comments', '2023-04-24 20:23:45', '2023-04-24 20:23:45'),
(98, 'AEH-Kha-302', 'CORN', '3', '3', 'no comments', '2023-04-24 20:23:45', '2023-04-24 20:23:45'),
(99, 'AEH-Kha-303', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-24 21:25:54', '2023-04-24 21:25:54'),
(100, 'AEH-Kha-304', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-24 21:27:52', '2023-04-24 21:27:52'),
(101, 'AEH-Kha-304', 'ANTIFUNGAL AGENTS', '3', '2', 'no comments', '2023-04-24 21:27:52', '2023-04-24 21:27:52'),
(102, 'AEH-Kha-305', 'EYE DISEASE', '2', '2', 'no comments', '2023-04-24 21:29:28', '2023-04-24 21:29:28'),
(103, 'AEH-Kha-306', 'RETINAL DETACHMENT', '1', '1', 'no comments', '2023-04-24 21:35:56', '2023-04-24 21:35:56'),
(104, 'AEH-Kha-306', 'RETINAL LASER', '1', '2', 'no comments', '2023-04-24 21:35:56', '2023-04-24 21:35:56'),
(105, 'AEH-Kha-307', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-24 21:38:41', '2023-04-24 21:38:41'),
(106, 'AEH-Kha-307', 'ANTIVIRAL AGENTS', 'select', 'select', '', '2023-04-24 21:38:41', '2023-04-24 21:38:41'),
(107, 'AEH-Kha-308', 'GLASS DISEASE', '1', '1', 'no comments', '2023-04-24 21:51:42', '2023-04-24 21:51:42'),
(108, 'AEH-Kha-308', 'ANTIMICROBIAL', 'select', 'select', '', '2023-04-24 21:51:42', '2023-04-24 21:51:42'),
(109, 'AEH-Kha-309', 'RETINAL DETACHMENT', '3', '1', 'no comments', '2023-04-24 22:07:31', '2023-04-24 22:07:31'),
(110, 'AEH-Kha-309', 'TUBERCULOSIS', 'select', 'select', '', '2023-04-24 22:07:31', '2023-04-24 22:07:31'),
(111, 'AEH-Kha-310', 'RETINAL DETACHMENT', '3', '1', 'no comments', '2023-04-24 22:09:04', '2023-04-24 22:09:04'),
(112, 'AEH-Kha-310', 'TUBERCULOSIS', 'select', 'select', '', '2023-04-24 22:09:04', '2023-04-24 22:09:04'),
(113, 'AEH-Kha-311', 'RETINAL DETACHMENT', '3', '1', 'no comments', '2023-04-24 22:13:40', '2023-04-24 22:13:40'),
(114, 'AEH-Kha-311', 'TUBERCULOSIS', 'select', 'select', '', '2023-04-24 22:13:40', '2023-04-24 22:13:40'),
(115, 'AEH-Kha-312', 'RETINAL DETACHMENT', '2', '3', 'no comments', '2023-04-24 22:16:17', '2023-04-24 22:16:17'),
(116, 'AEH-Kha-313', 'EYE DISEASE', '4', '1', 'no comments', '2023-04-24 22:18:01', '2023-04-24 22:18:01'),
(117, 'AEH-Kha-314', 'RETINAL DETACHMENT', '2', '1', 'no comments', '2023-04-24 22:20:59', '2023-04-24 22:20:59'),
(118, 'AEH-Kha-315', 'RETINAL DETACHMENT', '2', '3', 'no comments', '2023-04-24 22:26:45', '2023-04-24 22:26:45'),
(119, 'AEH-Kha-315', 'ANTIMICROBIAL', '3', '2', 'no comments', '2023-04-24 22:26:45', '2023-04-24 22:26:45'),
(120, 'AEH-Kha-315', 'SHELLFISH', '2', '2', 'no comments', '2023-04-24 22:26:45', '2023-04-24 22:26:45'),
(121, 'AEH-Kha-316', 'RETINAL DETACHMENT', '2', '3', 'no comments', '2023-04-24 22:27:27', '2023-04-24 22:27:27'),
(122, 'AEH-Kha-316', 'ANTIMICROBIAL', '3', '2', 'no comments', '2023-04-24 22:27:27', '2023-04-24 22:27:27'),
(123, 'AEH-Kha-316', 'SHELLFISH', '2', '2', 'no comments', '2023-04-24 22:27:27', '2023-04-24 22:27:27'),
(124, 'AEH-Kha-317', 'RETINAL DETACHMENT', '4', '3', 'no comments', '2023-04-24 22:28:39', '2023-04-24 22:28:39'),
(125, 'AEH-Kha-318', 'GLASS DISEASE', '2', '3', 'no comments', '2023-04-24 23:17:13', '2023-04-24 23:17:13'),
(126, 'AEH-Kha-318', 'ANTIFUNGAL AGENTS', '2', '1', 'no commentstest', '2023-04-24 23:17:13', '2023-04-24 23:17:13'),
(127, 'AEH-Kha-318', 'MILK', '3', '5', 'no comments', '2023-04-24 23:17:13', '2023-04-24 23:17:13'),
(128, 'AEH-Kha-319', 'EYE DISEASE', 'select', 'select', '', '2023-04-24 23:21:22', '2023-04-24 23:21:22'),
(129, 'AEH-Kha-319', 'GLASS DISEASE', '1', '2', 'no comments', '2023-04-24 23:21:22', '2023-04-24 23:21:22'),
(130, 'AEH-Kha-320', 'EYE DISEASE', 'select', 'select', '', '2023-04-24 23:21:52', '2023-04-24 23:21:52'),
(131, 'AEH-Kha-320', 'GLASS DISEASE', '1', '2', 'no comments', '2023-04-24 23:21:52', '2023-04-24 23:21:52'),
(132, 'AEH-Kha-321', 'EYE DISEASE', 'select', 'select', '', '2023-04-24 23:22:16', '2023-04-24 23:22:16'),
(133, 'AEH-Kha-321', 'GLASS DISEASE', '1', '2', 'no comments', '2023-04-24 23:22:16', '2023-04-24 23:22:16'),
(134, 'AEH-Kha-322', 'GLAUCOMA', '2', '2', 'no comments', '2023-04-24 23:23:36', '2023-04-24 23:23:36'),
(135, 'AEH-Kha-323', 'RETINAL DETACHMENT', '1', '1', 'no comments', '2023-04-24 23:30:09', '2023-04-24 23:30:09'),
(136, 'AEH-Kha-324', 'RETINAL DETACHMENT', '2', '1', 'no comments', '2023-04-24 23:37:51', '2023-04-24 23:37:51'),
(137, 'AEH-was-325', 'RETINAL DETACHMENT', '1', '3', 'no comments', '2023-04-24 23:39:13', '2023-04-24 23:39:13'),
(138, 'AEH-Kha-326', 'RETINAL DETACHMENT', '1', '3', 'no comments', '2023-04-27 19:38:39', '2023-04-27 19:38:39'),
(139, 'AEH-Kha-327', 'RETINAL DETACHMENT', '2', '4', 'no comments', '2023-04-27 19:40:09', '2023-04-27 19:40:09'),
(140, 'AEH-Kha-327', 'BENIGN HYPERPLASIA', '3', '2', 'no comments', '2023-04-27 19:40:09', '2023-04-27 19:40:09'),
(141, 'AEH-Kha-328', 'RETINAL DETACHMENT', '2', '4', 'no comments', '2023-04-27 19:40:09', '2023-04-27 19:40:09'),
(142, 'AEH-Kha-328', 'BENIGN HYPERPLASIA', '3', '2', 'no comments', '2023-04-27 19:40:09', '2023-04-27 19:40:09'),
(143, 'AEH-Kha-329', 'RETINAL DETACHMENT', '3', '2', 'no comments', '2023-04-27 19:42:14', '2023-04-27 19:42:14'),
(144, 'AEH-Kha-329', 'ANTIMICROBIAL', '2', '2', 'no comments', '2023-04-27 19:42:14', '2023-04-27 19:42:14'),
(145, 'AEH-Kha-329', 'LATEX', '2', '2', 'no comments', '2023-04-27 19:42:14', '2023-04-27 19:42:14'),
(146, 'AEH-Kha-329', 'SEAFOOD', '2', '2', 'no comments', '2023-04-27 19:42:14', '2023-04-27 19:42:14'),
(147, 'AEH-Kha-330', 'RETINAL DETACHMENT', '3', '3', 'no comments', '2023-04-27 19:45:24', '2023-04-27 19:45:24'),
(148, 'AEH-Kha-330', 'EYE DROP', '2', '3', 'no comments', '2023-04-27 19:45:24', '2023-04-27 19:45:24'),
(149, 'AEH-Kha-331', 'RETINAL DETACHMENT', '3', '3', 'no comments', '2023-04-27 19:45:24', '2023-04-27 19:45:24'),
(150, 'AEH-Kha-331', 'EYE DROP', '2', '3', 'no comments', '2023-04-27 19:45:24', '2023-04-27 19:45:24'),
(151, 'AEH-Kha-332', 'RETINAL DETACHMENT', '1', '3', 'no comments', '2023-04-27 19:48:24', '2023-04-27 19:48:24'),
(152, 'AEH-Kha-333', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-27 19:51:04', '2023-04-27 19:51:04'),
(153, 'AEH-Kha-333', 'ANTIMICROBIAL', '2', '2', 'no comments', '2023-04-27 19:51:04', '2023-04-27 19:51:04'),
(154, 'AEH-Kha-334', 'GLAUCOMA', '1', '3', 'no comments', '2023-04-27 19:59:24', '2023-04-27 19:59:24'),
(155, 'AEH-Kha-334', 'ANTIMICROBIAL', '4', '3', 'no comments', '2023-04-27 19:59:24', '2023-04-27 19:59:24'),
(156, 'AEH-Kha-335', 'RETINAL DETACHMENT', '2', '2', 'no comments', '2023-04-27 20:06:20', '2023-04-27 20:06:20'),
(157, 'AEH-Kha-335', 'ANTIMICROBIAL', '2', '3', 'no comments', '2023-04-27 20:06:20', '2023-04-27 20:06:20'),
(158, 'AEH-Kha-336', 'RETINAL DETACHMENT', '2', '3', 'no comments', '2023-04-27 20:13:48', '2023-04-27 20:13:48'),
(159, 'AEH-Kha-336', 'ANTIVIRAL AGENTS', '2', '1', 'no comments', '2023-04-27 20:13:48', '2023-04-27 20:13:48'),
(160, 'AEH-Kha-336', 'SEAFOOD', '3', '2', 'no comments', '2023-04-27 20:13:48', '2023-04-27 20:13:48'),
(161, 'AEH-Kha-337', 'GLAUCOMA', '1', '2', 'no comments', '2023-04-27 20:30:13', '2023-04-27 20:30:13'),
(162, 'AEH-Kha-337', 'ANTIMICROBIAL', '2', '2', 'no comments', '2023-04-27 20:30:13', '2023-04-27 20:30:13'),
(163, 'AEH-Was-338', 'GLAUCOMA', '1', '2', 'no comments', '2023-04-27 20:39:10', '2023-04-27 20:39:10'),
(164, 'AEH-Was-338', 'ANTIFUNGAL AGENTS', '2', '1', 'no comments', '2023-04-27 20:39:10', '2023-04-27 20:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `emr`
--

CREATE TABLE `emr` (
  `id` int(10) NOT NULL,
  `pat_id` varchar(30) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_event`, `end_event`) VALUES
(1, 'Meeting with Mike', '2019-11-08 00:00:00', '2019-11-08 00:00:00'),
(4, 'Meeting with Mike', '2019-11-11 00:00:00', '2019-11-11 00:00:00'),
(13, 'Youtube', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '2022-11-21', '2022-11-23 05:20:00', '2022-11-23 08:50:00'),
(23, 'Google', '2022-11-10 00:00:00', '2022-11-11 00:00:00'),
(24, 'Google', '2022-12-01 00:00:00', '2022-12-02 00:00:00'),
(25, '', '2022-12-08 02:00:00', '2022-12-09 00:00:00'),
(26, '', '2022-12-16 00:00:00', '2022-12-17 00:00:00'),
(27, '', '2022-12-10 00:00:00', '2022-12-10 00:00:00'),
(28, 'Google', '2022-12-07 01:30:00', '2022-12-07 03:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE `examination` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `general_examination` enum('Normal','Abnormal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `one_eyed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `squint_evaluation` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `examination`
--

INSERT INTO `examination` (`id`, `patient_id`, `appointment_id`, `comments`, `general_examination`, `one_eyed`, `squint_evaluation`, `created_at`, `updated_at`) VALUES
(1, 'ABC-XXX-1234', 'ABC-XXX-1234', 'ABC-XXX-1234', 'Abnormal', 'no', 'no', '2022-10-17 13:18:56', '2022-10-17 13:18:56');

-- --------------------------------------------------------

--
-- Table structure for table `examination_anteriorchamber`
--

CREATE TABLE `examination_anteriorchamber` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depth_r` enum('Normal','Shallow','Deep') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cells_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flare_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hyphema_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hypopyon_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `foreign_body_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `depth_l` enum('Normal','Shallow','Deep') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cells_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `flare_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hyphema_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hypopyon_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `foreign_body_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_appearance`
--

CREATE TABLE `examination_appearance` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pthisis_bulbi_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `anophthalmos_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `microphthalmos_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `artificial_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proptosis_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dystopia_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `injured_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `swollen_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pthisis_bulbi_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `anophthalmos_l` enum('Normal','Abnormal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `microphthalmos_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `artificial_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proptosis_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dystopia_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `injured_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `swollen_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_appendages`
--

CREATE TABLE `examination_appendages` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eyelids_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `eyelashes_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lacrimal_sac_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `syringing_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `diagram_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eyelids_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `eyelashes_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lacrimal_sac_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `syringing_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `daigram_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_conjunctiva`
--

CREATE TABLE `examination_conjunctiva` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `congestion_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tear_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conjunctival_bleb_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subconjunctival_heamorrhage_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `foreign_body_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `follicles_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `papillae_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pinguecula_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pterygium_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phlycten_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discharge_r` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `congestion_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tear_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conjunctival_bleb_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subconjunctival_heamorrhage_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `foreign_body_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `follicles_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `papillae_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pinguecula_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pterygium_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phlycten_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discharge_l` enum('yes','no','Normal') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_cornea`
--

CREATE TABLE `examination_cornea` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size_r` enum('Normal','Micro','Macro') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shape_r` enum('Normal','Irregural','Keratoconus','Keratoglobus') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `surface_r` enum('Normal','Epi defect','Thinning','Scarring','Vasularisation','Degeneration','Dystrophy','Foreign Body','Tear','KP','Opacity','Ulcer','Suture','Graft','Contact Len','Edema') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fluorescein_staining_r` enum('Normal','Positive','Negative') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `corneal_sensation_r` enum('Normal','Absent','Reduced') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schirmers_test_1_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schirmers_test_1_time_r` time NOT NULL,
  `schirmers_test_2_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schirmers_test_2_time_r` time NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cornea_diagram_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cornea_slit_diagram_r` int(110) NOT NULL,
  `size_l` enum('Normal','Micro','Macro') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `shape_l` enum('Normal','Irregural','Keratoconus','Keratoglobus') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `surface_l` enum('Normal','Epi defect','Thinning','Scarring','Vasularisation','Degeneration','Dystrophy','Foreign Body','Tear','KP','Opacity','Ulcer','Suture','Graft','Contact Len','Edema') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fluorescein_staining_l` enum('Normal','Positive','Negative') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `corneal_sensation_l` enum('Normal','Absent','Reduced') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schirmers_test_1_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schirmers_test_1_time_l` time NOT NULL,
  `schirmers_test_2_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schirmers_test_2_time_l` time NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cornea_diagram_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cornea_slit_diagram_l` int(110) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_extraocularmovements`
--

CREATE TABLE `examination_extraocularmovements` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Uniocularmovements_r` enum('Full','Restricted','Overaction') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Binocularmovements_r` enum('Full','Restricted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prism_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sqiunt_r` enum('Tropia','Pohria') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Uniocularmovements_l` enum('Full','Restricted','Overaction') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Binocularmovements_l` enum('Full','Restricted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prism_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sqiunt_l` enum('Tropia','Pohria') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_fundus`
--

CREATE TABLE `examination_fundus` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `media_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mediacomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PVD_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `opticdisksize_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `C/D_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `C/Dcomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Optic_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bloodvessels_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bloodvesselscomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Macula_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Maculacomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vitreous_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vitreouscomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `retinaldetachment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `retinaldetachmentcomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pheripherallesions_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pheripherallesionscomment_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fundus_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fundusdiagram_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `media_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mediacomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PVD_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `opticdisksize_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `C/D_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `C/Dcomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Optic_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bloodvessels_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bloodvesselscomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Macula_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Maculacomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vitreous_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vitreouscomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `retinaldetachment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `retinaldetachmentcomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pheripherallesions_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pheripherallesionscomment_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fundus_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fundusdiagram_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_gonioscopy`
--

CREATE TABLE `examination_gonioscopy` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior1_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior2_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior3_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascal1_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascal2_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascal3_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Temporal1_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Temporal2_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Temporal3_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inferior1_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inferior2_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inferior3_r` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior1_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior2_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `superior3_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascal1_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascal2_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nascal3_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Temporal1_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Temporal2_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Temporal3_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inferior1_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inferior2_l` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_intraocularmovements`
--

CREATE TABLE `examination_intraocularmovements` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value_time_r` time NOT NULL DEFAULT current_timestamp(),
  `method_r` enum('Full','Restricted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value_time_l` time NOT NULL DEFAULT current_timestamp(),
  `method_l` enum('Full','Restricted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_iris`
--

CREATE TABLE `examination_iris` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shape_r` enum('Normal','Defects') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NVI_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `synechiae_r` enum('No','Anterior','Posterior') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PI_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shape_l` enum('Normal','Defects') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NVI_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `synechiae_l` enum('No','Anterior','Posterior') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PI_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_lens`
--

CREATE TABLE `examination_lens` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nature_r` enum('Clear','Cataract','Psuedophakia','Aphakia') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_r` enum('Central','Decentral','Subluxated') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size_r` enum('Normal','Swollen','Absorbed','Micro') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lens_diagram_r` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nature_l` enum('Clear','Cataract','Psuedophakia','Aphakia') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_l` enum('Central','Decentral','Subluxated') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `size_l` enum('Normal','Swollen','Absorbed','Micro') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lens_diagram_l` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `examination_pupil`
--

CREATE TABLE `examination_pupil` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appointment_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shape_r` enum('Round','Eccentric','Irregular','oval','Polycoria') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pupil_size_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reflectiontolight_direct_r` enum('Normal','Sluggish','Absent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `reflectiontolight_consensual_r` enum('Normal','Sluggish','Absent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RAPD_r` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_r` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shape_l` enum('Round','Eccentric','Irregular','oval','Polycoria') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pupil_size_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reflectiontolight_direct_l` enum('Normal','Sluggish','Absent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `reflectiontolight_consensual_l` enum('Normal','Sluggish','Absent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RAPD_l` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comments_l` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_anthropometry`
--

CREATE TABLE `history_anthropometry` (
  `id` int(10) NOT NULL,
  `apt_id` varchar(10) NOT NULL,
  `pat_id` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `height` int(3) NOT NULL,
  `weight` int(3) NOT NULL,
  `bmi` int(3) NOT NULL,
  `comments` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_chief_complaints`
--

CREATE TABLE `history_chief_complaints` (
  `id` int(10) NOT NULL,
  `apt_id` varchar(10) NOT NULL,
  `pat_id` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `chief_complaint_type` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `side` varchar(30) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `duration_unit` varchar(30) NOT NULL,
  `comments1` varchar(100) NOT NULL,
  `options` varchar(30) NOT NULL,
  `comments2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_contact_allergies`
--

CREATE TABLE `history_contact_allergies` (
  `id` int(10) NOT NULL,
  `apt_id` int(10) NOT NULL,
  `pat_id` int(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `contact_allergies_type` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `duration_unit` varchar(30) NOT NULL,
  `comments1` varchar(100) NOT NULL,
  `comments2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_drug_allergies`
--

CREATE TABLE `history_drug_allergies` (
  `id` int(10) NOT NULL,
  `apt_id` int(10) NOT NULL,
  `pat_id` int(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `drug_allergies_type` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `duration_unit` varchar(30) NOT NULL,
  `comments1` varchar(100) NOT NULL,
  `comments2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_food_allergies`
--

CREATE TABLE `history_food_allergies` (
  `id` int(10) NOT NULL,
  `apt_id` int(10) NOT NULL,
  `pat_id` int(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `food_allergies_type` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `duration_unit` varchar(30) NOT NULL,
  `comments1` varchar(100) NOT NULL,
  `comments2` varchar(100) NOT NULL,
  `other` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_opthalmic_history`
--

CREATE TABLE `history_opthalmic_history` (
  `id` int(10) NOT NULL,
  `apt_id` varchar(10) NOT NULL,
  `pat_id` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `opthalmic_history_type` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `right_duration` varchar(30) NOT NULL,
  `right_duration_unit` varchar(30) NOT NULL,
  `left_duration` varchar(30) NOT NULL,
  `left_duration_unit` varchar(30) NOT NULL,
  `comments1` varchar(100) NOT NULL,
  `comments2` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_systemic_history`
--

CREATE TABLE `history_systemic_history` (
  `id` int(10) NOT NULL,
  `apt_id` int(10) NOT NULL,
  `pat_id` int(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `systemic_history_type` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `duration_unit` varchar(30) NOT NULL,
  `comments1` varchar(100) NOT NULL,
  `comments2` varchar(100) NOT NULL,
  `family_history` varchar(30) NOT NULL,
  `medical_history` varchar(30) NOT NULL,
  `special_status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_visit`
--

CREATE TABLE `history_visit` (
  `id` int(10) NOT NULL,
  `apt_id` varchar(10) NOT NULL,
  `pat_id` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `general_checkup` varchar(5) NOT NULL,
  `routine_checkup` varchar(5) NOT NULL,
  `postop_checkup` varchar(5) NOT NULL,
  `comments` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_vital_signs`
--

CREATE TABLE `history_vital_signs` (
  `id` int(10) NOT NULL,
  `apt_id` varchar(10) NOT NULL,
  `pat_id` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL,
  `temperature` varchar(5) NOT NULL,
  `pulse` varchar(5) NOT NULL,
  `blood_pressure` varchar(5) NOT NULL,
  `rr` varchar(5) NOT NULL,
  `spo2` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_branch`
--

CREATE TABLE `hospital_branch` (
  `id` int(11) NOT NULL,
  `hospital_id` varchar(56) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `speciality` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pincode` int(10) NOT NULL,
  `state` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_no` int(20) NOT NULL,
  `admin_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payeer_name` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_mode` enum('cash','card') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` int(20) NOT NULL,
  `comment` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `age` int(2) NOT NULL,
  `language` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `patient_type` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_proof` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IDproof_img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `guardian_name` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `marital_status` enum('married','unmarried') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `one_eyed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emergency_contact` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `patient_id`, `name`, `mobile_no`, `gender`, `DOB`, `age`, `language`, `patient_type`, `address`, `occupation`, `ID_proof`, `IDproof_img`, `status`, `guardian_name`, `img`, `blood_group`, `marital_status`, `one_eyed`, `emergency_contact`, `created_at`, `updated_at`) VALUES
(1, 'ABC-XXX-1234', 'Bilal Shaikh', '9870029314', 'male', '2001-03-27', 21, 'Hindi', 'VVIP', 'test', 'CEO', 'XXXX-XXXX-XXXX', 'XXXX-XXXX-XXXX', '1', 'TEST', 'TEST', 'O+', 'unmarried', 'no', '123456789', '2022-09-12 15:33:41', '2022-09-12 15:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(30) NOT NULL,
  `pat_id` varchar(55) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `mobilenumber` int(100) NOT NULL,
  `secondarynumber` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` text NOT NULL,
  `dob` int(100) NOT NULL,
  `year` int(100) NOT NULL,
  `months` int(100) NOT NULL,
  `language` varchar(100) NOT NULL,
  `patienttype` varchar(100) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(100) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `employeeid` varchar(100) NOT NULL,
  `medicalrecordno` varchar(100) NOT NULL,
  `governmentid` varchar(100) NOT NULL,
  `governmentidno` varchar(100) NOT NULL,
  `blood_grp` varchar(100) NOT NULL,
  `maritail_status` varchar(100) NOT NULL,
  `one_eyed` varchar(100) NOT NULL,
  `emg_relation` varchar(100) NOT NULL,
  `emg_name` varchar(200) NOT NULL,
  `emg_number` varchar(100) NOT NULL,
  `opthalmic_comment` varchar(255) NOT NULL,
  `systemic_comment` varchar(255) NOT NULL,
  `medical_history` varchar(255) NOT NULL,
  `family_history` varchar(255) NOT NULL,
  `paedairic_type` varchar(255) DEFAULT NULL,
  `paedairic_comment` varchar(255) NOT NULL,
  `immunization_type` varchar(100) DEFAULT NULL,
  `immunization_comment` varchar(255) NOT NULL,
  `drug_comment` varchar(255) NOT NULL,
  `contact_comment` varchar(255) NOT NULL,
  `food_comment` varchar(255) NOT NULL,
  `other_comment` varchar(255) NOT NULL,
  `other_id` int(30) NOT NULL,
  `history_id` int(30) NOT NULL,
  `allergies_id` int(30) NOT NULL,
  `app_id` int(30) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `emr_path` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `pat_id`, `firstname`, `middlename`, `lastname`, `mobilenumber`, `secondarynumber`, `email`, `gender`, `dob`, `year`, `months`, `language`, `patienttype`, `address1`, `address2`, `state`, `city`, `pincode`, `occupation`, `employeeid`, `medicalrecordno`, `governmentid`, `governmentidno`, `blood_grp`, `maritail_status`, `one_eyed`, `emg_relation`, `emg_name`, `emg_number`, `opthalmic_comment`, `systemic_comment`, `medical_history`, `family_history`, `paedairic_type`, `paedairic_comment`, `immunization_type`, `immunization_comment`, `drug_comment`, `contact_comment`, `food_comment`, `other_comment`, `other_id`, `history_id`, `allergies_id`, `app_id`, `img_path`, `emr_path`, `created_at`, `updated_at`) VALUES
(337, 'AEH-Kha-337', 'Khalid', 'mohd.', 'Merchant', 2147483647, 77777, '20co35@aiktc.ac.in', 'male', 2023, 21, 2, 'english', 'new', '282 90 Feet Road RP Nagar Dharavi', 'Near noor bekary', 'maharashtra', 'Mumbai', '400017', 'service', '2109140', '22222', 'aadharcard', '2222', 'O-', 'single', 'yes', 'sibling', 'Khalid merchant Merchant', 'MERCHANT', 'This is the patient\'s medical history.', 'This is the patient\'s medical history comment.', 'medical history of patient', 'medical history of family of patient', 'Malnourished', 'no other comments', 'Pending', 'no other comments', 'drug allergies comments', 'contact allergies commens', 'food allergies comments', 'no other comments', 0, 0, 0, 0, 'patients_image/1682607613_d716224a2e6e36e4265d.jpeg', 'EMR/Khalid_1682607613_lOXSuhxdHK.pdf', '2023-04-27 15:00:13.000000', '2023-04-27 15:00:13.000000'),
(338, 'AEH-Was-338', 'Wasif', 'Rahman', 'Siddique', 2147483647, 77777, 'admin@gmail.com', 'male', 2023, 21, 2, 'english', 'followup', '282 90 Feet Road RP Nagar Dharavi', 'Near noor bekary', 'maharashtra', 'Mumbai', '400017', 'service', '2109140', '22222', 'driverslicense', '2222', 'A-', 'single', 'yes', 'parent', 'Khalid merchant Merchant', 'MERCHANT', 'history of a patient with info.', 'history comment of patient', 'medical history of patient', 'family history of patient', 'Malnourished', 'no other comment', 'Pending', 'Nio other comment', 'drug allergies comment', 'contact alleries  comment', 'food allergies comment', 'no other comment', 0, 0, 0, 0, 'patients_image/1682608150_9b8f69ba62b6070cf787.jpg', 'EMR/Wasif_1682608150_ab1CBQkfGy.pdf', '2023-04-27 15:09:10.000000', '2023-04-27 15:09:10.000000');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `id` int(11) NOT NULL,
  `recp_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `age` int(2) NOT NULL,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobile_no` int(20) NOT NULL,
  `img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qualification` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_proof` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ID_img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `joined_at` date NOT NULL,
  `contract_img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_amsler`
--

CREATE TABLE `refraction_amsler` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `category_l` varchar(30) NOT NULL,
  `category_r` varchar(30) NOT NULL,
  `comment_l` varchar(30) NOT NULL,
  `comment_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_auto_refraction`
--

CREATE TABLE `refraction_auto_refraction` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `dry_sph_l` varchar(30) NOT NULL,
  `dry_sph_r` varchar(30) NOT NULL,
  `dry_cyl_l` varchar(30) NOT NULL,
  `dry_cyl_r` varchar(30) NOT NULL,
  `dry_axis_l` varchar(30) NOT NULL,
  `dry_axis_r` varchar(30) NOT NULL,
  `dilated_sph_l` varchar(30) NOT NULL,
  `dilated_sph_r` varchar(30) NOT NULL,
  `dialted_cyl_l` varchar(30) NOT NULL,
  `dialted_cyl_r` varchar(30) NOT NULL,
  `dialted_axis_l` varchar(30) NOT NULL,
  `dialted_axis_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_color_vision`
--

CREATE TABLE `refraction_color_vision` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `description_l` varchar(200) NOT NULL,
  `description_r` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_contactlens_prescription`
--

CREATE TABLE `refraction_contactlens_prescription` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `bc_l` varchar(30) NOT NULL,
  `bc_r` varchar(30) NOT NULL,
  `dia_l` varchar(30) NOT NULL,
  `dia_r` varchar(30) NOT NULL,
  `sph_l` varchar(30) NOT NULL,
  `sph_r` varchar(30) NOT NULL,
  `cyl_l` varchar(30) NOT NULL,
  `cyl_r` varchar(30) NOT NULL,
  `axis_l` varchar(30) NOT NULL,
  `axis_r` varchar(30) NOT NULL,
  `add_l` varchar(30) NOT NULL,
  `add_r` varchar(30) NOT NULL,
  `revisit_date_l` varchar(30) NOT NULL,
  `revisit_date_r` varchar(30) NOT NULL,
  `color_l` varchar(30) NOT NULL,
  `color_r` varchar(30) NOT NULL,
  `type_l` varchar(30) NOT NULL,
  `type_r` varchar(30) NOT NULL,
  `advice_l` varchar(30) NOT NULL,
  `advice_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_contrast_sensitivity`
--

CREATE TABLE `refraction_contrast_sensitivity` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `sens_l` varchar(30) NOT NULL,
  `sens_r` varchar(30) NOT NULL,
  `comment_l` varchar(200) NOT NULL,
  `comment_r` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_dilated_refraction`
--

CREATE TABLE `refraction_dilated_refraction` (
  `id` int(30) NOT NULL,
  `pateint_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `distant_sph_l` varchar(30) NOT NULL,
  `distant_sph_r` varchar(30) NOT NULL,
  `distant_cyl_l` varchar(30) NOT NULL,
  `distant_cyl_r` varchar(30) NOT NULL,
  `distant_axis_l` varchar(30) NOT NULL,
  `distant_axis_r` varchar(30) NOT NULL,
  `distant_vision_l` varchar(30) NOT NULL,
  `distant_vision_r` varchar(30) NOT NULL,
  `add_sph_l` varchar(30) NOT NULL,
  `add_sph_r` varchar(30) NOT NULL,
  `add_cyl_l` varchar(30) NOT NULL,
  `add_cyl_r` varchar(30) NOT NULL,
  `add_axis_l` varchar(30) NOT NULL,
  `add_axis_r` varchar(30) NOT NULL,
  `add_vision_l` varchar(30) NOT NULL,
  `add_vision_r` varchar(30) NOT NULL,
  `near_sph_l` varchar(30) NOT NULL,
  `near_sph_r` varchar(30) NOT NULL,
  `near_cyl_l` varchar(30) NOT NULL,
  `near_cyl_r` varchar(30) NOT NULL,
  `near_axis_l` varchar(30) NOT NULL,
  `near_axis_r` varchar(30) NOT NULL,
  `near_vision_l` varchar(30) NOT NULL,
  `near_vision_r` varchar(30) NOT NULL,
  `drug_used_l` varchar(30) NOT NULL,
  `drug_used_r` varchar(30) NOT NULL,
  `comment_l` varchar(30) NOT NULL,
  `comment_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_dry_refraction`
--

CREATE TABLE `refraction_dry_refraction` (
  `id` int(30) NOT NULL,
  `pateint_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `distant_sph_l` varchar(30) NOT NULL,
  `distant_sph_r` varchar(30) NOT NULL,
  `distant_cyl_l` varchar(30) NOT NULL,
  `distant_cyl_r` varchar(30) NOT NULL,
  `distant_axis_l` varchar(30) NOT NULL,
  `distant_axis_r` varchar(30) NOT NULL,
  `distant_vision_l` varchar(30) NOT NULL,
  `distant_vision_r` varchar(30) NOT NULL,
  `add_sph_l` varchar(30) NOT NULL,
  `add_sph_r` varchar(30) NOT NULL,
  `add_cyl_l` varchar(30) NOT NULL,
  `add_cyl_r` varchar(30) NOT NULL,
  `add_axis_l` varchar(30) NOT NULL,
  `add_axis_r` varchar(30) NOT NULL,
  `add_vision_l` varchar(30) NOT NULL,
  `add_vision_r` varchar(30) NOT NULL,
  `near_sph_l` varchar(30) NOT NULL,
  `near_sph_r` varchar(30) NOT NULL,
  `near_cyl_l` varchar(30) NOT NULL,
  `near_cyl_r` varchar(30) NOT NULL,
  `near_axis_l` varchar(30) NOT NULL,
  `near_axis_r` varchar(30) NOT NULL,
  `near_vision_l` varchar(30) NOT NULL,
  `near_vision_r` varchar(30) NOT NULL,
  `comment_l` varchar(30) NOT NULL,
  `comment_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_glasses_prescription`
--

CREATE TABLE `refraction_glasses_prescription` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `distant_sph_l` varchar(30) NOT NULL,
  `distant_sph_r` varchar(30) NOT NULL,
  `distant_cyl_l` varchar(30) NOT NULL,
  `distant_cyl_r` varchar(30) NOT NULL,
  `distant_axis_l` varchar(30) NOT NULL,
  `distant_axis_r` varchar(30) NOT NULL,
  `distant_vision_l` varchar(30) NOT NULL,
  `distant_vision_r` varchar(30) NOT NULL,
  `add_sph_l` varchar(30) NOT NULL,
  `add_sph_r` varchar(30) NOT NULL,
  `add_cyl_l` varchar(30) NOT NULL,
  `add_cyl_r` varchar(30) NOT NULL,
  `add_axis_l` varchar(30) NOT NULL,
  `add_axis_r` varchar(30) NOT NULL,
  `add_vision_l` varchar(30) NOT NULL,
  `add_vision_r` varchar(30) NOT NULL,
  `near_sph_l` varchar(30) NOT NULL,
  `near_sph_r` varchar(30) NOT NULL,
  `near_cyl_l` varchar(30) NOT NULL,
  `near_cyl_r` varchar(30) NOT NULL,
  `near_axis_l` varchar(30) NOT NULL,
  `near_axis_r` varchar(30) NOT NULL,
  `near_vision_l` varchar(30) NOT NULL,
  `near_vision_r` varchar(30) NOT NULL,
  `lens_type_l` varchar(30) NOT NULL,
  `lens_type_r` varchar(30) NOT NULL,
  `ipd_l` varchar(30) NOT NULL,
  `ipd_r` varchar(30) NOT NULL,
  `lens_material_l` varchar(30) NOT NULL,
  `lens_material_r` varchar(30) NOT NULL,
  `lens_tint_l` varchar(30) NOT NULL,
  `lens_tint_r` varchar(30) NOT NULL,
  `frame_material_l` varchar(30) NOT NULL,
  `frame_material_r` varchar(30) NOT NULL,
  `advice_l` varchar(200) NOT NULL,
  `advice_r` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_intermediated_glas_prescription`
--

CREATE TABLE `refraction_intermediated_glas_prescription` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `distant_sph_l` varchar(30) NOT NULL,
  `distant_sph_r` varchar(30) NOT NULL,
  `distant_cyl_l` varchar(30) NOT NULL,
  `distant_cyl_r` varchar(30) NOT NULL,
  `distant_axis_l` varchar(30) NOT NULL,
  `distant_axis_r` varchar(30) NOT NULL,
  `distant_vision_l` varchar(30) NOT NULL,
  `distant_vision_r` varchar(30) NOT NULL,
  `add_sph_l` varchar(30) NOT NULL,
  `add_sph_r` varchar(30) NOT NULL,
  `add_cyl_l` varchar(30) NOT NULL,
  `add_cyl_r` varchar(30) NOT NULL,
  `add_axis_l` varchar(30) NOT NULL,
  `add_axis_r` varchar(30) NOT NULL,
  `add_vision_l` varchar(30) NOT NULL,
  `add_vision_r` varchar(30) NOT NULL,
  `near_sph_l` varchar(30) NOT NULL,
  `near_sph_r` varchar(30) NOT NULL,
  `near_cyl_l` varchar(30) NOT NULL,
  `near_cyl_r` varchar(30) NOT NULL,
  `near_axis_l` varchar(30) NOT NULL,
  `near_axis_r` varchar(30) NOT NULL,
  `near_vision_l` varchar(30) NOT NULL,
  `near_vision_r` varchar(30) NOT NULL,
  `lens_type_l` varchar(30) NOT NULL,
  `lens_type_r` varchar(30) NOT NULL,
  `ipd_l` varchar(30) NOT NULL,
  `ipd_r` varchar(30) NOT NULL,
  `lens_material_l` varchar(30) NOT NULL,
  `lens_material_r` varchar(30) NOT NULL,
  `lens_tint_l` varchar(30) NOT NULL,
  `lens_tint_r` varchar(30) NOT NULL,
  `frame_material_l` varchar(30) NOT NULL,
  `frame_material_r` varchar(30) NOT NULL,
  `advice_l` varchar(30) NOT NULL,
  `advice_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_intraocular_pressure`
--

CREATE TABLE `refraction_intraocular_pressure` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `mmhg_l` varchar(30) NOT NULL,
  `mmhg_r` varchar(30) NOT NULL,
  `time_l` varchar(30) NOT NULL,
  `time_r` varchar(30) NOT NULL,
  `comment_l` varchar(200) NOT NULL,
  `comments_r` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_keratometry`
--

CREATE TABLE `refraction_keratometry` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `kh_l` varchar(30) NOT NULL,
  `kh_r` varchar(30) NOT NULL,
  `kh_axis_l` varchar(30) NOT NULL,
  `kh_axis_r` varchar(30) NOT NULL,
  `kv_l` varchar(30) NOT NULL,
  `kv_r` varchar(30) NOT NULL,
  `kv_axis_l` varchar(30) NOT NULL,
  `kv_axis_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_orthoptics`
--

CREATE TABLE `refraction_orthoptics` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `description_l` varchar(30) NOT NULL,
  `description_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_pgp1`
--

CREATE TABLE `refraction_pgp1` (
  `id` int(30) NOT NULL,
  `pateint_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `distant_sph_l` varchar(30) NOT NULL,
  `distant_sph_r` varchar(30) NOT NULL,
  `distant_cyl_l` varchar(30) NOT NULL,
  `distant_cyl_r` varchar(30) NOT NULL,
  `distant_axis_l` varchar(30) NOT NULL,
  `distant_axis_r` varchar(30) NOT NULL,
  `distant_vision_l` varchar(30) NOT NULL,
  `distant_vision_r` varchar(30) NOT NULL,
  `add_sph_l` varchar(30) NOT NULL,
  `add_sph_r` varchar(30) NOT NULL,
  `add_cyl_l` varchar(30) NOT NULL,
  `add_cyl_r` varchar(30) NOT NULL,
  `add_axis_l` varchar(30) NOT NULL,
  `add_axis_r` varchar(30) NOT NULL,
  `add_vision_l` varchar(30) NOT NULL,
  `add_vision_r` varchar(30) NOT NULL,
  `near_sph_l` varchar(30) NOT NULL,
  `near_sph_r` varchar(30) NOT NULL,
  `near_cyl_l` varchar(30) NOT NULL,
  `near_cyl_r` varchar(30) NOT NULL,
  `near_axis_l` varchar(30) NOT NULL,
  `near_axis_r` varchar(30) NOT NULL,
  `near_vision_l` varchar(30) NOT NULL,
  `near_vision_r` varchar(30) NOT NULL,
  `lens_type_l` varchar(30) NOT NULL,
  `lens_type_r` varchar(30) NOT NULL,
  `comment_l` varchar(200) NOT NULL,
  `comment_r` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_pmt`
--

CREATE TABLE `refraction_pmt` (
  `id` int(30) NOT NULL,
  `patient_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `distant_sph_l` varchar(30) NOT NULL,
  `distant_sph_r` varchar(30) NOT NULL,
  `distant_cyl_l` varchar(30) NOT NULL,
  `distant_cyl_r` varchar(30) NOT NULL,
  `distant_axis_l` varchar(30) NOT NULL,
  `distant_axis_r` varchar(30) NOT NULL,
  `distant_vision_l` varchar(30) NOT NULL,
  `distant_vision_r` varchar(30) NOT NULL,
  `add_sph_l` varchar(30) NOT NULL,
  `add_sph_r` varchar(30) NOT NULL,
  `add_cyl_l` varchar(30) NOT NULL,
  `add_cyl_r` varchar(30) NOT NULL,
  `add_axis_l` varchar(30) NOT NULL,
  `add_axis_r` varchar(30) NOT NULL,
  `add_vision_l` varchar(30) NOT NULL,
  `add_vision_r` varchar(30) NOT NULL,
  `near_sph_l` varchar(30) NOT NULL,
  `near_sph_r` varchar(30) NOT NULL,
  `near_cyl_l` varchar(30) NOT NULL,
  `near_cyl_r` varchar(30) NOT NULL,
  `near_axis_l` varchar(30) NOT NULL,
  `near_axis_r` varchar(30) NOT NULL,
  `near_vision_l` varchar(30) NOT NULL,
  `near_vision_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_retinoscopy`
--

CREATE TABLE `refraction_retinoscopy` (
  `id` int(30) NOT NULL,
  `pateint_id` varchar(30) NOT NULL,
  `appointment_id` varchar(30) NOT NULL,
  `r1_l` varchar(30) NOT NULL,
  `r1_r` varchar(30) NOT NULL,
  `r2_l` varchar(30) NOT NULL,
  `r2_r` varchar(30) NOT NULL,
  `r3_l` varchar(30) NOT NULL,
  `r3_r` varchar(30) NOT NULL,
  `r4_l` varchar(30) NOT NULL,
  `r4_r` varchar(30) NOT NULL,
  `distance_l` varchar(30) NOT NULL,
  `distance_r` varchar(30) NOT NULL,
  `drug_used_l` varchar(30) NOT NULL,
  `drug_used_r` varchar(30) NOT NULL,
  `comment_l` varchar(30) NOT NULL,
  `comment_r` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refraction_visual_acuity`
--

CREATE TABLE `refraction_visual_acuity` (
  `id` int(10) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `appointment_id` varchar(30) DEFAULT NULL,
  `ucva_l` varchar(30) NOT NULL,
  `ucva_r` varchar(30) NOT NULL,
  `pinhole_l` varchar(30) NOT NULL,
  `pinhole_r` varchar(30) NOT NULL,
  `glasses_l` varchar(30) NOT NULL,
  `glasses_r` varchar(30) NOT NULL,
  `contact_lens_l` varchar(30) NOT NULL,
  `contact_lens_r` varchar(30) NOT NULL,
  `comments_l` varchar(200) NOT NULL,
  `comments_r` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `reg_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(22) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  `designation` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `no_of_users` int(10) NOT NULL,
  `organization_name` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tagline` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `speciality` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo_img` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pincode` int(56) NOT NULL,
  `state` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobile_no` int(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `hospital_id` varchar(56) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(56) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `hospital_id`, `role`) VALUES
(1, '1', 'Admin'),
(2, '1', 'CenterHead'),
(3, '1', 'Counseller'),
(4, '1', 'Doctor'),
(5, '1', 'Receptionist'),
(6, '1', 'FloorManager'),
(7, '1', 'Optometrist'),
(8, '1', 'Owner'),
(9, '1', 'Nurse'),
(10, '1', 'Resident'),
(11, '1', 'Pharmacist'),
(12, '1', 'Optician'),
(13, '1', 'TPA'),
(14, '1', 'Radiologist'),
(15, '1', 'LaboratoryTechnician'),
(16, '1', 'OpthalmologyTecnician'),
(17, '1', 'ARNCT'),
(18, '1', 'Cashier'),
(19, '1', 'DoctorOwner'),
(20, '1', 'DoctorClinicalAuditor');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `DOB` date NOT NULL,
  `age` int(22) NOT NULL,
  `address` text NOT NULL,
  `mobile_no` int(22) NOT NULL,
  `img` text NOT NULL,
  `qualification` text NOT NULL,
  `speciality` text NOT NULL,
  `ID_proof` text NOT NULL,
  `ID_img` text NOT NULL,
  `joined_at` datetime NOT NULL,
  `role_id` int(22) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `password`, `gender`, `DOB`, `age`, `address`, `mobile_no`, `img`, `qualification`, `speciality`, `ID_proof`, `ID_img`, `joined_at`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bilal', 'bilal.softdigit@gmail.com', '132465', 'male', '2022-11-22', 21, 'mumbai', 2147483647, 'Capture.PNG', 'MBBS', 'test', 'aadharcard', 'Capture.PNG', '2022-11-22 00:00:00', 1, 1, '2022-11-22 05:00:19', '2022-11-22 09:30:19'),
(2, 'TEst', 'test@gmail.com', '123456', 'male', '2022-11-22', 21, 'mumbai', 132456789, 'Capture.PNG', 'MBBS', 'test', 'aadharcard', 'Capture.PNG', '2022-11-22 00:00:00', 2, 1, '2022-11-22 05:01:22', '2022-11-22 09:31:22'),
(3, 'Noor', 'test@gmail.com', '123456', 'male', '2022-11-22', 21, 'mumbai', 79845631, 'Capture.PNG', 'MBBS', 'test', 'voterid', 'Capture.PNG', '2022-11-22 00:00:00', 1, 1, '2022-11-22 05:03:21', '2022-11-22 09:33:21'),
(4, 'bilal', 'bilal.softdigit@gmail.com', '132465', 'male', '2022-11-22', 21, 'mumbai', 2147483647, 'Capture.PNG', 'MBBS', 'test', 'aadharcard', 'Capture.PNG', '2022-11-22 00:00:00', 1, 1, '2022-11-22 05:11:21', '2022-11-22 09:41:21'),
(5, 'BILAL SHAIKH', 'admin@gmail.com', '132465', 'male', '2001-03-27', 21, 'mumbai', 2147483647, '', 'MBBS', 'test', 'aadharcard', '', '2022-11-23 00:00:00', 1, 1, '2022-11-23 01:45:46', '2022-11-23 06:15:46'),
(6, 'NOOR ALAM KHAN', 'noor@gmail.com', '123456', 'transgender', '2022-11-23', 0, 'Govandi', 1234657891, '', 'MBBS', 'nothing', 'aadharcard', '', '2022-11-23 00:00:00', 4, 1, '2022-11-23 01:53:09', '2022-11-23 06:24:00'),
(7, 'BILAL SHAIKH', 'bilal.softdigit@gmail.com', '132465', 'male', '2022-11-23', 21, 'mumbai', 2147483647, '', 'MBBS', 'test', 'aadharcard', '', '2022-11-23 00:00:00', 6, 1, '2022-11-23 07:53:47', '2022-11-23 12:23:47'),
(8, 'Manchester', 'bilal.softdigit@gmail.com', '132465', 'male', '2022-11-23', 21, 'mumbai', 2147483647, '', 'MBBS', 'test', 'aadharcard', '', '0000-00-00 00:00:00', 4, 1, '2022-11-23 07:54:28', '2022-11-23 12:24:28'),
(9, 'BILAL SHAIKH', 'bilal.softdigit@gmail.com', '132465', 'male', '2022-11-30', 21, 'mumbai', 2147483647, 'Capture.PNG', 'MBBS', 'test', 'aadharcard', '', '2022-11-30 00:00:00', 1, 1, '2022-11-30 02:52:16', '2022-11-30 07:22:16'),
(10, 'BILAL SHAIKH', 'bilal.softdigit@gmail.com', '132465', 'male', '2022-11-30', 21, 'mumbai', 2147483647, '', 'MBBS', '', 'aadharcard', '', '2022-11-30 00:00:00', 4, 1, '2022-11-30 02:52:58', '2022-11-30 07:22:58'),
(11, 'Active', '123@gmail.com', '132465', 'male', '2022-11-30', 21, 'mumbai', 2147483647, '', 'MBBS', 'test', 'aadharcard', '', '2022-11-30 00:00:00', 4, 1, '2022-11-30 03:01:03', '2022-11-30 07:31:03'),
(12, 'bilal', 'admin@gmail.com', '132465', 'male', '2023-01-10', 21, 'mumbai', 2147483647, '', 'test', 'test', 'aadharcard', '', '0000-00-00 00:00:00', 4, 1, '2023-01-10 04:37:50', '2023-01-10 09:07:50'),
(13, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-15', 45, 'test', 78778978, '', 'MBBS', 'no', 'voterid', '', '2023-02-02 00:00:00', 4, 1, '2023-02-07 10:39:28', '2023-02-07 16:09:28'),
(14, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-15', 45, 'test', 78778978, '', 'MBBS', 'no', 'voterid', '', '2023-02-02 00:00:00', 4, 1, '2023-02-07 10:41:07', '2023-02-07 16:11:07'),
(15, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-15', 45, 'test', 78778978, '', 'MBBS', 'no', 'voterid', '', '2023-02-02 00:00:00', 4, 1, '2023-02-07 10:41:43', '2023-02-07 16:11:43'),
(16, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-15', 45, 'test', 78778978, '', 'MBBS', 'no', 'voterid', '', '2023-02-02 00:00:00', 4, 1, '2023-02-07 10:42:06', '2023-02-07 16:12:06'),
(17, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-24', 45, 'test', 8465564, '', 'MBBS', 'no', 'voterid', '', '2023-02-15 00:00:00', 4, 1, '2023-02-07 10:43:31', '2023-02-07 16:13:31'),
(18, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-24', 45, 'test', 8465564, '', 'MBBS', 'no', 'voterid', '', '2023-02-15 00:00:00', 4, 1, '2023-02-07 10:43:31', '2023-02-07 16:13:31'),
(19, 'test', 'admin@gmail.com', 'test', 'male', '2023-02-24', 45, 'test', 8465564, '', 'MBBS', 'no', 'voterid', '', '2023-02-15 00:00:00', 4, 1, '2023-02-07 10:44:46', '2023-02-07 16:14:46'),
(20, 'Khalid merchant Merchant', 'john@gamil.com', 'password', 'male', '2023-04-28', 45, '282 90 Feet Road RP Nagar Dharavi', 2147483647, '', 'MBBS', '', 'aadharcard', '', '0000-00-00 00:00:00', 1, 1, '2023-04-10 04:43:43', '2023-04-10 10:13:43');

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(11) NOT NULL,
  `side` varchar(40) NOT NULL,
  `duration` varchar(40) NOT NULL,
  `durationu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `fname` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `side`, `duration`, `durationu`, `comment`, `fname`, `created_at`, `updated_at`) VALUES
(10, '1', '1', '1', '1', '1', '2022-11-03 11:58:15', '2022-11-03 11:58:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `appoit`
--
ALTER TABLE `appoit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `app_id` (`app_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `dynamic_data`
--
ALTER TABLE `dynamic_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `emr`
--
ALTER TABLE `emr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_anteriorchamber`
--
ALTER TABLE `examination_anteriorchamber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_appearance`
--
ALTER TABLE `examination_appearance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_appendages`
--
ALTER TABLE `examination_appendages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_conjunctiva`
--
ALTER TABLE `examination_conjunctiva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_cornea`
--
ALTER TABLE `examination_cornea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_extraocularmovements`
--
ALTER TABLE `examination_extraocularmovements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_fundus`
--
ALTER TABLE `examination_fundus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_gonioscopy`
--
ALTER TABLE `examination_gonioscopy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_intraocularmovements`
--
ALTER TABLE `examination_intraocularmovements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `examination_iris`
--
ALTER TABLE `examination_iris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `history_anthropometry`
--
ALTER TABLE `history_anthropometry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_chief_complaints`
--
ALTER TABLE `history_chief_complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_contact_allergies`
--
ALTER TABLE `history_contact_allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_drug_allergies`
--
ALTER TABLE `history_drug_allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_food_allergies`
--
ALTER TABLE `history_food_allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_opthalmic_history`
--
ALTER TABLE `history_opthalmic_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_systemic_history`
--
ALTER TABLE `history_systemic_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `allergies_id` (`allergies_id`),
  ADD KEY `history_id` (`history_id`),
  ADD KEY `other_id` (`other_id`);

--
-- Indexes for table `refraction_amsler`
--
ALTER TABLE `refraction_amsler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_auto_refraction`
--
ALTER TABLE `refraction_auto_refraction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_color_vision`
--
ALTER TABLE `refraction_color_vision`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_contactlens_prescription`
--
ALTER TABLE `refraction_contactlens_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_contrast_sensitivity`
--
ALTER TABLE `refraction_contrast_sensitivity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_dilated_refraction`
--
ALTER TABLE `refraction_dilated_refraction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_dry_refraction`
--
ALTER TABLE `refraction_dry_refraction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_glasses_prescription`
--
ALTER TABLE `refraction_glasses_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_intermediated_glas_prescription`
--
ALTER TABLE `refraction_intermediated_glas_prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_intraocular_pressure`
--
ALTER TABLE `refraction_intraocular_pressure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_keratometry`
--
ALTER TABLE `refraction_keratometry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_orthoptics`
--
ALTER TABLE `refraction_orthoptics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_pgp1`
--
ALTER TABLE `refraction_pgp1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_pmt`
--
ALTER TABLE `refraction_pmt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_retinoscopy`
--
ALTER TABLE `refraction_retinoscopy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refraction_visual_acuity`
--
ALTER TABLE `refraction_visual_acuity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `allergies`
--
ALTER TABLE `allergies`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appoit`
--
ALTER TABLE `appoit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `dynamic_data`
--
ALTER TABLE `dynamic_data`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `emr`
--
ALTER TABLE `emr`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `examination`
--
ALTER TABLE `examination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `history_systemic_history`
--
ALTER TABLE `history_systemic_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT for table `refraction_amsler`
--
ALTER TABLE `refraction_amsler`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_auto_refraction`
--
ALTER TABLE `refraction_auto_refraction`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_color_vision`
--
ALTER TABLE `refraction_color_vision`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_contactlens_prescription`
--
ALTER TABLE `refraction_contactlens_prescription`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_contrast_sensitivity`
--
ALTER TABLE `refraction_contrast_sensitivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_dilated_refraction`
--
ALTER TABLE `refraction_dilated_refraction`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_dry_refraction`
--
ALTER TABLE `refraction_dry_refraction`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_glasses_prescription`
--
ALTER TABLE `refraction_glasses_prescription`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_intermediated_glas_prescription`
--
ALTER TABLE `refraction_intermediated_glas_prescription`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_intraocular_pressure`
--
ALTER TABLE `refraction_intraocular_pressure`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_keratometry`
--
ALTER TABLE `refraction_keratometry`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_orthoptics`
--
ALTER TABLE `refraction_orthoptics`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_pgp1`
--
ALTER TABLE `refraction_pgp1`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_pmt`
--
ALTER TABLE `refraction_pmt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_retinoscopy`
--
ALTER TABLE `refraction_retinoscopy`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refraction_visual_acuity`
--
ALTER TABLE `refraction_visual_acuity`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
