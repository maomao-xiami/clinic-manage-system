-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2026-06-19 05:34:50
-- 服务器版本： 5.7.26
-- PHP 版本： 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `infirmary`
--

-- --------------------------------------------------------

--
-- 表的结构 `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '科室名称',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '科室编码',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '位置',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正常 0停用',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `address`, `phone`, `status`, `remark`, `created_at`, `updated_at`) VALUES
(1, '外科', '0856', '浙江省 温州市 鹿城区', '16836272521', 1, '无', '2026-06-14 00:52:36', '2026-06-14 00:52:36'),
(2, '外科', '0856', '浙江省 温州市 鹿城区', '16836272521', 1, '无', '2026-06-14 00:55:11', '2026-06-14 00:55:11'),
(3, '外科', '0856', '浙江省 温州市 鹿城区', '16836272521', 1, '无', '2026-06-14 01:02:58', '2026-06-14 01:02:58'),
(4, '外科', '0856', '浙江省 温州市 鹿城区', '16836272521', 1, '无', '2026-06-14 04:56:42', '2026-06-14 04:56:42');

-- --------------------------------------------------------

--
-- 表的结构 `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '医生姓名',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职称/岗位',
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属科室',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `phone`, `job`, `department`, `created_at`, `updated_at`) VALUES
(1, '小杜', '16836272521', '护士', '外科', '2026-06-14 03:01:19', '2026-06-14 03:01:19'),
(5, '小李', '19956720976', '护士', '内科', '2026-06-15 07:50:27', '2026-06-15 07:50:27'),
(3, '嘻嘻哈哈', '123455678910', '医生', '内科', '2026-06-14 07:41:25', '2026-06-14 07:41:25');

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '患者姓名',
  `prescription_id` bigint(20) UNSIGNED NOT NULL COMMENT '关联处方ID',
  `total_price` decimal(10,2) NOT NULL COMMENT '总金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1未缴费 2已缴费',
  `pay_date` date DEFAULT NULL COMMENT '缴费日期',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `inpatients`
--

CREATE TABLE `inpatients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '患者姓名',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `department_id` bigint(20) UNSIGNED NOT NULL COMMENT '科室ID',
  `doctor_id` bigint(20) UNSIGNED NOT NULL COMMENT '主治医生ID',
  `in_date` date NOT NULL COMMENT '入院日期',
  `out_date` date DEFAULT NULL COMMENT '出院日期',
  `illness` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '病情描述',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1住院 2已出院',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `inpatients`
--

INSERT INTO `inpatients` (`id`, `patient_name`, `phone`, `department_id`, `doctor_id`, `in_date`, `out_date`, `illness`, `status`, `created_at`, `updated_at`) VALUES
(1, '小明', '16836272521', 1, 2, '2026-06-16', '2026-06-27', '无', 1, '2026-06-14 08:42:22', '2026-06-14 08:42:22'),
(2, '小明', '12345678901', 2, 1, '2026-06-18', '2026-06-19', '无', 1, '2026-06-15 01:29:37', '2026-06-15 01:29:37');

-- --------------------------------------------------------

--
-- 表的结构 `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '药品名称',
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `expire` date NOT NULL COMMENT '有效期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `spec`, `stock`, `expire`, `created_at`, `updated_at`) VALUES
(1, '阿莫西林胶囊', '1', 1, '2026-06-19', '2026-06-14 02:03:16', '2026-06-14 02:03:16'),
(2, '哈哈哈哈哈哈', '6', 20, '2026-06-09', '2026-06-14 07:43:23', '2026-06-14 07:43:23'),
(3, '999感冒灵', '6', 20, '2026-06-15', '2026-06-15 03:06:03', '2026-06-15 03:06:03'),
(4, '999感冒灵', '6', 12, '2026-06-15', '2026-06-15 07:40:32', '2026-06-15 07:40:32');

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_06_14_072624_create_departments_table', 2),
(6, '2026_06_14_092826_create_patients_table', 3),
(7, '2026_06_14_095737_create_medicines_table', 4),
(8, '2026_06_14_101422_create_records_table', 5),
(9, '2026_06_14_105503_create_doctors_table', 6),
(10, '2026_06_14_135403_create_reserves_table', 7),
(11, '2026_06_14_150332_create_inpatients_table', 8),
(12, '2026_06_14_151408_create_prescriptions_table', 9),
(13, '2026_06_14_152253_create_fees_table', 10),
(14, '2026_06_14_153036_create_roles_table', 11);

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '患者姓名',
  `sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1男 2女',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住址',
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `patients`
--

INSERT INTO `patients` (`id`, `name`, `sex`, `age`, `phone`, `address`, `id_card`, `remark`, `created_at`, `updated_at`) VALUES
(1, '小明', 2, 20, '12345678901', '贵州', '522427355135167890', '无', '2026-06-14 01:39:58', '2026-06-15 16:15:08'),
(4, '哈哈', 1, 10, '167785895478', '贵州', '533461789045671345', '无', '2026-06-15 07:51:14', '2026-06-15 07:51:14'),
(3, '小李', 1, 21, '16725671789', '铜仁', '366784678918902789', '无', '2026-06-14 01:44:12', '2026-06-14 01:44:12');

-- --------------------------------------------------------

--
-- 表的结构 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '患者姓名',
  `department_id` bigint(20) UNSIGNED NOT NULL COMMENT '科室ID',
  `doctor_id` bigint(20) UNSIGNED NOT NULL COMMENT '开方医生ID',
  `medicine_id` bigint(20) UNSIGNED NOT NULL COMMENT '药品ID',
  `num` int(11) NOT NULL COMMENT '数量',
  `usage` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用法用量',
  `prescribe_date` date NOT NULL COMMENT '开方日期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `patient_name`, `department_id`, `doctor_id`, `medicine_id`, `num`, `usage`, `prescribe_date`, `created_at`, `updated_at`) VALUES
(1, '小李', 1, 2, 1, 1, '无', '2026-06-16', '2026-06-14 08:51:39', '2026-06-14 08:51:39'),
(2, '小花', 1, 2, 2, 1, '无', '2026-06-17', '2026-06-14 08:52:22', '2026-06-14 08:52:22'),
(3, '小花', 1, 1, 2, 1, '无', '2026-06-17', '2026-06-14 09:04:27', '2026-06-14 09:04:27');

-- --------------------------------------------------------

--
-- 表的结构 `records`
--

CREATE TABLE `records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '患者姓名',
  `visit_time` datetime NOT NULL COMMENT '就诊时间',
  `symptom` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '症状描述',
  `medicine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '开具药品',
  `plan` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处置方案',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `records`
--

INSERT INTO `records` (`id`, `patient_name`, `visit_time`, `symptom`, `medicine`, `plan`, `created_at`, `updated_at`) VALUES
(1, '小花', '2026-06-14 21:24:00', '肚子不舒服', '止疼药', '吃药', '2026-06-14 02:25:23', '2026-06-14 02:25:23');

-- --------------------------------------------------------

--
-- 表的结构 `reserves`
--

CREATE TABLE `reserves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '患者姓名',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `department_id` bigint(20) UNSIGNED NOT NULL COMMENT '挂号科室ID',
  `doctor_id` bigint(20) UNSIGNED NOT NULL COMMENT '挂号医生ID',
  `reserve_date` date NOT NULL COMMENT '预约日期',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `reserves`
--

INSERT INTO `reserves` (`id`, `patient_name`, `phone`, `department_id`, `doctor_id`, `reserve_date`, `remark`, `created_at`, `updated_at`) VALUES
(2, '小花', '16836272521', 2, 2, '2026-06-16', '无', '2026-06-14 08:29:33', '2026-06-14 08:29:33'),
(10, '小明', '18818270544', 2, 3, '2026-06-17', '无', '2026-06-15 07:49:36', '2026-06-15 07:49:36'),
(5, '小花', '16836272521', 4, 1, '2026-06-16', '无', '2026-06-15 06:22:40', '2026-06-15 06:22:40'),
(6, '小李', '16836272521', 1, 5, '2026-06-16', '无误', '2026-06-15 06:23:05', '2026-06-15 15:59:51'),
(7, '小李', '16836272521', 3, 3, '2026-06-16', '无', '2026-06-15 06:34:53', '2026-06-15 06:34:53');

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `permission` text COLLATE utf8mb4_unicode_ci COMMENT '权限标识逗号分隔',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `permission`, `remark`, `created_at`, `updated_at`) VALUES
(1, '医生', 'index,patient,doctor,department,register,hospital,prescription,drug,fee,record', '医务室坐诊医生，负责接诊、开具处方、查看药品与就诊记录', '2026-06-15 17:08:15', '2026-06-15 17:08:15'),
(2, '系统管理员', 'index,patient,doctor,department,register,hospital,prescription,drug,fee,record,user,role,system', '系统最高权限账号，可管理全部用户、角色、药品、诊疗数据及系统配置', '2026-06-15 17:09:34', '2026-06-15 17:09:34'),
(3, '药房管理员', 'index,drug,department,record,prescription', '仅管理药品入库、库存、发药，查看处方与就诊记录，无人员、系统设置权限', '2026-06-15 17:10:52', '2026-06-15 17:10:52');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT '角色ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, '管理员', '128521849@qq.com', NULL, '$2y$10$39sdkXRuIwWDf0zawhYfRedhzP200GACXtDl5LTJzaqajxyFFbqI.', NULL, '2026-06-13 01:30:18', '2026-06-13 01:30:18', 1);

--
-- 转储表的索引
--

--
-- 表的索引 `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 表的索引 `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `inpatients`
--
ALTER TABLE `inpatients`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 表的索引 `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 表的索引 `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_email_index` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `inpatients`
--
ALTER TABLE `inpatients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `records`
--
ALTER TABLE `records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `reserves`
--
ALTER TABLE `reserves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
