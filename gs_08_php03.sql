-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-01-23 13:22:59
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gs_08_php03`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `like_table1`
--

CREATE TABLE `like_table1` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `todo_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `like_table1`
--

INSERT INTO `like_table1` (`id`, `user_id`, `todo_id`, `created_at`) VALUES
(4, 2, 11, '2025-01-18 14:55:20'),
(17, 1, 13, '2025-01-18 15:24:47'),
(18, 1, 15, '2025-01-18 15:44:47'),
(21, 1, 14, '2025-01-18 16:09:01'),
(25, 2, 10, '2025-01-18 16:09:14'),
(29, 2, 13, '2025-01-18 16:23:24'),
(30, 1, 10, '2025-01-23 21:19:43'),
(33, 1, 11, '2025-01-23 21:19:46');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table`
--

CREATE TABLE `todo_table` (
  `id` int(11) NOT NULL,
  `todo` varchar(128) NOT NULL,
  `deadline` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `todo_table`
--

INSERT INTO `todo_table` (`id`, `todo`, `deadline`, `created_at`, `updated_at`) VALUES
(6, 'test', '2024-12-18', '2024-12-26 17:53:48', '2024-12-26 17:53:48'),
(7, 'dddd', '2024-12-25', '2024-12-26 18:15:22', '2024-12-26 18:15:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_table_kadai`
--

CREATE TABLE `todo_table_kadai` (
  `id` int(11) NOT NULL,
  `todo` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `todo_table_kadai`
--

INSERT INTO `todo_table_kadai` (`id`, `todo`, `created_at`, `updated_at`, `image`, `title`) VALUES
(10, '今日は元気な\r\n雰囲気をしております\r\nｄｄｄｄ', '2024-12-26 19:40:32', '2024-12-29 10:36:31', 'uploads/factory06.jpg', '牛男'),
(11, 'これを基準にして\r\n製造をお願いします', '2024-12-26 19:46:59', '2024-12-26 20:02:08', 'uploads/delicious_cheese.jpg', 'チーズの状態'),
(13, 'めもめも', '2024-12-29 10:35:21', '2024-12-29 10:35:21', 'uploads/about_03.jpg', 'タイトル'),
(14, '発生しました', '2025-01-18 15:43:05', '2025-01-18 15:43:05', 'uploads/factory10.jpg', '工場不具合'),
(15, '教えるよ', '2025-01-18 15:44:37', '2025-01-18 15:44:37', 'uploads/course_02.jpg', 'いまでしょ');

-- --------------------------------------------------------

--
-- テーブルの構造 `users_table`
--

CREATE TABLE `users_table` (
  `id` int(12) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `users_table`
--

INSERT INTO `users_table` (`id`, `username`, `password`, `is_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'testuser01', '111111', 1, '2025-01-11 10:38:07', '2025-01-11 10:38:07', NULL),
(2, 'testuser02', '222222', 0, '2025-01-11 10:38:07', '2025-01-11 10:38:07', NULL),
(3, 'testuser03', '333333', 0, '2025-01-11 10:38:07', '2025-01-11 10:38:07', NULL),
(4, 'testuser04', '444444', 0, '2025-01-11 10:38:07', '2025-01-11 10:38:07', NULL);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `like_table1`
--
ALTER TABLE `like_table1`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table`
--
ALTER TABLE `todo_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `todo_table_kadai`
--
ALTER TABLE `todo_table_kadai`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `like_table1`
--
ALTER TABLE `like_table1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- テーブルの AUTO_INCREMENT `todo_table`
--
ALTER TABLE `todo_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `todo_table_kadai`
--
ALTER TABLE `todo_table_kadai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルの AUTO_INCREMENT `users_table`
--
ALTER TABLE `users_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
