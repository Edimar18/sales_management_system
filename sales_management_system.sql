-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2025 at 06:28 AM
-- Server version: 11.4.5-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales_management_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStock` (IN `p_ProductID` INT, IN `p_Quantity` INT)   BEGIN
    UPDATE Products
    SET Stock = Stock - p_Quantity
    WHERE ProductID = p_ProductID;
END$$

DELIMITER ;

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add orderdetails', 7, 'add_orderdetails'),
(26, 'Can change orderdetails', 7, 'change_orderdetails'),
(27, 'Can delete orderdetails', 7, 'delete_orderdetails'),
(28, 'Can view orderdetails', 7, 'view_orderdetails'),
(29, 'Can add orders', 8, 'add_orders'),
(30, 'Can change orders', 8, 'change_orders'),
(31, 'Can delete orders', 8, 'delete_orders'),
(32, 'Can view orders', 8, 'view_orders'),
(33, 'Can add products', 9, 'add_products'),
(34, 'Can change products', 9, 'change_products'),
(35, 'Can delete products', 9, 'delete_products'),
(36, 'Can view products', 9, 'view_products'),
(37, 'Can add transactions', 10, 'add_transactions'),
(38, 'Can change transactions', 10, 'change_transactions'),
(39, 'Can delete transactions', 10, 'delete_transactions'),
(40, 'Can view transactions', 10, 'view_transactions'),
(41, 'Can add users', 11, 'add_users'),
(42, 'Can change users', 11, 'change_users'),
(43, 'Can delete users', 11, 'delete_users'),
(44, 'Can view users', 11, 'view_users'),
(45, 'Can add auth group', 12, 'add_authgroup'),
(46, 'Can change auth group', 12, 'change_authgroup'),
(47, 'Can delete auth group', 12, 'delete_authgroup'),
(48, 'Can view auth group', 12, 'view_authgroup'),
(49, 'Can add auth group permissions', 13, 'add_authgrouppermissions'),
(50, 'Can change auth group permissions', 13, 'change_authgrouppermissions'),
(51, 'Can delete auth group permissions', 13, 'delete_authgrouppermissions'),
(52, 'Can view auth group permissions', 13, 'view_authgrouppermissions'),
(53, 'Can add auth permission', 14, 'add_authpermission'),
(54, 'Can change auth permission', 14, 'change_authpermission'),
(55, 'Can delete auth permission', 14, 'delete_authpermission'),
(56, 'Can view auth permission', 14, 'view_authpermission'),
(57, 'Can add auth user', 15, 'add_authuser'),
(58, 'Can change auth user', 15, 'change_authuser'),
(59, 'Can delete auth user', 15, 'delete_authuser'),
(60, 'Can view auth user', 15, 'view_authuser'),
(61, 'Can add auth user groups', 16, 'add_authusergroups'),
(62, 'Can change auth user groups', 16, 'change_authusergroups'),
(63, 'Can delete auth user groups', 16, 'delete_authusergroups'),
(64, 'Can view auth user groups', 16, 'view_authusergroups'),
(65, 'Can add auth user user permissions', 17, 'add_authuseruserpermissions'),
(66, 'Can change auth user user permissions', 17, 'change_authuseruserpermissions'),
(67, 'Can delete auth user user permissions', 17, 'delete_authuseruserpermissions'),
(68, 'Can view auth user user permissions', 17, 'view_authuseruserpermissions'),
(69, 'Can add django admin log', 18, 'add_djangoadminlog'),
(70, 'Can change django admin log', 18, 'change_djangoadminlog'),
(71, 'Can delete django admin log', 18, 'delete_djangoadminlog'),
(72, 'Can view django admin log', 18, 'view_djangoadminlog'),
(73, 'Can add django content type', 19, 'add_djangocontenttype'),
(74, 'Can change django content type', 19, 'change_djangocontenttype'),
(75, 'Can delete django content type', 19, 'delete_djangocontenttype'),
(76, 'Can view django content type', 19, 'view_djangocontenttype'),
(77, 'Can add django migrations', 20, 'add_djangomigrations'),
(78, 'Can change django migrations', 20, 'change_djangomigrations'),
(79, 'Can delete django migrations', 20, 'delete_djangomigrations'),
(80, 'Can view django migrations', 20, 'view_djangomigrations'),
(81, 'Can add django session', 21, 'add_djangosession'),
(82, 'Can change django session', 21, 'change_djangosession'),
(83, 'Can delete django session', 21, 'delete_djangosession'),
(84, 'Can view django session', 21, 'view_djangosession');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$zw12mwKZhL8IL1twkc74w8$dAPatrQZDf30cbXhR1KyCanqKcHvr1Cqty+GZaRV+R4=', '2025-03-19 10:44:16.782934', 1, 'Edimar', '', '', 'mosquida.edimar.18@gmail.com', 1, 1, '2025-03-06 13:23:16.124598');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `user_id` int(11) NOT NULL
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
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'home', 'authgroup'),
(13, 'home', 'authgrouppermissions'),
(14, 'home', 'authpermission'),
(15, 'home', 'authuser'),
(16, 'home', 'authusergroups'),
(17, 'home', 'authuseruserpermissions'),
(18, 'home', 'djangoadminlog'),
(19, 'home', 'djangocontenttype'),
(20, 'home', 'djangomigrations'),
(21, 'home', 'djangosession'),
(7, 'home', 'orderdetails'),
(8, 'home', 'orders'),
(9, 'home', 'products'),
(10, 'home', 'transactions'),
(11, 'home', 'users'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2025-03-06 12:12:48.437687'),
(2, 'auth', '0001_initial', '2025-03-06 12:12:48.827279'),
(3, 'admin', '0001_initial', '2025-03-06 12:12:48.909877'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-03-06 12:12:48.931902'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-06 12:12:48.958433'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-03-06 12:12:49.021514'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-03-06 12:12:49.058262'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-03-06 12:12:49.081117'),
(9, 'auth', '0004_alter_user_username_opts', '2025-03-06 12:12:49.094544'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-03-06 12:12:49.141009'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-03-06 12:12:49.143006'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-06 12:12:49.154051'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-03-06 12:12:49.187395'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-06 12:12:49.217563'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-03-06 12:12:49.246433'),
(16, 'auth', '0011_update_proxy_permissions', '2025-03-06 12:12:49.258116'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-06 12:12:49.281034'),
(18, 'home', '0001_initial', '2025-03-06 12:12:49.287029'),
(19, 'sessions', '0001_initial', '2025-03-06 12:12:49.324806'),
(20, 'home', '0002_alter_users_options', '2025-03-06 12:41:25.225512'),
(21, 'home', '0003_authgroup_authgrouppermissions_authpermission_and_more', '2025-03-06 12:58:08.705102'),
(22, 'home', '0004_alter_users_options', '2025-03-06 13:17:40.934122'),
(23, 'home', '0005_alter_users_options', '2025-03-07 08:44:13.025719'),
(24, 'home', '0006_alter_users_options', '2025-03-07 08:45:13.758520'),
(25, 'home', '0007_alter_users_options', '2025-03-19 12:06:57.224424');

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
('pja6u5t9thqr391euil2k6a1la9k7zc4', '.eJxVjMsKwjAQRf8lawmdpp0kLt33G8JkMrFVSaCPlfjvWihCt-ece99qW2QOU1JXaC4q0LaO4Y8UqBOLxE8pu0gPKvequZZ1nqLeE33YRQ81yet2tKeDkZbxt26ZJDdgGSj3RlhcbJ11hMgdZOfZIlojYKVPGI1kNAbF5zZ24HrP6vMFwD88FA:1tuqvg:f786TY4mrvQoERWDGw9SX7TGWTSUkbCIP0aaoBxZRvU', '2025-04-02 10:45:44.717068'),
('yrrgruy0kec6i6v2qwnz36mxiuxe04mx', 'e30:1tqTqo:-JYX7jAHmZ1HEsBgGu9C3oix3_AQlWx3xTTIAySux_I', '2025-03-21 09:18:38.100902');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Subtotal`) VALUES
(1, 1, 1, 1, 999.99),
(2, 1, 3, 1, 99.99),
(3, 2, 7, 1, 299.99),
(4, 3, 1, 1, 999.99),
(5, 4, 9, 1, 149.99),
(6, 5, 4, 1, 49.99),
(7, 6, 10, 1, 89.99),
(8, 7, 8, 1, 199.99),
(9, 8, 2, 1, 599.99),
(10, 9, 3, 1, 99.99),
(12, 12, 2, 3, 150.00);

--
-- Triggers `orderdetails`
--
DELIMITER $$
CREATE TRIGGER `BeforeOrderDetailInsert` BEFORE INSERT ON `orderdetails` FOR EACH ROW BEGIN
 DECLARE current_stock INT;
 SELECT Stock INTO current_stock FROM Products WHERE ProductID = NEW.ProductID;
 IF current_stock < NEW.Quantity THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = 'Insufficient stock for this product.';
 END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `OrderDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `TotalAmount`, `OrderDate`) VALUES
(1, 1, 1099.98, '2025-03-06 19:25:23'),
(2, 2, 299.98, '2025-03-06 19:25:23'),
(3, 3, 999.99, '2025-03-06 19:25:23'),
(4, 4, 149.99, '2025-03-06 19:25:23'),
(5, 5, 49.99, '2025-03-06 19:25:23'),
(6, 6, 89.99, '2025-03-06 19:25:23'),
(7, 7, 199.99, '2025-03-06 19:25:23'),
(8, 8, 599.99, '2025-03-06 19:25:23'),
(9, 9, 99.99, '2025-03-06 19:25:23'),
(10, 10, 29.99, '2025-03-06 19:25:23'),
(12, 1, 150.00, '2025-03-06 19:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `product_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Name`, `Price`, `Stock`, `ImageURL`, `product_details`) VALUES
(1, 'Laptop', 999.99, 50, 'home/images/Laptop.jpg', 'Experience lightning-fast performance with this high-end laptop, perfect for work, gaming, and creativity. Featuring a sleek design, powerful processor, and stunning display, it\'s built to elevate your productivity and entertainment to the next level.'),
(2, 'Smartphone', 599.99, 97, 'home/images/Smartphone.jpg', 'Stay connected with this state-of-the-art smartphone, featuring a high-resolution camera, long-lasting battery, and ultra-responsive touchscreen. Whether for work or play, enjoy seamless performance and stunning visuals in the palm of your hand.'),
(3, 'Headphones', 99.99, 200, 'home/images/Headphones.jpg', 'Immerse yourself in rich, crystal-clear sound with these premium headphones. Designed for comfort and high-fidelity audio, they offer noise cancellation, deep bass, and wireless freedom for an exceptional listening experience.'),
(4, 'Keyboard', 49.99, 150, 'home/images/Keyboard.jpg', 'Enhance your typing experience with this ergonomic keyboard, designed for efficiency and comfort. With responsive keys, customizable backlighting, and a sleek build, it\'s perfect for both work and gaming.'),
(5, 'Mouse', 29.99, 180, 'home/images/Mouse.jpg', 'Navigate with precision and ease using this high-performance wireless mouse. Designed for comfort and accuracy, it features customizable buttons, fast response time, and a sleek ergonomic design.'),
(6, 'Monitor', 199.99, 80, 'home/images/Monitor.jpg', 'Upgrade your workspace with this stunning HD monitor, offering vibrant colors, ultra-smooth refresh rates, and a slim bezel design. Perfect for gaming, productivity, and entertainment.'),
(7, 'Tablet', 299.99, 60, 'home/images/Tablet.jpg', 'Enjoy the perfect balance of portability and power with this high-performance tablet. Featuring a vivid touchscreen, long battery life, and versatile functionality, it\'s great for work, study, and entertainment.'),
(8, 'Smartwatch', 199.99, 70, 'home/images/Smartwatch.jpg', 'Stay ahead of your health and fitness goals with this sleek smartwatch. Track your steps, heart rate, and notifications on a stylish, high-resolution display with advanced features.'),
(9, 'Printer', 149.99, 40, 'home/images/Printer.jpg', 'Print with precision and efficiency using this high-quality printer. Whether for home or office use, enjoy fast speeds, crisp prints, and wireless connectivity for seamless operation.'),
(10, 'Speaker', 89.99, 120, 'home/images/Speaker.jpg', 'Fill any room with rich, immersive sound using this powerful speaker. With deep bass, crystal-clear audio, and wireless connectivity, it\'s perfect for music lovers and entertainment enthusiasts.');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `PaymentStatus` varchar(50) NOT NULL,
  `PaymentDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransactionID`, `OrderID`, `PaymentStatus`, `PaymentDate`) VALUES
(1, 1, 'Completed', '2025-03-06 19:25:23'),
(2, 2, 'Completed', '2025-03-06 19:25:23'),
(3, 3, 'Pending', '2025-03-06 19:25:23'),
(4, 4, 'Completed', '2025-03-06 19:25:23'),
(5, 5, 'Failed', '2025-03-06 19:25:23'),
(6, 6, 'Completed', '2025-03-06 19:25:23'),
(7, 7, 'Pending', '2025-03-06 19:25:23'),
(8, 8, 'Completed', '2025-03-06 19:25:23'),
(9, 9, 'Failed', '2025-03-06 19:25:23'),
(10, 10, 'Completed', '2025-03-06 19:25:23'),
(11, 12, 'Completed', '2025-03-06 19:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Password` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`, `Email`, `Role`, `Password`) VALUES
(1, 'Alice Johnson', 'alice@example.com', 'Customer', '127987'),
(2, 'Bob Smith', 'bob@example.com', 'Customer', '127987'),
(3, 'Charlie Davis', 'charlie@example.com', 'Customer', '127987'),
(4, 'David Brown', 'david@example.com', 'Customer', '127987'),
(5, 'Emma Wilson', 'emma@example.com', 'Customer', '127987'),
(6, 'Frank Thomas', 'frank@example.com', 'Admin', '127987'),
(7, 'Grace White', 'grace@example.com', 'Customer', '127987'),
(8, 'Henry Moore', 'henry@example.com', 'Customer', '127987'),
(9, 'Ivy Taylor', 'ivy@example.com', 'Customer', '127987'),
(10, 'Jack Anderson', 'jack@example.com', 'Customer', '127987');

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `idx_productid` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `idx_userid` (`UserID`),
  ADD KEY `idx_orderdate` (`OrderDate`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
