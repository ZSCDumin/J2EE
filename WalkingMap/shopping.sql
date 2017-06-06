/*
Navicat MySQL Data Transfer

Source Server         : ZSCDumin
Source Server Version : 100121
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 100121
File Encoding         : 65001

Date: 2017-06-10 08:54:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(32) DEFAULT NULL,
  `goodsprice` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `dingdanstatus` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`id`),
  KEY `fk_shop_id` (`shopid`),
  KEY `fk_good_id` (`goodsid`),
  CONSTRAINT `fk_good_id` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`id`),
  CONSTRAINT `fk_shop_id` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('1', '衣服', '35', '1', '1', '10', '0000000000');
INSERT INTO `dingdan` VALUES ('2', '衣服', '35', '1', '1', '11', '0000000000');
INSERT INTO `dingdan` VALUES ('3', '衣服', '35', '1', '2', '10', '0000000000');
INSERT INTO `dingdan` VALUES ('4', '衣服', '35', '1', '1', '10', '0000000000');
INSERT INTO `dingdan` VALUES ('5', '衣服', '35', '2', '1', '14', '0000000000');
INSERT INTO `dingdan` VALUES ('6', '衣服', '123', '33', '1', '24', '0000000000');
INSERT INTO `dingdan` VALUES ('7', '衣服', '35', '2', '1', '12', '0000000000');

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(32) DEFAULT NULL,
  `rowid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rowid` (`rowid`),
  CONSTRAINT `fk_rowid` FOREIGN KEY (`rowid`) REFERENCES `row` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', '增加用户', '1');
INSERT INTO `function` VALUES ('2', '管理所有用户', '1');
INSERT INTO `function` VALUES ('3', '删除用户', '1');
INSERT INTO `function` VALUES ('4', '查询单个用户', '1');
INSERT INTO `function` VALUES ('5', '新增商品', '3');
INSERT INTO `function` VALUES ('6', '订单管理', '3');
INSERT INTO `function` VALUES ('7', '商品维护', '3');
INSERT INTO `function` VALUES ('8', '查询商品', '3');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(32) DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `price` double(32,0) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `date` varchar(40) DEFAULT NULL,
  `status` int(10) unsigned zerofill DEFAULT '0000000000',
  `userid` int(11) DEFAULT NULL,
  `comment` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userid` (`userid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('7', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('8', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('9', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('10', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('11', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('12', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('13', 'T-SHIRT', 'pi.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('14', '外套', 'pi3.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('15', '外套', 'pi3.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('16', '外套', 'pi3.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('17', '外套', 'pi3.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('18', '外套', 'pi3.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('19', '外套', 'pi3.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('20', '双肩包', 'pi2.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('21', '双肩包', 'pi2.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('22', '双肩包', 'pi2.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('23', '双肩包', 'pi2.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('24', '双肩包', 'pi2.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('25', '休闲鞋', 'pi1.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('26', '休闲鞋', 'pi1.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('27', '休闲鞋', 'pi1.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('28', '休闲鞋', 'pi1.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('29', '运动鞋', 'pi1.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('30', '运动鞋', 'pi5.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('31', '运动鞋', 'pi5.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('32', '运动鞋', 'pi5.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('33', '运动鞋', 'pi5.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('34', '单肩包', 'pi4.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('35', '单肩包', 'pi4.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('36', '单肩包', 'pi4.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');
INSERT INTO `goods` VALUES ('37', '单肩包', 'pi4.jpg', '35', '18', '2016-9-5 10:37:36', '0000000000', '3', '这是一个好的产品');

-- ----------------------------
-- Table structure for row
-- ----------------------------
DROP TABLE IF EXISTS `row`;
CREATE TABLE `row` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rowname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of row
-- ----------------------------
INSERT INTO `row` VALUES ('1', '管理员');
INSERT INTO `row` VALUES ('2', '买家');
INSERT INTO `row` VALUES ('3', '卖家');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `shopstatus` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`userid`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '3', '2016-9-8 8:54:24', '0000000000');
INSERT INTO `shop` VALUES ('2', '3', '2016-9-8 10:16:25', '0000000000');
INSERT INTO `shop` VALUES ('3', '3', '2016-9-8 15:44:04', '0000000000');
INSERT INTO `shop` VALUES ('4', '3', '2016-9-8 15:53:16', '0000000000');
INSERT INTO `shop` VALUES ('5', '3', '2017-6-9 10:59:24', '0000000000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `rowid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_id` (`rowid`),
  CONSTRAINT `fk_id` FOREIGN KEY (`rowid`) REFERENCES `row` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin@qq.com', '1', '0');
INSERT INTO `user` VALUES ('2', 'root', 'root', 'root@qq.com', '1', '0');
INSERT INTO `user` VALUES ('3', 'seller', '123', 'seller33333@qq.com', '3', '0');
INSERT INTO `user` VALUES ('4', '666', '123', '666@qq.com', '3', '0');
INSERT INTO `user` VALUES ('9', '333', '333', '333@qq.com', '2', '0');
INSERT INTO `user` VALUES ('16', 'buyer', '123', 'buyer@qq.com', '2', '0');
