/*
Navicat MySQL Data Transfer

Source Server         : kingja
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : spring

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-11-15 17:32:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 NOT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifyTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nickName` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '昵称',
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '韩梅梅', '123456', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null);
INSERT INTO `account` VALUES ('2', '哈哈', '哈哈', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null);
INSERT INTO `account` VALUES ('3', '哈哈adsdf', '哈哈111', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null);
INSERT INTO `account` VALUES ('4', 'dsfd ', '都是', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null);
INSERT INTO `account` VALUES ('5', '科比', '也来了', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻标题',
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻内容',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `category` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻分类',
  `author` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '作者',
  `newsTopUrl` varchar(100) CHARACTER SET utf8 DEFAULT '',
  `commentId` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '评论Id',
  `newsContentUrl` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '第一条新闻', '新闻内容', '2016-11-09 08:49:33', '2016-11-09 08:49:33', '体育', '牛百叶', null, null, null);
INSERT INTO `news` VALUES ('2', 'NBA总冠军', '乔丹所在公牛队\r\n', '2016-11-09 09:08:11', '2016-11-09 09:08:11', '体育', '再别康桥', null, null, null);
INSERT INTO `news` VALUES ('3', '第二条', '新闻内容\r\n', '2016-11-09 09:55:22', '2016-11-09 09:55:22', '体育', '三本', null, null, null);
INSERT INTO `news` VALUES ('4', '第三条', '新闻内容\r\n', '2016-11-09 10:02:44', '2016-11-09 10:02:44', '体育', '关于', null, null, null);
INSERT INTO `news` VALUES ('6', '再别康桥', '新闻内容\r\n', '2016-11-09 10:57:50', '2016-11-09 10:57:50', '体育', '徐志摩', null, null, null);
INSERT INTO `news` VALUES ('7', 'aaa', '新闻内容\r\n', '2016-11-09 11:13:40', '2016-11-09 11:13:40', '体育', 'bbb', null, null, null);
INSERT INTO `news` VALUES ('8', '稀土掘金', '编辑推荐：稀土掘金，这是一个针对技术开发者的一个应用，你可以在掘金上获取最新最优质的技术干货，不仅仅是Android知识、前端、后端以至于产品和设计都有涉猎，想成为全栈工程师的朋友不要错过！', '2016-11-09 13:03:06', '2016-11-09 13:03:06', '体育', '稀土掘金', null, null, null);
INSERT INTO `news` VALUES ('9', 'dsfa ', '新闻内容\r\nsdf ', '2016-11-09 13:42:00', '2016-11-09 13:42:00', '体育', 'sdf ', null, null, null);
INSERT INTO `news` VALUES ('10', '有一条新闻', '123456', '2016-11-14 10:40:00', '2016-11-14 10:40:00', '科技', '黑金', '', null, null);
INSERT INTO `news` VALUES ('11', 'ddd', '新闻内容\r\n', '2016-11-14 15:22:25', '2016-11-14 15:22:25', '体育', 'ddd', 'F:\\wxy\\WzShow\\target\\WzShow\\WEB-INF\\upload\\ic_launcher.png', null, null);
INSERT INTO `news` VALUES ('12', '222', '新闻内容\r\n', '2016-11-14 15:35:13', '2016-11-14 15:35:13', '体育', '222', 'F:\\wxy\\WzShow\\target\\WzShow\\WEB-INF\\upload\\ic_launcher.png', null, null);
INSERT INTO `news` VALUES ('13', 'ccc', '新闻内容\r\n', '2016-11-14 15:43:03', '2016-11-14 15:43:03', '体育', 'ccc', '/upload/ic_launcher.png', null, null);
INSERT INTO `news` VALUES ('14', '444', '新闻内容\r\n', '2016-11-14 16:20:43', '2016-11-14 16:20:43', '体育', '444', '/upload/bg_msg_tip.png', null, null);
INSERT INTO `news` VALUES ('15', 'qqq', '新闻内容\r\n', '2016-11-14 16:30:38', '2016-11-14 16:30:38', '体育', 'qqq', '/upload/bg_msg_tip.png', null, '/upload/bg_menu.png#/upload/bg_msg.png#');
INSERT INTO `news` VALUES ('16', 'sdf s', '新闻内容\r\nsdf sdf sd fs', '2016-11-15 16:49:05', '2016-11-15 16:49:05', '体育', 'sfd fsd', '/upload/bg_msg_tip.png', null, '/upload/bg_menu.png#/upload/bg_msg.png#');
SET FOREIGN_KEY_CHECKS=1;
