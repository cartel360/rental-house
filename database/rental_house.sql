-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2021 at 01:38 PM
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
-- Database: `rental_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `contract_id` int(3) NOT NULL,
  `tenant_id` int(3) NOT NULL,
  `house_id` int(3) NOT NULL,
  `duration_month` int(2) NOT NULL,
  `total_rent` int(7) NOT NULL,
  `terms` int(2) NOT NULL,
  `rent_per_term` int(7) NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date NOT NULL,
  `date_contract_sign` datetime NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`contract_id`, `tenant_id`, `house_id`, `duration_month`, `total_rent`, `terms`, `rent_per_term`, `start_day`, `end_day`, `date_contract_sign`, `status`) VALUES
(1, 1, 10, 3, 30000, 1, 30000, '2021-06-01', '2021-08-31', '2021-06-02 13:49:19', 'Active'),
(4, 5, 1, 3, 240000, 1, 240000, '2019-08-01', '2019-10-31', '2019-08-07 00:18:18', 'Inactive'),
(5, 6, 4, 12, 840000, 4, 210000, '2019-08-01', '2020-07-31', '2019-08-07 00:25:47', 'Active'),
(8, 9, 6, 6, 480000, 2, 240000, '2019-07-01', '2019-12-31', '2019-07-15 02:52:34', 'Inactive'),
(9, 4, 2, 3, 180000, 1, 180000, '2019-08-01', '2019-07-20', '2019-07-19 03:12:17', 'Inactive'),
(12, 10, 2, 12, 720000, 4, 180000, '2019-07-01', '2020-06-30', '2019-07-23 12:20:10', 'Inactive'),
(15, 4, 7, 3, 180000, 1, 180000, '2019-08-01', '2019-10-31', '2019-08-04 00:18:11', 'Inactive'),
(16, 25, 1, 3, 21000, 1, 21000, '2021-06-01', '2021-08-31', '2021-06-05 10:14:27', 'Active'),
(17, 26, 1, 6, 48000, 2, 24000, '2021-06-01', '2021-11-30', '2021-06-05 10:22:21', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `house_id` int(3) NOT NULL,
  `house_name` varchar(10) NOT NULL,
  `compartment` text NOT NULL,
  `balcony` varchar(11) DEFAULT NULL,
  `rent_per_month` int(6) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`house_id`, `house_name`, `compartment`, `balcony`, `rent_per_month`, `status`) VALUES
(1, 'A10', 'Yes', 'Yes', 8000, 'Occupied'),
(2, 'A20', 'No', 'Yes', 6000, 'Empty'),
(3, 'D30', 'No', 'Yes', 6000, 'Empty'),
(4, 'C40', 'Yes', 'No', 7000, 'Occupied'),
(6, 'A30', 'Yes', 'Yes', 8000, 'Empty'),
(7, 'A40', 'No', 'No', 6000, 'Empty'),
(8, 'B30', 'Yes', 'No', 7000, 'Empty'),
(10, 'G01', 'Yes', 'Yes', 10000, 'Occupied');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(3) NOT NULL,
  `tenant_id` int(7) NOT NULL,
  `ref_no` varchar(11) NOT NULL,
  `amount` int(7) NOT NULL,
  `pay_from` text NOT NULL,
  `pay_to` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `tenant_id`, `ref_no`, `amount`, `pay_from`, `pay_to`, `date`) VALUES
(2, 4, '2147483647', 180000, 'August 2019', 'October 2019', '2019-08-08 11:11:19'),
(4, 4, '8654712358', 180000, 'February 2020', 'April 2020', '2019-08-08 12:56:45'),
(5, 6, '784156978', 210000, 'August 2019', 'October 2019', '2019-08-08 13:10:15'),
(6, 6, '7456257832', 210000, 'November 2019', 'January 2020', '2019-08-08 13:40:31'),
(7, 6, '39222962841', 210000, 'February 2020', 'April 2020', '2019-08-08 14:15:58'),
(8, 5, '1551327804', 240000, 'January 2021', 'May 2021', '2019-08-09 14:24:29'),
(9, 6, '71308220851', 60000, 'May 2020', 'June 2020', '2019-08-14 11:06:25'),
(10, 6, '72912660562', 70000, 'June 2020', 'July 2020', '2019-08-14 11:22:13'),
(11, 6, '36480604749', 30000, 'August 2020', 'August 2020', '2019-08-14 11:30:35'),
(12, 9, '2099451721', 150000, 'August 2019', 'October 2019', '2019-08-15 10:45:04'),
(13, 1, '38089398303', 5000, 'January 2021', 'January 2021', '2021-06-02 14:49:18'),
(14, 1, '60566624409', 25000, 'January 2021', 'January 2021', '2021-06-02 14:58:14'),
(15, 1, '91254761320', 4000, 'January 2021', 'January 2021', '2021-06-02 15:32:22'),
(16, 1, '73690008437', 500, 'January 2021', 'January 2021', '2021-06-02 15:33:56'),
(17, 1, '87657711269', 500, 'January 2021', 'January 2021', '2021-06-02 15:35:46'),
(18, 1, '56345573816', 1000, 'January 2021', 'January 2021', '2021-06-02 15:37:49'),
(19, 1, '81501124720', 1000, 'January 2021', 'January 2021', '2021-06-02 15:38:15'),
(20, 1, '88833261309', 1000, 'January 2021', 'January 2021', '2021-06-02 15:40:09'),
(21, 1, '74134706562', 1000, 'January 2021', 'January 2021', '2021-06-02 15:46:22'),
(22, 1, '60426510205', 1000, 'January 2021', 'January 2021', '2021-06-02 15:49:07'),
(23, 1, '69342353906', 1000, 'January 2021', 'January 2021', '2021-06-02 15:49:57'),
(24, 1, '44775566026', 1000, 'January 2021', 'January 2021', '2021-06-02 15:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `tenant_id` int(3) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `programme` varchar(30) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `occupation` text NOT NULL,
  `p_no` varchar(15) NOT NULL,
  `pno1` varchar(15) NOT NULL,
  `e_address` varchar(250) NOT NULL,
  `p_address` varchar(40) NOT NULL,
  `city` varchar(250) NOT NULL,
  `region` varchar(250) NOT NULL,
  `u_name` text NOT NULL,
  `p_word` text NOT NULL,
  `day_reg` date NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`tenant_id`, `fname`, `lname`, `programme`, `reg_no`, `occupation`, `p_no`, `pno1`, `e_address`, `p_address`, `city`, `region`, `u_name`, `p_word`, `day_reg`, `status`) VALUES
(1, 'Faith', 'Tunzo', 'BSc. IT', 'BSc-IT-18389', '', '0712345678', '255746553132', 'faithtunzo@gmail.com', '01000. Thika', 'Nairobi', 'Thika', 'hope', 'd5537295be1d5a93bfe54f8992d06bda', '2019-07-14', 0),
(4, 'Genny', 'Mnzava', '', '', 'Lecturer', '', '255746553132', '1@test.com', '2522, Arusha', 'Arusha', 'Arusha', 'geneswaa', 'fe3742082b02380c86075d11ba88ebc0', '2019-07-14', 1),
(5, 'Agape', 'Tunzo', '', '', 'Saleswoman', '255717812676', '255746553132', 'agapemnzava@yahoo.com', '2522, Arusha', 'Arusha', 'Arusha', 'narindwa', '144d87c8323749c9bf3f0c71d3182f9d', '2019-07-14', 2),
(6, 'Emma', 'Tunzo', '', '', 'Teacher', '', '255746553132', 'emanueltunzo@gmail.com', '2522, Arusha', 'Nairobi', 'Thika', 'emanuel', '25f9e794323b453885f5181f1b624d0b', '2019-07-15', 1),
(9, 'Andy', 'Tunzo', '', '', 'Manager', '255717812676', '255746553132', 'andy123@hotmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'andrew', 'd41555c72445d4a3b05de048fe5f3e0d', '2019-07-15', 1),
(10, 'Love', 'Faith', '', '', 'Assistant Manager', '255717812676', '255746553132', 'faithtunzo@google.com', '2522, Arusha', 'Arusha', 'Arusha', 'loveness', 'e807f1fcf82d132f9bb018ca6738a19f', '2019-07-23', 2),
(11, 'qwert', 'yuiop', '', '', 'Plumber', '0784565656', '0784565656', 'faith.tunzo@yahoo.com', '345,Iringa', 'Iringa', 'Iringa', 'asdfg', '123456789', '2019-08-04', 3),
(12, 'Aubrey', 'Pena', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'Velit', 'Proident', 'Admpedit', 'Sybil', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(13, 'John', 'Doe', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'john', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(14, 'John', 'Doe', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'doe', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(15, 'Jane', 'Doe', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'jane', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(16, 'Jane', 'Smith', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'smith', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(17, 'Mary', 'Jane', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'mary', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(18, 'Apalla', 'Jane', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'apalla', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(19, 'Apalla', 'Mary', '', '', 'Farmer', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'apallam', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(20, 'Peter', 'John', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'peter', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(21, 'Allan', 'John', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'allan', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(22, 'Allan', 'Juma', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'juma', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(23, 'Juma', 'Jumanji', '', '', 'Farmer', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'jumanji', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(24, 'Dwayne', 'Jumanji', '', '', '', '254712053654', '254712987654', 'ridypujumy@mailinator.com', 'General Kago', 'Nairobi', 'Kenya', 'dwayne', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 1),
(25, 'Rae', 'Malone', '', '', 'Corporis', '254712053654', '254789545223', 'dehe@mailinator.com', 'Quibusdam', 'Eos', 'Cum', 'Brock', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0),
(26, 'Martina', 'Merritt', 'BIT', 'BIT/0100/2000', '', '254756871523', '254789645561', 'bavygujoz@mailinator.com', 'Dolorem', 'Nihil', 'Commodo', 'Nina', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_contacts`
--

CREATE TABLE `tenant_contacts` (
  `contact_id` int(3) NOT NULL,
  `tenant_id` int(3) NOT NULL,
  `fname1` text NOT NULL,
  `lname1` text NOT NULL,
  `occupation1` text NOT NULL,
  `nature1` text NOT NULL,
  `pno1` varchar(15) NOT NULL,
  `pno2` varchar(15) NOT NULL,
  `e_address1` varchar(30) NOT NULL,
  `p_address1` varchar(40) NOT NULL,
  `city1` varchar(15) NOT NULL,
  `region1` varchar(15) NOT NULL,
  `fname2` text NOT NULL,
  `lname2` text NOT NULL,
  `occupation2` text NOT NULL,
  `nature2` text NOT NULL,
  `pno3` varchar(15) NOT NULL,
  `pno4` varchar(15) NOT NULL,
  `e_address2` varchar(30) NOT NULL,
  `p_address2` varchar(40) NOT NULL,
  `city2` varchar(15) NOT NULL,
  `region2` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant_contacts`
--

INSERT INTO `tenant_contacts` (`contact_id`, `tenant_id`, `fname1`, `lname1`, `occupation1`, `nature1`, `pno1`, `pno2`, `e_address1`, `p_address1`, `city1`, `region1`, `fname2`, `lname2`, `occupation2`, `nature2`, `pno3`, `pno4`, `e_address2`, `p_address2`, `city2`, `region2`) VALUES
(1, 1, 'Twazihirwa', 'Mnzava', 'Lecturer', 'Daddy', '0784949021', '0717225082', 'mnzavatunzo@gmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'Gloria', 'Mnzava', 'Teacher', 'Mom', '0754698589', '0658698589', 'gloriamzava@gmail.com', '2522, Arusha', 'Arusha', 'Arusha'),
(4, 4, 'Tunzo', 'Mnzava', 'Lecturer', 'Grandfather', '0712121212', '0745121212', 'mnzavatunzo@gmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'Gloria', 'Mnzava', 'Teacher', 'Grandmother', '0745151515', '0754151515', 'gloriamzava@gmail.com', '2522, Arusha', 'Arusha', 'Arusha'),
(5, 5, 'Tunzo', 'Mnzava', 'Lecturer', 'Daddy', '0712121212', '0745121212', 'mnzavatunzo@gmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'Gloria', 'Mnzava', 'Lecturer', 'Mom', '0745151515', '0754151515', 'gloriamzava@gmail.com', '2522, Arusha', 'Arusha', 'Arusha'),
(6, 6, 'Tunzo', 'Mnzava', 'Lecturer', 'Daddy', '0712121212', '0745121212', 'mnzavatunzo@gmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'Gloria', 'Mnzava', 'Teacher', 'Mom', '0745151515', '0754151515', 'gloriamzava@gmail.com', '2522, Arusha', 'Arusha', 'Arusha'),
(9, 9, 'Tunzo', 'Mnzava', 'Lecturer', 'Daddy', '0712121212', '0745121212', 'mnzavatunzo@gmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'Gloria', 'Mnzava', 'Lecturer', 'Mom', '0745151515', '0754151515', 'gloriamzava@gmail.com', '2522, Arusha', 'Arusha', 'Arusha'),
(11, 10, 'Tunzo', 'Mnzava', 'Lecturer', 'Grandfather', '0712121212', '0745121212', 'mnzavatunzo@gmail.com', '2522, Arusha', 'Arusha', 'Arusha', 'Gloria', 'Mnzava', 'Teacher', 'Grand mother', '0745151515', '0754151515', 'gloriamzava@gmail.com', '2522, Arusha', 'Arusha', 'Arusha'),
(12, 11, 'Tunzo', 'Mnzava', 'Lecturer', 'dad', '0717454545', '0745151515', '', '54, Arusha', 'Arusha', 'Arusha', 'Glory', 'Mnzava', 'Lecturer', 'mom', '0745151515', '0717454545', '', '54, Arusha', 'Arusha', 'Arusha'),
(13, 12, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(14, 13, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(15, 14, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(16, 15, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(17, 16, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(18, 17, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(19, 18, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(20, 19, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Quod', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(21, 20, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(22, 21, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(23, 22, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(24, 23, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Quod', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(25, 24, 'Ray', 'Kermit', 'Quod', 'Deleniti', '254789652315', '254769524125', 'nawi@mailinator.com', '23 Hague Road', 'Eos', 'Dolor', 'Jameson', 'Noah', 'Enim', 'Occaecat', '254774569821', '254769854523', 'diqyxapeha@mailinator.com', 'Laboris deserunt vol', 'Voluptatem', 'Vero'),
(26, 25, 'Rahim', 'Ann', 'Quod', 'Minima', '254789545236', '254789665234', 'leby@mailinator.com', '70 North Milton Court', 'Vero', 'Mollitia', 'Cathleen', 'Justin', 'Sed', 'Eos', '254712365489', '254715697865', 'nadeqosa@mailinator.com', 'Voluptatem', 'Maxime', 'Natus'),
(27, 26, 'Lamar', 'Lois', 'Sed consectetur nihi', 'Libero', '254789653258', '254789653258', 'heduxyxah@mailinator.com', '544 East White Clarendon Boulevard', 'Modi', 'Eeaque', 'Judah', 'Jermaine', 'Sed consectetur nihi', 'Saepe', '254756315898', '254756315898', 'covyqeg@mailinator.com', 'Sed rerum labore sol', 'Maiores', 'Lorem');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_in`
--

CREATE TABLE `tenant_in` (
  `in_id` int(3) NOT NULL,
  `contract_id` int(3) NOT NULL,
  `stat_keyholder` text NOT NULL,
  `stat_electricityRemote` text NOT NULL,
  `no_bulbs` int(2) NOT NULL,
  `stat_bulbs` text NOT NULL,
  `stat_paint` text NOT NULL,
  `stat_Windows` text NOT NULL,
  `stat_toiletSink` text NOT NULL,
  `stat_washingSink` text NOT NULL,
  `stat_doorLock` text NOT NULL,
  `stat_toiletDoorLock` text NOT NULL,
  `water_units` int(5) NOT NULL,
  `comments` text NOT NULL,
  `date_reg` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='"stat" represents the status/condition of an item';

--
-- Dumping data for table `tenant_in`
--

INSERT INTO `tenant_in` (`in_id`, `contract_id`, `stat_keyholder`, `stat_electricityRemote`, `no_bulbs`, `stat_bulbs`, `stat_paint`, `stat_Windows`, `stat_toiletSink`, `stat_washingSink`, `stat_doorLock`, `stat_toiletDoorLock`, `water_units`, `comments`, `date_reg`, `status`) VALUES
(1, 5, 'Good', 'Average', 2, 'Good', 'Average', 'Average', 'Broken', 'Average', 'Average', 'Average', 123, 'Please fix', '2019-08-08', 'Checked');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_out`
--

CREATE TABLE `tenant_out` (
  `out_id` int(3) NOT NULL,
  `contract_id` int(3) NOT NULL,
  `stat_keyholder` text NOT NULL,
  `stat_electricityRemote` text NOT NULL,
  `no_bulbs` int(2) NOT NULL,
  `stat_bulbs` text NOT NULL,
  `stat_paint` text NOT NULL,
  `stat_Windows` text NOT NULL,
  `stat_toiletSink` text NOT NULL,
  `stat_washingSink` text NOT NULL,
  `stat_doorLock` text NOT NULL,
  `stat_toiletDoorLock` text NOT NULL,
  `comments` text NOT NULL,
  `date_reg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant_out`
--

INSERT INTO `tenant_out` (`out_id`, `contract_id`, `stat_keyholder`, `stat_electricityRemote`, `no_bulbs`, `stat_bulbs`, `stat_paint`, `stat_Windows`, `stat_toiletSink`, `stat_washingSink`, `stat_doorLock`, `stat_toiletDoorLock`, `comments`, `date_reg`) VALUES
(1, 9, 'Good', 'Good', 2, 'Average', 'Good', 'Good', 'Good', 'Good', 'Average', 'Average', 'Gotta Pay', '2019-08-08'),
(2, 12, 'No key holder', 'Bad', 1, 'Some missing', 'Average', 'Good', 'Average', 'Good', 'Good', 'Average', 'Has to pay', '2019-08-12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(3) NOT NULL,
  `name` text NOT NULL,
  `role` text NOT NULL,
  `pno` varchar(15) NOT NULL,
  `u_name` varchar(10) NOT NULL,
  `pword` text NOT NULL,
  `date_reg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `role`, `pno`, `u_name`, `pword`, `date_reg`) VALUES
(1, 'RHMS', 'Administrator', '255717812676', 'Admin', '25f9e794323b453885f5181f1b624d0b', '2019-07-15'),
(2, 'Juma Jux', 'Manager', '255787966996', 'JJ', '25f9e794323b453885f5181f1b624d0b', '2019-08-09'),
(3, 'John Doe', 'Manager', '254712053654', 'john', 'd5537295be1d5a93bfe54f8992d06bda', '2021-06-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `house_id` (`house_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`house_id`),
  ADD UNIQUE KEY `house_name` (`house_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `tenant_id` (`tenant_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`tenant_id`);

--
-- Indexes for table `tenant_contacts`
--
ALTER TABLE `tenant_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `tenant_in`
--
ALTER TABLE `tenant_in`
  ADD PRIMARY KEY (`in_id`),
  ADD KEY `contract_id` (`contract_id`);

--
-- Indexes for table `tenant_out`
--
ALTER TABLE `tenant_out`
  ADD PRIMARY KEY (`out_id`),
  ADD KEY `contract_id` (`contract_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `contract_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `house_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `tenant_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tenant_contacts`
--
ALTER TABLE `tenant_contacts`
  MODIFY `contact_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tenant_in`
--
ALTER TABLE `tenant_in`
  MODIFY `in_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenant_out`
--
ALTER TABLE `tenant_out`
  MODIFY `out_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house` (`house_id`),
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
