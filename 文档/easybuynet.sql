/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : easybuynet

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-28 11:54:46
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息';

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='大分类';

-- ----------------------------
-- Records of bigclass
-- ----------------------------
INSERT INTO `bigclass` VALUES ('1', '1');
INSERT INTO `bigclass` VALUES ('2', '2');
INSERT INTO `bigclass` VALUES ('3', '3');
INSERT INTO `bigclass` VALUES ('4', '4');

-- ----------------------------
-- Table structure for `buycar`
-- ----------------------------
DROP TABLE IF EXISTS `buycar`;
CREATE TABLE `buycar` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `c_name` varchar(20) DEFAULT NULL COMMENT '所购商品名称',
  `c_price` double(11,0) DEFAULT NULL COMMENT '所购商品价格',
  `c_count` int(11) DEFAULT NULL COMMENT '所购商品数量',
  `c_dis` varchar(20) DEFAULT NULL COMMENT '所购商品描述',
  `c_money` double(11,0) DEFAULT NULL COMMENT '所购商品支付钱数',
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `buycar_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告';

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='小分类';

-- ----------------------------
-- Records of smallclass
-- ----------------------------
INSERT INTO `smallclass` VALUES ('2', '1.1', '1');
INSERT INTO `smallclass` VALUES ('3', '1.2', '1');
INSERT INTO `smallclass` VALUES ('4', '2.1', '2');
INSERT INTO `smallclass` VALUES ('5', '2.2', '2');
INSERT INTO `smallclass` VALUES ('6', '3.1', '3');
INSERT INTO `smallclass` VALUES ('7', '3.2', '3');
INSERT INTO `smallclass` VALUES ('9', '4.1', '4');
INSERT INTO `smallclass` VALUES ('11', '4.2', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=1446 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', '阿萨德', 'asd', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('8', '123', '123', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1030', '23', '23', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1033', '1234', '1234', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1035', '12345', '12345', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1036', '123456', '123456', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1157', '111', '111', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1254', '1111', '1111', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1393', '21', '21', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1433', '去', 'q', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1434', '1', '1', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1435', '我', 'w', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1436', '22', '22', '', '', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1440', '123123', '123', '', '', null, null, null, null, null, null);
