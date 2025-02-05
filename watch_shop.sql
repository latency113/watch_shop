-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2025 at 04:35 PM
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
-- Database: `watch_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'นาฬิกาโคตรแพง'),
(2, 'นาฬิกาโคตรถูก'),
(3, 'นาฬิกากลาง');

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('approved','pending','rejected') NOT NULL DEFAULT 'pending',
  `payment_date` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `order_date`, `status`, `payment_date`) VALUES
(1, 1, '2025-02-05 15:16:52', 'pending', '2025-02-05 22:16:52.000');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `description`, `picture`, `quantity`) VALUES
(1, 1, 'Rolexy', 10000, 'โคตรแพง', 'picture-1738764794281-552346104.png', 10),
(2, 2, 'Rolexynos', 1000, 'โคตรถูก', 'picture-1738764844876-928118506.png', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `picture` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `tel` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `picture`, `address`, `tel`) VALUES
(1, 'test', 'test1@gmail.com', '$2b$10$HPpjZlC9zUEKnildSqcjVeZfhBCjwM1fTeUssYhBxJMGDpkp5THi6', 'picture-1738766555882-504447871.jpg', 'dadaa', '12121');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('2617d080-3ca0-4901-98ec-a8c4bf3f8b13', '93613f8d139331be4ab72d412b2c4cd429949225029f7ba1df3660a86ee932f7', '2025-02-05 14:59:13.384', '20250205145913_update', NULL, NULL, '2025-02-05 14:59:13.255', 1),
('3a68731f-727e-4405-9682-7483446cee51', '7b00f2656c03e7e2e0d3d6c463a16240afe204594420bb60667ecde918bc720c', '2025-02-05 14:51:42.776', '20250205145142_update', NULL, NULL, '2025-02-05 14:51:42.630', 1),
('6197fca8-58b6-4570-8fe5-ebe7767a971a', '36cbadd61c069d949bce8de4bb990e197574f95751d5c35e069693d40d24d5ea', '2025-02-05 14:00:22.754', '20241227043910_pppppp', NULL, NULL, '2025-02-05 14:00:22.736', 1),
('631818e3-0e27-4a2e-be31-a6a3f993ccd0', '279e9eac9a4140264a2c2e1897e2b6bfe4f150ba08937194f71b02780e09389d', '2025-02-05 14:49:04.750', '20250205144904_update', NULL, NULL, '2025-02-05 14:49:04.674', 1),
('67813ec3-0613-471b-96b3-a5a107be8f63', '07181bdec2ac661099c72500b80416515c30df6f623029c880311f2a2ddccf5d', '2025-02-05 15:20:09.765', '20250205152009_update', NULL, NULL, '2025-02-05 15:20:09.700', 1),
('7b1add3f-4b9b-457a-beda-1366c6f5c9c7', '18d2336eb3457fee649ea9e72e33517ad4b22e7b8e062676da52c84a8cc92828', '2025-02-05 15:07:02.675', '20250205150702_update', NULL, NULL, '2025-02-05 15:07:02.606', 1),
('91eaef51-2e02-4c14-972d-bdc5ba69a901', 'a5d3bad95cb39336476dc23b309ba3fa92df74d277a04d2278ca977290f004d3', '2025-02-05 14:00:22.735', '20241226080050_init', NULL, NULL, '2025-02-05 14:00:22.660', 1),
('9a55e9cb-a3db-44f0-a320-cf7e73b28f51', 'eef124822dbb32e7a657dc7fcb82ea25b83cfc0b92eab24161d060f7532eb3ce', '2025-02-05 14:00:23.467', '20250205140023_update', NULL, NULL, '2025-02-05 14:00:23.355', 1),
('a6b6ccec-7054-4ea6-b034-adb011c3f2e0', 'bf7dbaaeed120fb850af4780f303bec4a4b808bc27176377a767259804a16e65', '2025-02-05 15:01:07.012', '20250205150106_update', NULL, NULL, '2025-02-05 15:01:06.931', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Detail_product_id_fkey` (`product_id`),
  ADD KEY `Detail_order_id_fkey` (`order_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_user_id_fkey` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Product_category_id_fkey` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `Detail_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Detail_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Product_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
