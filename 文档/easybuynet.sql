/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : easybuynet

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-17 18:10:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` varchar(12) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '穆天麟', 'mtl');
INSERT INTO `admin` VALUES ('2', '姚维康', 'ywk');
INSERT INTO `admin` VALUES ('3', '曹新锋', 'cxf');

-- ----------------------------
-- Table structure for `bigclass`
-- ----------------------------
DROP TABLE IF EXISTS `bigclass`;
CREATE TABLE `bigclass` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `b_name` varchar(20) NOT NULL COMMENT '大分类名称',
  PRIMARY KEY (`b_id`),
  UNIQUE KEY `b_name` (`b_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='大分类';

-- ----------------------------
-- Records of bigclass
-- ----------------------------
INSERT INTO `bigclass` VALUES ('5', '家用电器');
INSERT INTO `bigclass` VALUES ('6', '手机');
INSERT INTO `bigclass` VALUES ('3', '服装');
INSERT INTO `bigclass` VALUES ('1', '测试');
INSERT INTO `bigclass` VALUES ('2', '电脑');
INSERT INTO `bigclass` VALUES ('4', '食品');

-- ----------------------------
-- Table structure for `buycar`
-- ----------------------------
DROP TABLE IF EXISTS `buycar`;
CREATE TABLE `buycar` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `g_id` int(11) NOT NULL,
  `c_name` varchar(20) DEFAULT NULL COMMENT '所购商品名称',
  `c_price` double(11,2) DEFAULT NULL COMMENT '所购商品价格',
  `c_count` int(11) DEFAULT NULL COMMENT '所购商品数量',
  `c_desc` varchar(20) DEFAULT NULL COMMENT '所购商品描述',
  `c_money` double(11,2) DEFAULT NULL COMMENT '所购商品支付钱数',
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`),
  KEY `c_name` (`c_name`),
  CONSTRAINT `buycar_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`),
  CONSTRAINT `buycar_ibfk_2` FOREIGN KEY (`c_name`) REFERENCES `goods` (`g_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of buycar
-- ----------------------------
INSERT INTO `buycar` VALUES ('1', '3', '2', '10', '50.00', '3', null, '150.00');
INSERT INTO `buycar` VALUES ('5', '3', '3', '法国德菲丝松露精品巧克力500g/盒', '69.90', '1', null, '69.90');
INSERT INTO `buycar` VALUES ('7', '11', '8', 'Genius925纯银施华洛世奇水晶吊坠', '69.90', '1', null, '69.90');
INSERT INTO `buycar` VALUES ('10', '11', '2', '10', '50.00', '1', null, '50.00');
INSERT INTO `buycar` VALUES ('11', '11', '3', '法国德菲丝松露精品巧克力500g/盒', '108.00', '1', null, '108.00');
INSERT INTO `buycar` VALUES ('12', '11', '4', '乐扣普通型保鲜盒圣诞7件套', '69.90', '1', null, '69.90');
INSERT INTO `buycar` VALUES ('13', '1', '4', '乐扣普通型保鲜盒圣诞7件套', '69.90', '1', null, '69.90');
INSERT INTO `buycar` VALUES ('14', '1', '2', '10', '50.00', '1', null, '50.00');
INSERT INTO `buycar` VALUES ('15', '1', '3', '法国德菲丝松露精品巧克力500g/盒', '108.00', '1', null, '108.00');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，也是图片名字',
  `g_name` varchar(50) NOT NULL COMMENT '商品名称',
  `gb_id` int(11) NOT NULL COMMENT '大分类id',
  `gs_id` int(11) NOT NULL COMMENT '小分类id',
  `g_bpic` varchar(50) DEFAULT NULL COMMENT '大分类图片路径',
  `g_bpic1` varchar(50) DEFAULT NULL COMMENT '大分类图片路径1',
  `g_bpic2` varchar(50) DEFAULT NULL COMMENT '大分类图片路径2',
  `g_spic1` varchar(50) DEFAULT NULL COMMENT '小分类图片路径1',
  `g_spic2` varchar(50) DEFAULT NULL COMMENT '小分类图片路径2',
  `g_desc` varchar(300) DEFAULT NULL COMMENT '描述',
  `g_carry` double(11,2) DEFAULT NULL COMMENT '运费',
  `g_count` int(11) DEFAULT NULL COMMENT '数量',
  `g_price` double(11,2) DEFAULT NULL COMMENT '价格',
  `g_dis` double(11,2) DEFAULT '1.00' COMMENT '折扣',
  `g_type` varchar(10) NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `g_name` (`g_name`),
  KEY `gs_id` (`gs_id`),
  KEY `gb_id` (`gb_id`),
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`gs_id`) REFERENCES `smallclass` (`s_id`),
  CONSTRAINT `goods_ibfk_3` FOREIGN KEY (`gb_id`) REFERENCES `bigclass` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '10', '1', '1', 'images/product/2.jpg', null, null, null, null, null, null, '200', '50.00', '1.00', '1');
INSERT INTO `goods` VALUES ('3', '法国德菲丝松露精品巧克力500g/盒', '1', '1', 'images/product/3.jpg', null, null, null, null, null, null, '200000', '108.00', '1.00', '1');
INSERT INTO `goods` VALUES ('4', '乐扣普通型保鲜盒圣诞7件套', '1', '1', 'images/product/4.jpg', null, null, null, null, null, null, '300000', '69.90', '1.00', '1');
INSERT INTO `goods` VALUES ('5', '欧珀莱均衡保湿四件套', '1', '1', 'images/product/5.jpg', null, null, null, null, null, null, '123', '279.00', '1.00', '1');
INSERT INTO `goods` VALUES ('6', '联想笔记本电脑 高速独立显存', '1', '1', 'images/product/6.jpg', null, null, null, null, null, null, '132', '4199.00', '1.00', '1');
INSERT INTO `goods` VALUES ('7', '法姿韩版显瘦彩边时尚牛仔铅笔裤', '1', '1', 'images/product/7.jpg', null, null, null, null, null, null, '123', '49.00', '1.00', '1');
INSERT INTO `goods` VALUES ('8', 'Genius925纯银施华洛世奇水晶吊坠', '1', '1', 'images/product/8.jpg', null, null, null, null, null, null, '123', '69.90', '1.00', '1');
INSERT INTO `goods` VALUES ('9', '利仁2018M福满堂电饼铛 好用实惠', '1', '1', 'images/product/9.jpg', null, null, null, null, null, null, '123', '268.00', '1.00', '1');
INSERT INTO `goods` VALUES ('10', '达派高档拉杆箱20寸 经典款式', '1', '1', 'images/product/10.jpg', null, null, null, null, null, null, '123', '198.00', '1.00', '1');
INSERT INTO `goods` VALUES ('11', '爱国者MP4 全屏触摸多格式播放 4G', '1', '1', 'images/product/11.jpg', null, null, null, null, null, null, '123', '289.00', '1.00', '1');

-- ----------------------------
-- Table structure for `indent`
-- ----------------------------
DROP TABLE IF EXISTS `indent`;
CREATE TABLE `indent` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `ig_id` int(11) NOT NULL COMMENT '商品id',
  `i_name` varchar(50) NOT NULL COMMENT '订单名称',
  `i_price` int(11) DEFAULT NULL COMMENT '订单价格',
  `i_count` int(11) NOT NULL COMMENT '订单数量',
  `i_money` double(11,2) DEFAULT NULL COMMENT '订单须支付钱数',
  `i_dis` double(11,2) DEFAULT NULL COMMENT '订单折扣',
  `i_status` varchar(10) NOT NULL COMMENT '订单状态',
  `i_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  PRIMARY KEY (`i_id`),
  KEY `u_id` (`u_id`),
  KEY `ig_id` (`ig_id`),
  CONSTRAINT `indent_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`),
  CONSTRAINT `indent_ibfk_2` FOREIGN KEY (`ig_id`) REFERENCES `goods` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of indent
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `n_title` varchar(50) NOT NULL COMMENT '公告标题',
  `n_desc` text NOT NULL COMMENT '公告内容',
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
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `s_name` varchar(20) NOT NULL COMMENT '小分类名称',
  `sb_id` int(11) NOT NULL COMMENT '所属大分类id',
  PRIMARY KEY (`s_id`),
  KEY `sb_id` (`sb_id`),
  CONSTRAINT `smallclass_ibfk_1` FOREIGN KEY (`sb_id`) REFERENCES `bigclass` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='小分类';

-- ----------------------------
-- Records of smallclass
-- ----------------------------
INSERT INTO `smallclass` VALUES ('1', '测试', '1');
INSERT INTO `smallclass` VALUES ('2', '笔记本', '2');
INSERT INTO `smallclass` VALUES ('3', '台式电脑', '2');
INSERT INTO `smallclass` VALUES ('4', 'apple', '6');
INSERT INTO `smallclass` VALUES ('5', '衬衫', '3');
INSERT INTO `smallclass` VALUES ('6', '风衣', '3');
INSERT INTO `smallclass` VALUES ('7', '连衣裙', '3');
INSERT INTO `smallclass` VALUES ('8', '洗衣机', '5');
INSERT INTO `smallclass` VALUES ('9', '吹风机', '5');
INSERT INTO `smallclass` VALUES ('10', '液晶电视', '5');
INSERT INTO `smallclass` VALUES ('11', '零食', '4');
INSERT INTO `smallclass` VALUES ('12', '小米', '6');
INSERT INTO `smallclass` VALUES ('13', '华为', '6');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` varchar(20) NOT NULL COMMENT '登录名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `userName` varchar(20) NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `sex` varchar(10) NOT NULL DEFAULT '' COMMENT '性别',
  `birth` varchar(12) DEFAULT NULL COMMENT '出生日期',
  `idCard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `email` varchar(25) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `likes` varchar(50) DEFAULT NULL COMMENT '爱好',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test', 'test', '2333', '女', '1900.1.1', null, null, '请问', '请问', null);
INSERT INTO `user` VALUES ('2', '穆天麟', 'mtl', '穆天麟', '男', '1998.10.4', null, null, null, null, null);
INSERT INTO `user` VALUES ('3', '123', '123', '姚维康', '女', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'ssh', 'ssh', '曹新锋', '女', '1998.10.4', null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'q', '?', '', '?', '1998.10.4', null, null, '?', '?', null);
INSERT INTO `user` VALUES ('6', '王明清', 'wmq', '王明清', '男', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('7', '张凯', 'zk', '张凯', '男', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('8', '吕文翔', 'lwx', '吕文翔', '男', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('9', '崔永鑫', 'cyx', '崔永鑫', '男', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('10', '杜习港', 'dxg', '杜习港', '男', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('11', 'yyy', '123456', '', '', null, null, null, null, null, null);
