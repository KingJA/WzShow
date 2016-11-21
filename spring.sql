/*
Navicat MySQL Data Transfer

Source Server         : kingja
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : spring

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-11-21 17:29:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nickName` varchar(20) CHARACTER SET utf8 DEFAULT '' COMMENT '昵称',
  `phone` varchar(11) CHARACTER SET utf8 DEFAULT '',
  `token` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT 'token',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '韩梅梅', '123456', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null, '', '');
INSERT INTO `account` VALUES ('2', '哈哈', '哈哈', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null, '', '');
INSERT INTO `account` VALUES ('3', '哈哈adsdf', '哈哈111', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null, '', '');
INSERT INTO `account` VALUES ('4', 'dsfd ', '都是', '2016-11-15 15:01:37', '2016-11-15 15:01:37', '', null, '', '');
INSERT INTO `account` VALUES ('5', '科比', '也来了', '2016-11-15 15:01:37', '2016-11-16 16:43:04', '', null, '1350ebd07b7b416f9180b9756d3d9fca', '/upload/avatar/bg_logo_login.png');
INSERT INTO `account` VALUES ('6', '科比', '也来了', '2016-11-16 15:09:57', '2016-11-16 15:09:57', '', '', '', '');
INSERT INTO `account` VALUES ('7', 'aaa', 'ccc', '2016-11-16 15:17:04', '2016-11-16 15:17:04', '', '', '', '');
INSERT INTO `account` VALUES ('8', '乔丹', 'ccc', '2016-11-16 15:17:21', '2016-11-16 15:17:21', '', '', '', '');
INSERT INTO `account` VALUES ('9', 'aaa', 'bbb', '2016-11-18 13:34:13', '2016-11-18 13:34:13', '', '', '', '');
INSERT INTO `account` VALUES ('10', 'ccc', 'bbb', '2016-11-18 13:55:54', '2016-11-18 13:55:54', '', '', '', '');

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '回答内容',
  `imgUrls` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '回答图片',
  `praiseCount` int(11) DEFAULT '0' COMMENT '点赞数',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回答时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '回答修改时间',
  `accountId` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`answerId`),
  KEY `accountId` (`accountId`),
  KEY `questionId` (`questionId`),
  CONSTRAINT `accountId` FOREIGN KEY (`accountId`) REFERENCES `account` (`account_id`),
  CONSTRAINT `questionId` FOREIGN KEY (`questionId`) REFERENCES `question` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '我觉得应该是这样的', '', '2', '2016-11-22 11:06:10', '2016-11-21 11:18:22', '5', '6');
INSERT INTO `answer` VALUES ('2', '我觉得应该是这样的', '', '2', '2016-11-01 11:06:10', '2016-11-21 11:18:33', '6', '6');
INSERT INTO `answer` VALUES ('3', '我觉得应该是这样的', '', '2', '2016-11-02 11:06:10', '2016-11-21 11:18:36', '7', '6');
INSERT INTO `answer` VALUES ('4', '我觉得应该是这样的', '', '2', '2016-11-03 11:06:10', '2016-11-21 11:18:40', '5', '5');
INSERT INTO `answer` VALUES ('5', '我觉得应该是这样的', '', '2', '2016-11-21 11:06:10', '2016-11-21 11:06:10', '5', '7');

-- ----------------------------
-- Table structure for my_answer
-- ----------------------------
DROP TABLE IF EXISTS `my_answer`;
CREATE TABLE `my_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_Id` int(11) NOT NULL,
  `account_Id` int(11) NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `question_Id` (`question_Id`),
  KEY `account_Id` (`account_Id`),
  CONSTRAINT `account_Id` FOREIGN KEY (`account_Id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `question_Id` FOREIGN KEY (`question_Id`) REFERENCES `question` (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='我回答的问答';

-- ----------------------------
-- Records of my_answer
-- ----------------------------
INSERT INTO `my_answer` VALUES ('1', '5', '1', '2016-11-18 17:06:51');
INSERT INTO `my_answer` VALUES ('2', '6', '2', '2016-11-18 17:06:51');
INSERT INTO `my_answer` VALUES ('3', '7', '3', '2016-11-18 17:06:51');
INSERT INTO `my_answer` VALUES ('4', '8', '2', '2016-11-18 17:06:51');
INSERT INTO `my_answer` VALUES ('5', '9', '3', '2016-11-18 17:06:51');

-- ----------------------------
-- Table structure for my_attention
-- ----------------------------
DROP TABLE IF EXISTS `my_attention`;
CREATE TABLE `my_attention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attentionActId` int(11) DEFAULT NULL,
  `attentionedActId` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  PRIMARY KEY (`id`),
  KEY `a` (`attentionActId`),
  KEY `b` (`attentionedActId`),
  CONSTRAINT `a` FOREIGN KEY (`attentionActId`) REFERENCES `account` (`account_id`),
  CONSTRAINT `b` FOREIGN KEY (`attentionedActId`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关注表';

-- ----------------------------
-- Records of my_attention
-- ----------------------------

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
  `answerCount` int(5) DEFAULT '0' COMMENT '回答数',
  `accountId` int(11) DEFAULT NULL COMMENT '用户id',
  `tagId` int(11) DEFAULT NULL COMMENT '标签id',
  PRIMARY KEY (`questionId`),
  KEY `accout_id` (`accountId`),
  KEY `tag_id` (`tagId`),
  CONSTRAINT `accout_id` FOREIGN KEY (`accountId`) REFERENCES `account` (`account_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('5', '标题1', '内容1', '', '2016-11-18 17:05:30', '2016-11-18 17:05:30', '0', null, null);
INSERT INTO `question` VALUES ('6', '标题2', '内容2', '', '2016-11-18 17:05:30', '2016-11-18 17:05:30', '0', null, null);
INSERT INTO `question` VALUES ('7', '标题3', '内容3', '', '2016-11-18 17:05:30', '2016-11-18 17:05:30', '0', null, null);
INSERT INTO `question` VALUES ('8', '标题4', '内容4', '', '2016-11-18 17:05:30', '2016-11-18 17:05:30', '0', null, null);
INSERT INTO `question` VALUES ('9', '标题5', '内容5', '', '2016-11-18 17:05:30', '2016-11-18 17:05:30', '0', null, null);
INSERT INTO `question` VALUES ('10', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 15:53:46', '2016-11-21 15:53:46', '0', null, '6');
INSERT INTO `question` VALUES ('11', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:06:08', '2016-11-21 16:06:08', '0', null, '6');
INSERT INTO `question` VALUES ('12', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:06:23', '2016-11-21 16:06:23', '0', null, '6');
INSERT INTO `question` VALUES ('13', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:06:42', '2016-11-21 16:06:42', '0', null, '6');
INSERT INTO `question` VALUES ('14', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:07:11', '2016-11-21 16:07:11', '0', null, '6');
INSERT INTO `question` VALUES ('15', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:08:13', '2016-11-21 16:08:13', '0', null, '6');
INSERT INTO `question` VALUES ('16', '怎么上火星', '怎么上火星', '/upload/bg_menu.png#/upload/bg_msg.png#', '2016-11-21 16:11:26', '2016-11-21 16:11:26', '0', null, '6');

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer` (
  `commentId` int(11) DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='回答-评论关联表';

-- ----------------------------
-- Records of question_answer
-- ----------------------------

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `myview` AS SELECT name,password
FROM account ;
SET FOREIGN_KEY_CHECKS=1;
