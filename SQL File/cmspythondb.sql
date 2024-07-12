-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 06:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmspythondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add subcategory', 8, 'add_subcategory'),
(30, 'Can change subcategory', 8, 'change_subcategory'),
(31, 'Can delete subcategory', 8, 'delete_subcategory'),
(32, 'Can view subcategory', 8, 'view_subcategory'),
(33, 'Can add state', 9, 'add_state'),
(34, 'Can change state', 9, 'change_state'),
(35, 'Can delete state', 9, 'delete_state'),
(36, 'Can view state', 9, 'view_state'),
(37, 'Can add user reg', 10, 'add_userreg'),
(38, 'Can change user reg', 10, 'change_userreg'),
(39, 'Can delete user reg', 10, 'delete_userreg'),
(40, 'Can view user reg', 10, 'view_userreg'),
(41, 'Can add complaints', 11, 'add_complaints'),
(42, 'Can change complaints', 11, 'change_complaints'),
(43, 'Can delete complaints', 11, 'delete_complaints'),
(44, 'Can view complaints', 11, 'view_complaints'),
(45, 'Can add complaint remark', 12, 'add_complaintremark'),
(46, 'Can change complaint remark', 12, 'change_complaintremark'),
(47, 'Can delete complaint remark', 12, 'delete_complaintremark'),
(48, 'Can view complaint remark', 12, 'view_complaintremark');

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_category`
--

CREATE TABLE `cmsapp_category` (
  `id` bigint(20) NOT NULL,
  `catname` varchar(200) NOT NULL,
  `catdes` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_category`
--

INSERT INTO `cmsapp_category` (`id`, `catname`, `catdes`, `created_at`, `updated_at`) VALUES
(1, 'E-commerce', 'E-commerce', '2024-04-25 14:20:42.949871', '2024-04-25 14:20:42.949871'),
(2, 'Consumer', 'nkjhdkhfklshikrt', '2024-04-25 14:20:50.488595', '2024-04-25 14:20:50.488595'),
(3, 'Bank', 'ytryrtyhjuyji', '2024-04-25 14:20:55.603422', '2024-04-25 14:20:55.603422'),
(4, 'Labour', '7yi7urki,;op.', '2024-04-25 14:21:00.585792', '2024-04-25 14:21:00.585792'),
(5, 'General', 'jgjuy', '2024-04-25 14:21:10.935597', '2024-04-25 14:21:10.936593');

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_complaintremark`
--

CREATE TABLE `cmsapp_complaintremark` (
  `id` bigint(20) NOT NULL,
  `remark` longtext NOT NULL,
  `status` varchar(250) NOT NULL,
  `remarkdate` datetime(6) NOT NULL,
  `comp_id_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_complaintremark`
--

INSERT INTO `cmsapp_complaintremark` (`id`, `remark`, `status`, `remarkdate`, `comp_id_id_id`) VALUES
(1, 'dgfdgfd', 'Closed', '2024-04-29 06:33:43.776083', 2),
(2, 'In-process', 'Inprocess', '2024-04-29 06:34:24.586800', 4),
(3, 'Closed', 'Closed', '2024-04-29 06:34:56.881404', 4),
(4, 'In-Process', 'Inprocess', '2024-04-29 07:01:49.293423', 5),
(5, 'In-process', 'Inprocess', '2024-05-09 05:01:49.382669', 7),
(6, 'Closed', 'Closed', '2024-05-09 05:02:03.056343', 7),
(7, 'Order will devliver shortly', 'Closed', '2024-05-09 14:35:27.601176', 9);

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_complaints`
--

CREATE TABLE `cmsapp_complaints` (
  `id` bigint(20) NOT NULL,
  `complaint_number` int(11) NOT NULL,
  `complainttype` varchar(250) NOT NULL,
  `noc` varchar(250) NOT NULL,
  `complaindetails` longtext NOT NULL,
  `compfile` varchar(100) NOT NULL,
  `complaintdate_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cat_id_id` bigint(20) NOT NULL,
  `stateid_id` bigint(20) NOT NULL,
  `subcategory_id_id` bigint(20) NOT NULL,
  `remark` longtext NOT NULL,
  `status` varchar(250) NOT NULL,
  `userregid_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_complaints`
--

INSERT INTO `cmsapp_complaints` (`id`, `complaint_number`, `complainttype`, `noc`, `complaindetails`, `compfile`, `complaintdate_at`, `updated_at`, `cat_id_id`, `stateid_id`, `subcategory_id_id`, `remark`, `status`, `userregid_id`) VALUES
(1, 378525503, '', 'Complain against Shopping website', 'Complain against Shopping website', 'media/doc_file/face13.jpg', '2024-04-25 14:25:59.092931', '2024-04-29 06:25:52.090354', 1, 1, 3, 'Closed', 'Closed', 1),
(2, 467755510, '', 'Complain against Shopping website', 'ggresygy', '', '2024-04-25 14:33:00.058020', '2024-04-29 06:33:43.772092', 1, 1, 2, 'dgfdgfd', 'Closed', 1),
(4, 658743585, '', 'Complain against Shopping website', 'gjytogioi9o9', 'media/doc_file/face25_Pb3J8Bv.jpg', '2024-04-26 14:27:50.971589', '2024-04-29 06:34:56.872030', 2, 1, 5, 'Closed', 'Closed', 2),
(5, 306727951, '', 'Complain against Shopping website', 'tjryj', '', '2024-04-26 14:30:29.128914', '2024-04-29 07:01:49.283396', 2, 3, 5, 'In-Process', 'Inprocess', 2),
(6, 713735629, 'Complaint', 'Complain against Shopping website', 'trtgr5g', '', '2024-04-26 14:32:31.655668', '2024-04-27 14:29:47.456843', 1, 2, 2, 'Closed', 'Closed', 3),
(7, 862277869, 'Complaint', 'Complain against Shopping website', 'giyiuyiuydiuweyafiwret', 'media/doc_file/bg.jpg', '2024-04-30 12:23:02.050461', '2024-05-09 05:02:03.011845', 1, 1, 3, 'Closed', 'Closed', 3),
(8, 655581112, 'General Query', 'Asking Loan', 'yuiryiauwefyhiuytiuwyhsrui', '', '2024-04-30 12:24:38.928384', '2024-04-30 12:24:38.928384', 3, 5, 6, '', '0', 2),
(9, 731672483, 'Complaint', 'Product not delivery ', 'Product not deliver yet Orde no is 3423423', '', '2024-05-09 14:34:13.514394', '2024-05-09 14:35:27.596624', 1, 2, 3, 'Order will devliver shortly', 'Closed', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_customuser`
--

CREATE TABLE `cmsapp_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `profile_pic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_customuser`
--

INSERT INTO `cmsapp_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `user_type`, `profile_pic`) VALUES
(1, 'pbkdf2_sha256$390000$ZaQno2WfKhTA2h1aQZ8HoM$E7Brqb7gHQRzY7vKMibDC/MLKTD/c+YYbDcoHssL3Ck=', '2024-05-09 17:28:55.134166', 1, 'admin', 'Admin', '', 'admin@gmail.com', 1, 1, '2024-04-25 14:19:03.794656', '1', 'media/profile_pic/face15_Rq007OX.jpg'),
(2, 'pbkdf2_sha256$720000$lLEQDUZfYlYdplF1tVWs29$f8ZM5lObRBWLHVBqwGuzyA+Y8lXfwQlh2W+oVzEZEyg=', '2024-05-01 12:10:41.391974', 0, 'abir123', 'Abir', 'Singh', 'abir@gmail.com', 0, 1, '2024-04-25 14:25:27.291317', '2', 'media/profile_pic/face27_Fx9EjXD.jpg'),
(3, 'pbkdf2_sha256$720000$5bzkU1dwL7O9I4652vVOtD$XmNd6u3Oap5cwbYayn3Ca9DmyNng6Sji15+yxRNUvRE=', '2024-04-30 12:24:10.969130', 0, 'reema123', 'Reema', 'Sharma', 'reema@gmail.com', 0, 1, '2024-04-30 12:13:02.572777', '2', 'media/profile_pic/pic4.jpg'),
(4, 'pbkdf2_sha256$390000$yu6uk0kTmdSxMPWkUp8Vzs$W/p8H3ZFbs+iANFPOppSD0LGJw8+aZGOUchbcOYWch4=', '2024-05-09 05:34:01.774302', 0, 'test@123', 'Test', 'Test', 'test@gmail.com', 0, 1, '2024-04-30 12:13:29.657085', '2', 'media/profile_pic/image.png'),
(5, 'pbkdf2_sha256$390000$HFT05sIZI7EoBXwznXw5ZR$/zUQ5fK8p/6thjF0/Iwq10BMdC/lwaVvzJZrpI0MZV4=', '2024-05-11 03:04:48.749172', 0, 'akh343', 'Ajay', 'Kumar Singh', 'ajayk30@gmail.com', 0, 1, '2024-05-09 14:33:02.346723', '2', 'media/profile_pic/license.png');

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_customuser_groups`
--

CREATE TABLE `cmsapp_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_customuser_user_permissions`
--

CREATE TABLE `cmsapp_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_state`
--

CREATE TABLE `cmsapp_state` (
  `id` bigint(20) NOT NULL,
  `statename` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_state`
--

INSERT INTO `cmsapp_state` (`id`, `statename`, `created_at`, `updated_at`) VALUES
(1, 'Uttar Pradesh', '2024-04-25 14:23:00.464917', '2024-04-25 14:23:00.464917'),
(2, 'Haryana', '2024-04-25 14:23:03.125621', '2024-04-25 14:23:03.125621'),
(3, 'Punjab', '2024-04-25 14:23:05.602256', '2024-04-25 14:23:05.602256'),
(4, 'Madya Pradesh', '2024-04-25 14:23:07.886978', '2024-04-25 14:23:07.886978'),
(5, 'Uttrakhand', '2024-04-25 14:23:10.737791', '2024-04-25 14:23:10.737791'),
(6, 'Bihar', '2024-04-25 14:23:13.433259', '2024-04-25 14:23:13.433259'),
(7, 'Delhi', '2024-05-09 14:36:38.223552', '2024-05-09 14:36:38.223552');

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_subcategory`
--

CREATE TABLE `cmsapp_subcategory` (
  `id` bigint(20) NOT NULL,
  `subcatname` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cat_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_subcategory`
--

INSERT INTO `cmsapp_subcategory` (`id`, `subcatname`, `created_at`, `updated_at`, `cat_id_id`) VALUES
(1, 'Online Shopping', '2024-04-25 14:21:30.753575', '2024-04-25 14:21:30.753575', 1),
(2, 'XYZ', '2024-04-25 14:21:39.799013', '2024-04-25 14:21:39.799013', 1),
(3, 'E-wllaet', '2024-04-25 14:21:48.483723', '2024-04-25 14:21:48.484721', 1),
(4, 'Others', '2024-04-25 14:22:18.590959', '2024-04-25 14:22:18.590959', 2),
(5, 'ABC', '2024-04-25 14:22:23.442814', '2024-04-25 14:22:23.442814', 2),
(6, 'Loan Related', '2024-04-25 14:22:43.124776', '2024-04-25 14:22:43.124776', 3),
(7, 'Wages Related', '2024-04-25 14:22:54.341657', '2024-04-25 14:22:54.341657', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cmsapp_userreg`
--

CREATE TABLE `cmsapp_userreg` (
  `id` bigint(20) NOT NULL,
  `mobilenumber` varchar(11) NOT NULL,
  `regdate_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cmsapp_userreg`
--

INSERT INTO `cmsapp_userreg` (`id`, `mobilenumber`, `regdate_at`, `updated_at`, `admin_id`) VALUES
(1, '7979797987', '2024-04-25 14:25:28.048430', '2024-04-25 14:25:28.049428', 2),
(2, '7797979798', '2024-04-30 12:13:03.364372', '2024-04-30 12:13:03.364372', 3),
(3, '7894561236', '2024-04-30 12:13:30.393024', '2024-04-30 12:13:30.393024', 4),
(4, '5434534534', '2024-05-09 14:33:02.590696', '2024-05-09 14:33:02.590696', 5);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(7, 'cmsapp', 'category'),
(12, 'cmsapp', 'complaintremark'),
(11, 'cmsapp', 'complaints'),
(6, 'cmsapp', 'customuser'),
(9, 'cmsapp', 'state'),
(8, 'cmsapp', 'subcategory'),
(10, 'cmsapp', 'userreg'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-25 14:17:26.596053'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-04-25 14:17:26.649200'),
(3, 'auth', '0001_initial', '2024-04-25 14:17:26.877680'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-04-25 14:17:26.926195'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-04-25 14:17:26.935171'),
(6, 'auth', '0004_alter_user_username_opts', '2024-04-25 14:17:26.945143'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-04-25 14:17:26.952771'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-04-25 14:17:26.955297'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-04-25 14:17:26.967303'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-04-25 14:17:26.977237'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-04-25 14:17:26.984692'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-04-25 14:17:26.998655'),
(13, 'auth', '0011_update_proxy_permissions', '2024-04-25 14:17:27.006634'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-04-25 14:17:27.016606'),
(15, 'cmsapp', '0001_initial', '2024-04-25 14:17:27.256124'),
(16, 'admin', '0001_initial', '2024-04-25 14:17:27.413737'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-04-25 14:17:27.424711'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-25 14:17:27.435678'),
(19, 'cmsapp', '0002_alter_customuser_user_type', '2024-04-25 14:17:27.448809'),
(20, 'cmsapp', '0003_category', '2024-04-25 14:17:27.461519'),
(21, 'cmsapp', '0004_subcategory', '2024-04-25 14:17:27.522711'),
(22, 'cmsapp', '0005_state', '2024-04-25 14:17:27.537670'),
(23, 'cmsapp', '0006_userreg', '2024-04-25 14:17:27.652671'),
(24, 'cmsapp', '0007_alter_customuser_user_type_complaints', '2024-04-25 14:17:27.795446'),
(25, 'cmsapp', '0008_complaints_admin', '2024-04-25 14:17:27.854376'),
(26, 'sessions', '0001_initial', '2024-04-25 14:17:27.889632'),
(27, 'cmsapp', '0009_alter_complaints_admin_alter_customuser_user_type', '2024-04-26 14:27:04.240843'),
(28, 'cmsapp', '0010_alter_complaints_complainttype', '2024-04-26 14:30:05.619954'),
(29, 'cmsapp', '0011_complaints_remark_complaints_status_and_more', '2024-04-26 15:12:10.377262'),
(30, 'cmsapp', '0012_alter_customuser_user_type_complaintremark', '2024-04-29 06:13:09.227253'),
(31, 'cmsapp', '0013_rename_comp_id_complaintremark_comp_id_id', '2024-04-29 06:22:04.210074'),
(32, 'cmsapp', '0014_remove_complaints_admin_complaints_userregid', '2024-04-30 12:06:38.979601');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ai5hsst9jqln3mokzhyw5hkybugi592v', '.eJxVjDsOwjAQBe_iGlk4699S0nOGaL1ecADZUpxUiLtDpBTQvpl5LzXSupRx7TKPU1YnZdThd0vED6kbyHeqt6a51WWekt4UvdOuLy3L87y7fweFevnWyRuwkpERiSLhdUAHNkB0EoQTu-wRonXkA9iIwoDWgB88cHR8BPX-ANk3Nwo:1s54rH:4c8S061WHzabaFxD8ZtlnoyhQNcYZ1pHwarOOWpQZC8', '2024-05-23 14:34:55.900410'),
('rk9qb0qd0p4kclhmtrm17zlw78io3trr', '.eJxVjDsOwjAQBe_iGlmy4y8lPWew1rtrHEC2FCcV4u4QKQW0b2beSyTY1pq2wUuaSZyFEqffLQM-uO2A7tBuXWJv6zJnuSvyoENeO_Hzcrh_BxVG_dbWKBcMRS7RMTlvOIeoow0auRijkcAyGoc45TJ5BiisdfEWMESlWLw_75w4sg:1s293g:aPeb8kq6N0ti6HfYzWgQhGXZFp9ik4hQ_8HAar_ooRc', '2024-05-15 12:27:36.182041');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `cmsapp_category`
--
ALTER TABLE `cmsapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmsapp_complaintremark`
--
ALTER TABLE `cmsapp_complaintremark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmsapp_complaintrema_comp_id_id_id_eef57696_fk_cmsapp_co` (`comp_id_id_id`);

--
-- Indexes for table `cmsapp_complaints`
--
ALTER TABLE `cmsapp_complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmsapp_complaints_cat_id_id_6c81c042_fk_cmsapp_category_id` (`cat_id_id`),
  ADD KEY `cmsapp_complaints_stateid_id_bd6f4b07_fk_cmsapp_state_id` (`stateid_id`),
  ADD KEY `cmsapp_complaints_subcategory_id_id_05376955_fk_cmsapp_su` (`subcategory_id_id`),
  ADD KEY `cmsapp_complaints_userregid_id_11f44224_fk_cmsapp_userreg_id` (`userregid_id`);

--
-- Indexes for table `cmsapp_customuser`
--
ALTER TABLE `cmsapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cmsapp_customuser_groups`
--
ALTER TABLE `cmsapp_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmsapp_customuser_groups_customuser_id_group_id_45650982_uniq` (`customuser_id`,`group_id`),
  ADD KEY `cmsapp_customuser_groups_group_id_9d73370c_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `cmsapp_customuser_user_permissions`
--
ALTER TABLE `cmsapp_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cmsapp_customuser_user_p_customuser_id_permission_3100a3a5_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `cmsapp_customuser_us_permission_id_bf407ca8_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cmsapp_state`
--
ALTER TABLE `cmsapp_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmsapp_subcategory`
--
ALTER TABLE `cmsapp_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmsapp_subcategory_cat_id_id_996bae74_fk_cmsapp_category_id` (`cat_id_id`);

--
-- Indexes for table `cmsapp_userreg`
--
ALTER TABLE `cmsapp_userreg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_cmsapp_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `cmsapp_category`
--
ALTER TABLE `cmsapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cmsapp_complaintremark`
--
ALTER TABLE `cmsapp_complaintremark`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cmsapp_complaints`
--
ALTER TABLE `cmsapp_complaints`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cmsapp_customuser`
--
ALTER TABLE `cmsapp_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cmsapp_customuser_groups`
--
ALTER TABLE `cmsapp_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmsapp_customuser_user_permissions`
--
ALTER TABLE `cmsapp_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cmsapp_state`
--
ALTER TABLE `cmsapp_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cmsapp_subcategory`
--
ALTER TABLE `cmsapp_subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cmsapp_userreg`
--
ALTER TABLE `cmsapp_userreg`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `cmsapp_complaintremark`
--
ALTER TABLE `cmsapp_complaintremark`
  ADD CONSTRAINT `cmsapp_complaintrema_comp_id_id_id_eef57696_fk_cmsapp_co` FOREIGN KEY (`comp_id_id_id`) REFERENCES `cmsapp_complaints` (`id`);

--
-- Constraints for table `cmsapp_complaints`
--
ALTER TABLE `cmsapp_complaints`
  ADD CONSTRAINT `cmsapp_complaints_cat_id_id_6c81c042_fk_cmsapp_category_id` FOREIGN KEY (`cat_id_id`) REFERENCES `cmsapp_category` (`id`),
  ADD CONSTRAINT `cmsapp_complaints_stateid_id_bd6f4b07_fk_cmsapp_state_id` FOREIGN KEY (`stateid_id`) REFERENCES `cmsapp_state` (`id`),
  ADD CONSTRAINT `cmsapp_complaints_subcategory_id_id_05376955_fk_cmsapp_su` FOREIGN KEY (`subcategory_id_id`) REFERENCES `cmsapp_subcategory` (`id`),
  ADD CONSTRAINT `cmsapp_complaints_userregid_id_11f44224_fk_cmsapp_userreg_id` FOREIGN KEY (`userregid_id`) REFERENCES `cmsapp_userreg` (`id`);

--
-- Constraints for table `cmsapp_customuser_groups`
--
ALTER TABLE `cmsapp_customuser_groups`
  ADD CONSTRAINT `cmsapp_customuser_gr_customuser_id_63c3707f_fk_cmsapp_cu` FOREIGN KEY (`customuser_id`) REFERENCES `cmsapp_customuser` (`id`),
  ADD CONSTRAINT `cmsapp_customuser_groups_group_id_9d73370c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `cmsapp_customuser_user_permissions`
--
ALTER TABLE `cmsapp_customuser_user_permissions`
  ADD CONSTRAINT `cmsapp_customuser_us_customuser_id_820f4ca8_fk_cmsapp_cu` FOREIGN KEY (`customuser_id`) REFERENCES `cmsapp_customuser` (`id`),
  ADD CONSTRAINT `cmsapp_customuser_us_permission_id_bf407ca8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `cmsapp_subcategory`
--
ALTER TABLE `cmsapp_subcategory`
  ADD CONSTRAINT `cmsapp_subcategory_cat_id_id_996bae74_fk_cmsapp_category_id` FOREIGN KEY (`cat_id_id`) REFERENCES `cmsapp_category` (`id`);

--
-- Constraints for table `cmsapp_userreg`
--
ALTER TABLE `cmsapp_userreg`
  ADD CONSTRAINT `cmsapp_userreg_admin_id_94e4b9b8_fk_cmsapp_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `cmsapp_customuser` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_cmsapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `cmsapp_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
