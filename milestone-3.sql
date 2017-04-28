-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2017 at 06:40 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `milestone-3`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `body`, `user_id`, `post_id`) VALUES
(46, '2017-04-26 01:09:03', '2017-04-26 01:09:03', 'cool pic!', 2, 90),
(47, '2017-04-26 01:12:33', '2017-04-26 01:12:33', 'hello simply me!', 1, 91),
(48, '2017-04-26 23:00:48', '2017-04-26 23:00:48', 'thanks', 1, 90),
(49, '2017-04-27 00:06:37', '2017-04-27 00:06:53', 'hi jonathan mwah', 4, 96),
(51, '2017-04-27 00:31:57', '2017-04-27 00:31:57', 'hello', 1, 94);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `like` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `created_at`, `updated_at`, `user_id`, `post_id`, `like`) VALUES
(38, '2017-04-25 23:44:52', '2017-04-25 23:44:52', 2, 63, 0),
(44, '2017-04-25 23:55:05', '2017-04-25 23:55:05', 1, 63, 0),
(46, '2017-04-26 00:16:48', '2017-04-26 00:16:48', 1, 64, 1),
(47, '2017-04-26 00:26:11', '2017-04-26 00:26:11', 2, 65, 1),
(53, '2017-04-27 00:44:37', '2017-04-27 00:44:41', 5, 96, 1),
(54, '2017-04-27 00:46:48', '2017-04-27 00:46:48', 5, 85, 1);

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
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2017_04_21_024306_create_posts_table', 1),
(5, '2017_04_24_012340_create_comments_table', 2),
(8, '2017_04_24_030100_create_photos_table', 3),
(10, '2017_04_25_024748_add_image_to_users', 4),
(11, '2017_04_25_030226_add_bio_to_users', 5),
(12, '2017_04_26_021326_create_likes_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `created_at`, `updated_at`, `photo`, `caption`, `user_id`, `post_id`) VALUES
(1, '2017-04-23 19:43:37', '2017-04-23 19:43:37', 'baler2.jpg', 'aaa', 1, 34),
(2, '2017-04-23 23:15:47', '2017-04-23 23:15:47', 'baler3.jpeg', 'aaa', 1, 35),
(3, '2017-04-23 23:16:28', '2017-04-23 23:16:28', 'baler3.jpeg', 'a', 1, 36),
(4, '2017-04-23 23:21:36', '2017-04-23 23:21:36', 'photo1.jpeg', 'zamba3', 1, 37),
(5, '2017-04-23 23:25:54', '2017-04-23 23:25:54', 'photo38.jpeg', 'df', 1, 38),
(6, '2017-04-23 23:32:00', '2017-04-23 23:32:00', 'photo39.jpeg', 'eyyy', 1, 39),
(7, '2017-04-23 23:56:40', '2017-04-23 23:56:40', 'photo40.jpeg', 'la union', 1, 40),
(8, '2017-04-23 23:57:30', '2017-04-23 23:57:30', 'photo42.jpeg', 'asdffg', 1, 42),
(9, '2017-04-23 23:59:50', '2017-04-23 23:59:50', 'photo43.jpeg', 'hhhh', 1, 43),
(10, '2017-04-24 00:47:38', '2017-04-24 00:47:38', 'photo45.jpeg', 'eyyy', 1, 45),
(11, '2017-04-24 17:14:36', '2017-04-24 17:14:36', 'photo51.jpeg', 'LU baby!', 2, 51),
(12, '2017-04-24 20:10:40', '2017-04-24 20:10:40', 'photo52.jpeg', 'yes', 1, 52),
(13, '2017-04-24 20:29:25', '2017-04-24 20:29:25', 'photo53.jpeg', 'surfboard', 1, 53),
(14, '2017-04-24 20:53:43', '2017-04-24 20:53:43', 'photo55.jpeg', 'cool!', 1, 55),
(15, '2017-04-25 00:34:55', '2017-04-25 00:34:55', 'photo60.jpeg', 'aaa', 1, 60),
(16, '2017-04-25 23:29:44', '2017-04-25 23:29:44', 'photo64.jpeg', 'winter', 1, 64),
(17, '2017-04-26 00:26:07', '2017-04-26 00:26:07', 'photo65.jpeg', 'codes', 2, 65),
(18, '2017-04-26 00:40:45', '2017-04-26 00:40:45', 'photo67.jpeg', 'coding is life!', 2, 67),
(19, '2017-04-26 00:48:14', '2017-04-26 00:48:14', 'photo69.png', '#codes', 2, 69),
(20, '2017-04-26 00:50:33', '2017-04-26 00:50:33', 'photo71.png', '#quotes #life', 2, 71),
(21, '2017-04-26 00:52:21', '2017-04-26 00:52:21', 'photo73.jpeg', '#surfing', 1, 73),
(22, '2017-04-26 00:53:14', '2017-04-26 00:53:14', 'photo75.jpeg', 'my dog winter.', 1, 75),
(23, '2017-04-26 00:54:32', '2017-04-26 00:54:32', 'photo77.jpeg', '#friends', 1, 77),
(24, '2017-04-26 00:56:42', '2017-04-26 00:56:42', 'photo79.jpeg', 'lazy monkey', 1, 79),
(25, '2017-04-26 00:58:10', '2017-04-26 00:58:10', 'photo84.jpeg', '#travel', 1, 84),
(26, '2017-04-26 00:58:52', '2017-04-26 00:58:52', 'photo86.jpeg', 'it''s a typewriter', 1, 86),
(27, '2017-04-26 00:59:03', '2017-04-26 00:59:03', 'photo87.jpeg', '#music', 1, 87),
(28, '2017-04-26 01:01:05', '2017-04-26 01:01:05', 'photo90.jpeg', NULL, 1, 90),
(29, '2017-04-27 00:02:20', '2017-04-27 00:02:20', 'photo93.jpeg', 'dog', 4, 93),
(30, '2017-04-27 00:02:49', '2017-04-27 00:02:49', 'photo94.jpeg', 'dog', 4, 94),
(31, '2017-04-27 00:04:51', '2017-04-27 00:04:51', 'photo96.jpeg', NULL, 4, 96),
(32, '2017-04-27 00:46:10', '2017-04-27 00:46:10', 'photo98.jpeg', '#life', 5, 98),
(33, '2017-04-27 00:46:25', '2017-04-27 00:46:25', 'photo99.jpeg', 'aaa', 5, 99);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `body`, `user_id`) VALUES
(66, '2017-04-26 00:40:23', '2017-04-26 00:40:23', 'hi, my name is simply me.', 2),
(67, '2017-04-26 00:40:45', '2017-04-26 00:40:45', NULL, 2),
(68, '2017-04-26 00:43:11', '2017-04-26 00:43:11', 'Located in the beautiful modern city of Abu Dhabi, the Sheikh Zayed Grand Mosque is one of the most important places of worship in the United Arab Emirates. Have you ever been?', 2),
(69, '2017-04-26 00:48:14', '2017-04-26 00:48:14', NULL, 2),
(70, '2017-04-26 00:48:56', '2017-04-26 00:48:56', '“The most important sentence in any article is the first one. If it doesn’t induce the reader to proceed to the second sentence, your article is dead. And if the second sentence doesn’t induce him to continue to the third sentence, it’s equally dead. Of such a progression of sentences, each tugging the reader forward until … safely hooked, a writer constructs that fateful unit: the lead.”\r\n— William Zinsser, On Writing Well', 2),
(71, '2017-04-26 00:50:33', '2017-04-26 00:50:33', NULL, 2),
(72, '2017-04-26 00:51:25', '2017-04-26 00:51:25', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1),
(73, '2017-04-26 00:52:21', '2017-04-26 00:52:21', NULL, 1),
(74, '2017-04-26 00:52:51', '2017-04-26 00:52:51', 'my third post! hello world, how are you?', 1),
(75, '2017-04-26 00:53:14', '2017-04-26 00:53:14', NULL, 1),
(77, '2017-04-26 00:54:32', '2017-04-26 00:54:32', NULL, 1),
(78, '2017-04-26 00:55:34', '2017-04-26 00:55:34', 'Bali became so popular because it has something for everyone. You''ll find all kinds of travelers there, from the backpackers who travel all across Southeast Asia, the spiritual yogis, luxury travelers, families, divers, surfers... They all come to Bali, mainly for one reason: It''s an excellent value for a good price, and the variety that Bali has to offer is unlike any other tourist destination in the world. But Bali isn''t perfect. The island has been overrun by mass tourism over the past years. The good news is that Bali is a huge island, it takes over three hours to drive from the southern tip to the North. You can still find less touristy spots in Bali and enjoy a laidback lifestyle far away from the crowds. Let me take you on a virtual trip. If you have no time to read the whole article, give me at least three minutes of your attention and check out our video above.', 1),
(79, '2017-04-26 00:56:42', '2017-04-26 00:56:42', NULL, 1),
(80, '2017-04-26 00:57:02', '2017-04-26 00:57:02', 'tuitt coding bootcamp almost done.', 1),
(82, '2017-04-26 00:57:22', '2017-04-26 01:12:07', 'The next time you’re stuck on how to open a blog post, roll out one of these eleven beauties, and you’ll be well on your way to clicking the publish button.', 1),
(84, '2017-04-26 00:58:10', '2017-04-26 00:58:10', NULL, 1),
(85, '2017-04-26 00:58:26', '2017-04-26 00:58:26', 'Darren, do you have any tips for creating more content for my blog? I have grown my blog to become reasonably successful but as it grows find myself with more and more requests and questions from readers that take me away from writing content. What should I do?”—William', 1),
(86, '2017-04-26 00:58:52', '2017-04-26 00:58:52', NULL, 1),
(88, '2017-04-26 00:59:41', '2017-04-26 00:59:41', 'hey what''s up hello', 1),
(90, '2017-04-26 01:01:05', '2017-04-26 01:01:05', NULL, 1),
(91, '2017-04-26 01:07:31', '2017-04-26 01:07:31', 'As a post opener, quotes are one of the best. When done well, they not only add credibility to your work, but they also form a solid foundation upon which you can build the rest of the article. For an example, just go back to the top of this post.', 2),
(94, '2017-04-27 00:02:49', '2017-04-27 00:02:49', NULL, 4),
(95, '2017-04-27 00:03:25', '2017-04-27 00:04:26', 'President Donald Trump''s strategy was announced after a special briefing for all 100 US senators.\r\nEarlier, the top US commander in the Pacific defended the deployment of an advanced missile defence system in South Korea.\r\nTensions have risen amid fears the North is planning new weapons tests.\r\n"The United States seeks stability and the peaceful denuclearisation of the Korean peninsula," said a joint statement issued by Secretary of State Rex Tillerson, Defense Secretary Jim Mattis and Director of National Intelligence Dan Coats.', 4),
(96, '2017-04-27 00:04:51', '2017-04-27 00:04:51', NULL, 4),
(98, '2017-04-27 00:46:10', '2017-04-27 00:46:10', NULL, 5),
(99, '2017-04-27 00:46:25', '2017-04-27 00:46:25', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `bio` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `image`, `bio`) VALUES
(1, 'regine blanco', 'regineannblanco@yahoo.com', '$2y$10$imQ5anV6UnLI6OfgSe.jpOhItNz/y2x93TUCpf8/4Aq5nX4tKoAOm', 'jHjJ4agCwC8ZnflsRYghbEMiYK5Gw69RRFEPmFRu8PTrZS1iFFHuODZRF6Y5', '2017-04-20 20:15:42', '2017-04-26 01:01:46', 'image1.jpeg', 'lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.'),
(2, 'simply me', 'simplyme@yahoo.com', '$2y$10$gvET0oU.ErsmkbB0G8uwDe4TuzBlbDnYsHXTBfGlSUcIkMBirxDFm', 'lilCIlOwwzWfhu695rKdqXOgWETZvsRZmxmc45ggxH9d9NXF4B4lWeCzEa1Z', '2017-04-21 00:04:01', '2017-04-26 00:32:38', 'image2.jpeg', 'i am simply billy, i love to code and read.'),
(3, 'billy arante', 'billy@yahoo.com', '$2y$10$YsZEeDICmIKR0TZj8hWlrOr03P3QVhq.y7D2Qlb6x.tp3lOGHArOG', 'eeOUhmRg8Xc05BxENplEJN7oAvJU7F701MA7kLSzT1k21F9WkqoYrg32kTpK', '2017-04-25 00:08:14', '2017-04-25 00:08:14', NULL, NULL),
(4, 'wo harmon', 'haru@gmail.com', '$2y$10$ur6nZWjnSyxpZGBDUhDBFuEE7Am9BTTbVQ7ogaVXRYpRNyg3Zasjy', 'zWg9YhdOpNaKJ06Ct4djZSYxXXbG3J2SaE3wIHFI1EddYIZoe6XcPvkE56TX', '2017-04-27 00:01:17', '2017-04-27 00:03:11', 'image4.jpeg', 'hi i''m haru'),
(5, 'Vince Pleyto', 'toohottohandle@gmail.com', '$2y$10$B6lmjEKR9JcanpkTxpc4W.PWWBGS/92RpKGfkr0tPM7Z41LxT4aue', 'VWvKWf74GFktKYFxJFKH0xLHLzhcFf8IlY3AUsQd3l2T5bS2I1LLZxRWYGuA', '2017-04-27 00:43:07', '2017-04-27 00:45:51', 'image5.jpeg', 'hi world');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
