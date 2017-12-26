/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : easybuynet

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-26 09:05:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` varchar(12) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `bigclass`
-- ----------------------------
DROP TABLE IF EXISTS `bigclass`;
CREATE TABLE `bigclass` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `b_name` varchar(20) NOT NULL COMMENT '大分类名称',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bigclass
-- ----------------------------

-- ----------------------------
-- Table structure for `buycar`
-- ----------------------------
DROP TABLE IF EXISTS `buycar`;
CREATE TABLE `buycar` (
  `c_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `c_name` varchar(20) DEFAULT NULL COMMENT '所购商品名称',
  `c_price` double(11,0) DEFAULT NULL COMMENT '所购商品价格',
  `c_count` int(11) DEFAULT NULL COMMENT '所购商品数量',
  `c_dis` varchar(20) DEFAULT NULL COMMENT '所购商品描述',
  `c_money` double(11,0) DEFAULT NULL COMMENT '所购商品支付钱数',
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `buycar_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buycar
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(50) NOT NULL,
  `gb_id` int(11) NOT NULL,
  `gs_id` int(11) NOT NULL,
  `g_bpic` varchar(50) DEFAULT NULL,
  `g_bpic1` varchar(50) DEFAULT NULL,
  `g_bpic2` varchar(50) DEFAULT NULL,
  `g_spic1` varchar(50) DEFAULT NULL,
  `g_spic2` varchar(50) DEFAULT NULL,
  `g_desc` varchar(300) DEFAULT NULL,
  `g_carry` double(11,0) DEFAULT NULL,
  `g_count` int(11) DEFAULT NULL,
  `g_price` double(11,0) DEFAULT NULL,
  `g_dis` double(11,0) DEFAULT NULL,
  `g_type` varchar(10) NOT NULL,
  PRIMARY KEY (`g_id`),
  KEY `gb_id` (`gb_id`),
  KEY `gs_id` (`gs_id`),
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`gs_id`) REFERENCES `smallclass` (`s_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`gb_id`) REFERENCES `bigclass` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `ig_id` int(11) NOT NULL,
  `i_name` varchar(50) NOT NULL,
  `i_price` int(11) DEFAULT NULL,
  `i_count` int(11) NOT NULL,
  `i_money` double(11,0) DEFAULT NULL,
  `i_dis` double(11,0) DEFAULT NULL,
  `i_status` varchar(10) NOT NULL,
  `i_date` date NOT NULL,
  PRIMARY KEY (`i_id`),
  KEY `u_id` (`u_id`),
  KEY `ig_id` (`ig_id`),
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`ig_id`) REFERENCES `goods` (`g_id`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indent
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(50) NOT NULL,
  `n_desc` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `smallclass`
-- ----------------------------
DROP TABLE IF EXISTS `smallclass`;
CREATE TABLE `smallclass` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(20) NOT NULL,
  `sb_id` int(11) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `sb_id` (`sb_id`),
  CONSTRAINT `smallclass_ibfk_1` FOREIGN KEY (`sb_id`) REFERENCES `bigclass` (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smallclass
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `birth` varchar(12) DEFAULT NULL,
  `idCard` varchar(18) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `likes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
