-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2026 at 02:31 PM
-- Server version: 8.0.44-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `attribute_id` int NOT NULL,
  `attribute_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attribute_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_code`, `attribute_name`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'ATTR-MAT', 'Material', NULL, NULL, NULL, NULL, 'Active', '0'),
(2, 'ATTR-COL', 'Color', NULL, NULL, '2026-01-09 14:04:31', 1, 'Active', '0'),
(3, 'ATTR-SIZ', 'Size', NULL, NULL, NULL, NULL, 'Active', '0'),
(4, 'ATTR-WGT', 'Weight', NULL, NULL, NULL, NULL, 'Active', '0'),
(5, 'ATTR-STY', 'Style', NULL, NULL, NULL, NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `banners_id` int NOT NULL,
  `banner_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banner_image`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'ffc1abe052139b7fb66226879956066b.png', '2025-03-23 16:01:58', 1, '2026-01-15 23:23:39', 1, 'Active', '0'),
(2, 'b55385289d052867b3defc2370037c02.jpg', '2026-01-15 22:56:23', 1, '2026-01-15 23:20:17', 1, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `title`, `content`, `author`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'test', '<p><strong>test Data</strong></p>\r\n\r\n<h2 data-selectable-paragraph=\"\" id=\"686b\">How to Write the Perfect Blog Post: My 10,000 Word Journey</h2>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"9748\">Starting a blog was one of the most rewarding things I&rsquo;ve done in my career. As someone who loves writing and connecting with readers, having an outlet to share my thoughts while potentially helping others has been an incredible experience.</p>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"24e3\">When I first began blogging a few years ago, I really had no idea what I was doing. I would just sit down at my computer whenever inspiration struck and write whatever came to mind. Sometimes I would publish posts without even proofreading them because I was so eager to get my ideas out there.</p>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"6e93\">Looking back now, those early posts were pretty rough. It&rsquo;s almost cringe-worthy to read some of my early writing. But we all have to start somewhere, right? Even though I made plenty of mistakes (which I&rsquo;ll detail later in this post), blogging has enabled me to find my voice, create helpful content, and connect with readers from all walks of life.</p>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"7f31\">If you&rsquo;re thinking about starting a blog but feel intimidated or don&rsquo;t know where to begin, I want this post to encourage you. You don&rsquo;t have to have everything figured out on day one. I certainly didn&rsquo;t! Consider this your kick in the pants to just take that first step and start writing.</p>\r\n', 'test', '2026-01-06 00:22:56', 1, NULL, NULL, 'Active', '0'),
(2, 'Word Journey', '<p><strong>test Data</strong></p>\r\n\r\n<h2 data-selectable-paragraph=\"\" id=\"686b\">How to Write the Perfect Blog Post: My 10,000 Word Journey</h2>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"9748\">Starting a blog was one of the most rewarding things I&rsquo;ve done in my career. As someone who loves writing and connecting with readers, having an outlet to share my thoughts while potentially helping others has been an incredible experience.</p>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"24e3\">When I first began blogging a few years ago, I really had no idea what I was doing. I would just sit down at my computer whenever inspiration struck and write whatever came to mind. Sometimes I would publish posts without even proofreading them because I was so eager to get my ideas out there.</p>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"6e93\">Looking back now, those early posts were pretty rough. It&rsquo;s almost cringe-worthy to read some of my early writing. But we all have to start somewhere, right? Even though I made plenty of mistakes (which I&rsquo;ll detail later in this post), blogging has enabled me to find my voice, create helpful content, and connect with readers from all walks of life.</p>\r\n\r\n<p data-selectable-paragraph=\"\" id=\"7f31\">If you&rsquo;re thinking about starting a blog but feel intimidated or don&rsquo;t know where to begin, I want this post to encourage you. You don&rsquo;t have to have everything figured out on day one. I certainly didn&rsquo;t! Consider this your kick in the pants to just take that first step and start writing.</p>\r\n', 'Gayu', '2026-01-06 18:18:48', 1, NULL, NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_image`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'Resinify', 'b74d5a66a74bed24abbc1d0a0cc71748.jpg', NULL, NULL, '2026-01-09 14:14:10', 1, 'Active', '0'),
(2, 'Stitch & Soul', '2db4bc600538ad490ebf1cd5e40d64fa.jpg', NULL, NULL, '2026-01-09 14:15:21', 1, 'Active', '0'),
(3, 'Giftify', 'fe87c6f1a7353dc99c150544de8d658d.png', NULL, NULL, '2026-01-09 14:16:46', 1, 'Active', '0'),
(4, 'DecorVibe', 'aa983fdfa923ebce8d80a7696a48ac7d.jpg', NULL, NULL, '2026-01-09 14:17:44', 1, 'Active', '0'),
(5, 'Craftopia', NULL, NULL, NULL, '2026-01-09 14:15:28', 1, 'Active', '1'),
(6, 'Craftopia', 'e7432be7b810c507ce568fb12c639814.jpg', '2026-01-09 14:15:40', 1, NULL, NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_category_id` int DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` int DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_category_id`, `added_date`, `added_by`, `updated_date`, `updated_by`, `status`, `is_delete`) VALUES
(1, 'Resin Art', NULL, '2026-01-09 08:23:37', NULL, '2026-01-09 08:23:37', NULL, 'Active', '0'),
(2, 'Crochets', NULL, '2026-01-09 08:23:37', NULL, '2026-01-09 08:37:08', 1, 'Active', '0'),
(3, 'Custom Gifts', NULL, '2026-01-09 08:23:37', NULL, '2026-01-09 08:23:37', NULL, 'Active', '0'),
(4, 'Home Decorrr', NULL, '2026-01-09 08:23:37', NULL, '2026-01-09 08:23:37', NULL, 'Active', '0'),
(5, 'Jewellery', NULL, '2026-01-09 08:23:37', NULL, '2026-01-09 08:23:37', NULL, 'Active', '0'),
(6, 'Festive', NULL, '2026-01-09 08:35:08', 1, '2026-01-09 08:36:56', 1, 'Active', '0'),
(7, 'Keychains', 1, '2026-01-15 17:06:01', NULL, '2026-01-15 17:06:01', NULL, 'Active', '0'),
(8, 'Name Plates', 1, '2026-01-15 17:06:01', NULL, '2026-01-15 17:06:01', NULL, 'Active', '0'),
(9, 'Photo Frames', 1, '2026-01-15 17:06:01', NULL, '2026-01-15 17:06:01', NULL, 'Active', '0'),
(10, 'Jewellery', 1, '2026-01-15 17:06:01', NULL, '2026-01-15 17:06:01', NULL, 'Active', '0'),
(11, 'Wall Art', 1, '2026-01-15 17:06:01', NULL, '2026-01-15 17:06:01', NULL, 'Active', '0'),
(12, 'Bags & Pouches', 2, '2026-01-15 17:07:25', NULL, '2026-01-15 17:07:25', NULL, 'Active', '0'),
(13, 'Flowers & Bouquets', 2, '2026-01-15 17:07:25', NULL, '2026-01-15 17:07:25', NULL, 'Active', '0'),
(14, 'Soft Toys', 2, '2026-01-15 17:07:25', NULL, '2026-01-15 17:07:25', NULL, 'Active', '0'),
(15, 'Coasters', 2, '2026-01-15 17:07:25', NULL, '2026-01-15 17:07:25', NULL, 'Active', '0'),
(16, 'Wearables', 2, '2026-01-15 17:07:25', NULL, '2026-01-15 17:07:25', NULL, 'Active', '0'),
(17, 'Name Gifts', 3, '2026-01-15 17:07:40', NULL, '2026-01-15 17:07:40', NULL, 'Active', '0'),
(18, 'Couple Gifts', 3, '2026-01-15 17:07:40', NULL, '2026-01-15 17:07:40', NULL, 'Active', '0'),
(19, 'Birthday Gifts', 3, '2026-01-15 17:07:40', NULL, '2026-01-15 17:07:40', NULL, 'Active', '0'),
(20, 'Anniversary Gifts', 3, '2026-01-15 17:07:40', NULL, '2026-01-15 17:07:40', NULL, 'Active', '0'),
(21, 'Baby Gifts', 3, '2026-01-15 17:07:40', NULL, '2026-01-15 17:07:40', NULL, 'Active', '0'),
(22, 'Wall Hangings', 4, '2026-01-15 17:07:52', NULL, '2026-01-15 17:07:52', NULL, 'Active', '0'),
(23, 'Table Decorrr', 4, '2026-01-15 17:07:52', NULL, '2026-01-15 17:17:27', 1, 'Active', '0'),
(24, 'Showpieces', 4, '2026-01-15 17:07:52', NULL, '2026-01-15 17:07:52', NULL, 'Active', '0'),
(25, 'Lamps & Lights', 4, '2026-01-15 17:07:52', NULL, '2026-01-15 17:07:52', NULL, 'Active', '0'),
(26, 'Resin Jewellery', 5, '2026-01-15 17:08:03', NULL, '2026-01-15 17:08:03', NULL, 'Active', '0'),
(27, 'Crochet Jewellery', 5, '2026-01-15 17:08:03', NULL, '2026-01-15 17:08:03', NULL, 'Active', '0'),
(28, 'Earrings', 5, '2026-01-15 17:08:03', NULL, '2026-01-15 17:08:03', NULL, 'Active', '0'),
(29, 'Bracelets', 5, '2026-01-15 17:08:03', NULL, '2026-01-15 17:08:03', NULL, 'Active', '0'),
(30, 'Diwali Décor', 6, '2026-01-15 17:08:20', NULL, '2026-01-15 17:08:20', NULL, 'Active', '0'),
(31, 'Rakhi Gifts', 6, '2026-01-15 17:08:20', NULL, '2026-01-15 17:08:20', NULL, 'Active', '0'),
(32, 'Christmas Crafts', 6, '2026-01-15 17:08:20', NULL, '2026-01-15 17:08:20', NULL, 'Active', '0'),
(33, 'Wedding Gifts', 6, '2026-01-15 17:08:20', NULL, '2026-01-15 17:08:20', NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL,
  `client_unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_person` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pan_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shifting_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gst_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_id` int DEFAULT NULL,
  `date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int DEFAULT '0',
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `client_unit`, `client_name`, `contact_person`, `pan_no`, `billing_address`, `shifting_address`, `phone_no`, `gst_number`, `created_id`, `date`, `time`, `timestamp`, `deleted`, `state`, `state_no`, `bank_details`, `address1`, `location`, `pin`) VALUES
(1, 'Talegaon Unit', 'TEST TECHNOPLAST', 'MR. Suresh Kamat', 'BIZPB5715', 'S.no. 123/4, Near PCMC water tank, Whalekarwadi Road, Pimple Goan, Pune-411111  Email: xxxxaaa@yahoo.com   PH: 1234567890', 'Gat no.5648, House no 133, near Hotel, Pimple Road, Pune-411111', '1111111110', '11ABCDE2222FGHI', 3, '03-04-2024', '10:58:33', '2024-02-09 08:27:30', 0, 'MAHARASHTRA', '27', 'ICICI BANK - Ac.No. 1111', 'xxxxx, xxxxxxxxxxx, xxxxxxxxxxxxxxxxxxxxxxx', 'Chinchwad', '411111'),
(2, 'Akurdi Unit', 'TEST TECHNOPLAST', 'MR. Suresh Kamat', 'BIZPB5715', 'S.no. 123/4, Near PCMC water tank, Whalekarwadi Road, Pimple Goan, Pune-411111  Email: xxxxaaa@yahoo.com   PH: 1234567890', 'Gat no.5648, House no 133, near Hotel, Pimple Road, Pune-411111', '1111111110', '11ABCDE2222FGHI', 3, '21-04-2024', '06:53:03', '2024-02-09 10:29:41', 0, 'Maharashtra', '27', 'ICICI BANK 1111', 'xxxxx, xxxxxxxxxxx, xxxxxxxxxxxxxxxxxxxxxxx', 'Chinchwad', '411111');

-- --------------------------------------------------------

--
-- Table structure for table `commmet`
--

CREATE TABLE `commmet` (
  `id` int UNSIGNED NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config_setting`
--

CREATE TABLE `config_setting` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('check_box','input','date','file','textarea') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_id` int NOT NULL,
  `is_edit` enum('Yes','No') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `config_setting`
--
INSERT INTO `config_setting` (`id`, `name`, `title`, `value`, `description`, `type`, `company_id`, `is_edit`) VALUES
(1, 'admin_company_logo', 'Admin Company Logo', 'public/uploads/config_setting/5d10dde49b68a1ff751ab690b360ff50.png', 'Admin panel company logo', 'file', 0, 'No'),
(2, 'admin_company_name', 'Admin Company Name', 'E-commerce Admin', 'Admin panel company name', 'input', 0, 'No'),
(3, 'admin_company_fav_icon', 'Admin Company Fav Icon', 'public/uploads/config_setting/c0df45ee36aa8aa021ac83518c8fb52f.png', 'Admin panel favicon', 'file', 0, 'No'),
(4, 'admin_login_attempt', 'Admin Login Attempt', '5', 'Maximum admin login attempts', 'input', 0, 'No'),
(5, 'admin_menu_type', 'Admin Menu Type', 'horizontal', 'horizontal|vertical', 'input', 0, 'No'),
(6, 'frontend_company_logo', 'Frontend Company Logo', 'public/uploads/config_setting/d7a690d5b781aa9c8a4b4b25fe2e51b9.png', 'Frontend website logo', 'file', 0, 'No'),
(7, 'frontend_company_name', 'Frontend Company Name', 'Craftology', 'Frontend website company name', 'input', 0, 'No'),
(8, 'frontend_company_fav_icon', 'Frontend Company Fav Icon', 'public/uploads/config_setting/8bef6c9ddbed8d635c1660e99fb1f6db.png', 'Frontend website favicon', 'file', 0, 'No'),
(9, 'default_page_view_type', 'Default Page View Type for Listing', '{\"User\":\"Grid\"}', 'Table/Grid', 'input', 0, 'No'),
(10, 'smtp_user_name', 'SMTP User Name', 'erp.system@gmail.com', 'SMTP User Name', 'input', 0, 'No'),
(11, 'smtp_user_password', 'SMTP User Password', 'csoh fxfg hvfk egju', 'SMTP User Password', 'input', 0, 'No'),
(12, 'company_email', 'Company Email', 'codecrafter.help@gmail.com', 'Company Email', 'input', 0, 'No'),
(13, 'password_link_expiry', 'Password Link Expiry', '10', 'Password Link Expiry In Minutes', 'input', 0, 'No'),
(14, 'email_notification_enable', 'Email Notification Enable', 'Yes', 'Enable email notifications', 'check_box', 0, 'No'),
(15, 'social_whatsapp', 'WhatsApp Link', 'https://wa.me/91XXXXXXXXXX', 'Official WhatsApp contact link for customer support', 'input', 1, 'No'),
(16, 'social_instagram', 'Instagram Profile', 'https://www.instagram.com/craftology.ecom', 'Official Instagram profile link', 'input', 1, 'No'),
(17, 'social_facebook', 'Facebook Page', 'https://www.facebook.com/craftologyecom', 'Official Facebook page link', 'input', 1, 'No'),
(18, 'social_linkedin', 'LinkedIn Profile', 'https://www.linkedin.com/company/craftology-ecom', 'Official LinkedIn company profile link', 'input', 1, 'No'),
(19, 'company_description', 'Company Description', 'Handcrafted with love. Discover unique resin art, crochet treasures, and personalized gifts made just for you.', 'Displayed in website footer as company introduction', 'textarea', 1, 'No'),
(20, 'frontend_company_name_visible', 'Frontend Company Name Visible', 'No', 'Frontend website company name Visible', 'check_box', 0, 'No'),
(21, 'user_manual_file', 'User Manual', '', 'Upload user manual PDF or document for users', 'file', 0, 'Yes'),
(22, 'contact_location', 'Company Location', 'Pune, Maharashtra, India', 'Company physical address', 'textarea', 1, 'Yes'),
(23, 'contact_phone', 'Contact Number', '+91 9XXXXXXXXX', 'Official company contact number', 'input', 1, 'Yes'),
(24, 'contact_location', 'Company Location', 'Pune, Maharashtra, India', 'Company physical address', 'textarea', 1, 'Yes'),
(25, 'google_map_location', 'Google Map Location', 'https://www.google.com/maps/embed?pb=...', 'Google Map embed URL for company location', 'textarea', 1, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_master`
--

CREATE TABLE `contact_us_master` (
  `contact_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('New','Read','Replied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'New',
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us_master`
--

INSERT INTO `contact_us_master` (`contact_id`, `name`, `email`, `subject`, `message`, `ip_address`, `user_agent`, `status`, `added_date`) VALUES
(1, 'Gayatri', 'gayatri.arom@gmail.com', 'General Inquiry', 'Test Need Data', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'New', '2026-01-14 23:36:42'),
(2, 'GAYATRI', 'gayatrihedau3@gmail.com', 'Custom Order Request', 'Custom order Request', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'Read', '2026-01-14 23:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupons_id` int NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `discount_type` enum('Percentage','Fixed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_order_value` decimal(10,2) DEFAULT '0.00',
  `expires_at` date DEFAULT NULL,
  `coupons_status` enum('Active','Expired','Disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupons_id`, `code`, `discount`, `discount_type`, `min_order_value`, `expires_at`, `coupons_status`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'WELCOME10', '10.00', 'Percentage', '0.00', '2026-12-31', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(2, 'SAVE500', '500.00', 'Fixed', '2000.00', '2026-06-30', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(3, 'FESTIVE20', '20.00', 'Percentage', '1000.00', '2026-01-20', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(4, 'FREESHIP', '100.00', 'Fixed', '500.00', '2026-03-15', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(5, 'EXPIRED5', '5.00', 'Percentage', '0.00', '2025-12-31', 'Expired', '2025-01-01 10:00:00', 1, NULL, NULL, 'Inactive', '0'),
(6, 'FLASH30', '30.00', 'Percentage', '1500.00', '2026-02-01', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(7, 'NEWUSER', '200.00', 'Fixed', '1000.00', '2026-12-31', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(8, 'WINTER25', '25.00', 'Percentage', '800.00', '2026-02-28', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(9, 'OFFER15', '15.00', 'Percentage', '500.00', '2026-05-10', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0'),
(10, 'BULK1000', '1000.00', 'Fixed', '5000.00', '2026-08-15', 'Active', '2026-01-09 23:44:51', 1, NULL, NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `address_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `address_type` enum('Billing','Shipping') DEFAULT 'Shipping',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_delete` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`address_id`, `customer_id`, `mobile_number`, `receiver_name`, `address`, `city`, `state`, `pincode`, `address_type`, `status`, `is_delete`) VALUES
(1, 1, '7845961230', 'Neeta', 'A-101, Shanti Nagar, Near Jain Temple', 'Ahmedabad', 'Gujarat', '380001', 'Shipping', 'Active', '0'),
(2, 1, '7845961203', 'Neha', 'Plot 25, Gandhi Marg, Behind Bus Depot', 'Ahmedabad', 'Gujarat', '380002', 'Shipping', 'Active', '0'),
(3, 2, NULL, NULL, 'Flat 402, Crystal Heights, MG Road', 'Pune', 'Maharashtra', '411001', 'Billing', 'Active', '0'),
(4, 2, NULL, NULL, 'Warehouse 7, Industrial Area Phase 2', 'Pune', 'Maharashtra', '411026', 'Shipping', 'Active', '0'),
(5, 3, NULL, NULL, 'Sector 15, Vashi, Navi Mumbai', 'Mumbai', 'Maharashtra', '400703', 'Billing', 'Active', '0'),
(6, 4, NULL, NULL, 'Baner Road, Near Balewadi High Street', 'Pune', 'Maharashtra', '411045', 'Shipping', 'Active', '0'),
(7, 5, NULL, NULL, 'Indira Nagar, Near Metro Station', 'Bangalore', 'Karnataka', '560038', 'Billing', 'Active', '0'),
(8, 1, '9874563210', 'GAYATRI HEDAU', 'Vaishali Nagar', 'Nagpur', 'Maharashtra', '411037', 'Shipping', 'Active', '0'),
(9, 11, '7845961230', 'GAYATRI HEDAU', 'Vaishali Nagar', 'Nagpur', 'Maharashtra', '411037', 'Shipping', 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `customer_bank`
--

CREATE TABLE `customer_bank` (
  `bank_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_bank`
--

INSERT INTO `customer_bank` (`bank_id`, `customer_id`, `account_holder_name`, `bank_name`, `account_no`, `ifsc_code`, `branch_name`, `status`) VALUES
(1, 1, '', 'State Bank of India', '123456789012', 'SBIN0000456', 'Ellis Bridge', 'Active'),
(2, 1, NULL, 'HDFC Bank', '987654321098', 'HDFC0001234', 'Aundh', 'Inactive'),
(3, 2, NULL, 'ICICI Bank', '555566667777', 'ICIC0000111', 'Kothrud', 'Active'),
(4, 3, NULL, 'Axis Bank', '112233445566', 'UTIB0000123', 'Vashi', 'Active'),
(5, 4, NULL, 'Kotak Mahindra Bank', '998877665544', 'KKBK0000456', 'Baner', 'Active'),
(6, 5, NULL, 'Canara Bank', '776655443322', 'CNRB0000789', 'Indira Nagar', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `id` int NOT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gst_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `identity_details` text,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Approved','Rejected','Pending','Blocked','Active','Inactive') DEFAULT 'Pending',
  `is_delete` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`id`, `customer_code`, `customer_name`, `profile_image`, `mobile_no`, `email`, `password`, `gst_no`, `pan_no`, `dob`, `gender`, `identity_details`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'CUST001', 'GAYATRI HEDAU', 'ba9d957c183e4dea815d1bdd1567ee66.jpg', '9876543210', 'aarav.patel@example.com', '$2y$10$.emX2rYPJr9e6dIWdn0oB.fFTxT2i/ayOVVI7B.kxwF0LKEe9k72a', '27ABCDE1234F1Z5', 'ABCDE1234F', '2026-01-16', 'Male', 'Identity Details', '2025-12-08 00:11:43', 1, '2026-01-14 23:49:39', 1, 'Active', '0'),
(2, 'CUST002', 'Riya Sharma', NULL, '9865321470', 'riya.sharma@example.com', NULL, '27ASDFG5678H2Z6', 'ASDFG5678H', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Active', '0'),
(3, 'CUST003', 'Mohit Verma', NULL, '9123456780', 'mohit.verma@example.com', NULL, '27QWERT1234P3Z7', 'QWERT1234P', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Inactive', '0'),
(4, 'CUST004', 'Sneha Desai', NULL, '9988776655', 'sneha.desai@example.com', NULL, '27ZXCVB6789L4Z8', 'ZXCVB6789L', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Active', '0'),
(5, 'CUST005', 'Nikhil Singh', NULL, '9090909090', 'nikhil.singh@example.com', NULL, '27LMNOP3456K5Z9', 'LMNOP3456K', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Active', '0'),
(6, 'CUST006', 'Priya Nair', NULL, '9877701234', 'priya.nair@example.com', NULL, '27GHJKL7890M6Z1', 'GHJKL7890M', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Inactive', '0'),
(7, 'CUST007', 'Rahul Yadav', NULL, '9822334455', 'rahul.yadav@example.com', NULL, '27BNMAS1234R7Z2', 'BNMAS1234R', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Active', '0'),
(8, 'CUST008', 'Kavya Joshi', NULL, '9753108642', 'kavya.joshi@example.com', NULL, '27POIUY0987T8Z3', 'POIUY0987T', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Active', '0'),
(9, 'CUST009', 'Vikram Mehta', NULL, '9012345678', 'vikram.mehta@example.com', NULL, '27HJKKL5566U9Z4', 'HJKKL5566U', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Inactive', '0'),
(10, 'CUST010', 'Simran Kaur', NULL, '9998887776', 'simran.kaur@example.com', NULL, '27TYUIO1122V1Z5', 'TYUIO1122V', NULL, NULL, NULL, '2025-12-08 00:11:43', 1, NULL, NULL, 'Active', '0'),
(11, 'CUST011', 'Gayu Hedau', NULL, '9998887776', 'gayu@yopmail.com', '$2y$10$.emX2rYPJr9e6dIWdn0oB.fFTxT2i/ayOVVI7B.kxwF0LKEe9k72a', NULL, NULL, NULL, NULL, NULL, '2026-01-13 16:57:53', 0, NULL, NULL, 'Active', '0'),
(12, 'CUST012', 'Aarbaj Mulla', NULL, NULL, 'aarbaj@yopmail.com', '$2y$10$.emX2rYPJr9e6dIWdn0oB.fFTxT2i/ayOVVI7B.kxwF0LKEe9k72a', NULL, NULL, NULL, NULL, NULL, '2026-01-13 17:11:16', 0, NULL, NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `customer_reviews`
--

CREATE TABLE `customer_reviews` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `reviewer_type` enum('admin','staff','system') NOT NULL DEFAULT 'admin',
  `rating` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` enum('0','1') NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `customer_reviews`
--

INSERT INTO `customer_reviews` (`id`, `customer_id`, `reviewer_type`, `rating`, `comment`, `status`, `created_at`, `updated_at`, `is_delete`) VALUES
(1, 1, 'admin', 5, 'Excellent buyer, quick payment and great communication.', 'Inactive', '2026-01-09 23:29:46', '2026-01-09 23:37:45', '0'),
(2, 1, 'staff', 4, 'Very polite and always provides clear requirements.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:29:46', '0'),
(3, 1, 'system', 5, 'Automatic high rating based on 10 consecutive successful orders.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:29:46', '0'),
(4, 2, 'admin', 3, 'Average buyer, sometimes slow to respond to queries.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:29:46', '0'),
(5, 2, 'staff', 2, 'Multiple payment delays reported by accountancy.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:38:46', '1'),
(6, 2, 'admin', 4, 'Condition improved, recent orders were smoother.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:29:46', '0'),
(7, 3, 'admin', 1, 'Frequent cancellations. Caution advised for high-value orders.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:29:46', '0'),
(8, 3, 'staff', 2, 'Difficult to reach on mobile for delivery confirmations.', 'Active', '2026-01-09 23:29:46', '2026-01-09 23:29:46', '0'),
(9, 3, 'staff', 4, 'Good ', 'Active', '2026-01-09 23:34:11', '2026-01-09 23:34:11', '0');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_partners`
--

CREATE TABLE `delivery_partners` (
  `id` int NOT NULL,
  `partner_name` varchar(255) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `tracking_url_format` text,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_delete` tinyint(1) DEFAULT '0',
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `delivery_partners`
--

INSERT INTO `delivery_partners` (`id`, `partner_name`, `contact_person`, `email`, `phone`, `tracking_url_format`, `status`, `is_delete`, `added_date`, `added_by`, `updated_date`, `updated_by`) VALUES
(1, 'FedEx Express', 'John Doe', 'john.doe@fedex.com', '+1 555-0123', 'https://www.fedex.com/fedextrack/?trknbr={tracking_number}', 'Active', 0, '2026-01-08 00:08:20', NULL, NULL, NULL),
(2, 'DHL Global', 'Jane Smith', 'jane.smith@dhl.com', '+1 555-4567', 'https://www.dhl.com/en/express/tracking.html?AWB={tracking_number}', 'Active', 0, '2026-01-08 00:08:20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE `email_marketing` (
  `id` int NOT NULL,
  `campaign_name` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `target_audience` varchar(100) DEFAULT 'all',
  `scheduled_date` date DEFAULT NULL,
  `status` enum('Draft','Scheduled','Sent','Active','Inactive','Completed') DEFAULT 'Draft',
  `sent_count` int DEFAULT '0',
  `open_count` int DEFAULT '0',
  `click_count` int DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  `added_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `email_marketing`
--

INSERT INTO `email_marketing` (`id`, `campaign_name`, `subject`, `content`, `target_audience`, `scheduled_date`, `status`, `sent_count`, `open_count`, `click_count`, `is_delete`, `added_date`, `added_by`, `updated_date`, `updated_by`) VALUES
(1, 'Welcome Series', 'Welcome to our store!', '<p>Thank you for joining us...</p>', 'all', '2026-01-23', 'Sent', 1200, 450, 120, 0, '2026-01-07 23:32:08', 1, '2026-01-07 23:33:15', 1),
(2, 'Summer Sale 2025', 'Huge discounts inside!', '<p>Don\'t miss our summer special...</p>', 'customers', '2025-06-15', 'Scheduled', 0, 0, 0, 0, '2026-01-07 23:32:08', 1, NULL, NULL),
(3, 'Abandoned Cart', 'You left something behind', '<p>Complete your purchase now!</p>', 'inactive', NULL, 'Active', 85, 40, 15, 0, '2026-01-07 23:32:08', 1, NULL, NULL),
(4, 'Monthly Newsletter - June', 'What\'s new this month', '<p>Check out our latest products...</p>', 'all', NULL, 'Draft', 0, 0, 0, 0, '2026-01-07 23:32:08', 1, NULL, NULL),
(5, 'Feedback Request', 'We value your opinion', '<p>Tell us how we are doing...</p>', 'customers', NULL, 'Completed', 500, 200, 50, 0, '2026-01-07 23:32:08', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `faq_id` int NOT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`faq_id`, `question`, `answer`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'How can I track my order?', 'You can track your order by logging into your account and visiting the \"My Orders\" section. Once your order is shipped, you\'ll receive a tracking link via email or SMS.', '2025-03-23 16:22:46', 1, NULL, NULL, 'Active', '0'),
(2, 'What payment methods do you accept?', 'We accept various payment methods, including Credit/Debit Cards, UPI, Net Banking, PayPal, and Cash on Delivery (COD) (where available).', '2025-03-23 16:23:59', 1, '2025-03-23 16:24:08', 1, 'Inactive', '0');

-- --------------------------------------------------------

--
-- Table structure for table `group_master`
--

CREATE TABLE `group_master` (
  `group_master_id` int NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_master`
--

INSERT INTO `group_master` (`group_master_id`, `group_name`, `group_code`, `status`) VALUES
(1, 'Admin', 'Admin', 'Active'),
(2, 'AROM', 'AROM', 'Active'),
(5, 'Purchase', 'purchase', 'Active'),
(6, 'Sales', 'sales', 'Active'),
(7, 'Quality', 'quality', 'Active'),
(13, 'Super Admin', 'super_admin', 'Active'),
(14, 'Super Admin2', 'super_adminw', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `group_rights`
--

CREATE TABLE `group_rights` (
  `group_rights_id` int NOT NULL,
  `group_master_id` int NOT NULL,
  `menu_master_id` int NOT NULL,
  `list` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'No',
  `add` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `update` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `delete` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `export` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `import` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_rights`
--

INSERT INTO `group_rights` (`group_rights_id`, `group_master_id`, `menu_master_id`, `list`, `add`, `update`, `delete`, `export`, `import`) VALUES
(26, 1, 1, 'No', 'No', 'No', 'Yes', 'No', 'No'),
(27, 1, 2, 'Yes', 'No', 'Yes', 'No', 'No', 'No'),
(28, 1, 3, 'Yes', 'No', 'Yes', 'No', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `menu_category_id` int NOT NULL,
  `menu_category_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`menu_category_id`, `menu_category_code`, `menu_category_name`) VALUES
(1, 'user_managemnet', 'User Management'),
(2, 'purchase', 'Purchase');

-- --------------------------------------------------------

--
-- Table structure for table `menu_master`
--

CREATE TABLE `menu_master` (
  `menu_master_id` int NOT NULL,
  `menu_category_id` int NOT NULL,
  `diaplay_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_master`
--

INSERT INTO `menu_master` (`menu_master_id`, `menu_category_id`, `diaplay_name`, `url`, `status`) VALUES
(1, 1, 'User', 'user_list', 'Inactive'),
(2, 1, 'Group Master', 'group_master', 'Inactive'),
(3, 2, 'Sitemap', 'sitemap', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `shipping_address_json` text COLLATE utf8mb4_general_ci,
  `billing_address_json` text COLLATE utf8mb4_general_ci,
  `coupon_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `shipping_charge` decimal(10,2) DEFAULT '0.00',
  `tax_amount` decimal(10,2) DEFAULT '0.00',
  `net_amount` decimal(10,2) DEFAULT '0.00',
  `order_status` enum('pending','processing','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `payment_status` enum('Unpaid','Paid','Partially Paid','Partially Refunded','Refunded','Failed') COLLATE utf8mb4_general_ci DEFAULT 'Unpaid',
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_json`, `billing_address_json`, `coupon_id`, `total_amount`, `discount_amount`, `shipping_charge`, `tax_amount`, `net_amount`, `order_status`, `payment_status`, `payment_method`, `added_date`, `updated_date`) VALUES
(1, 1, '{\"name\":\"Aarav Patel\",\"address\":\"123 Silk St\",\"city\":\"Mumbai\",\"state\":\"Maharashtra\",\"zip\":\"400001\"}', NULL, NULL, '1200.00', '120.00', '50.00', '194.40', '1324.40', 'delivered', 'Paid', 'Credit Card', '2026-01-09 18:45:53', '2026-01-09 18:45:53'),
(2, 2, '{\"name\":\"Riya Sharma\",\"address\":\"456 Knit Rd\",\"city\":\"Pune\",\"state\":\"Maharashtra\",\"zip\":\"411001\"}', NULL, NULL, '2500.00', '125.00', '0.00', '427.50', '2802.50', 'shipped', 'Paid', 'PayPal', '2026-01-09 18:45:53', '2026-01-09 18:45:53'),
(3, 4, '{\"name\":\"Sneha Desai\",\"address\":\"789 Resin Ave\",\"city\":\"Surat\",\"state\":\"Gujarat\",\"zip\":\"395001\"}', NULL, NULL, '1800.00', '0.00', '100.00', '324.00', '2224.00', 'processing', 'Unpaid', 'COD', '2026-01-09 18:45:53', '2026-01-09 18:45:53'),
(4, 5, '{\"name\":\"Nikhil Singh\",\"address\":\"321 Craft Blvd\",\"city\":\"Jaipur\",\"state\":\"Rajasthan\",\"zip\":\"302001\"}', NULL, NULL, '850.00', '0.00', '50.00', '0.00', '900.00', 'pending', 'Failed', 'Razorpay', '2026-01-09 18:45:53', '2026-01-09 18:45:53'),
(5, 7, '{\"name\":\"Rahul Yadav\",\"address\":\"222 Jewel Ln\",\"city\":\"Indore\",\"state\":\"MP\",\"zip\":\"452001\"}', NULL, NULL, '1100.00', '110.00', '0.00', '0.00', '990.00', 'cancelled', 'Refunded', 'Credit Card', '2026-01-09 18:45:53', '2026-01-09 18:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `history_id` int NOT NULL,
  `order_id` int NOT NULL,
  `status_from` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_to` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_general_ci,
  `added_by` int DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`history_id`, `order_id`, `status_from`, `status_to`, `remarks`, `added_by`, `added_date`) VALUES
(1, 1, 'pending', 'delivered', 'Order completed successfully', NULL, '2026-01-09 18:45:53'),
(2, 2, 'pending', 'shipped', 'Package handed over to carrier', NULL, '2026-01-09 18:45:53'),
(3, 3, 'pending', 'processing', 'Order under review', NULL, '2026-01-09 18:45:53'),
(4, 5, 'pending', 'cancelled', 'Customer requested cancellation', NULL, '2026-01-09 18:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_name_at_order` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sku_at_order` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `tax_amount` decimal(10,2) DEFAULT '0.00',
  `final_price` decimal(10,2) DEFAULT '0.00',
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `product_name_at_order`, `sku_at_order`, `quantity`, `price`, `discount_amount`, `tax_amount`, `final_price`, `added_date`) VALUES
(1, 1, 1, 'Ocean Wave Resin Coasters', NULL, 1, '1200.00', '120.00', '194.40', '1274.40', '2026-01-09 18:45:53'),
(2, 2, 2, 'Pressed Flower Resin Tray', NULL, 1, '2500.00', '125.00', '427.50', '2802.50', '2026-01-09 18:45:53'),
(3, 3, 3, 'Glow-in-the-Dark Resin Pyramid', NULL, 1, '1800.00', '0.00', '324.00', '2124.00', '2026-01-09 18:45:53'),
(4, 4, 7, 'Amigurumi Crochet Bunny', NULL, 1, '850.00', '0.00', '0.00', '850.00', '2026-01-09 18:45:53'),
(5, 5, 23, 'Silk Thread Bangle Set', NULL, 1, '1100.00', '110.00', '0.00', '990.00', '2026-01-09 18:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `tracking_number` varchar(100) NOT NULL,
  `carrier_name` varchar(100) DEFAULT NULL,
  `current_status` enum('Dispatched','In Transit','Out for Delivery','Delivered','Returned') DEFAULT 'Dispatched',
  `last_location` varchar(255) DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`id`, `order_id`, `tracking_number`, `carrier_name`, `current_status`, `last_location`, `estimated_delivery`, `is_delete`, `added_date`, `added_by`, `updated_date`, `updated_by`) VALUES
(1, 'ORD-2024-0001', 'FEDEX123456', 'FedEx', 'In Transit', 'Los Angeles, CA', '2024-01-15', 0, '2026-01-08 00:11:09', NULL, NULL, NULL),
(2, 'ORD-2024-0002', 'DHL789012', 'DHL', 'Out for Delivery', 'New York, NY', '2024-01-10', 0, '2026-01-08 00:11:09', NULL, NULL, NULL),
(3, 'ORD-2024-0003', 'UPS345678', 'UPS', 'Delivered', 'Chicago, IL', '2024-01-08', 0, '2026-01-08 00:11:09', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `payment_method` enum('credit_card','paypal','bank_transfer','cash_on_delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payment_gateway` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway_order_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway_transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway_response` text COLLATE utf8mb4_general_ci,
  `error_message` text COLLATE utf8mb4_general_ci,
  `paid_date` datetime DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_gateway`, `gateway_order_id`, `gateway_transaction_id`, `gateway_response`, `error_message`, `paid_date`, `amount`, `payment_status`, `transaction_id`, `added_date`) VALUES
(1, 1, 'credit_card', 'Stripe', NULL, 'st_9988776655', NULL, NULL, '2026-01-10 00:15:53', '1324.40', 'completed', 'TXN_RD_998877', '2026-01-09 18:45:53'),
(2, 2, 'paypal', 'PayPal', NULL, 'pp_5544332211', NULL, NULL, '2026-01-10 00:15:53', '2802.50', 'completed', 'PAY-PP-554433', '2026-01-09 18:45:53'),
(3, 3, 'cash_on_delivery', NULL, NULL, NULL, NULL, NULL, NULL, '2224.00', 'pending', NULL, '2026-01-09 18:45:53'),
(4, 4, 'credit_card', 'Razorpay', NULL, 'rzp_111222333', NULL, NULL, NULL, '900.00', 'failed', 'TXN_FL_111222', '2026-01-09 18:45:53'),
(5, 5, 'credit_card', 'Stripe', NULL, 'st_444555666', NULL, NULL, '2026-01-10 00:15:53', '990.00', 'completed', 'TXN_RF_444555', '2026-01-09 18:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_percentage` decimal(5,2) DEFAULT '0.00',
  `is_gst_applicable` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `gst_percentage` decimal(5,2) DEFAULT '0.00',
  `added_date` timestamp NULL DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `category_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `added_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `detail`, `price`, `discount_percentage`, `is_gst_applicable`, `gst_percentage`, `added_date`, `updated_date`, `category_id`, `brand_id`, `stock_quantity`, `added_by`, `updated_by`, `status`, `is_delete`) VALUES
(1, 'Ocean Resin Coaster', 'cover.png', 'Handcrafted ocean-themed resin coaster with real sand.', '120.00', '0.00', 'No', '0.00', NULL, NULL, 1, 1, 1, NULL, NULL, 'Active', '0'),
(2, 'Crochet Dino Toy', '5ba39f8dcef881124e5de3e451fa913f.jpg', 'Cute green amigurumi crochet dinosaur toy.', '45.00', '45.00', 'Yes', '10.00', NULL, '2026-01-09 18:29:36', 2, 2, 100, NULL, NULL, 'Active', '0'),
(3, 'Personalized Wood Frame', 'cover.png', 'Custom laser-engraved wooden photo frame.', '85.00', '0.00', 'No', '0.00', NULL, NULL, 3, 3, 100, NULL, NULL, 'Active', '0'),
(4, 'Macrame Wall Hanging', 'cover.png', 'Bohemian style cotton rope wall hanging.', '150.00', '0.00', 'No', '0.00', NULL, NULL, 4, 4, 100, NULL, NULL, 'Active', '0'),
(5, 'Crystal Amethyst Bracelet', 'cover.png', 'Elegant silver bracelet with amethyst beads.', '60.00', '0.00', 'No', '0.00', NULL, NULL, 5, 5, 100, NULL, NULL, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `product_attribute_id` int NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `attribute_id` int DEFAULT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`product_attribute_id`, `product_id`, `attribute_id`, `attribute_value`, `added_date`, `added_by`, `status`, `is_delete`) VALUES
(1, 1, 1, 'Resin', NULL, NULL, 'Active', '0'),
(2, 1, 2, 'Ocean Blue', NULL, NULL, 'Active', '0'),
(5, 3, 1, 'Oak Wood', NULL, NULL, 'Active', '0'),
(6, 4, 1, 'Cotton Rope', NULL, NULL, 'Active', '0'),
(7, 5, 5, 'Minimalist', NULL, NULL, 'Active', '0'),
(11, 2, 4, '500', '2026-01-09 23:59:36', 1, 'Active', '0'),
(12, 2, 2, 'Red', '2026-01-09 23:59:36', 1, 'Active', '0'),
(13, 2, 1, 'Cotton Yarn', '2026-01-09 23:59:36', 1, 'Active', '0'),
(14, 2, 3, 'Small', '2026-01-09 23:59:36', 1, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_cover` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `display_order` int DEFAULT '0',
  `added_date` datetime DEFAULT NULL,
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_path`, `is_cover`, `display_order`, `added_date`, `is_delete`) VALUES
(1, 1, 'cover.png', '1', 0, NULL, '0'),
(2, 2, 'cover.png', '0', 0, NULL, '0'),
(3, 3, 'cover.png', '1', 0, NULL, '0'),
(4, 4, 'cover.png', '1', 0, NULL, '0'),
(5, 5, 'cover.png', '1', 0, NULL, '0'),
(6, 2, '2324d453f0435ce6a9349cb82161d09f.jpg', '0', 0, '2026-01-09 14:30:18', '0'),
(7, 2, '5ba39f8dcef881124e5de3e451fa913f.jpg', '1', 1, '2026-01-09 14:30:18', '0');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `review_id` int NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `reviewer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  `added_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`review_id`, `product_id`, `reviewer_name`, `email`, `rating`, `comment`, `status`, `added_date`, `is_delete`) VALUES
(1, 1, 'Charlie Brown', 'charlie@example.com', 1, 'Average experience. The product is okay but could be better.', 'Approved', '2026-01-01 14:43:39', '0'),
(2, 1, 'Diana Prince', 'diana@example.com', 5, 'A bit smaller than expected, but the quality makes up for it.', 'Pending', '2025-12-23 14:43:39', '0'),
(3, 1, 'Alice Johnson', 'alice@example.com', 4, 'Sturdy and well-made. Will definitely buy again.', 'Rejected', '2025-12-14 14:43:39', '0'),
(4, 1, 'Fiona Gallagher', 'fiona@example.com', 3, 'A bit smaller than expected, but the quality makes up for it.', 'Approved', '2026-01-04 14:43:39', '0'),
(5, 1, 'Alice Johnson', 'alice@example.com', 3, 'Sturdy and well-made. Will definitely buy again.', 'Approved', '2025-12-29 14:43:39', '0'),
(6, 2, 'Julia Roberts', 'julia@example.com', 3, 'A bit smaller than expected, but the quality makes up for it.', 'Approved', '2026-01-07 14:43:39', '0'),
(7, 2, 'Ethan Hunt', 'ethan@example.com', 5, 'Highly recommended! The finish is superb.', 'Pending', '2025-12-12 14:43:39', '0'),
(8, 2, 'Fiona Gallagher', 'fiona@example.com', 5, 'Highly recommended! The finish is superb.', 'Rejected', '2026-01-07 14:43:39', '0'),
(9, 2, 'Ian McKellen', 'ian@example.com', 4, 'Sturdy and well-made. Will definitely buy again.', 'Approved', '2025-12-28 14:43:40', '0'),
(10, 2, 'Hannah Montana', 'hannah@example.com', 4, 'Beautifully crafted. Perfect for gifting.', 'Approved', '2025-12-11 14:43:40', '0'),
(11, 3, 'Julia Roberts', 'julia@example.com', 3, 'Average experience. The product is okay but could be better.', 'Approved', '2026-01-02 14:43:40', '0'),
(12, 3, 'George Costanza', 'george@example.com', 2, 'Not worth the price. Expected more based on the description.', 'Pending', '2025-12-10 14:43:40', '0'),
(13, 3, 'George Costanza', 'george@example.com', 4, 'One of the best purchases I\'ve made recently!', 'Rejected', '2025-12-17 14:43:40', '0'),
(14, 3, 'Charlie Brown', 'charlie@example.com', 3, 'Absolutely love this product! The quality is amazing.', 'Rejected', '2026-01-07 14:43:40', '0'),
(15, 3, 'Ethan Hunt', 'ethan@example.com', 5, 'Sturdy and well-made. Will definitely buy again.', 'Approved', '2025-12-14 14:43:40', '0'),
(16, 4, 'George Costanza', 'george@example.com', 4, 'A bit smaller than expected, but the quality makes up for it.', 'Approved', '2025-12-20 14:43:40', '0'),
(17, 4, 'Charlie Brown', 'charlie@example.com', 3, 'Good value for money. Handled with care.', 'Pending', '2025-12-23 14:43:40', '0'),
(18, 4, 'Alice Johnson', 'alice@example.com', 4, 'Beautifully crafted. Perfect for gifting.', 'Approved', '2026-01-08 14:43:40', '0'),
(19, 4, 'Julia Roberts', 'julia@example.com', 3, 'Sturdy and well-made. Will definitely buy again.', 'Approved', '2025-12-16 14:43:40', '0'),
(20, 4, 'Alice Johnson', 'alice@example.com', 3, 'Not worth the price. Expected more based on the description.', 'Approved', '2026-01-04 14:43:40', '0'),
(21, 5, 'Diana Prince', 'diana@example.com', 3, 'Absolutely love this product! The quality is amazing.', 'Approved', '2025-12-15 14:43:40', '0'),
(22, 5, 'Alice Johnson', 'alice@example.com', 5, 'A bit smaller than expected, but the quality makes up for it.', 'Pending', '2025-12-29 14:43:40', '0'),
(23, 5, 'Ian McKellen', 'ian@example.com', 4, 'Highly recommended! The finish is superb.', 'Rejected', '2025-12-13 14:43:40', '0'),
(24, 5, 'George Costanza', 'george@example.com', 3, 'Not worth the price. Expected more based on the description.', 'Approved', '2026-01-07 14:43:40', '0'),
(25, 5, 'Ethan Hunt', 'ethan@example.com', 4, 'Highly recommended! The finish is superb.', 'Approved', '2025-12-31 14:43:40', '0');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `refund_id` int NOT NULL,
  `order_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `refund_status` enum('Requested','Processing','Completed','Failed') COLLATE utf8mb4_general_ci DEFAULT 'Requested',
  `gateway_refund_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_general_ci,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`refund_id`, `order_id`, `payment_id`, `refund_amount`, `refund_status`, `gateway_refund_id`, `reason`, `added_date`) VALUES
(1, 5, 5, '990.00', 'Completed', NULL, 'Order Cancelled', '2026-01-09 18:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `added_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` int NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `carrier` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `min_delivery_days` int DEFAULT '0',
  `max_delivery_days` int DEFAULT '0',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_delete` tinyint(1) DEFAULT '0',
  `added_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `method_name`, `carrier`, `shipping_fee`, `min_delivery_days`, `max_delivery_days`, `status`, `is_delete`, `added_date`, `added_by`, `updated_date`, `updated_by`) VALUES
(1, 'Standard Shipping', 'FedEx', '5.00', 3, 5, 'Active', 0, '2026-01-07 23:57:44', NULL, NULL, NULL),
(2, 'Express Shipping', 'DHL', '15.00', 1, 2, 'Active', 0, '2026-01-07 23:57:44', NULL, NULL, NULL),
(3, 'Free Shipping', 'Local Post', '0.00', 7, 10, 'Active', 0, '2026-01-07 23:57:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `testimonials_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`testimonials_id`, `name`, `designation`, `message`, `image`, `rating`, `added_date`, `added_by`, `update_date`, `update_by`, `status`, `is_delete`) VALUES
(1, 'GAYATRI HEDAU', 'Head Of Department', 'testing', 'dc54e9179c4d0c97e90e3920dfcf21ef.jpg', 3, '2025-03-25 13:51:21', 1, '2025-03-25 16:33:54', 1, 'Inactive', '0'),
(2, 'Gayatri Narayan Hedau', 'Head Of Department', 'Working with Code Crafter has been an amazing experience! Their team is highly skilled, responsive, and delivered our website beyond expectations. Highly recommended!', 'ec676d5f83427b2b98685ecb05ad9b29.png', 5, '2025-03-25 16:32:57', 1, '2025-03-25 18:22:54', 1, 'Active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `traffic_logs`
--

CREATE TABLE `traffic_logs` (
  `id` int NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `request_uri` varchar(255) DEFAULT NULL,
  `referrer` text,
  `device_type` enum('Mobile','Desktop','Tablet') DEFAULT 'Desktop',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `traffic_logs`
--

INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referrer`, `device_type`, `timestamp`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:41:04'),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:41:04'),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:41:05'),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-10 17:41:08'),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-10 17:41:14'),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:43:36'),
(7, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:43:37'),
(8, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:43:37'),
(9, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:44:47'),
(10, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:44:47'),
(11, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:44:47'),
(12, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:45:46'),
(13, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:45:46'),
(14, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-10 17:45:46'),
(15, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/traffic_analytics', 'http://localhost/ecom/dashboard', 'Desktop', '2026-01-10 17:45:57'),
(16, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/traffic_analytics', 'http://localhost/ecom/traffic_analytics', 'Desktop', '2026-01-10 17:46:18'),
(17, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-11 11:32:34'),
(18, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-11 11:33:11'),
(19, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', '', 'Desktop', '2026-01-11 11:35:27'),
(20, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/traffic_analytics', 'http://localhost/ecom/dashboard', 'Desktop', '2026-01-11 11:35:40'),
(21, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/traffic_analytics', '', 'Desktop', '2026-01-11 11:51:20'),
(22, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/product_dashboard', 'http://localhost/ecom/traffic_analytics', 'Desktop', '2026-01-11 11:51:25'),
(23, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/categories', 'http://localhost/ecom/product_dashboard', 'Desktop', '2026-01-11 11:51:30'),
(24, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/user_list', 'http://localhost/ecom/categories', 'Desktop', '2026-01-11 11:52:13'),
(25, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-12 09:42:36'),
(26, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 10:53:16'),
(27, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-13 10:53:31'),
(28, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', '', 'Desktop', '2026-01-13 10:55:15'),
(29, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/traffic_analytics', 'http://localhost/ecom/dashboard', 'Desktop', '2026-01-13 10:56:12'),
(30, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/product_dashboard', 'http://localhost/ecom/traffic_analytics', 'Desktop', '2026-01-13 10:56:29'),
(31, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/product_list', 'http://localhost/ecom/product_dashboard', 'Desktop', '2026-01-13 10:56:31'),
(32, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/add_product', 'http://localhost/ecom/product_list', 'Desktop', '2026-01-13 10:56:35'),
(33, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/product_list', 'http://localhost/ecom/add_product', 'Desktop', '2026-01-13 10:56:41'),
(34, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/product_list', 'http://localhost/ecom/add_product', 'Desktop', '2026-01-13 10:56:48'),
(35, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:13:07'),
(36, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:13:28'),
(37, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/shipping-policy', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:13:51'),
(38, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/returns', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:13:52'),
(39, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/privacy-policy', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:13:54'),
(40, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:17:03'),
(41, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:17:03'),
(42, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:17:04'),
(43, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:17:16'),
(44, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:18:14'),
(45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:20:07'),
(46, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:20:08'),
(47, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:20:08'),
(48, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:21:10'),
(49, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register?', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:21:13'),
(50, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:21:18'),
(51, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 11:21:35'),
(52, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 11:21:41'),
(53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 11:21:46'),
(54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 11:21:50'),
(55, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-13 11:21:58'),
(56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', '', 'Desktop', '2026-01-13 11:22:01'),
(57, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:22:07'),
(58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register?', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:22:17'),
(59, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 11:24:10'),
(60, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:25:48'),
(61, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:25:49'),
(62, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:25:49'),
(63, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:26:43'),
(64, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:27:55'),
(65, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login?', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:28:36'),
(66, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login?', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:35:09'),
(67, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', 'http://localhost/ecom/shop/login?', 'Desktop', '2026-01-13 11:35:14'),
(68, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:36:04'),
(69, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:36:55'),
(70, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:36:55'),
(71, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:36:55'),
(72, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:16'),
(73, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:16'),
(74, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:17'),
(75, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:17'),
(76, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:17'),
(77, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:17'),
(78, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:17'),
(79, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:18'),
(80, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:37:18'),
(81, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:39:46'),
(82, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:39:46'),
(83, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:39:46'),
(84, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:39:46'),
(85, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:39:47'),
(86, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/register', '', 'Desktop', '2026-01-13 11:39:47'),
(87, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:41:18'),
(88, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:41:53'),
(89, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', '', 'Desktop', '2026-01-13 11:43:20'),
(90, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:43:30'),
(91, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:44:48'),
(92, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:44:54'),
(93, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:45:39'),
(94, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:46:20'),
(95, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:46:38'),
(96, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:46:38'),
(97, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/register', 'Desktop', '2026-01-13 11:46:38'),
(98, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/forgot-password', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:47:20'),
(99, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/forgot-password', 'Desktop', '2026-01-13 11:47:34'),
(100, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:47:44'),
(101, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:55:55'),
(102, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:55:55'),
(103, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:57:24'),
(104, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 11:57:28'),
(105, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 11:59:22'),
(106, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 11:59:25'),
(107, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/logout', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 11:59:32'),
(108, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 11:59:32'),
(109, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:59:38'),
(110, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 11:59:43'),
(111, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 11:59:50'),
(112, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:01:56'),
(113, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:02:52'),
(114, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:03:13'),
(115, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:04:11'),
(116, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:04:27'),
(117, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:04:36'),
(118, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:05:10'),
(119, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:07:12'),
(120, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:07:32'),
(121, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:08:51'),
(122, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:10:44'),
(123, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/track-order', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:11:04'),
(124, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 12:11:43'),
(125, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:11:48'),
(126, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:12:01'),
(127, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:14:07'),
(128, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:14:15'),
(129, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:14:28'),
(130, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:15:22'),
(131, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 12:15:28'),
(132, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 12:15:28'),
(133, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-13 12:15:40'),
(134, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/product_list', 'http://localhost/ecom/dashboard', 'Desktop', '2026-01-13 12:15:45'),
(135, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:17:26'),
(136, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:18:02'),
(137, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:18:21'),
(138, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:20:44'),
(139, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:20:45'),
(140, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:20:45'),
(141, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:20:52'),
(142, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:21:00'),
(143, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:21:00'),
(144, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:21:00'),
(145, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:21:01'),
(146, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:22:49'),
(147, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:23:44'),
(148, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:27:42'),
(149, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:28:15'),
(150, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:29:09'),
(151, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:30:18'),
(152, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:30:50'),
(153, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&name=GAYATRI+HEDAU&mobile=9874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:31:07'),
(154, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:33:14'),
(155, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:34:29'),
(156, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:34:29'),
(157, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:34:30'),
(158, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&name=GAYATRI+HEDAU&mobile=9874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:34:43'),
(159, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&name=GAYATRI+HEDAU&mobile=9874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:41:18'),
(160, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=&name=GAYATRI+HEDAU&mobile=9874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'Desktop', '2026-01-13 12:41:50'),
(161, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:42:05'),
(162, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:44:25'),
(163, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:44:26'),
(164, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:44:26'),
(165, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:45:18'),
(166, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:45:18'),
(167, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'http://localhost/ecom/shop/dashboard?address_id=2&mobile=09874563210&street=Plot+No+-+G-10+%2CVaishali+Nagar+Nagpur&city=Nagpur&state=Maharashtra&zip=440017', 'Desktop', '2026-01-13 12:45:19'),
(168, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:45:23'),
(169, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:42'),
(170, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:50'),
(171, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:53'),
(172, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:53'),
(173, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:53'),
(174, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:53'),
(175, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:54'),
(176, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:45:54'),
(177, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard?address_id=&receiver_name=GAYATRI+HEDAU&mobile=09874563210&street=Vaishali+Nagar&city=Nagpur&state=Maharashtra&zip=411037', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:48:03'),
(178, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:48:10'),
(179, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:04'),
(180, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:04'),
(181, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:04'),
(182, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:23'),
(183, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:34'),
(184, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:34'),
(185, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-13 12:50:35'),
(186, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:50:58'),
(187, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:51:23'),
(188, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:52:29'),
(189, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:54:00'),
(190, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 12:54:29'),
(191, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 12:54:32'),
(192, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 12:54:34'),
(193, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-13 12:54:40'),
(194, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-13 12:55:04'),
(195, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', '', 'Desktop', '2026-01-13 12:55:17'),
(196, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', '', 'Desktop', '2026-01-13 12:55:29'),
(197, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/login', 'Desktop', '2026-01-13 12:55:38'),
(198, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:55:46'),
(199, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:57:09'),
(200, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:57:20'),
(201, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:57:44'),
(202, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:20'),
(203, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:20'),
(204, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:20'),
(205, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:20'),
(206, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:28'),
(207, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:37'),
(208, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/dashboard', 'Desktop', '2026-01-13 12:58:43'),
(209, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/contact', 'http://localhost/ecom/shop', 'Desktop', '2026-01-13 12:58:46'),
(210, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-14 07:00:54'),
(211, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-14 07:00:58'),
(212, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', '', 'Desktop', '2026-01-14 07:01:04'),
(213, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-14 17:00:50'),
(214, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-14 17:00:58'),
(215, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-14 17:02:41'),
(216, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-14 17:02:43'),
(217, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-14 17:03:21'),
(218, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/login', 'Desktop', '2026-01-14 17:03:34'),
(219, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-14 17:03:40'),
(220, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:03:47'),
(221, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact?', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:03:54'),
(222, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', '', 'Desktop', '2026-01-14 17:03:58'),
(223, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/login', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:04:04'),
(224, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', 'http://localhost/ecommerce/shop/login', 'Desktop', '2026-01-14 17:04:16'),
(225, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:04:22');
INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referrer`, `device_type`, `timestamp`) VALUES
(226, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:04:54'),
(227, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:20:48'),
(228, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:25:51'),
(229, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:26:37'),
(230, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard?customer_name=Aarav+Patel&mobile_no=9876543210&profile_image=&gst_no=27ABCDE1234F1Z5&pan_no=ABCDE1234F&dob=2026-01-16&gender=Male&identity_details=&current_password=Test%40123&new_password=&confirm_password=', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:26:42'),
(231, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:26:58'),
(232, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:23'),
(233, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:23'),
(234, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:23'),
(235, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:23'),
(236, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard?customer_name=Aarav+Patel&mobile_no=9876543210&profile_image=&gst_no=27ABCDE1234F1Z5&pan_no=ABCDE1234F&dob=2026-01-16&gender=Male&identity_details=&current_password=Test%40123&new_password=&confirm_password=', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:28:32'),
(237, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:47'),
(238, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:58'),
(239, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:58'),
(240, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:58'),
(241, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:28:58'),
(242, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard?customer_name=Aarav+Patel&mobile_no=9876543210&profile_image=boy.jpg&gst_no=27ABCDE1234F1Z5&pan_no=ABCDE1234F&dob=2026-01-16&gender=Male&identity_details=Test&current_password=Test%40123&new_password=&confirm_password=', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:29:23'),
(243, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard?customer_name=Aarav+Patel&mobile_no=9876543210&profile_image=boy.jpg&gst_no=27ABCDE1234F1Z5&pan_no=ABCDE1234F&dob=2026-01-16&gender=Male&identity_details=Test&current_password=Test%40123&new_password=&confirm_password=', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:32:46'),
(244, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard?customer_name=Aarav+Patel&mobile_no=9876543210&profile_image=boy.jpg&gst_no=27ABCDE1234F1Z5&pan_no=ABCDE1234F&dob=2026-01-16&gender=Male&identity_details=Test&current_password=Test%40123&new_password=&confirm_password=', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:32:46'),
(245, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard?customer_name=Aarav+Patel&mobile_no=9876543210&profile_image=boy.jpg&gst_no=27ABCDE1234F1Z5&pan_no=ABCDE1234F&dob=2026-01-16&gender=Male&identity_details=Test&current_password=Test%40123&new_password=&confirm_password=', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:32:46'),
(246, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:32:53'),
(247, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:35:41'),
(248, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:35:44'),
(249, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:37:43'),
(250, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:37:43'),
(251, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 17:37:43'),
(252, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:37:53'),
(253, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:38:08'),
(254, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:43:15'),
(255, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:45:35'),
(256, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:45:53'),
(257, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:46:18'),
(258, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:46:28'),
(259, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:49:41'),
(260, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:49:41'),
(261, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:49:41'),
(262, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:49:42'),
(263, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:49:42'),
(264, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:49:42'),
(265, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:50:25'),
(266, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-14 17:52:20'),
(267, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/login', 'Desktop', '2026-01-14 17:52:29'),
(268, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-14 17:52:41'),
(269, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/login', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:52:47'),
(270, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', 'http://localhost/ecommerce/shop/login', 'Desktop', '2026-01-14 17:52:57'),
(271, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:53:03'),
(272, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:53:11'),
(273, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:53:25'),
(274, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:53:33'),
(275, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:53:33'),
(276, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:53:33'),
(277, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:53:34'),
(278, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 17:55:07'),
(279, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 17:55:12'),
(280, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:55:34'),
(281, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 17:55:52'),
(282, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:03:55'),
(283, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:05:48'),
(284, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:05:48'),
(285, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:05:48'),
(286, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:06:11'),
(287, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:06:11'),
(288, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:06:11'),
(289, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:06:12'),
(290, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:06:12'),
(291, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-14 18:07:59'),
(292, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-14 18:08:08'),
(293, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/track-order', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:08:17'),
(294, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/products', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:11:52'),
(295, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:15:08'),
(296, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:19:18'),
(297, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:19:19'),
(298, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:19:19'),
(299, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:19:40'),
(300, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 18:20:27'),
(301, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 18:20:30'),
(302, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/products', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:27:40'),
(303, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:27:51'),
(304, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:28:26'),
(305, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-14 18:29:11'),
(306, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:30:07'),
(307, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:30:07'),
(308, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:30:07'),
(309, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:30:08'),
(310, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:30:08'),
(311, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:31:08'),
(312, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:32:09'),
(313, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:32:39'),
(314, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:32:40'),
(315, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:32:40'),
(316, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 18:36:39'),
(317, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 18:36:39'),
(318, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', '', 'Desktop', '2026-01-14 18:36:39'),
(319, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-14 18:37:08'),
(320, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:00:15'),
(321, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-15 17:00:32'),
(322, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', '', 'Desktop', '2026-01-15 17:01:43'),
(323, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', '', 'Desktop', '2026-01-15 17:01:44'),
(324, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', '', 'Desktop', '2026-01-15 17:02:04'),
(325, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:02:09'),
(326, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', '', 'Desktop', '2026-01-15 17:02:10'),
(327, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/about', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:02:32'),
(328, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/products', 'http://localhost/ecom/shop/about', 'Desktop', '2026-01-15 17:02:40'),
(329, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/products', 'http://localhost/ecom/shop/about', 'Desktop', '2026-01-15 17:08:22'),
(330, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', '', 'Desktop', '2026-01-15 17:08:25'),
(331, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', '', 'Desktop', '2026-01-15 17:08:31'),
(332, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/categories', 'http://localhost/ecom/dashboard', 'Desktop', '2026-01-15 17:08:39'),
(333, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/products', 'http://localhost/ecom/shop/about', 'Desktop', '2026-01-15 17:11:31'),
(334, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/products', 'http://localhost/ecom/shop/about', 'Desktop', '2026-01-15 17:11:31'),
(335, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/products', 'http://localhost/ecom/shop/about', 'Desktop', '2026-01-15 17:11:31'),
(336, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:11:58'),
(337, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:13:49'),
(338, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:14:01'),
(339, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:14:24'),
(340, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:15:29'),
(341, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:15:29'),
(342, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:15:30'),
(343, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/update_categories', 'http://localhost/ecom/categories', 'Desktop', '2026-01-15 17:17:19'),
(344, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:17:22'),
(345, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/update_categories', 'http://localhost/ecom/categories', 'Desktop', '2026-01-15 17:17:27'),
(346, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/dashboard', '', 'Desktop', '2026-01-15 17:17:31'),
(347, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/login', '', 'Desktop', '2026-01-15 17:17:31'),
(348, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:17:54'),
(349, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:17:54'),
(350, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:18:30'),
(351, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:18:30'),
(352, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:18:30'),
(353, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:18:30'),
(354, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop/products', 'Desktop', '2026-01-15 17:22:31'),
(355, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:22:34'),
(356, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-15 17:22:35'),
(357, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/dashboard', 'http://localhost/ecom/login', 'Desktop', '2026-01-15 17:23:00'),
(358, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/banner', 'http://localhost/ecom/dashboard', 'Desktop', '2026-01-15 17:23:10'),
(359, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/banner', 'http://localhost/ecom/banner', 'Desktop', '2026-01-15 17:23:22'),
(360, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:23:42'),
(361, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop/products', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:23:56'),
(362, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:23:59'),
(363, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/banner', 'http://localhost/ecom/banner', 'Desktop', '2026-01-15 17:26:25'),
(364, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:26'),
(365, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:26'),
(366, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:26'),
(367, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:38'),
(368, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:39'),
(369, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:39'),
(370, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:34:39'),
(371, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:37:31'),
(372, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:37:53'),
(373, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:38:35'),
(374, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:38:36'),
(375, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/banner', 'http://localhost/ecom/banner', 'Desktop', '2026-01-15 17:39:58'),
(376, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:40:51'),
(377, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:40:51'),
(378, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/shop', 'http://localhost/ecom/shop', 'Desktop', '2026-01-15 17:40:51'),
(379, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:41:09'),
(380, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:41:28'),
(381, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:41:46'),
(382, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-15 17:41:50'),
(383, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/login', 'Desktop', '2026-01-15 17:41:54'),
(384, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 17:42:04'),
(385, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:42:15'),
(386, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:42:23'),
(387, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:42:26'),
(388, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:42:26'),
(389, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:43:12'),
(390, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:44:26'),
(391, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:45:36'),
(392, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:47:31'),
(393, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:47:50'),
(394, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:48:50'),
(395, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:49:28'),
(396, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:50:18'),
(397, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:50:22'),
(398, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:52:32'),
(399, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 17:53:40'),
(400, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:53:44'),
(401, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:56:14'),
(402, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:56:14'),
(403, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:56:15'),
(404, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 17:56:50'),
(405, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/about', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 17:57:58'),
(406, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/contact', 'http://localhost/ecommerce/shop/about', 'Desktop', '2026-01-15 17:58:01'),
(407, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/cart', 'http://localhost/ecommerce/shop/contact', 'Desktop', '2026-01-15 17:58:10'),
(408, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/login', 'http://localhost/ecommerce/shop/cart', 'Desktop', '2026-01-15 17:58:23'),
(409, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', 'http://localhost/ecommerce/shop/login', 'Desktop', '2026-01-15 17:58:34'),
(410, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 17:58:39'),
(411, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 17:59:11'),
(412, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 17:59:11'),
(413, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 17:59:11'),
(414, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 18:00:01'),
(415, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/dashboard', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 18:01:25'),
(416, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/products?category=12', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-15 18:01:49'),
(417, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/banner', 'Desktop', '2026-01-15 18:04:59'),
(418, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/products?category=12', 'http://localhost/ecommerce/shop/dashboard', 'Desktop', '2026-01-15 18:05:20'),
(419, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-15 18:05:50'),
(420, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:14:18'),
(421, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:14:25'),
(422, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:14:42'),
(423, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-15 18:14:45'),
(424, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/login', 'Desktop', '2026-01-15 18:14:56'),
(425, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/login', '', 'Desktop', '2026-01-15 18:20:10'),
(426, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/login', 'Desktop', '2026-01-15 18:20:14'),
(427, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:20:20'),
(428, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:21:24'),
(429, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:21:24'),
(430, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:21:24'),
(431, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:22:44'),
(432, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:23:18'),
(433, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:23:18'),
(434, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:23:18'),
(435, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/contact_us', '', 'Desktop', '2026-01-15 18:31:21'),
(436, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:31:33'),
(437, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:32:47'),
(438, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:32:49'),
(439, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', '', 'Desktop', '2026-01-15 18:32:49'),
(440, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:32:58'),
(441, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', '', 'Desktop', '2026-01-15 18:32:58'),
(442, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', '', 'Desktop', '2026-01-15 18:33:07'),
(443, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:33:26'),
(444, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', '', 'Desktop', '2026-01-15 18:33:26'),
(445, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:33:44'),
(446, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:34:14'),
(447, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/logout', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:34:48'),
(448, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:34:48'),
(449, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:34:57'),
(450, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:25'),
(451, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:44'),
(452, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:44'),
(453, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:44');
INSERT INTO `traffic_logs` (`id`, `ip_address`, `user_agent`, `request_uri`, `referrer`, `device_type`, `timestamp`) VALUES
(454, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:45'),
(455, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:45'),
(456, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:37:45'),
(457, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-15 18:40:53'),
(458, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', '', 'Desktop', '2026-01-15 18:40:53'),
(459, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', '', 'Desktop', '2026-01-15 18:40:56'),
(460, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/logout', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:41:03'),
(461, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 18:41:03'),
(462, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/secure_admin/login', 'Desktop', '2026-01-15 18:41:09'),
(463, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:48:06'),
(464, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:48:06'),
(465, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:48:07'),
(466, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-15 18:48:11'),
(467, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/products?category=17', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-15 19:20:22'),
(468, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/about', 'http://localhost/ecommerce/shop/products?category=17', 'Desktop', '2026-01-15 19:20:28'),
(469, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/product_list', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-15 19:20:35'),
(470, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/categories', 'http://localhost/ecommerce/product_list', 'Desktop', '2026-01-15 19:20:42'),
(471, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/orders', 'http://localhost/ecommerce/categories', 'Desktop', '2026-01-15 19:21:02'),
(472, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/banner', 'http://localhost/ecommerce/orders', 'Desktop', '2026-01-15 19:21:15'),
(473, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-16 07:52:54'),
(474, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop', '', 'Desktop', '2026-01-16 07:52:59'),
(475, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/shop/about', 'http://localhost/ecommerce/shop', 'Desktop', '2026-01-16 07:53:08'),
(476, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecom/login', '', 'Desktop', '2026-01-16 08:15:17'),
(477, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/secure_admin/login', '', 'Desktop', '2026-01-16 08:15:34'),
(478, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/secure_admin/login', 'Desktop', '2026-01-16 08:16:06'),
(479, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/secure_admin/login', 'Desktop', '2026-01-16 08:16:37'),
(480, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/secure_admin/login', 'Desktop', '2026-01-16 08:17:28'),
(481, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/inprogress_page', 'http://localhost/ecommerce/dashboard', 'Desktop', '2026-01-16 08:17:46'),
(482, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '/ecommerce/dashboard', 'http://localhost/ecommerce/inprogress_page', 'Desktop', '2026-01-16 08:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int NOT NULL,
  `user_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_role` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `added_date` datetime DEFAULT NULL,
  `added_by` int NOT NULL,
  `deleted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `unit_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `groups` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_attempt` int NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive','Block') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `user_email`, `user_role`, `user_name`, `user_password`, `added_date`, `added_by`, `deleted`, `unit_ids`, `groups`, `login_attempt`, `status`) VALUES
(1, 'mullaaarbaj10@gmail.com', 'Admin', 'Aarbaj Mulla', '$2y$10$tfZyKpLEje.gpj9qt3DsN.B6uakFSUKMWvGYCy37XZPMFUuF9t4jG', '2024-11-19 12:41:29', 3, NULL, '1,2', '1', 0, 'Active'),
(2, 'mullajuned0@gmail.com', 'Admin', 'Juned Mulla', '123456', '2024-11-19 12:42:40', 3, '0', '1,2', '1', 1, 'Active'),
(3, 'gayu@yopmail.com', 'Customer', 'Gayu Hedau', '$2y$10$B4E09.PiNu3i9R0IaIPo2u/FJYvaYrutKYpNNHL5d//RQlzMrdysS', '2026-01-13 16:57:53', 0, NULL, '', '', 0, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Active',
  `is_delete` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `added_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `product_id`, `status`, `is_delete`, `added_date`) VALUES
(1, 1, 1, 'Active', '0', '2026-01-10 16:30:52'),
(2, 1, 2, 'Active', '0', '2026-01-10 16:30:52'),
(3, 2, 3, 'Active', '0', '2026-01-10 16:30:52'),
(4, 2, 1, 'Inactive', '0', '2026-01-10 16:30:52'),
(5, 3, 4, 'Active', '0', '2026-01-10 16:30:52'),
(6, 3, 2, 'Active', '0', '2026-01-10 16:30:52'),
(7, 4, 5, 'Active', '0', '2026-01-10 16:30:52'),
(8, 4, 1, 'Active', '0', '2026-01-10 16:30:52'),
(9, 5, 3, 'Inactive', '0', '2026-01-10 16:30:52'),
(10, 5, 4, 'Active', '0', '2026-01-10 16:30:52'),
(11, 6, 1, 'Active', '0', '2026-01-10 16:30:52'),
(12, 6, 5, 'Active', '0', '2026-01-10 16:30:52'),
(13, 7, 2, 'Active', '0', '2026-01-10 16:30:52'),
(14, 7, 3, 'Active', '0', '2026-01-10 16:30:52'),
(15, 8, 4, 'Inactive', '0', '2026-01-10 16:30:52'),
(16, 8, 1, 'Active', '0', '2026-01-10 16:30:52'),
(17, 9, 5, 'Active', '0', '2026-01-10 16:30:52'),
(18, 9, 2, 'Active', '0', '2026-01-10 16:30:52'),
(19, 10, 3, 'Active', '0', '2026-01-10 16:30:52'),
(20, 10, 1, 'Active', '0', '2026-01-10 16:30:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`banners_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commmet`
--
ALTER TABLE `commmet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_setting`
--
ALTER TABLE `config_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_master`
--
ALTER TABLE `contact_us_master`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_added_date` (`added_date`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupons_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer_bank`
--
ALTER TABLE `customer_bank`
  ADD PRIMARY KEY (`bank_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer_name` (`customer_name`),
  ADD KEY `idx_customer_code` (`customer_code`);

--
-- Indexes for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer` (`customer_id`);

--
-- Indexes for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_marketing`
--
ALTER TABLE `email_marketing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `group_master`
--
ALTER TABLE `group_master`
  ADD PRIMARY KEY (`group_master_id`);

--
-- Indexes for table `group_rights`
--
ALTER TABLE `group_rights`
  ADD PRIMARY KEY (`group_rights_id`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`menu_category_id`);

--
-- Indexes for table `menu_master`
--
ALTER TABLE `menu_master`
  ADD PRIMARY KEY (`menu_master_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_order_status` (`order_status`),
  ADD KEY `idx_payment_status` (`payment_status`),
  ADD KEY `idx_added_date` (`added_date`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_product_name` (`product_name_at_order`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_brand` (`brand_id`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_is_delete` (`is_delete`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`product_attribute_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`testimonials_id`);

--
-- Indexes for table `traffic_logs`
--
ALTER TABLE `traffic_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_timestamp` (`timestamp`),
  ADD KEY `idx_request_uri` (`request_uri`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `attribute_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `banners_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commmet`
--
ALTER TABLE `commmet`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config_setting`
--
ALTER TABLE `config_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contact_us_master`
--
ALTER TABLE `contact_us_master`
  MODIFY `contact_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupons_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `address_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_bank`
--
ALTER TABLE `customer_bank`
  MODIFY `bank_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_partners`
--
ALTER TABLE `delivery_partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_marketing`
--
ALTER TABLE `email_marketing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `faq_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_master`
--
ALTER TABLE `group_master`
  MODIFY `group_master_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `group_rights`
--
ALTER TABLE `group_rights`
  MODIFY `group_rights_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `menu_category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_master`
--
ALTER TABLE `menu_master`
  MODIFY `menu_master_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `history_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `product_attribute_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `refund_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `testimonials_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `traffic_logs`
--
ALTER TABLE `traffic_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_bank`
--
ALTER TABLE `customer_bank`
  ADD CONSTRAINT `customer_bank_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_reviews`
--
ALTER TABLE `customer_reviews`
  ADD CONSTRAINT `fk_review_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `fk_product_reviews_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
