-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 26, 2022 at 12:17 PM
-- Server version: 8.0.24
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xabarchi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cl_acc_validations`
--

CREATE TABLE `cl_acc_validations` (
  `id` int NOT NULL,
  `hash` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `json` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_ads`
--

CREATE TABLE `cl_ads` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `cover` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `company` varchar(120) NOT NULL DEFAULT '',
  `target_url` varchar(1200) NOT NULL DEFAULT '',
  `status` enum('orphan','active','inactive') NOT NULL DEFAULT 'orphan',
  `approved` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `audience` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `description` varchar(600) NOT NULL DEFAULT '',
  `cta` varchar(300) NOT NULL DEFAULT '',
  `budget` varchar(15) NOT NULL DEFAULT '0.00',
  `clicks` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_affiliate_payouts`
--

CREATE TABLE `cl_affiliate_payouts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `amount` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.00',
  `bonuses` int NOT NULL DEFAULT '0',
  `status` enum('pending','paid') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pending',
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_blocks`
--

CREATE TABLE `cl_blocks` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `profile_id` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_bookmarks`
--

CREATE TABLE `cl_bookmarks` (
  `id` int NOT NULL,
  `publication_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_chats`
--

CREATE TABLE `cl_chats` (
  `id` int NOT NULL,
  `user_one` int NOT NULL DEFAULT '0',
  `user_two` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_configs`
--

CREATE TABLE `cl_configs` (
  `id` int NOT NULL,
  `title` varchar(120) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `value` varchar(3000) NOT NULL DEFAULT '',
  `regex` varchar(120) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cl_configs`
--

INSERT INTO `cl_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES
(1, 'Theme', 'theme', 'default', ''),
(2, 'Site name', 'name', 'Xabarchi', '/^(.){0,50}$/'),
(3, 'Site title', 'title', 'Xabarchi', '/^(.){0,150}$/'),
(4, 'Site description', 'description', 'Xabarchi', '/^(.){0,350}$/'),
(5, 'SEO keywords', 'keywords', 'Xabarchi', ''),
(6, 'Site logo', 'site_logo', 'statics/img/logo.png', ''),
(7, 'Site favicon', 'site_favicon', 'statics/img/favicon.png', ''),
(8, 'Chat wallpaper', 'chat_wp', 'statics/img/chatwp/default.png', ''),
(9, 'Account activation', 'acc_validation', 'off', '/^(on|off)$/'),
(10, 'Default language', 'language', 'uzbek', ''),
(11, 'AS3 storage', 'as3_storage', 'off', '/^(on|off)$/'),
(12, 'E-mail address', 'email', 'admin@xabarchi.uz', ''),
(13, 'SMTP server', 'smtp_or_mail', 'smtp', '/^(smtp|mail)$/'),
(14, 'SMTP host', 'smtp_host', '', ''),
(15, 'SMTP password', 'smtp_password', '', '/^(.){0,50}$/'),
(16, 'SMTP encryption', 'smtp_encryption', 'tls', '/^(ssl|tls)$/'),
(17, 'SMTP port', 'smtp_port', '587', '/^[0-9]{1,11}$/'),
(18, 'SMTP username', 'smtp_username', '', ''),
(19, 'FFMPEG binary', 'ffmpeg_binary', 'core/libs/ffmpeg/ffmpeg', '/^(.){0,550}$/'),
(20, 'Giphy api', 'giphy_api_key', 'EEoFiCosGuyEIWlXnRuw4McTLxfjCrl1', '/^(.){0,150}$/'),
(21, 'Google analytics', 'google_analytics', '', ''),
(22, 'Facebook API ID', 'facebook_api_id', '', '/^(.){0,150}$/'),
(23, 'Facebook API Key', 'facebook_api_key', '', '/^(.){0,150}$/'),
(24, 'Twitter API ID', 'twitter_api_id', '', '/^(.){0,150}$/'),
(25, 'Twitter API Key', 'twitter_api_key', '', '/^(.){0,150}$/'),
(26, 'Google API ID', 'google_api_id', '', '/^(.){0,150}$/'),
(27, 'Google API Key', 'google_api_key', '', '/^(.){0,150}$/'),
(28, 'Script version', 'version', '1.0', ''),
(29, 'Last backup', 'last_backup', '0', ''),
(30, 'Sitemap last update', 'sitemap_update', '', ''),
(31, 'Affiliate bonus rate', 'aff_bonus_rate', '0.10', '/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(32, 'Affiliates System', 'affiliates_system', 'off', '/^(on|off)$/'),
(33, 'PayPal API Public key', 'paypal_api_key', '', ''),
(34, 'PayPal API Secret key', 'paypal_api_pass', '', ''),
(35, 'PayPal Payment Mode', 'paypal_mode', 'sandbox', '/^(sandbox|live)$/'),
(36, 'Site currency', 'site_currency', 'usd', ' \r\n/^([a-zA-Z]){2,7}$/'),
(37, 'Advertising system', 'advertising_system', 'off', '/^(on|off)$/'),
(38, 'Ad conversion rate', 'ad_conversion_rate', '0.05', '/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(39, 'Max post length', 'max_post_len', '600', '/^[0-9]{1,11}$/'),
(40, 'Google oAuth', 'google_oauth', 'on', '/^(on|off)$/'),
(41, 'Twitter oAuth', 'twitter_oauth', 'on', '/^(on|off)$/'),
(42, 'Facebook oAuth', 'facebook_oauth', 'on', '/^(on|off)$/'),
(43, 'Google ads (Horiz-banner)', 'google_ad_horiz', '', ''),
(44, 'Google ads (Vert-banner)', 'google_ad_vert', '', ''),
(45, 'Default country', 'country_id', '1', '/^[0-9]{1,11}$/'),
(46, 'Firebase API key', 'firebase_api_key', '', ''),
(47, 'Push notifications', 'push_notifs', 'on', '/^(on|off)$/'),
(48, 'Page update interval', 'page_update_interval', '30', '/^[0-9]{1,11}$/'),
(49, 'Chat update interval', 'chat_update_interval', '5', '/^[0-9]{1,11}$/'),
(50, 'Amazon S3 storage', 'as3_storage', 'off', '/^(on|off)$/'),
(51, 'AS3 bucket name', 'as3_bucket_name', '', ''),
(52, 'Amazon S3 API key', 'as3_api_key', '', ''),
(53, 'Amazon S3 API secret key', 'as3_api_secret_key', '', ''),
(54, 'AS3 bucket region', 'as3_bucket_region', 'us-east-1', ''),
(55, 'Max upload size', 'max_upload_size', '24000000', '/^[0-9]{1,11}$/'),
(56, 'Max post audio record length', 'post_arec_length', '30', '/^[0-9]{1,11}$/'),
(57, 'Wallet topup min amount', 'wallet_min_amount', '50', '/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(58, '', '', '', ''),
(59, 'Currency symbol position', 'currency_symbol_pos', 'after', '/^(before|after)$/'),
(60, 'Aff payout min amount', 'aff_payout_min', '50', '/^([0-9]{1,3}\\\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(61, 'Default color scheme', 'default_color_scheme', 'default', ''),
(62, 'Default BG color', 'default_bg_color', 'default', ''),
(63, 'Android app (Google play item URL)', 'android_app_url', '', ''),
(64, 'IOS app (App store item URL)', 'ios_app_url', '', ''),
(65, 'User registration system', 'user_signup', 'on', '/^(on|off)$/'),
(66, 'Cookie warning popup', 'cookie_warning_popup', 'on', '/^(on|off)$/'),
(67, 'Google reCAPTCHA', 'google_recaptcha', 'on', '/^(on|off)$/'),
(68, 'Google reCAPTCHA Sitekey', 'google_recap_key1', '', ''),
(69, 'Google reCAPTCHA Secret key', 'google_recap_key2', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cl_connections`
--

CREATE TABLE `cl_connections` (
  `id` int NOT NULL,
  `follower_id` int NOT NULL DEFAULT '0',
  `following_id` int NOT NULL DEFAULT '0',
  `status` enum('active','pending') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'active',
  `time` varchar(25) NOT NULL DEFAULT '25'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_hashtags`
--

CREATE TABLE `cl_hashtags` (
  `id` int NOT NULL,
  `posts` int NOT NULL DEFAULT '0',
  `tag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_invite_links`
--

CREATE TABLE `cl_invite_links` (
  `id` int NOT NULL,
  `code` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role` set('user','admin') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user',
  `mnu` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `expires_at` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `registered_users` int NOT NULL DEFAULT '0',
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_messages`
--

CREATE TABLE `cl_messages` (
  `id` int NOT NULL,
  `sent_by` int NOT NULL DEFAULT '0',
  `sent_to` int NOT NULL DEFAULT '0',
  `owner` int NOT NULL DEFAULT '0',
  `message` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `media_file` varchar(1000) NOT NULL DEFAULT '',
  `media_type` varchar(25) NOT NULL DEFAULT 'none',
  `seen` varchar(25) NOT NULL DEFAULT '0',
  `deleted_fs1` enum('Y','N') NOT NULL DEFAULT 'N',
  `deleted_fs2` enum('Y','N') NOT NULL DEFAULT 'N',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_notifications`
--

CREATE TABLE `cl_notifications` (
  `id` int NOT NULL,
  `notifier_id` int NOT NULL DEFAULT '0',
  `recipient_id` int NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `subject` varchar(32) NOT NULL DEFAULT 'none',
  `entry_id` int NOT NULL DEFAULT '0',
  `json` varchar(1200) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_posts`
--

CREATE TABLE `cl_posts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `publication_id` int NOT NULL DEFAULT '0',
  `type` enum('post','repost') NOT NULL DEFAULT 'post',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_profile_reports`
--

CREATE TABLE `cl_profile_reports` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `profile_id` int NOT NULL DEFAULT '0',
  `reason` int NOT NULL DEFAULT '0',
  `comment` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seen` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_publications`
--

CREATE TABLE `cl_publications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` enum('text','video','image','gif','poll','audio') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'text',
  `replys_count` int NOT NULL DEFAULT '0',
  `reposts_count` int NOT NULL DEFAULT '0',
  `likes_count` int NOT NULL DEFAULT '0',
  `status` enum('active','inactive','deleted','orphan') NOT NULL DEFAULT 'active',
  `thread_id` int NOT NULL DEFAULT '0',
  `target` enum('publication','pub_reply') NOT NULL DEFAULT 'publication',
  `og_data` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `poll_data` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `priv_wcs` enum('everyone','followers') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'everyone',
  `priv_wcr` enum('everyone','followers','mentioned') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'everyone',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_publikes`
--

CREATE TABLE `cl_publikes` (
  `id` int NOT NULL,
  `pub_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_pubmedia`
--

CREATE TABLE `cl_pubmedia` (
  `id` int NOT NULL,
  `pub_id` int NOT NULL DEFAULT '0',
  `type` enum('image','video','gif','audio') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `src` varchar(1200) NOT NULL DEFAULT '',
  `json_data` varchar(3000) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_pub_reports`
--

CREATE TABLE `cl_pub_reports` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `post_id` int NOT NULL DEFAULT '0',
  `reason` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `seen` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `comment` varchar(1210) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_sessions`
--

CREATE TABLE `cl_sessions` (
  `id` int NOT NULL,
  `session_id` varchar(120) NOT NULL DEFAULT '',
  `user_id` varchar(11) NOT NULL DEFAULT '0',
  `platform` varchar(15) NOT NULL DEFAULT 'web',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `lifespan` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cl_sessions`
--

INSERT INTO `cl_sessions` (`id`, `session_id`, `user_id`, `platform`, `time`, `lifespan`) VALUES
(1, '32a283134e0e9c536e25421858293f2d744a1cfa1645785909a2bed93dac00a5fbde01a7567057f9cc', '1', 'web', '1645785909', '1677321909');

-- --------------------------------------------------------

--
-- Table structure for table `cl_ui_langs`
--

CREATE TABLE `cl_ui_langs` (
  `id` int NOT NULL,
  `name` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `slug` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` set('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `is_rtl` set('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `is_native` set('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cl_ui_langs`
--

INSERT INTO `cl_ui_langs` (`id`, `name`, `slug`, `status`, `is_rtl`, `is_native`) VALUES
(1, 'English', 'english', '1', 'N', '1'),
(2, 'French', 'french', '0', 'N', '1'),
(3, 'German', 'german', '0', 'N', '1'),
(4, 'Italian', 'italian', '0', 'N', '1'),
(5, 'Russian', 'russian', '0', 'N', '1'),
(6, 'Portuguese', 'portuguese', '0', 'N', '1'),
(7, 'Spanish', 'spanish', '0', 'N', '1'),
(8, 'Turkish', 'turkish', '0', 'N', '1'),
(9, 'Dutch', 'dutch', '0', 'N', '1'),
(10, 'Ukraine', 'ukraine', '0', 'N', '1'),
(11, 'Arabic', 'arabic', '0', 'Y', '1'),
(13, 'Uzbek - o‘zbek', 'uzbek', '1', 'N', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cl_users`
--

CREATE TABLE `cl_users` (
  `id` int NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `fname` varchar(30) NOT NULL DEFAULT '',
  `lname` varchar(30) NOT NULL DEFAULT '',
  `about` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `email` varchar(60) NOT NULL DEFAULT '',
  `em_code` varchar(100) NOT NULL DEFAULT '',
  `email_conf_code` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(140) NOT NULL DEFAULT '',
  `joined` varchar(20) NOT NULL DEFAULT '0',
  `start_up` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'done',
  `last_active` varchar(20) NOT NULL DEFAULT '0',
  `ip_address` varchar(140) NOT NULL DEFAULT '0.0.0.0',
  `language` varchar(32) NOT NULL DEFAULT 'default',
  `avatar` varchar(300) NOT NULL DEFAULT 'upload/default/avatar.png',
  `cover` varchar(300) NOT NULL DEFAULT 'upload/default/cover.png',
  `cover_orig` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'upload/default/cover.png',
  `active` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `verified` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `posts` int NOT NULL DEFAULT '0',
  `followers` int NOT NULL DEFAULT '0',
  `following` int NOT NULL DEFAULT '0',
  `website` varchar(120) NOT NULL DEFAULT '',
  `country_id` int NOT NULL DEFAULT '1',
  `last_post` int NOT NULL DEFAULT '0',
  `last_swift` varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_ad` int NOT NULL DEFAULT '0',
  `profile_privacy` enum('everyone','followers') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'everyone',
  `follow_privacy` enum('everyone','approved') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'everyone',
  `contact_privacy` enum('everyone','followed') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'everyone',
  `index_privacy` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  `aff_bonuses` int NOT NULL DEFAULT '0',
  `wallet` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.00',
  `pnotif_token` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{"token": "","type": "android"}',
  `refresh_token` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `settings` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{"notifs":{"like":1,"subscribe":1,"subscribe_request":1,"subscribe_accept":1,"reply":1,"repost":1,"mention":1,"visit":1},"enotifs":{"like":1,"subscribe":1,"subscribe_request":1,"subscribe_accept":1,"reply":1,"repost":1,"mention":1,"visit":1}}',
  `display_settings` varchar(1200) NOT NULL DEFAULT '{"color_scheme": "default","background": "default"}',
  `swift` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `swift_update` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `info_file` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cl_users`
--

INSERT INTO `cl_users` (`id`, `username`, `fname`, `lname`, `about`, `gender`, `email`, `em_code`, `email_conf_code`, `password`, `joined`, `start_up`, `last_active`, `ip_address`, `language`, `avatar`, `cover`, `cover_orig`, `active`, `verified`, `admin`, `posts`, `followers`, `following`, `website`, `country_id`, `last_post`, `last_swift`, `last_ad`, `profile_privacy`, `follow_privacy`, `contact_privacy`, `index_privacy`, `aff_bonuses`, `wallet`, `pnotif_token`, `refresh_token`, `settings`, `display_settings`, `swift`, `swift_update`, `info_file`) VALUES
(1, 'administrator', 'Site', 'Admin', '', 'M', 'admin@xabarchi.uz', '', '0', '$2y$10$i48UQNlyG7GuTpyTPQwxIOAUmIqKDAHBnczXZX2ZvdzHvr3dIV2O2', '1645785875', 'done', '1645847508', '127.0.0.1', 'uzbek', 'upload/default/avatar.png', 'upload/default/cover.png', 'upload/default/cover.png', '1', '1', '1', 0, 0, 0, '', 1, 0, '', 0, 'everyone', 'everyone', 'everyone', 'Y', 0, '0.00', '{\"token\": \"\",\"type\": \"android\"}', '0', '{\"notifs\":{\"like\":1,\"subscribe\":1,\"subscribe_request\":1,\"subscribe_accept\":1,\"reply\":1,\"repost\":1,\"mention\":1,\"visit\":1},\"enotifs\":{\"like\":1,\"subscribe\":1,\"subscribe_request\":1,\"subscribe_accept\":1,\"reply\":1,\"repost\":1,\"mention\":1,\"visit\":1}}', '{\"color_scheme\": \"default\",\"background\": \"default\"}', NULL, '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `cl_verifications`
--

CREATE TABLE `cl_verifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `full_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `text_message` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `video_message` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `time` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cl_wallet_history`
--

CREATE TABLE `cl_wallet_history` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `operation` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `amount` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.00',
  `json_data` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cl_acc_validations`
--
ALTER TABLE `cl_acc_validations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_ads`
--
ALTER TABLE `cl_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_affiliate_payouts`
--
ALTER TABLE `cl_affiliate_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_blocks`
--
ALTER TABLE `cl_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_bookmarks`
--
ALTER TABLE `cl_bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_chats`
--
ALTER TABLE `cl_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_configs`
--
ALTER TABLE `cl_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_connections`
--
ALTER TABLE `cl_connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_hashtags`
--
ALTER TABLE `cl_hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_invite_links`
--
ALTER TABLE `cl_invite_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_messages`
--
ALTER TABLE `cl_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_notifications`
--
ALTER TABLE `cl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_posts`
--
ALTER TABLE `cl_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_profile_reports`
--
ALTER TABLE `cl_profile_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_publications`
--
ALTER TABLE `cl_publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_publikes`
--
ALTER TABLE `cl_publikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_pubmedia`
--
ALTER TABLE `cl_pubmedia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_pub_reports`
--
ALTER TABLE `cl_pub_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_sessions`
--
ALTER TABLE `cl_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_ui_langs`
--
ALTER TABLE `cl_ui_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_users`
--
ALTER TABLE `cl_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts` (`posts`);

--
-- Indexes for table `cl_verifications`
--
ALTER TABLE `cl_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_wallet_history`
--
ALTER TABLE `cl_wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cl_acc_validations`
--
ALTER TABLE `cl_acc_validations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_ads`
--
ALTER TABLE `cl_ads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_affiliate_payouts`
--
ALTER TABLE `cl_affiliate_payouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_blocks`
--
ALTER TABLE `cl_blocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_bookmarks`
--
ALTER TABLE `cl_bookmarks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_chats`
--
ALTER TABLE `cl_chats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_configs`
--
ALTER TABLE `cl_configs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `cl_connections`
--
ALTER TABLE `cl_connections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_hashtags`
--
ALTER TABLE `cl_hashtags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_invite_links`
--
ALTER TABLE `cl_invite_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_messages`
--
ALTER TABLE `cl_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_notifications`
--
ALTER TABLE `cl_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_posts`
--
ALTER TABLE `cl_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_profile_reports`
--
ALTER TABLE `cl_profile_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_publications`
--
ALTER TABLE `cl_publications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_publikes`
--
ALTER TABLE `cl_publikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_pubmedia`
--
ALTER TABLE `cl_pubmedia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_pub_reports`
--
ALTER TABLE `cl_pub_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_sessions`
--
ALTER TABLE `cl_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cl_ui_langs`
--
ALTER TABLE `cl_ui_langs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cl_users`
--
ALTER TABLE `cl_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cl_verifications`
--
ALTER TABLE `cl_verifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_wallet_history`
--
ALTER TABLE `cl_wallet_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
