/*
 Navicat Premium Data Transfer

 Source Server         : JavaEE
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 30/03/2019 22:28:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ausertable
-- ----------------------------
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) NOT NULL,
  `apwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ausertable
-- ----------------------------
BEGIN;
INSERT INTO `ausertable` VALUES (1, 'admin', '123456');
COMMIT;

-- ----------------------------
-- Table structure for busertable
-- ----------------------------
DROP TABLE IF EXISTS `busertable`;
CREATE TABLE `busertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `bpwd` varchar(50) DEFAULT NULL,
  `bemail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of busertable
-- ----------------------------
BEGIN;
INSERT INTO `busertable` VALUES (1, '123', '123', '123');
COMMIT;

-- ----------------------------
-- Table structure for carttable
-- ----------------------------
DROP TABLE IF EXISTS `carttable`;
CREATE TABLE `carttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) DEFAULT NULL,
  `goodstable_id` int(11) DEFAULT NULL,
  `shoppingnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_buser_id` (`busertable_id`),
  KEY `fk_product_id` (`goodstable_id`),
  CONSTRAINT `fk_buser_id` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for focustable
-- ----------------------------
DROP TABLE IF EXISTS `focustable`;
CREATE TABLE `focustable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) DEFAULT NULL,
  `busertable_id` int(11) DEFAULT NULL,
  `focustime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_focus_user_id` (`busertable_id`),
  KEY `fk_focus_product_id` (`goodstable_id`),
  CONSTRAINT `fk_focus_product_id` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_focus_user_id` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focustable
-- ----------------------------
BEGIN;
INSERT INTO `focustable` VALUES (1, 1, 1, '2019-03-24 19:56:41');
INSERT INTO `focustable` VALUES (2, 8, 1, '2019-03-26 10:56:09');
COMMIT;

-- ----------------------------
-- Table structure for goodstable
-- ----------------------------
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) DEFAULT NULL,
  `goprice` double DEFAULT NULL COMMENT '原价',
  `grprice` double DEFAULT NULL COMMENT '现价',
  `gstore` int(11) DEFAULT NULL COMMENT '库存',
  `gpicture` varchar(50) DEFAULT NULL,
  `goodstype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goodstype_id` (`goodstype_id`),
  CONSTRAINT `fk_goodstype_id` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstable
-- ----------------------------
BEGIN;
INSERT INTO `goodstable` VALUES (1, '充电宝', 2, 1, 2, '20190328101508698.jpeg', 1);
INSERT INTO `goodstable` VALUES (3, 'LKKK', 5555, 55, 5, '20190324195932685.jpeg', 1);
INSERT INTO `goodstable` VALUES (4, 'ee1111', 44, 3, 999, '20190324205438585.jpeg', 2);
INSERT INTO `goodstable` VALUES (5, '2', 2, 2, 0, NULL, 1);
INSERT INTO `goodstable` VALUES (7, 'LKKK22', 22, 2, 7, '20190327132938476.jpeg', 14);
INSERT INTO `goodstable` VALUES (8, '222', 22, 2, 2, NULL, 1);
INSERT INTO `goodstable` VALUES (27, 'w', 2, 2, 2, NULL, 14);
COMMIT;

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
BEGIN;
INSERT INTO `goodstype` VALUES (1, '充电宝');
INSERT INTO `goodstype` VALUES (2, '相机');
INSERT INTO `goodstype` VALUES (4, '洒大地');
INSERT INTO `goodstype` VALUES (13, '大');
INSERT INTO `goodstype` VALUES (14, 'x');
INSERT INTO `goodstype` VALUES (22, '爱上');
COMMIT;

-- ----------------------------
-- Table structure for noticetable
-- ----------------------------
DROP TABLE IF EXISTS `noticetable`;
CREATE TABLE `noticetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(100) DEFAULT NULL,
  `ncontent` varchar(500) DEFAULT NULL,
  `ntime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of noticetable
-- ----------------------------
BEGIN;
INSERT INTO `noticetable` VALUES (1, '1', '2', '2019-03-24 10:09:22');
INSERT INTO `noticetable` VALUES (2, '333', '1212121', '2019-03-24 19:51:33');
INSERT INTO `noticetable` VALUES (3, '管理员公告', '加油加油加油！', '2019-03-28 16:02:48');
COMMIT;

-- ----------------------------
-- Table structure for orderbasetable
-- ----------------------------
DROP TABLE IF EXISTS `orderbasetable`;
CREATE TABLE `orderbasetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL COMMENT '订单金额',
  `status` tinyint(4) DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_orderbase_user_id` (`busertable_id`),
  CONSTRAINT `fk_orderbase_user_id` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderbasetable
-- ----------------------------
BEGIN;
INSERT INTO `orderbasetable` VALUES (1, 1, 1, 1, '2019-03-28 22:01:15');
INSERT INTO `orderbasetable` VALUES (2, 1, 133, 1, '2019-03-24 21:38:14');
INSERT INTO `orderbasetable` VALUES (3, 1, 2865, 1, '2019-03-24 21:38:57');
INSERT INTO `orderbasetable` VALUES (4, 1, 3, 1, '2019-03-24 21:39:05');
INSERT INTO `orderbasetable` VALUES (5, 1, 3, 1, '2019-03-24 22:14:09');
INSERT INTO `orderbasetable` VALUES (12, 1, 1, 1, '2019-03-28 20:09:41');
INSERT INTO `orderbasetable` VALUES (13, 1, 0, 1, '2019-03-28 20:33:39');
INSERT INTO `orderbasetable` VALUES (14, 1, 1, 0, '2019-03-28 21:37:30');
INSERT INTO `orderbasetable` VALUES (15, 1, 1, 0, '2019-03-29 16:10:17');
INSERT INTO `orderbasetable` VALUES (16, 1, 1, 0, '2019-03-29 16:13:37');
INSERT INTO `orderbasetable` VALUES (17, 1, 1, 0, '2019-03-29 16:26:24');
INSERT INTO `orderbasetable` VALUES (18, 1, 1, 1, '2019-03-29 16:43:25');
INSERT INTO `orderbasetable` VALUES (19, 1, 3, 1, '2019-03-29 16:44:08');
INSERT INTO `orderbasetable` VALUES (20, 1, 1, 1, '2019-03-29 21:27:14');
INSERT INTO `orderbasetable` VALUES (21, 1, 3, 0, '2019-03-29 21:45:51');
INSERT INTO `orderbasetable` VALUES (22, 1, 22, 1, '2019-03-30 20:48:59');
INSERT INTO `orderbasetable` VALUES (24, 1, 99, 1, '2019-03-30 21:54:01');
COMMIT;

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int(11) DEFAULT NULL,
  `goodstable_id` int(11) DEFAULT NULL,
  `shoppingnum` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `returndate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `fk_orderdetail_base_id` (`orderbasetable_id`),
  KEY `fk_orderdetail_pro_id` (`goodstable_id`),
  CONSTRAINT `fk_orderdetail_base_id` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderdetail_pro_id` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
BEGIN;
INSERT INTO `orderdetail` VALUES (1, 1, 1, 1, 1, '2019-03-30 21:54:27');
INSERT INTO `orderdetail` VALUES (2, 2, 1, 1, 1, '2019-03-30 21:54:35');
INSERT INTO `orderdetail` VALUES (3, 2, 4, 44, 1, '2019-03-30 21:54:41');
INSERT INTO `orderdetail` VALUES (5, 3, 4, 955, 1, '2019-03-30 21:53:19');
INSERT INTO `orderdetail` VALUES (6, 4, 4, 1, 0, '2019-03-29 18:49:43');
INSERT INTO `orderdetail` VALUES (7, 5, 4, 1, 0, '2019-03-29 18:49:44');
INSERT INTO `orderdetail` VALUES (15, 12, 1, 1, 0, '2019-03-29 18:49:45');
INSERT INTO `orderdetail` VALUES (16, 14, 1, 1, 0, '2019-03-29 18:49:46');
INSERT INTO `orderdetail` VALUES (17, 15, 1, 1, 0, '2019-03-29 18:49:47');
INSERT INTO `orderdetail` VALUES (18, 16, 1, 1, 0, '2019-03-29 18:49:49');
INSERT INTO `orderdetail` VALUES (19, 17, 1, 1, 0, '2019-03-29 18:49:50');
INSERT INTO `orderdetail` VALUES (20, 18, 1, 1, 0, '2019-03-29 18:49:50');
INSERT INTO `orderdetail` VALUES (21, 19, 1, 1, 0, '2019-03-29 18:49:51');
INSERT INTO `orderdetail` VALUES (22, 19, 5, 1, 0, '2019-03-29 18:49:52');
INSERT INTO `orderdetail` VALUES (24, 20, 1, 1, 0, NULL);
INSERT INTO `orderdetail` VALUES (25, 21, 1, 1, 0, NULL);
INSERT INTO `orderdetail` VALUES (26, 21, 5, 1, 0, NULL);
INSERT INTO `orderdetail` VALUES (28, 22, 1, 22, 1, '2019-03-30 21:48:36');
INSERT INTO `orderdetail` VALUES (30, 24, 1, 99, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for returnorder
-- ----------------------------
DROP TABLE IF EXISTS `returnorder`;
CREATE TABLE `returnorder` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `orderdetail_id` int(11) DEFAULT NULL,
  `goid` int(11) DEFAULT NULL,
  `shoppingnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `fa_orderdetail_id` (`orderdetail_id`),
  KEY `fk_goodstable_id` (`goid`),
  CONSTRAINT `fa_orderdetail_id` FOREIGN KEY (`orderdetail_id`) REFERENCES `orderdetail` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_goodstable_id` FOREIGN KEY (`goid`) REFERENCES `goodstable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of returnorder
-- ----------------------------
BEGIN;
INSERT INTO `returnorder` VALUES (1, NULL, NULL, NULL);
INSERT INTO `returnorder` VALUES (2, 1, 1, 1);
INSERT INTO `returnorder` VALUES (3, 28, 1, 22);
INSERT INTO `returnorder` VALUES (4, 28, 1, 22);
INSERT INTO `returnorder` VALUES (5, 28, 1, 22);
INSERT INTO `returnorder` VALUES (7, 28, 1, 22);
INSERT INTO `returnorder` VALUES (8, 5, 4, 955);
INSERT INTO `returnorder` VALUES (9, 1, 1, 1);
INSERT INTO `returnorder` VALUES (10, 2, 1, 1);
INSERT INTO `returnorder` VALUES (11, 3, 4, 44);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
