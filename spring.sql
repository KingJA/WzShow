/*
Navicat MySQL Data Transfer

Source Server         : kingja
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : spring

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-03-05 21:24:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accountId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nickName` varchar(20) CHARACTER SET utf8 DEFAULT '' COMMENT '昵称',
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT '',
  `token` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT 'token',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像',
  `coin` int(11) unsigned DEFAULT '200',
  `experience` int(11) unsigned DEFAULT '0' COMMENT '经验值',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '韩梅梅', '123456', '2016-11-15 15:01:37', '2016-11-23 09:37:02', '', null, '', '/upload/avatar/head_1.jpg', '200', '0');
INSERT INTO `account` VALUES ('2', '哈哈', '哈哈', '2016-11-15 15:01:37', '2016-11-23 09:37:26', '', null, '', '/upload/avatar/head_2.jpg', '200', '0');
INSERT INTO `account` VALUES ('3', '哈哈adsdf', '哈哈111', '2016-11-15 15:01:37', '2016-11-23 09:37:28', '', null, '', '/upload/avatar/head_3.jpg', '200', '0');
INSERT INTO `account` VALUES ('4', 'dsfd ', '都是', '2016-11-15 15:01:37', '2016-11-23 09:37:30', '', null, '', '/upload/avatar/head_4.jpg', '200', '0');
INSERT INTO `account` VALUES ('5', '科比', '也来了', '2016-11-15 15:01:37', '2016-11-23 09:37:32', '', null, '1350ebd07b7b416f9180b9756d3d9fca', '/upload/avatar/head_5.jpg', '200', '0');
INSERT INTO `account` VALUES ('6', '詹姆斯', '也来了', '2016-11-16 15:09:57', '2016-11-23 09:37:36', '', '', '', '/upload/avatar/head_6.jpg', '200', '0');
INSERT INTO `account` VALUES ('7', 'aaa', 'ccc', '2016-11-16 15:17:04', '2017-02-28 23:24:57', '', '', '44672286cc57471c9c245ed0699786c5', '/upload/avatar/head_7.jpg', '200', '0');
INSERT INTO `account` VALUES ('8', '乔丹', 'ccc', '2016-11-16 15:17:21', '2016-11-23 09:37:42', '', '', '', '/upload/avatar/head_8.jpg', '200', '0');
INSERT INTO `account` VALUES ('9', 'aaa', 'bbb', '2016-11-18 13:34:13', '2017-02-28 23:24:57', '', '', '44672286cc57471c9c245ed0699786c5', '/upload/avatar/head_9.jpg', '99814', '146');
INSERT INTO `account` VALUES ('10', 'ccc', 'bbb', '2016-11-18 13:55:54', '2016-12-10 14:16:36', '', '', '', '/upload/avatar/head_default.jpg', '247', '47');
INSERT INTO `account` VALUES ('11', '1', '1', '2016-11-22 10:58:32', '2016-11-23 09:37:59', '', '', '', '/upload/avatar/head_default.jpg', '200', '0');
INSERT INTO `account` VALUES ('12', 'ddd', 'ddd', '2016-11-22 10:58:36', '2016-11-29 16:01:57', '', '', '', '/upload/avatar/head_default.jpg', '200', '0');

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '回答内容',
  `imgUrls` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '回答图片',
  `praiseCount` int(11) DEFAULT '0' COMMENT '点赞数',
  `collectCount` int(11) DEFAULT '0' COMMENT '收藏数',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回答时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '回答修改时间',
  `accountId` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `accept` tinyint(1) DEFAULT '0' COMMENT '是否是最佳答案1：是 0 ：否',
  PRIMARY KEY (`answerId`),
  KEY `accountId` (`accountId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `accountId` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `questionId` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('3', '好像是的', '', '3', '0', '2016-11-02 11:06:10', '2016-11-23 14:43:30', '7', '17', '0');
INSERT INTO `answer` VALUES ('4', '这个可以有', '', '2', '0', '2016-11-03 11:06:10', '2016-11-23 14:05:09', '5', '5', '0');
INSERT INTO `answer` VALUES ('5', '必须点', '', '2', '0', '2016-11-21 11:06:10', '2016-11-23 15:42:12', '5', '7', '0');
INSERT INTO `answer` VALUES ('6', '楼主记得早起', '/upload/head_default.jpg#', '0', '0', '2016-11-24 15:03:48', '2016-11-28 16:29:18', '9', '7', '0');
INSERT INTO `answer` VALUES ('7', '洞头可以看到日出，楼主记得早起', '/upload/head_default.jpg#', '0', '0', '2016-11-24 15:09:51', '2016-11-24 15:09:51', '9', '17', '0');
INSERT INTO `answer` VALUES ('8', '自己家门口', '/upload/#', '0', '0', '2016-11-24 15:20:54', '2016-11-24 15:20:54', '9', '17', '0');
INSERT INTO `answer` VALUES ('9', '我也不知道啊', '/upload/#', '0', '0', '2016-11-24 15:22:14', '2016-11-24 15:22:14', '9', '17', '0');

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `attentionId` int(11) NOT NULL AUTO_INCREMENT,
  `myAccountId` int(11) NOT NULL,
  `otherAccountId` int(11) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  PRIMARY KEY (`attentionId`),
  KEY `a` (`myAccountId`),
  KEY `b` (`otherAccountId`),
  CONSTRAINT `a` FOREIGN KEY (`myAccountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `b` FOREIGN KEY (`otherAccountId`) REFERENCES `account` (`accountId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关注表';

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES ('1', '9', '1', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('2', '9', '2', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('3', '9', '3', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('4', '9', '4', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('5', '9', '5', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('6', '9', '6', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('7', '9', '7', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('8', '9', '8', '2016-11-29 15:51:52');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collectId` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`collectId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '2', '17', '2016-11-24 10:33:35');
INSERT INTO `collect` VALUES ('2', '9', '18', '2016-11-28 15:29:20');
INSERT INTO `collect` VALUES ('3', '9', '15749', '2016-11-29 13:09:08');
INSERT INTO `collect` VALUES ('4', '9', '15755', '2016-11-29 14:46:33');
INSERT INTO `collect` VALUES ('5', '9', '15756', '2016-11-29 14:46:48');
INSERT INTO `collect` VALUES ('6', '9', '20', '2016-11-29 15:02:07');
INSERT INTO `collect` VALUES ('7', '9', '21', '2016-11-29 15:02:07');
INSERT INTO `collect` VALUES ('8', '9', '22', '2016-11-29 15:02:07');
INSERT INTO `collect` VALUES ('9', '9', '23', '2016-11-29 15:02:07');
INSERT INTO `collect` VALUES ('10', '9', '24', '2016-11-29 15:02:07');
INSERT INTO `collect` VALUES ('11', '9', '25', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('12', '9', '26', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('13', '9', '27', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('14', '9', '28', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('15', '9', '29', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('16', '9', '30', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('17', '9', '31', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('18', '9', '32', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('19', '9', '33', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('20', '9', '34', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('21', '9', '35', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('22', '9', '36', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('23', '9', '37', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('24', '9', '38', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('25', '9', '39', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('26', '9', '40', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('27', '9', '41', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('28', '9', '42', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('29', '9', '43', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('30', '9', '44', '2016-11-29 15:02:27');
INSERT INTO `collect` VALUES ('31', '9', '45', '2016-11-29 15:02:28');
INSERT INTO `collect` VALUES ('32', '9', '46', '2016-11-29 15:02:29');
INSERT INTO `collect` VALUES ('33', '9', '47', '2016-11-29 15:02:30');
INSERT INTO `collect` VALUES ('34', '9', '48', '2016-11-29 15:02:31');
INSERT INTO `collect` VALUES ('35', '9', '49', '2016-11-29 15:02:32');
INSERT INTO `collect` VALUES ('36', '9', '50', '2016-11-29 15:02:33');
INSERT INTO `collect` VALUES ('37', '9', '15762', '2016-12-09 16:19:34');
INSERT INTO `collect` VALUES ('38', '9', '15762', '2016-12-09 16:20:52');
INSERT INTO `collect` VALUES ('39', '9', '15752', '2016-12-10 09:44:34');
INSERT INTO `collect` VALUES ('40', '10', '15701', '2016-12-10 13:48:12');
INSERT INTO `collect` VALUES ('41', '10', '15705', '2016-12-10 14:01:35');
INSERT INTO `collect` VALUES ('42', '9', '15706', '2016-12-10 14:16:36');
INSERT INTO `collect` VALUES ('43', '10', '15707', '2016-12-10 14:18:15');

-- ----------------------------
-- Table structure for footprint
-- ----------------------------
DROP TABLE IF EXISTS `footprint`;
CREATE TABLE `footprint` (
  `pathId` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) DEFAULT NULL,
  `operationCode` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `accountBId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `experience` int(11) DEFAULT '0' COMMENT '增加的经验值',
  `coin` int(11) DEFAULT '0' COMMENT '增加的金币',
  PRIMARY KEY (`pathId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of footprint
-- ----------------------------
INSERT INTO `footprint` VALUES ('1', '9', '1', '15761', '浮沉教你学刷机，图文详解视频教程', null, '', '2016-12-05 17:19:29', '10', '10');
INSERT INTO `footprint` VALUES ('2', '9', '1', '15762', '怎么把 Bootstrap 用到项目中？', null, '', '2016-12-05 17:22:46', '10', '10');
INSERT INTO `footprint` VALUES ('3', '9', '3', '15762', '怎么把 Bootstrap 用到项目中？', '10', 'ccc', '2016-12-06 17:09:34', '2', '2');
INSERT INTO `footprint` VALUES ('4', '10', '4', '15762', '怎么把 Bootstrap 用到项目中？', '9', 'ccc', '2016-12-06 17:09:34', '2', '2');
INSERT INTO `footprint` VALUES ('5', '9', '2', '15762', '怎么把 Bootstrap 用到项目中？', null, '', '2016-12-06 17:25:28', '10', '10');
INSERT INTO `footprint` VALUES ('6', '9', '1', '15701', '塘下哪里火锅好吃', null, '', '2016-12-10 13:41:32', '10', '10');
INSERT INTO `footprint` VALUES ('7', '10', '2', '15701', '塘下哪里火锅好吃', null, '', '2016-12-10 13:41:56', '5', '5');
INSERT INTO `footprint` VALUES ('8', '10', '7', '15701', '塘下哪里火锅好吃', '9', 'aaa', '2016-12-10 13:48:12', '5', '5');
INSERT INTO `footprint` VALUES ('9', '9', '1', '15702', '来个赞啊', null, '', '2016-12-10 13:51:37', '10', '10');
INSERT INTO `footprint` VALUES ('10', '9', '1', '15703', '我是aaa发起的问题', null, '', '2016-12-10 13:54:21', '10', '10');
INSERT INTO `footprint` VALUES ('11', '10', '1', '15704', '我是CCC发起的问题', null, '', '2016-12-10 13:57:53', '10', '10');
INSERT INTO `footprint` VALUES ('12', '9', '1', '15705', '我还是AAA发起的委托给你', null, '', '2016-12-10 14:00:54', '10', '10');
INSERT INTO `footprint` VALUES ('13', '10', '7', '15705', '我还是AAA发起的委托给你', '9', 'aaa', '2016-12-10 14:01:35', '5', '5');
INSERT INTO `footprint` VALUES ('14', '10', '1', '15706', 'FC时代的游戏，更多的是从人的眼睛特性（横向视角广）、脖子（左右移比上下移轻松且可转角度大）、阅读习惯等考虑设计；你有发现高比宽比例大的屏幕吗？', null, '', '2016-12-10 14:16:09', '10', '10');
INSERT INTO `footprint` VALUES ('15', '9', '7', '15706', 'FC时代的游戏，更多的是从人的眼睛特性（横向视角广）、脖子（左右移比上下移轻松且可转角度大）、阅读习惯等考虑设计；你有发现高比宽比例大的屏幕吗？', '10', 'ccc', '2016-12-10 14:16:36', '5', '5');
INSERT INTO `footprint` VALUES ('16', '9', '1', '15707', 'sdf sd ', null, '', '2016-12-10 14:18:05', '10', '10');
INSERT INTO `footprint` VALUES ('17', '10', '7', '15707', 'sdf sd ', '9', 'aaa', '2016-12-10 14:18:16', '5', '5');
INSERT INTO `footprint` VALUES ('18', '9', '1', '15708', '测试空格', null, '', '2016-12-10 14:52:21', '10', '10');
INSERT INTO `footprint` VALUES ('19', '9', '1', '15709', '测试换行', null, '', '2016-12-10 14:53:13', '10', '10');
INSERT INTO `footprint` VALUES ('20', '9', '1', '15710', 'FC时代的游戏，更多的是从人的眼睛特性（横向视角例大的屏幕吗？', null, '', '2016-12-10 14:54:23', '10', '10');

-- ----------------------------
-- Table structure for gift
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
  `giftId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `giftName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '礼物名称',
  `giftCost` int(11) unsigned DEFAULT '100' COMMENT '礼物价值',
  `giftRank` tinyint(3) unsigned DEFAULT '1' COMMENT '礼物等级',
  `giftUrl` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '图片地址',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`giftId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gift
-- ----------------------------
INSERT INTO `gift` VALUES ('1', '爱心', '20', '1', '/img/gift/ax.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('2', '棒棒糖', '5', '2', '/img/gift/bbt.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('3', '冰棍', '5', '2', '/img/gift/bg.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('4', '巧克力', '10', '3', '/img/gift/ckl.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('5', '蛋糕', '20', '5', '/img/gift/dg.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('6', '肥皂', '10', '1', '/img/gift/fz.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('7', '红包', '50', '1', '/img/gift/hb.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('8', '口红', '100', '2', '/img/gift/kh.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('9', '红玫瑰', '99', '1', '/img/gift/mg.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('10', '啤酒', '30', '1', '/img/gift/pj.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('11', '情书', '200', '2', '/img/gift/qs.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('12', '香槟', '500', '3', '/img/gift/xb.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('13', '香蕉', '15', '1', '/img/gift/xj.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('14', '茉莉', '80', '2', '/img/gift/ml.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('15', '药丸', '30', '1', '/img/gift/yw.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('16', '甜粽子', '15', '1', '/img/gift/tzz.png', '2016-11-30 10:13:48');
INSERT INTO `gift` VALUES ('17', '咸粽子', '15', '1', '/img/gift/xzz.png', '2016-11-30 10:13:48');

-- ----------------------------
-- Table structure for my_gift
-- ----------------------------
DROP TABLE IF EXISTS `my_gift`;
CREATE TABLE `my_gift` (
  `accountId` int(11) DEFAULT NULL,
  `giftId` int(11) DEFAULT NULL,
  `giftCount` int(11) DEFAULT NULL COMMENT '金币数量',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of my_gift
-- ----------------------------
INSERT INTO `my_gift` VALUES ('9', '1', '1', '2016-11-30 14:56:22', '2016-12-01 14:07:56');
INSERT INTO `my_gift` VALUES ('9', '2', '11', '2016-11-30 14:56:22', '2016-12-01 17:31:12');
INSERT INTO `my_gift` VALUES ('9', '3', '5', '2016-11-30 14:56:22', '2016-12-07 14:43:53');
INSERT INTO `my_gift` VALUES ('9', '4', '4', '2016-11-30 14:56:22', '2016-12-01 14:07:56');
INSERT INTO `my_gift` VALUES ('8', '5', '5', '2016-11-30 14:56:22', '2016-12-01 14:07:56');
INSERT INTO `my_gift` VALUES ('9', '5', '3', '2016-12-02 09:29:55', '2016-12-02 09:34:38');
INSERT INTO `my_gift` VALUES ('9', '17', '1', '2016-12-08 10:27:08', '2016-12-08 10:27:08');
INSERT INTO `my_gift` VALUES ('9', '13', '1', '2016-12-08 10:27:11', '2016-12-08 10:27:11');
INSERT INTO `my_gift` VALUES ('9', '16', '1', '2016-12-08 10:27:14', '2016-12-08 10:27:14');
INSERT INTO `my_gift` VALUES ('9', '10', '1', '2016-12-08 10:27:23', '2016-12-08 10:27:23');
INSERT INTO `my_gift` VALUES ('9', '15', '1', '2016-12-08 10:27:25', '2016-12-08 10:27:25');
INSERT INTO `my_gift` VALUES ('9', '14', '1', '2016-12-08 10:29:56', '2016-12-08 10:29:56');
INSERT INTO `my_gift` VALUES ('9', '9', '1', '2016-12-08 10:30:00', '2016-12-08 10:30:00');
INSERT INTO `my_gift` VALUES ('9', '8', '1', '2016-12-08 10:30:02', '2016-12-08 10:30:02');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻标题',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻内容',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻分类',
  `author` varchar(10) DEFAULT NULL COMMENT '作者',
  `newsTopUrl` varchar(100) DEFAULT '',
  `commentId` varchar(32) DEFAULT NULL COMMENT '评论Id',
  `newsContentUrl` varchar(200) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL COMMENT '手机用户token',
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '第一条新闻', '新闻内容', '2016-11-09 08:49:33', '2016-11-09 08:49:33', '体育', '牛百叶', null, null, null, null);
INSERT INTO `news` VALUES ('2', 'NBA总冠军', '乔丹所在公牛队\r\n', '2016-11-09 09:08:11', '2016-11-09 09:08:11', '体育', '再别康桥', null, null, null, null);
INSERT INTO `news` VALUES ('3', '第二条', '新闻内容\r\n', '2016-11-09 09:55:22', '2016-11-09 09:55:22', '体育', '三本', null, null, null, null);
INSERT INTO `news` VALUES ('4', '第三条', '新闻内容\r\n', '2016-11-09 10:02:44', '2016-11-09 10:02:44', '体育', '关于', null, null, null, null);
INSERT INTO `news` VALUES ('6', '再别康桥', '新闻内容\r\n', '2016-11-09 10:57:50', '2016-11-09 10:57:50', '体育', '徐志摩', null, null, null, null);
INSERT INTO `news` VALUES ('7', 'aaa', '新闻内容\r\n', '2016-11-09 11:13:40', '2016-11-09 11:13:40', '体育', 'bbb', null, null, null, null);
INSERT INTO `news` VALUES ('8', '稀土掘金', '编辑推荐：稀土掘金，这是一个针对技术开发者的一个应用，你可以在掘金上获取最新最优质的技术干货，不仅仅是Android知识、前端、后端以至于产品和设计都有涉猎，想成为全栈工程师的朋友不要错过！', '2016-11-09 13:03:06', '2016-11-09 13:03:06', '体育', '稀土掘金', null, null, null, null);
INSERT INTO `news` VALUES ('9', 'dsfa ', '新闻内容\r\nsdf ', '2016-11-09 13:42:00', '2016-11-09 13:42:00', '体育', 'sdf ', null, null, null, null);
INSERT INTO `news` VALUES ('10', '有一条新闻', '123456', '2016-11-14 10:40:00', '2016-11-14 10:40:00', '科技', '黑金', '', null, null, null);
INSERT INTO `news` VALUES ('11', 'ddd', '新闻内容\r\n', '2016-11-14 15:22:25', '2016-11-14 15:22:25', '体育', 'ddd', 'F:\\wxy\\WzShow\\target\\WzShow\\WEB-INF\\upload\\ic_launcher.png', null, null, null);
INSERT INTO `news` VALUES ('12', '222', '新闻内容\r\n', '2016-11-14 15:35:13', '2016-11-14 15:35:13', '体育', '222', 'F:\\wxy\\WzShow\\target\\WzShow\\WEB-INF\\upload\\ic_launcher.png', null, null, null);
INSERT INTO `news` VALUES ('13', 'ccc', '新闻内容\r\n', '2016-11-14 15:43:03', '2016-11-14 15:43:03', '体育', 'ccc', '/upload/ic_launcher.png', null, null, null);
INSERT INTO `news` VALUES ('14', '444', '新闻内容\r\n', '2016-11-14 16:20:43', '2016-11-14 16:20:43', '体育', '444', '/upload/bg_msg_tip.png', null, null, null);
INSERT INTO `news` VALUES ('15', 'qqq', '新闻内容\r\n', '2016-11-14 16:30:38', '2016-11-14 16:30:38', '体育', 'qqq', '/upload/bg_msg_tip.png', null, '/upload/bg_menu.png#/upload/bg_msg.png#', null);
INSERT INTO `news` VALUES ('16', 'sdf s', '新闻内容\r\nsdf sdf sd fs', '2016-11-15 16:49:05', '2016-11-15 16:49:05', '体育', 'sfd fsd', '/upload/bg_msg_tip.png', null, '/upload/bg_menu.png#/upload/bg_msg.png#', null);
INSERT INTO `news` VALUES ('17', 'sdf s', '新闻内容\r\n', '2016-11-16 09:37:11', '2016-11-16 09:37:11', '体育', 'dsf ', '/upload/bg_msg.png', null, '/upload/#', null);
INSERT INTO `news` VALUES ('18', 'sss', '编辑推荐：稀土掘金，这是一个针对技术开发者的一个应用，你可以在掘金上获取最新最优质的技术干货，不仅仅是Android知识、前端、后端以至于产品和设计都有涉猎，想成为全栈工程师的朋友不要错过！编辑推荐：稀土掘金，这是一个针对技术开发者的一个应用，你可以在掘金上获取最新最优质的技术干货，不仅仅是Android知识、前端、后端以至于产品和设计都有涉猎，想成为全栈工程师的朋友不要错过！', '2016-11-18 11:35:11', '2016-11-18 11:35:11', '娱乐', 'ddd', '/upload/bg_logo_login.png', null, '/upload/bg_msg.png#', null);

-- ----------------------------
-- Table structure for praise
-- ----------------------------
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praiseId` int(11) NOT NULL AUTO_INCREMENT COMMENT '点赞Id',
  `accountId` int(11) DEFAULT NULL COMMENT '用户Id',
  `answerId` int(11) DEFAULT NULL COMMENT '回答Id',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0' COMMENT '点赞状态 1: 有效 0：无效',
  PRIMARY KEY (`praiseId`),
  KEY `accountId` (`accountId`),
  KEY `answerId` (`answerId`),
  CONSTRAINT `praise_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `praise_ibfk_2` FOREIGN KEY (`answerId`) REFERENCES `answer` (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of praise
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '问题标题',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '问题内容',
  `imgUrls` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '问题图片',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `answerCount` int(11) DEFAULT '0' COMMENT '回答数',
  `collectCount` int(11) DEFAULT '0' COMMENT '收藏数',
  `accountId` int(11) DEFAULT NULL COMMENT '用户id',
  `tagId` int(11) DEFAULT '1' COMMENT '标签id',
  `solved` tinyint(1) DEFAULT '0' COMMENT '是否解决 0 未解决 1 解决',
  PRIMARY KEY (`questionId`),
  KEY `accout_id` (`accountId`),
  KEY `tag_id` (`tagId`),
  CONSTRAINT `accout_id` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('5', '标题1', '内容1', '', '2016-11-18 17:05:30', '2016-11-29 15:16:27', '0', '0', '1', '1', '0');
INSERT INTO `question` VALUES ('6', '标题2', '内容2', '', '2016-11-18 17:05:30', '2016-11-29 15:16:28', '0', '0', '2', '1', '0');
INSERT INTO `question` VALUES ('7', '标题3', '内容3', '', '2016-11-18 17:05:30', '2016-11-29 15:16:29', '0', '0', '3', '1', '0');
INSERT INTO `question` VALUES ('8', '标题4', '内容4', '', '2016-11-18 17:05:30', '2017-03-05 19:00:09', '0', '0', '4', '1', '1');
INSERT INTO `question` VALUES ('9', '标题5', '内容5', '', '2016-11-18 17:05:30', '2017-03-05 19:00:12', '0', '0', '3', '1', '1');
INSERT INTO `question` VALUES ('10', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 15:53:46', '2016-11-22 17:22:45', '0', '0', '1', '6', '0');
INSERT INTO `question` VALUES ('11', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:06:08', '2016-11-22 17:22:57', '0', '0', '4', '6', '0');
INSERT INTO `question` VALUES ('12', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:06:23', '2016-11-22 17:22:55', '0', '0', '3', '6', '0');
INSERT INTO `question` VALUES ('13', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:06:42', '2016-11-22 17:22:55', '0', '0', '3', '6', '0');
INSERT INTO `question` VALUES ('14', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:07:11', '2016-11-28 13:03:27', '0', '0', '9', '6', '0');
INSERT INTO `question` VALUES ('15', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:08:13', '2016-11-28 11:18:21', '0', '0', '9', '6', '0');
INSERT INTO `question` VALUES ('16', '搞清楚上述内容后，我想就不必要纠结于经验获得的公式算法了，相反经验和升级不是一个公式化就能搞定的东西，有些情况下可以根据实际需求进行调整，当然调整的手段和规模尽量保证低风险和高效用', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:11:26', '2017-03-05 19:00:14', '0', '0', '9', '6', '1');
INSERT INTO `question` VALUES ('17', '哪里可以看日出', '哪里可以看日出哪里可以看日出哪里可以看日出哪里可以看日出', '', '2016-11-22 10:17:55', '2017-03-05 19:00:18', '0', '0', '9', '6', '1');
INSERT INTO `question` VALUES ('18', '怎么轻松来一个720转身扣篮', '醒醒，哥们，起来搬砖了。', '', '2016-11-22 10:48:39', '2017-03-05 19:00:22', '0', '0', '9', '1', '1');
INSERT INTO `question` VALUES ('19', '1', '1', '', '2016-11-22 10:59:06', '2016-11-22 17:22:52', '0', '0', '2', '1', '0');
INSERT INTO `question` VALUES ('20', '哪里可以吃到好吃的饺子', '洞头可以看到日出，楼主记得早起', '/upload/head_default.jpg#', '2016-11-24 15:01:38', '2016-11-29 09:14:01', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('21', '请问大家一个问题', '具体问题请看标题', '', '2016-11-29 09:13:40', '2016-11-29 09:14:14', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('22', '请问大家一个问题', '具体问题请看标题', '', '2016-11-29 09:13:40', '2016-11-29 09:14:15', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('23', '请问大家一个问题', '具体问题请看标题', '', '2016-11-29 09:13:40', '2016-11-29 09:14:15', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('24', '请问大家一个问题', '具体问题请看标题', '', '2016-11-29 09:13:40', '2016-11-29 09:34:13', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('25', '请问大家一个问题24', '具体问题请看标题24', '', '2016-11-29 09:34:06', '2016-11-29 09:39:22', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('26', '这是一个新的问题', '具体问题请看标题', '', '2016-11-29 09:38:54', '2016-11-29 15:16:40', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('27', '这是一个新的问题', '具体问题请看标题', '', '2016-11-29 09:38:54', '2016-11-29 15:16:40', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('28', '这是一个新的问题', '具体问题请看标题', '', '2016-11-29 09:38:54', '2016-11-29 15:16:41', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('29', '这是一个新的问题', '具体问题请看标题', '', '2016-11-29 09:38:54', '2016-11-29 15:16:41', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('30', '这是一个新的问题', '具体问题请看标题', '', '2016-11-29 09:38:54', '2016-11-29 15:17:13', '0', '0', '8', '1', '0');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '标签名',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签表';

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '生活', '2016-11-21 10:25:57');
INSERT INTO `tag` VALUES ('2', '娱乐', '2016-11-21 10:25:57');
INSERT INTO `tag` VALUES ('3', '工作', '2016-11-21 10:25:57');
INSERT INTO `tag` VALUES ('4', '感情', '2016-11-21 10:25:57');
INSERT INTO `tag` VALUES ('5', '吐槽', '2016-11-21 10:25:57');
INSERT INTO `tag` VALUES ('6', '求助', '2016-11-21 10:25:57');

-- ----------------------------
-- View structure for myview
-- ----------------------------
DROP VIEW IF EXISTS `myview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myview` AS select `account`.`name` AS `name`,`account`.`password` AS `password` from `account` ;

-- ----------------------------
-- Procedure structure for addAttention
-- ----------------------------
DROP PROCEDURE IF EXISTS `addAttention`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addAttention`()
begin
declare i int;
set i = 1;
while i <= 8 do 
insert into attention (myAccountId,otherAccountId) 
values (9,i);
set i = i +1;
end while; 
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addCollect
-- ----------------------------
DROP PROCEDURE IF EXISTS `addCollect`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCollect`()
begin
declare i int;
set i = 20;
while i <= 50 do 
insert into collect (accountId,questionId) 
values (9,i);
set i = i +1;
end while; 
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addGift
-- ----------------------------
DROP PROCEDURE IF EXISTS `addGift`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGift`()
begin
declare i int;
set i = 1;
while i <= 17 do 
insert into gift (giftName,giftUrl) 
values ("礼物","/img/gift/");
set i = i +1;
end while; 
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addMyGift
-- ----------------------------
DROP PROCEDURE IF EXISTS `addMyGift`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMyGift`()
begin
declare i int;
set i = 1;
while i <= 5 do 
insert into my_gift (accountId,giftId,giftCount) 
values (9,i,i);
set i = i +1;
end while; 
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for addQuestion
-- ----------------------------
DROP PROCEDURE IF EXISTS `addQuestion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addQuestion`()
begin
declare i int;
set i = 1;
while i <= 10000 do 
insert into question (title,content,imgUrls,accountId,answerCount,tagId) 
values ("FC时代的游戏，更多的是从人的眼睛特性（横向视角广）、脖子（左右移比上下移轻松且可转角度大）、阅读习惯等考虑设计；你有发现高比宽比例大的屏幕吗？","从FC时代养成的游戏习惯，加上上述说的人体特性和屏幕设计之外，作为一个游戏类型的存在，你可以理解为横版是这个类型的特色之一。",9,0,1);
set i = i +1;
end while; 
end
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
