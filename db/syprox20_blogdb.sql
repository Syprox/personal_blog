-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Гру 28 2024 р., 23:32
-- Версія сервера: 10.6.20-MariaDB-cll-lve
-- Версія PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `syprox20_blogdb`
--

-- --------------------------------------------------------

--
-- Структура таблиці `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'superuser'),
(2, 'content_manager');

-- --------------------------------------------------------

--
-- Структура таблиці `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 2, 1),
(46, 2, 2),
(47, 2, 3),
(48, 2, 4),
(49, 2, 5),
(50, 2, 6),
(51, 2, 7),
(52, 2, 8),
(53, 2, 9),
(54, 2, 10),
(55, 2, 11),
(56, 2, 12),
(57, 2, 13),
(58, 2, 14),
(59, 2, 15),
(60, 2, 16),
(61, 2, 17),
(62, 2, 18),
(63, 2, 19),
(64, 2, 20),
(65, 2, 37),
(66, 2, 38),
(67, 2, 39),
(68, 2, 40);

-- --------------------------------------------------------

--
-- Структура таблиці `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add attachment', 1, 'add_attachment'),
(2, 'Can change attachment', 1, 'change_attachment'),
(3, 'Can delete attachment', 1, 'delete_attachment'),
(4, 'Can view attachment', 1, 'view_attachment'),
(5, 'Can add category', 2, 'add_category'),
(6, 'Can change category', 2, 'change_category'),
(7, 'Can delete category', 2, 'delete_category'),
(8, 'Can view category', 2, 'view_category'),
(9, 'Can add post', 3, 'add_post'),
(10, 'Can change post', 3, 'change_post'),
(11, 'Can delete post', 3, 'delete_post'),
(12, 'Can view post', 3, 'view_post'),
(13, 'Can add comment', 4, 'add_comment'),
(14, 'Can change comment', 4, 'change_comment'),
(15, 'Can delete comment', 4, 'delete_comment'),
(16, 'Can view comment', 4, 'view_comment'),
(17, 'Can add image', 5, 'add_image'),
(18, 'Can change image', 5, 'change_image'),
(19, 'Can delete image', 5, 'delete_image'),
(20, 'Can view image', 5, 'view_image'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session'),
(45, 'Can add page', 12, 'add_page'),
(46, 'Can change page', 12, 'change_page'),
(47, 'Can delete page', 12, 'delete_page'),
(48, 'Can view page', 12, 'view_page');

-- --------------------------------------------------------

--
-- Структура таблиці `auth_user`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$OzjejAMYmfhdhDuYwRZHUW$TgR1wZwY0JkNctL5FzHpntDneYiSQbh/LCGek7Y5il0=', '2024-12-14 22:55:48.664887', 1, 'syprox20_syprox', '', '', 'cgartteacher@duck.com', 1, 1, '2024-12-14 22:37:24.402847'),
(2, 'pbkdf2_sha256$600000$qeLSHrq0yl2AFpQJBcJ4Jg$st0l4ky4XPv3aB8vRAgTRVmluHLLPsyHcGFQD6Sz3Xw=', NULL, 0, 'syprox', 'Сергій', 'Савін', 'cgartteacher@duck.com', 1, 1, '2024-12-15 05:36:40.000000');

-- --------------------------------------------------------

--
-- Структура таблиці `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `blog_category`
--

CREATE TABLE `blog_category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `blog_category`
--

INSERT INTO `blog_category` (`category_id`, `name`, `slug`) VALUES
(1, 'Персональний комп\'ютер', 'pc'),
(2, 'Веб-розробка', 'web'),
(3, 'Батик', 'batik'),
(4, 'Комп\'ютерна графіка', 'cg'),
(5, 'Цифрові інструменти', 'digital_tools'),
(6, 'Кольорознавство', 'color_science');

-- --------------------------------------------------------

--
-- Структура таблиці `blog_comment`
--

CREATE TABLE `blog_comment` (
  `comment_id` int(11) NOT NULL,
  `author` varchar(60) NOT NULL,
  `message` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `blog_comment`
--

INSERT INTO `blog_comment` (`comment_id`, `author`, `message`, `created_on`, `post_id`) VALUES
(1, 'Сергій', 'Дуже цікавий дописи', '2024-12-15 13:19:36.679232', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `blog_image`
--

CREATE TABLE `blog_image` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `blog_image_category`
--

CREATE TABLE `blog_image_category` (
  `id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `blog_page`
--

CREATE TABLE `blog_page` (
  `page_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `blog_page`
--

INSERT INTO `blog_page` (`page_id`, `title`, `slug`, `content`, `created_on`, `updated_on`, `status`, `author_id`) VALUES
(1, 'Про мене', 'about_me', '<p>Про мене</p>', '2024-12-21 19:04:41.525995', '2024-12-21 19:04:41.526011', 1, 2),
(2, 'Контакти', 'contacts', '<p>Пошта</p>', '2024-12-21 19:05:04.024656', '2024-12-21 19:05:04.024673', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `blog_post`
--

CREATE TABLE `blog_post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `blog_post`
--

INSERT INTO `blog_post` (`post_id`, `title`, `slug`, `content`, `created_on`, `updated_on`, `status`, `author_id`) VALUES
(1, 'Перший допис', 'first-post', '<p>Привіт!</p>\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo neque placeat officiis modi dolores molestiae illum exercitationem doloremque odio unde.</p>\r\n<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Error, vitae ad et reiciendis, impedit voluptatibus cumque quo facilis labore libero illo id perspiciatis aperiam optio obcaecati enim, accusantium numquam placeat itaque omnis reprehenderit. Quidem quae unde ratione blanditiis reiciendis. Explicabo, omnis odit at modi rerum ratione laboriosam officiis quo. Mollitia.</p><p><br></p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque, quis.</p>\r\n<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Minima debitis doloremque voluptatibus maiores voluptatum error, ipsum sint nemo inventore eveniet odit natus fugiat! Atque, non labore harum, nesciunt iure distinctio repudiandae nihil deserunt consequatur pariatur eligendi nemo incidunt sunt ducimus!</p>', '2024-12-15 06:00:23.962820', '2024-12-15 08:44:29.898713', 1, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `blog_post_category`
--

CREATE TABLE `blog_post_category` (
  `id` bigint(20) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `blog_post_category`
--

INSERT INTO `blog_post_category` (`id`, `post_id`, `category_id`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблиці `django_admin_log`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-12-15 05:19:50.189201', '1', 'Персональний комп\'ютер', 1, '[{\"added\": {}}]', 2, 1),
(2, '2024-12-15 05:22:24.664788', '2', 'Веб та інтернет', 1, '[{\"added\": {}}]', 2, 1),
(3, '2024-12-15 05:22:43.699235', '3', 'Батик', 1, '[{\"added\": {}}]', 2, 1),
(4, '2024-12-15 05:22:54.877933', '4', 'Комп\'ютерна графіка', 1, '[{\"added\": {}}]', 2, 1),
(5, '2024-12-15 05:25:18.665929', '5', 'Цифрові інструменти', 1, '[{\"added\": {}}]', 2, 1),
(6, '2024-12-15 05:26:17.958937', '2', 'Веб-розробка', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 2, 1),
(7, '2024-12-15 05:36:41.326866', '2', 'syprox', 1, '[{\"added\": {}}]', 9, 1),
(8, '2024-12-15 05:39:21.183176', '2', 'syprox', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\"]}}]', 9, 1),
(9, '2024-12-15 05:39:52.816407', '1', 'superuser', 1, '[{\"added\": {}}]', 8, 1),
(10, '2024-12-15 05:41:24.768463', '2', 'content_manager', 1, '[{\"added\": {}}]', 8, 1),
(11, '2024-12-15 05:41:41.885664', '2', 'syprox', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]', 9, 1),
(12, '2024-12-15 06:00:23.965582', '1', 'Перший допис', 1, '[{\"added\": {}}]', 3, 1),
(13, '2024-12-15 08:19:16.443606', '1', 'Перший допис', 2, '[{\"changed\": {\"fields\": [\"Content\"]}}]', 3, 1),
(14, '2024-12-15 08:29:40.057289', '1', 'Додавання календаря та експортування роботи.jpg', 1, '[{\"added\": {}}]', 1, 1),
(15, '2024-12-15 08:44:29.900400', '1', 'Перший допис', 2, '[]', 3, 1),
(16, '2024-12-21 19:04:41.526574', '1', 'Про мене', 1, '[{\"added\": {}}]', 12, 1),
(17, '2024-12-21 19:05:04.025116', '2', 'Контакти', 1, '[{\"added\": {}}]', 12, 1),
(18, '2024-12-22 14:13:51.343509', '5', 'Цифрові інструменти', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 2, 1),
(19, '2024-12-22 14:13:56.874447', '4', 'Комп\'ютерна графіка', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 2, 1),
(20, '2024-12-22 14:14:02.024565', '3', 'Батик', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 2, 1),
(21, '2024-12-22 14:14:10.658164', '2', 'Веб-розробка', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 2, 1),
(22, '2024-12-22 14:14:19.431915', '1', 'Персональний комп\'ютер', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 2, 1),
(23, '2024-12-22 14:25:54.729967', '6', 'Кольорознавство', 1, '[{\"added\": {}}]', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'django_summernote', 'attachment'),
(2, 'blog', 'category'),
(3, 'blog', 'post'),
(4, 'blog', 'comment'),
(5, 'blog', 'image'),
(6, 'admin', 'logentry'),
(7, 'auth', 'permission'),
(8, 'auth', 'group'),
(9, 'auth', 'user'),
(10, 'contenttypes', 'contenttype'),
(11, 'sessions', 'session'),
(12, 'blog', 'page');

-- --------------------------------------------------------

--
-- Структура таблиці `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-14 03:18:58.981468'),
(2, 'auth', '0001_initial', '2024-12-14 03:18:59.109528'),
(3, 'admin', '0001_initial', '2024-12-14 03:18:59.135819'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-12-14 03:18:59.142443'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-14 03:18:59.147227'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-12-14 03:18:59.165071'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-12-14 03:18:59.172815'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-12-14 03:18:59.182167'),
(9, 'auth', '0004_alter_user_username_opts', '2024-12-14 03:18:59.187664'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-12-14 03:18:59.198052'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-12-14 03:18:59.198979'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-12-14 03:18:59.205270'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-12-14 03:18:59.216202'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-12-14 03:18:59.227052'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-12-14 03:18:59.238892'),
(16, 'auth', '0011_update_proxy_permissions', '2024-12-14 03:18:59.245639'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-12-14 03:18:59.254289'),
(18, 'blog', '0001_initial', '2024-12-14 03:18:59.300598'),
(19, 'blog', '0002_rename_categories_post_category_alter_post_status', '2024-12-14 03:18:59.312796'),
(20, 'blog', '0003_image', '2024-12-14 03:18:59.317254'),
(21, 'django_summernote', '0001_initial', '2024-12-14 03:18:59.323822'),
(22, 'django_summernote', '0002_update-help_text', '2024-12-14 03:18:59.326767'),
(23, 'sessions', '0001_initial', '2024-12-14 03:18:59.334891'),
(24, 'django_summernote', '0003_alter_attachment_id', '2024-12-14 04:29:51.903795'),
(25, 'blog', '0002_alter_category_options_alter_comment_options_and_more', '2024-12-15 08:47:31.435964'),
(26, 'blog', '0003_page', '2024-12-21 19:04:06.389799'),
(27, 'blog', '0004_alter_comment_message_alter_page_content_and_more', '2024-12-21 19:04:06.404260'),
(28, 'blog', '0005_category_slug', '2024-12-22 14:11:55.990695'),
(29, 'blog', '0006_alter_category_slug', '2024-12-22 14:18:33.621375'),
(30, 'blog', '0007_alter_category_slug', '2024-12-22 14:24:27.838496'),
(31, 'blog', '0008_image_category_image_created_on_image_slug', '2024-12-24 06:42:00.945948'),
(32, 'blog', '0009_alter_image_slug', '2024-12-24 06:42:00.962517'),
(33, 'blog', '0010_alter_post_created_on', '2024-12-24 07:16:15.926091'),
(34, 'blog', '0011_alter_post_author_alter_post_category_and_more', '2024-12-24 07:16:15.971446'),
(35, 'blog', '0012_alter_post_created_on', '2024-12-24 07:16:15.979346'),
(36, 'blog', '0013_alter_category_options_alter_comment_options_and_more', '2024-12-24 07:16:16.111800'),
(37, 'blog', '0014_alter_comment_message_alter_page_content_and_more', '2024-12-24 07:16:16.133960');

-- --------------------------------------------------------

--
-- Структура таблиці `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zwhqssh3civ8volte3iarm3bdscsvpph', '.eJxVjEEOwiAQRe_C2hCgZRhcuvcMZGCoVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hZnEWWpx-t0jpkesO-E711mRqdV3mKHdFHrTLa-P8vBzu30GhXr51GjIoDyYmM1qHhmEyk7M0MjMSEjiTvQdS2g7OIXKC6L3jOGStEqN4fwDaEDfB:1tMb36:Jcc4dmx6-IhW5P3zbtvY8JJe2-ZnKVZI4-Pa4ZWUECo', '2024-12-28 22:55:48.665704');

-- --------------------------------------------------------

--
-- Структура таблиці `django_summernote_attachment`
--

CREATE TABLE `django_summernote_attachment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded` datetime(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп даних таблиці `django_summernote_attachment`
--

INSERT INTO `django_summernote_attachment` (`id`, `name`, `file`, `uploaded`) VALUES
(1, 'Додавання календаря та експортування роботи.jpg', 'django-summernote/2024-12-15/d828d3d2-4f2c-4638-9a7c-3ddc72ddb897.jpg', '2024-12-15 08:29:40.056515'),
(2, 'college-logo.png', 'django-summernote/2024-12-15/cd686594-3aa3-4d65-a8e2-6b9611c3c84f.png', '2024-12-15 08:31:41.700755'),
(3, 'college-logo.png', 'django-summernote/2024-12-15/58bead32-5604-4b52-a4b2-f5aaeb71178b.png', '2024-12-15 08:58:21.013580'),
(4, 'chrome_Lzoj.png', 'django-summernote/2024-12-16/18d0c906-e7fc-4ca4-a0c5-28e486c91102.png', '2024-12-16 22:44:07.038335');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Індекси таблиці `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`);

--
-- Індекси таблиці `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- Індекси таблиці `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Індекси таблиці `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  ADD KEY `auth_user_groups_group_id_97559544` (`group_id`);

--
-- Індекси таблиці `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  ADD KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`);

--
-- Індекси таблиці `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `blog_category_slug_92643dc5_uniq` (`slug`);

--
-- Індекси таблиці `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `blog_comment_post_id_580e96ef` (`post_id`);

--
-- Індекси таблиці `blog_image`
--
ALTER TABLE `blog_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_image_slug_bbc78326_uniq` (`slug`);

--
-- Індекси таблиці `blog_image_category`
--
ALTER TABLE `blog_image_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_image_category_image_id_category_id_8364aa4f_uniq` (`image_id`,`category_id`),
  ADD KEY `blog_image_category_image_id_cc439077` (`image_id`),
  ADD KEY `blog_image_category_category_id_400efddd` (`category_id`);

--
-- Індекси таблиці `blog_page`
--
ALTER TABLE `blog_page`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blog_page_author_id_e1087405` (`author_id`);

--
-- Індекси таблиці `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `blog_post_author_id_dd7a8485` (`author_id`);

--
-- Індекси таблиці `blog_post_category`
--
ALTER TABLE `blog_post_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_post_categories_post_id_category_id_ed4f1727_uniq` (`post_id`,`category_id`),
  ADD KEY `blog_post_categories_post_id_c34e7be1` (`post_id`),
  ADD KEY `blog_post_categories_category_id_2211dae5` (`category_id`);

--
-- Індекси таблиці `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Індекси таблиці `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Індекси таблиці `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Індекси таблиці `django_summernote_attachment`
--
ALTER TABLE `django_summernote_attachment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT для таблиці `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблиці `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблиці `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `blog_image`
--
ALTER TABLE `blog_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `blog_image_category`
--
ALTER TABLE `blog_image_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `blog_page`
--
ALTER TABLE `blog_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `blog_post_category`
--
ALTER TABLE `blog_post_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблиці `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблиці `django_summernote_attachment`
--
ALTER TABLE `django_summernote_attachment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
