/*
Navicat MySQL Data Transfer

Source Server         : kingja
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : spring

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-03-24 16:33:46
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
  `des` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '个性签名',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '韩梅梅', '123456', '2016-11-15 15:01:37', '2017-03-21 15:35:37', '', null, '', '/upload/avatar/head_1.jpg', '200', '0', '我是我，不一样的烟火');
INSERT INTO `account` VALUES ('2', '哈哈', '哈哈', '2016-11-15 15:01:37', '2017-03-21 15:36:03', '', null, '', '/upload/avatar/head_2.jpg', '200', '10', '心情一直棒棒的');
INSERT INTO `account` VALUES ('3', '哈哈adsdf', '哈哈111', '2016-11-15 15:01:37', '2017-03-21 15:36:14', '', null, '', '/upload/avatar/head_3.jpg', '200', '200', '专业治疗师');
INSERT INTO `account` VALUES ('4', 'dsfd ', '都是', '2016-11-15 15:01:37', '2017-03-21 15:35:39', '', null, '', '/upload/avatar/head_4.jpg', '200', '200', '我是我，不一样的烟火');
INSERT INTO `account` VALUES ('5', '科比', '也来了', '2016-11-15 15:01:37', '2017-03-21 15:35:40', '', null, '1350ebd07b7b416f9180b9756d3d9fca', '/upload/avatar/head_5.jpg', '200', '50', '我是我，不一样的烟火');
INSERT INTO `account` VALUES ('6', '詹姆斯', '也来了', '2016-11-16 15:09:57', '2017-03-09 13:13:18', '', '', '', '/upload/avatar/head_6.jpg', '200', '100', '');
INSERT INTO `account` VALUES ('7', 'aaa', 'ccc', '2016-11-16 15:17:04', '2017-03-21 15:36:22', '', '', 'd5ca5cbb8b47438e9cb83328951116e9', '/upload/avatar/head_7.jpg', '200', '50', '你怎么舍得我伤悲');
INSERT INTO `account` VALUES ('8', '乔丹', 'ccc', '2016-11-16 15:17:21', '2017-03-24 13:10:35', '', '', '', '/upload/avatar/head_8.jpg', '200', '20', '接班人,别跟我说是詹姆斯，哦对了，我从来没有接班人，至少我看得上的，目前没有...');
INSERT INTO `account` VALUES ('9', 'aaa', 'bbb', '2016-11-18 13:34:13', '2017-03-24 16:19:13', '', '', 'd2a5d2f2e3ae4c01adee928c20e83e0e', '/upload/avatar/head_9.jpg', '99794', '146', '我是我，不一样的烟火');
INSERT INTO `account` VALUES ('10', 'ccc', 'bbb', '2016-11-18 13:55:54', '2016-12-10 14:16:36', '', '', '', '/upload/avatar/head_default.jpg', '247', '47', '');
INSERT INTO `account` VALUES ('11', '1', '1', '2016-11-22 10:58:32', '2017-03-21 15:35:43', '', '', '', '/upload/avatar/head_default.jpg', '200', '50', '我是我，不一样的烟火');
INSERT INTO `account` VALUES ('12', 'ddd', 'ddd', '2016-11-22 10:58:36', '2017-03-21 15:36:41', '', '', '', '/upload/avatar/head_default.jpg', '200', '20', '本地区基本没人比我帅');

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
  CONSTRAINT `accountId` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`) ON UPDATE CASCADE,
  CONSTRAINT `questionId` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('3', '好像是的', '', '3', '0', '2016-11-02 11:06:10', '2017-03-13 15:09:04', '7', '18', '0');
INSERT INTO `answer` VALUES ('4', '这个可以有', '', '2', '0', '2016-11-03 11:06:10', '2016-11-23 14:05:09', '5', '5', '0');
INSERT INTO `answer` VALUES ('5', '必须点', '', '2', '0', '2016-11-21 11:06:10', '2016-11-23 15:42:12', '5', '7', '0');
INSERT INTO `answer` VALUES ('6', '楼主记得早起', '/upload/275785422767016085266878617378913609278.jpg#', '0', '0', '2016-11-24 15:03:48', '2017-03-10 13:57:16', '9', '7', '0');
INSERT INTO `answer` VALUES ('7', '洞头可以看到日出，楼主记得早起', '/upload/275785422767016085266878617378913609278.jpg#/upload/275973204128748668658315770757783316030.jpg#/upload/276203771233540155247118095303592994366#', '0', '0', '2016-11-24 15:09:51', '2017-03-21 13:45:46', '9', '17', '0');
INSERT INTO `answer` VALUES ('8', '自己家门口', '/upload/275785422767016085266878617378913609278.jpg#', '0', '0', '2016-11-24 15:20:54', '2017-03-10 13:57:52', '9', '17', '0');
INSERT INTO `answer` VALUES ('9', '我也不知道啊', '/upload/275785422767016085266878617378913609278.jpg#/upload/275973204128748668658315770757783316030.jpg#', '0', '0', '2016-11-24 15:22:14', '2017-03-10 13:57:06', '9', '17', '0');
INSERT INTO `answer` VALUES ('10', '大神，求我啊', '', '0', '0', '2017-03-13 14:55:52', '2017-03-23 16:56:13', '9', '17', '0');
INSERT INTO `answer` VALUES ('11', '我要保命', '', '0', '0', '2017-03-13 14:56:17', '2017-03-23 16:58:23', '8', '17', '0');
INSERT INTO `answer` VALUES ('12', '沙发太大了', '', '0', '0', '2017-03-13 14:56:17', '2017-03-23 16:56:26', '9', '16', '0');
INSERT INTO `answer` VALUES ('13', '尼玛的', '', '0', '0', '2017-03-13 14:56:17', '2017-03-23 16:56:40', '9', '16', '0');
INSERT INTO `answer` VALUES ('14', '疯狂变身中', '', '0', '0', '2017-03-13 14:56:18', '2017-03-23 16:56:45', '9', '16', '0');
INSERT INTO `answer` VALUES ('15', '什么情况', '', '0', '0', '2017-03-13 14:56:18', '2017-03-23 16:56:50', '9', '16', '0');
INSERT INTO `answer` VALUES ('16', '我TM也是醉了', '', '0', '0', '2017-03-13 14:56:18', '2017-03-23 16:56:57', '9', '16', '0');
INSERT INTO `answer` VALUES ('17', '直播中', '', '0', '0', '2017-03-13 14:56:19', '2017-03-23 16:57:55', '8', '16', '0');
INSERT INTO `answer` VALUES ('18', '这可不是开玩笑的', '', '0', '0', '2017-03-13 14:56:19', '2017-03-23 16:58:00', '8', '16', '0');
INSERT INTO `answer` VALUES ('19', '对了，就这样', '', '0', '0', '2017-03-13 14:56:19', '2017-03-23 16:58:02', '8', '16', '0');
INSERT INTO `answer` VALUES ('20', '哈哈， 终于占了', '', '0', '0', '2017-03-13 14:56:19', '2017-03-23 16:58:05', '8', '16', '0');
INSERT INTO `answer` VALUES ('21', '我看还行', '/upload/answer/db25202aa0a74d3b8ad2f79e2eb44023.png#', '0', '0', '2017-03-15 17:17:18', '2017-03-23 16:58:15', '8', '45', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关注表';

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES ('1', '9', '1', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('2', '9', '2', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('4', '9', '4', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('5', '9', '5', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('7', '9', '7', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('8', '9', '8', '2016-11-29 15:51:52');
INSERT INTO `attention` VALUES ('16', '3', '9', '2017-03-22 15:36:18');
INSERT INTO `attention` VALUES ('17', '4', '9', '2017-03-22 15:36:19');
INSERT INTO `attention` VALUES ('18', '5', '9', '2017-03-22 15:36:19');
INSERT INTO `attention` VALUES ('19', '6', '9', '2017-03-22 15:36:20');
INSERT INTO `attention` VALUES ('20', '3', '8', '2017-03-22 15:37:04');
INSERT INTO `attention` VALUES ('27', '9', '3', '2017-03-24 15:27:54');
INSERT INTO `attention` VALUES ('30', '9', '6', '2017-03-24 15:31:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '2', '17', '2016-11-24 10:33:35');
INSERT INTO `collect` VALUES ('2', '9', '18', '2016-11-28 15:29:20');
INSERT INTO `collect` VALUES ('29', '9', '43', '2016-11-29 15:02:08');
INSERT INTO `collect` VALUES ('30', '9', '44', '2016-11-29 15:02:27');
INSERT INTO `collect` VALUES ('32', '9', '10', '2016-11-29 15:02:29');
INSERT INTO `collect` VALUES ('33', '9', '11', '2016-11-29 15:02:30');
INSERT INTO `collect` VALUES ('34', '9', '12', '2016-11-29 15:02:31');
INSERT INTO `collect` VALUES ('35', '9', '13', '2016-11-29 15:02:32');
INSERT INTO `collect` VALUES ('36', '9', '14', '2016-11-29 15:02:33');
INSERT INTO `collect` VALUES ('49', '9', '15', '2017-03-16 14:30:00');
INSERT INTO `collect` VALUES ('50', '9', '16', '2017-03-18 14:34:37');

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
  `giftDes` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '礼品描述',
  PRIMARY KEY (`giftId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gift
-- ----------------------------
INSERT INTO `gift` VALUES ('1', '爱心', '20', '1', '/img/gift/ax.png', '2016-11-30 10:13:48', '爱心');
INSERT INTO `gift` VALUES ('2', '棒棒糖', '5', '2', '/img/gift/bbt.png', '2016-11-30 10:13:48', '棒棒糖');
INSERT INTO `gift` VALUES ('3', '冰棍', '5', '2', '/img/gift/bg.png', '2016-11-30 10:13:48', '冰棍');
INSERT INTO `gift` VALUES ('4', '巧克力', '10', '3', '/img/gift/ckl.png', '2016-11-30 10:13:48', '巧克力');
INSERT INTO `gift` VALUES ('5', '蛋糕', '20', '3', '/img/gift/dg.png', '2016-11-30 10:13:48', '蛋糕');
INSERT INTO `gift` VALUES ('6', '肥皂', '10', '1', '/img/gift/fz.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('7', '红包', '50', '1', '/img/gift/hb.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('8', '口红', '100', '2', '/img/gift/kh.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('9', '红玫瑰', '99', '1', '/img/gift/mg.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('10', '啤酒', '30', '1', '/img/gift/pj.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('11', '情书', '200', '2', '/img/gift/qs.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('12', '香槟', '500', '3', '/img/gift/xb.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('13', '香蕉', '15', '1', '/img/gift/xj.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('14', '茉莉', '80', '2', '/img/gift/ml.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('15', '药丸', '30', '1', '/img/gift/yw.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('16', '甜粽子', '15', '1', '/img/gift/tzz.png', '2016-11-30 10:13:48', '');
INSERT INTO `gift` VALUES ('17', '咸粽子', '15', '1', '/img/gift/xzz.png', '2016-11-30 10:13:48', '');

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
INSERT INTO `my_gift` VALUES ('9', '1', '2', '2016-11-30 14:56:22', '2017-03-20 14:02:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of praise
-- ----------------------------
INSERT INTO `praise` VALUES ('1', '9', '21', '2017-03-16 16:18:04', '0');
INSERT INTO `praise` VALUES ('2', '1', '21', '2017-03-16 16:18:28', '0');
INSERT INTO `praise` VALUES ('3', '9', '9', '2017-03-16 16:18:31', '0');
INSERT INTO `praise` VALUES ('4', '9', '11', '2017-03-16 17:14:52', '0');
INSERT INTO `praise` VALUES ('5', '9', '11', '2017-03-16 17:16:04', '0');
INSERT INTO `praise` VALUES ('6', '9', '11', '2017-03-16 17:17:07', '0');
INSERT INTO `praise` VALUES ('7', '9', '17', '2017-03-17 10:03:59', '0');
INSERT INTO `praise` VALUES ('8', '9', '19', '2017-03-17 10:04:11', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('5', '标题1', '内容1', '', '2016-11-18 17:05:30', '2017-03-07 16:38:55', '0', '0', '1', '1', '0');
INSERT INTO `question` VALUES ('6', '标题2', '内容2', '/upload/275456607036279209870861864829104776766.jpg#/upload/275785422767016085266878617378913609278.jpg#', '2016-11-18 17:05:30', '2017-03-07 16:40:48', '0', '0', '2', '1', '0');
INSERT INTO `question` VALUES ('7', '标题3', '内容3', '/upload/275785422767016085266878617378913609278.jpg', '2016-11-18 17:05:30', '2017-03-07 16:40:50', '0', '0', '3', '1', '0');
INSERT INTO `question` VALUES ('8', '标题4', '内容4', '/upload/275785422767016085266878617378913609278.jpg', '2016-11-18 17:05:30', '2017-03-07 16:40:52', '0', '0', '4', '1', '1');
INSERT INTO `question` VALUES ('9', '标题5', '内容5', '/upload/275785422767016085266878617378913609278.jpg', '2016-11-18 17:05:30', '2017-03-07 16:40:54', '0', '0', '3', '1', '1');
INSERT INTO `question` VALUES ('10', '这是没图片的', '怎么上火星', '', '2016-11-21 15:53:46', '2017-03-07 16:42:00', '0', '0', '1', '6', '0');
INSERT INTO `question` VALUES ('11', '这图片是错误的', '怎么上火星', '275905063947578275615563891567481153086.jpg', '2016-11-21 16:06:08', '2017-03-07 16:42:14', '0', '0', '4', '6', '0');
INSERT INTO `question` VALUES ('12', '怎么上火星', '怎么上火星', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-21 16:06:23', '2017-03-07 16:40:58', '0', '0', '3', '6', '0');
INSERT INTO `question` VALUES ('13', '怎么上火星', '怎么上火星', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-21 16:06:42', '2017-03-07 16:41:01', '0', '0', '3', '6', '0');
INSERT INTO `question` VALUES ('14', '怎么上火星', '怎么上火星', '', '2016-11-21 16:07:11', '2017-03-07 16:38:52', '0', '0', '9', '6', '0');
INSERT INTO `question` VALUES ('15', '怎么上火星', '怎么上火星', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-21 16:08:13', '2017-03-07 16:41:02', '0', '0', '9', '6', '0');
INSERT INTO `question` VALUES ('16', '搞清楚上述内容后，我想就不必要纠结于经验获得的公式算法了，相反经验和升级不是一个公式化就能搞定的东西，有些情况下可以根据实际需求进行调整，当然调整的手段和规模尽量保证低风险和高效用', '怎么上火星', '', '2016-11-21 16:11:26', '2017-03-07 16:38:10', '0', '0', '9', '6', '1');
INSERT INTO `question` VALUES ('17', '哪里可以看日出', '哪里可以看日出哪里可以看日出哪里可以看日出哪里可以看日出', '/upload/275785422767016085266878617378913609278.jpg#/upload/275973204128748668658315770757783316030.jpg#', '2016-11-22 10:17:55', '2017-03-07 16:41:11', '0', '0', '9', '6', '1');
INSERT INTO `question` VALUES ('18', '怎么轻松来一个720转身扣篮', '醒醒，哥们，起来搬砖了。', '/upload/275785422767016085266878617378913609278.jpg', '2016-11-22 10:48:39', '2017-03-07 16:41:13', '0', '0', '9', '1', '1');
INSERT INTO `question` VALUES ('19', '1', '1', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-22 10:59:06', '2017-03-07 16:41:15', '0', '0', '2', '1', '0');
INSERT INTO `question` VALUES ('20', '哪里可以吃到好吃的饺子', '洞头可以看到日出，楼主记得早起', '', '2016-11-24 15:01:38', '2017-03-22 13:30:03', '0', '0', '2', '1', '0');
INSERT INTO `question` VALUES ('21', '请问大家一个问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:13:40', '2017-03-07 16:41:17', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('22', '请问大家一个问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:13:40', '2017-03-07 16:41:19', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('23', '请问大家一个问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:13:40', '2017-03-07 16:41:21', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('24', '请问大家一个问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:13:40', '2017-03-07 16:41:23', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('25', '请问大家一个问题24', '具体问题请看标题24', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:34:06', '2017-03-07 16:41:25', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('26', '这是一个新的问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:38:54', '2017-03-07 16:41:26', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('27', '这是一个新的问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:38:54', '2017-03-07 16:41:28', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('28', '这是一个新的问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:38:54', '2017-03-07 16:41:31', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('29', '这是一个新的问题', '具体问题请看标题', '/upload/275905063947578275615563891567481153086.jpg', '2016-11-29 09:38:54', '2017-03-07 16:41:34', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('30', '这是一个新的问题', '具体问题请看标题', '', '2016-11-29 09:38:54', '2017-03-07 16:41:40', '0', '0', '8', '1', '0');
INSERT INTO `question` VALUES ('32', 'rrf', 'ggh', '', '2017-03-15 13:22:08', '2017-03-15 13:48:13', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('33', 'rrf', 'ggh', '', '2017-03-15 13:22:08', '2017-03-15 13:48:17', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('34', 'rrf', 'ggh', '', '2017-03-15 13:25:55', '2017-03-15 13:48:21', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('35', '哪里有好吃的料理？', '如题', '/upload/publish/108d6fe2d37d4e85bfe85aae877c0394.png#', '2017-03-15 14:51:48', '2017-03-15 14:51:48', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('36', '吧', '啦啦啦', '', '2017-03-15 14:57:29', '2017-03-15 14:57:29', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('37', '测试下事件总线', '如题', '/upload/publish/c3abaabb8f7b4a98935b6605b468cd6e.png#', '2017-03-15 15:07:07', '2017-03-15 15:07:07', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('38', '我刚来，不知道问什么', '哈哈', '/upload/publish/94f02c823deb4697a6c1c1fb78de0f16.png#', '2017-03-15 15:14:32', '2017-03-15 15:14:32', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('39', '我感觉我要火', '如题', '/upload/publish/c16fb67105f947b4ac5a6b1749b3c5a3.png#', '2017-03-15 15:17:17', '2017-03-15 15:17:17', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('40', '又来一个哈哈', '哈哈', '', '2017-03-15 15:24:07', '2017-03-15 15:24:07', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('41', '差不多了', '是的', '', '2017-03-15 15:26:52', '2017-03-15 15:26:52', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('42', 'rrr', 'rrr', '', '2017-03-15 15:35:12', '2017-03-15 15:35:12', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('43', 'ttt', 'ttt', '', '2017-03-15 15:36:56', '2017-03-15 15:36:56', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('44', '好了吧', '好了Y(^o^)Y', '', '2017-03-15 15:48:09', '2017-03-15 15:48:09', '0', '0', '9', '1', '0');
INSERT INTO `question` VALUES ('45', '这张图怎样', '哈哈', '/upload/publish/a07e5c316049497ab64a44785d7bfea2.png#', '2017-03-15 15:50:25', '2017-03-22 13:54:34', '0', '0', '3', '1', '0');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `myview` AS select `account`.`name` AS `name`,`account`.`password` AS `password` from `account` ;

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
