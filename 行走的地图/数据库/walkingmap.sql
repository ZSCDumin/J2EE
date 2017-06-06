/*
Navicat MySQL Data Transfer

Source Server         : ZSCDumin
Source Server Version : 100121
Source Host           : localhost:3306
Source Database       : walkingmap

Target Server Type    : MYSQL
Target Server Version : 100121
File Encoding         : 65001

Date: 2017-05-31 20:09:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_t
-- ----------------------------
DROP TABLE IF EXISTS `order_t`;
CREATE TABLE `order_t` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `touristAccount` varchar(20) NOT NULL,
  `sellerAccount` varchar(20) NOT NULL,
  `shopName` varchar(20) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `productPrice` double NOT NULL,
  `productNum` int(11) NOT NULL,
  `orderTotalPrice` double NOT NULL,
  `isPaid` bit(1) NOT NULL,
  `orderedTime` datetime NOT NULL,
  `orderComment` varchar(200) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK5` (`sellerAccount`),
  KEY `FK6` (`touristAccount`),
  KEY `FK4` (`productId`),
  CONSTRAINT `FK4` FOREIGN KEY (`productId`) REFERENCES `product_t` (`productId`),
  CONSTRAINT `FK5` FOREIGN KEY (`sellerAccount`) REFERENCES `seller_t` (`sellerAccount`),
  CONSTRAINT `FK6` FOREIGN KEY (`touristAccount`) REFERENCES `tourist_t` (`touristAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_t
-- ----------------------------

-- ----------------------------
-- Table structure for product_t
-- ----------------------------
DROP TABLE IF EXISTS `product_t`;
CREATE TABLE `product_t` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(20) NOT NULL,
  `productPic` varchar(200) NOT NULL,
  `productPrice` double NOT NULL,
  `productNum` int(11) NOT NULL,
  `productDes` varchar(200) NOT NULL,
  `sellerAccount` varchar(20) NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK7` (`sellerAccount`),
  CONSTRAINT `FK7` FOREIGN KEY (`sellerAccount`) REFERENCES `seller_t` (`sellerAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_t
-- ----------------------------

-- ----------------------------
-- Table structure for routingplan_t
-- ----------------------------
DROP TABLE IF EXISTS `routingplan_t`;
CREATE TABLE `routingplan_t` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `touristAccount` varchar(20) NOT NULL,
  `routingPlan` varchar(200) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`,`touristAccount`),
  KEY `FK8` (`touristAccount`),
  CONSTRAINT `FK8` FOREIGN KEY (`touristAccount`) REFERENCES `tourist_t` (`touristAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of routingplan_t
-- ----------------------------

-- ----------------------------
-- Table structure for scenic_t
-- ----------------------------
DROP TABLE IF EXISTS `scenic_t`;
CREATE TABLE `scenic_t` (
  `sceneryAccount` varchar(20) NOT NULL,
  `sceneryPassword` varchar(20) NOT NULL,
  `sceneryName` varchar(20) NOT NULL,
  `sceneryTel` varchar(11) NOT NULL,
  `ticketPrice` double NOT NULL,
  `ticketNum` int(11) NOT NULL,
  `sceneryPV` int(11) NOT NULL DEFAULT '0',
  `UserRole` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`sceneryAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic_t
-- ----------------------------
INSERT INTO `scenic_t` VALUES ('2014030402011', '123456', '长隆水上乐园', '18979429542', '100', '50', '0', '0');

-- ----------------------------
-- Table structure for seller_t
-- ----------------------------
DROP TABLE IF EXISTS `seller_t`;
CREATE TABLE `seller_t` (
  `sellerAccount` varchar(20) NOT NULL,
  `sellerPassword` varchar(20) NOT NULL,
  `shopName` varchar(30) NOT NULL,
  `sellerName` varchar(20) NOT NULL,
  `sellerSex` bit(1) NOT NULL,
  `sellerAge` int(11) NOT NULL,
  `sellerTel` varchar(20) NOT NULL,
  `UserRole` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sellerAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller_t
-- ----------------------------
INSERT INTO `seller_t` VALUES ('2014030402011', '123456', '肯德基', '杜敏', '', '24', '18979429542', '1');

-- ----------------------------
-- Table structure for shoppingcart_t
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart_t`;
CREATE TABLE `shoppingcart_t` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `sellerAccount` varchar(20) NOT NULL,
  `touristAccount` varchar(20) NOT NULL,
  `shopName` varchar(20) NOT NULL,
  `productId` int(11) NOT NULL,
  `productPrice` double(11,2) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `productNum` int(11) NOT NULL,
  PRIMARY KEY (`cartId`),
  KEY `FK1` (`sellerAccount`),
  KEY `FK2` (`touristAccount`),
  KEY `FK3` (`productId`),
  CONSTRAINT `FK1` FOREIGN KEY (`sellerAccount`) REFERENCES `seller_t` (`sellerAccount`),
  CONSTRAINT `FK2` FOREIGN KEY (`touristAccount`) REFERENCES `tourist_t` (`touristAccount`),
  CONSTRAINT `FK3` FOREIGN KEY (`productId`) REFERENCES `product_t` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart_t
-- ----------------------------

-- ----------------------------
-- Table structure for tourist_t
-- ----------------------------
DROP TABLE IF EXISTS `tourist_t`;
CREATE TABLE `tourist_t` (
  `touristAccount` varchar(20) NOT NULL,
  `touristPassword` varchar(20) NOT NULL,
  `touristName` varchar(20) NOT NULL,
  `touristSex` bit(1) NOT NULL,
  `touristAge` int(11) NOT NULL,
  `touristTel` varchar(20) NOT NULL,
  `UserRole` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`touristAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tourist_t
-- ----------------------------
INSERT INTO `tourist_t` VALUES ('2014030402011', '123456', '杜敏', '', '24', '18979429542', '0');
