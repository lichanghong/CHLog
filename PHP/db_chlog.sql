-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 12, 2016 at 05:11 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_chlog`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_chlog`
--

CREATE TABLE IF NOT EXISTS `t_chlog` (
  `logid` bigint(20) NOT NULL AUTO_INCREMENT,
  `logcontent` text,
  `save_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=2287 ;

--
-- Dumping data for table `t_chlog`
--

INSERT INTO `t_chlog` (`logid`, `logcontent`, `save_time`) VALUES
(2274, '-[ViewController viewDidLoad]:21 [--test chlog  1893--]', '2016-09-12 08:57:00'),
(2275, '-[ViewController viewDidLoad]:21 [--test chlog  1894--]', '2016-09-12 08:57:00'),
(2276, '-[ViewController viewDidLoad]:21 [--test chlog  1896--]', '2016-09-12 08:57:00'),
(2277, '-[ViewController viewDidLoad]:21 [--test chlog  1895--]', '2016-09-12 08:57:00'),
(2278, '-[ViewController viewDidLoad]:21 [--test chlog  1897--]', '2016-09-12 08:57:00'),
(2279, '-[ViewController viewDidLoad]:21 [--test chlog  1899--]', '2016-09-12 08:57:00'),
(2280, '-[ViewController viewDidLoad]:21 [--test chlog  1900--]', '2016-09-12 08:57:00'),
(2281, '-[ViewController viewDidLoad]:21 [--test chlog  1901--]', '2016-09-12 08:57:00'),
(2282, '-[ViewController viewDidLoad]:21 [--test chlog  1898--]', '2016-09-12 08:57:00'),
(2283, '-[ViewController viewDidLoad]:21 [--test chlog  1904--]', '2016-09-12 08:57:00'),
(2284, '-[ViewController viewDidLoad]:21 [--test chlog  1903--]', '2016-09-12 08:57:00'),
(2285, '-[ViewController viewDidLoad]:21 [--test chlog  1902--]', '2016-09-12 08:57:00'),
(2286, '-[ViewController viewDidLoad]:21 [--test chlog  1905--]', '2016-09-12 08:57:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
