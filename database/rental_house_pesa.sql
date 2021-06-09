-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2021 at 01:39 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_house_pesa`
--

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(250) NOT NULL,
  `user` varchar(250) NOT NULL,
  `recipient` varchar(250) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `ref_no`, `user`, `recipient`, `amount`, `date`) VALUES
(1, '15743678853', '2', '1', 20000, '2021-06-02 14:45:10'),
(2, '38089398303', '2', '1', 5000, '2021-06-02 14:49:18'),
(3, '60566624409', '2', '1', 25000, '2021-06-02 14:58:14'),
(4, '91254761320', '2', '1', 4000, '2021-06-02 15:32:22'),
(5, '73690008437', '2', '1', 500, '2021-06-02 15:33:56'),
(6, '87657711269', '2', '1', 500, '2021-06-02 15:35:46'),
(7, '56345573816', '2', '1', 1000, '2021-06-02 15:37:49'),
(8, '81501124720', '2', '1', 1000, '2021-06-02 15:38:15'),
(9, '88833261309', '2', '1', 1000, '2021-06-02 15:40:09'),
(10, '74134706562', '2', '1', 1000, '2021-06-02 15:46:22'),
(11, '60426510205', '2', '1', 1000, '2021-06-02 15:49:07'),
(12, '69342353906', '2', '1', 1000, '2021-06-02 15:49:57'),
(13, '44775566026', '2', '1', 1000, '2021-06-02 15:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `pin_no` int(8) NOT NULL,
  `amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `phone`, `email`, `pin_no`, `amount`) VALUES
(1, 'Admin', '254712345678', 'admin@gmail.com', 1234, 152000),
(2, 'faith Tunzo', '254798765432', 'billycartel360@gmail.com', 1010, 93000),
(3, 'Allan Juma', '', 'ridypujumy@mailinator.com', 5851, 100000),
(4, 'Juma Jumanji', '', 'ridypujumy@mailinator.com', 2089, 100000),
(5, 'Dwayne Jumanji', '254712053654', 'ridypujumy@mailinator.com', 8516, 90000),
(6, 'Rae Malone', '254712053654', 'dehe@mailinator.com', 5913, 100000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
