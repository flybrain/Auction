-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016 �?01 �?16 �?08:11
-- 服务器版本: 5.6.11
-- PHP 版本: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `auction`
--
CREATE DATABASE IF NOT EXISTS `auction` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `auction`;

-- --------------------------------------------------------

--
-- 表的结构 `auction_user`
--

CREATE TABLE IF NOT EXISTS `auction_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `userpass` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `auction_user`
--

INSERT INTO `auction_user` (`user_id`, `username`, `userpass`, `email`) VALUES
(1, 'tomcat', 'tomcat', 'spring_test@163.com'),
(2, 'mysql', 'mysql', 'spring_test@163.com');

-- --------------------------------------------------------

--
-- 表的结构 `bid`
--

CREATE TABLE IF NOT EXISTS `bid` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `bid_price` double NOT NULL,
  `bid_date` date NOT NULL,
  PRIMARY KEY (`bid_id`),
  UNIQUE KEY `item_id` (`item_id`,`bid_price`),
  KEY `FK17CFD5A919C26` (`item_id`),
  KEY `FK17CFDAB0B5DF1` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `bid`
--

INSERT INTO `bid` (`bid_id`, `user_id`, `item_id`, `bid_price`, `bid_date`) VALUES
(1, 2, 1, 250, '2015-12-19'),
(2, 1, 3, 25000, '2015-12-15'),
(13, 2, 14, 130, '2016-01-15');

-- --------------------------------------------------------

--
-- 表的结构 `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `item_remark` varchar(255) DEFAULT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `kind_id` int(11) NOT NULL,
  `addtime` date NOT NULL,
  `endtime` date NOT NULL,
  `init_price` double NOT NULL,
  `max_price` double NOT NULL,
  `owner_id` int(11) NOT NULL,
  `winer_id` int(11) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK317B13B2144086` (`kind_id`),
  KEY `FK317B1371643773` (`winer_id`),
  KEY `FK317B1316F20E09` (`owner_id`),
  KEY `FK317B138C5E4E` (`state_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `item_remark`, `item_desc`, `kind_id`, `addtime`, `endtime`, `init_price`, `max_price`, `owner_id`, `winer_id`, `state_id`) VALUES
(1, '主板', '老式主板', '老主板，还可以用', 1, '2015-12-16', '2016-01-20', 230, 250, 1, NULL, 1),
(2, '显卡', '老式显卡', '老显卡，还可以用', 1, '2015-12-12', '2015-12-19', 210, 210, 2, NULL, 3),
(3, '老房子', '老式房子', '40年的老房子', 2, '2015-12-12', '2015-12-16', 21000, 25000, 2, 1, 2),
(14, '??122Te', '?dddd', 'Tttttt', 16, '2016-01-15', '2016-01-16', 120, 130, 1, 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `kind`
--

CREATE TABLE IF NOT EXISTS `kind` (
  `kind_id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_name` varchar(50) NOT NULL,
  `kind_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`kind_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `kind`
--

INSERT INTO `kind` (`kind_id`, `kind_name`, `kind_desc`) VALUES
(1, '电脑硬件', '这里并不是很主流的产品，但价格绝对令你心动'),
(2, '房产', '提供非常稀缺的房源'),
(3, '????', '??????'),
(4, '????2', '??????'),
(15, '??', '??12'),
(16, 'Test', 'Test12');

-- --------------------------------------------------------

--
-- 表的结构 `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, '拍卖中'),
(2, '拍卖成功'),
(3, '流拍');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
