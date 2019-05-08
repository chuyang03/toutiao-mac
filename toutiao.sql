/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : toutiao

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 08/05/2019 20:28:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_type` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entity_index` (`entity_id`,`entity_type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, '这里是一个评论啊！0', 1, 1, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (2, '这里是一个评论啊！1', 1, 1, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (3, '这里是一个评论啊！2', 1, 1, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (4, '这里是一个评论啊！0', 2, 2, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (5, '这里是一个评论啊！1', 2, 2, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (6, '这里是一个评论啊！2', 2, 2, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (7, '这里是一个评论啊！0', 3, 3, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (8, '这里是一个评论啊！1', 3, 3, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (9, '这里是一个评论啊！2', 3, 3, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (10, '这里是一个评论啊！0', 4, 4, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (11, '这里是一个评论啊！1', 4, 4, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (12, '这里是一个评论啊！2', 4, 4, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (13, '这里是一个评论啊！0', 5, 5, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (14, '这里是一个评论啊！1', 5, 5, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (15, '这里是一个评论啊！2', 5, 5, 1, '2019-01-07 01:29:15', 0);
INSERT INTO `comment` VALUES (16, '这里是一个评论啊！0', 6, 6, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (17, '这里是一个评论啊！1', 6, 6, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (18, '这里是一个评论啊！2', 6, 6, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (19, '这里是一个评论啊！0', 7, 7, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (20, '这里是一个评论啊！1', 7, 7, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (21, '这里是一个评论啊！2', 7, 7, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (22, '这里是一个评论啊！0', 8, 8, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (23, '这里是一个评论啊！1', 8, 8, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (24, '这里是一个评论啊！2', 8, 8, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (25, '这里是一个评论啊！0', 9, 9, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (26, '这里是一个评论啊！1', 9, 9, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (27, '这里是一个评论啊！2', 9, 9, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (28, '这里是一个评论啊！0', 10, 10, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (29, '这里是一个评论啊！1', 10, 10, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (30, '这里是一个评论啊！2', 10, 10, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (31, '这里是一个评论啊！0', 11, 11, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (32, '这里是一个评论啊！1', 11, 11, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (33, '这里是一个评论啊！2', 11, 11, 1, '2019-01-07 01:29:16', 0);
INSERT INTO `comment` VALUES (34, 'gogo', 12, 11, 1, '2019-01-07 01:38:31', 0);
INSERT INTO `comment` VALUES (35, 'I like computer!', 12, 11, 1, '2019-01-07 01:38:48', 0);
COMMIT;

-- ----------------------------
-- Table structure for login_ticket
-- ----------------------------
DROP TABLE IF EXISTS `login_ticket`;
CREATE TABLE `login_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ticket` varchar(45) NOT NULL,
  `expired` datetime NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticket_UNIQUE` (`ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_ticket
-- ----------------------------
BEGIN;
INSERT INTO `login_ticket` VALUES (1, 1, 'TICKET1', '2019-01-07 01:29:15', 2);
INSERT INTO `login_ticket` VALUES (2, 2, 'TICKET2', '2019-01-07 06:29:15', 2);
INSERT INTO `login_ticket` VALUES (3, 3, 'TICKET3', '2019-01-07 11:29:15', 2);
INSERT INTO `login_ticket` VALUES (4, 4, 'TICKET4', '2019-01-07 16:29:15', 2);
INSERT INTO `login_ticket` VALUES (5, 5, 'TICKET5', '2019-01-07 21:29:15', 2);
INSERT INTO `login_ticket` VALUES (6, 6, 'TICKET6', '2019-01-08 02:29:15', 2);
INSERT INTO `login_ticket` VALUES (7, 7, 'TICKET7', '2019-01-08 07:29:16', 2);
INSERT INTO `login_ticket` VALUES (8, 8, 'TICKET8', '2019-01-08 12:29:16', 2);
INSERT INTO `login_ticket` VALUES (9, 9, 'TICKET9', '2019-01-08 17:29:16', 2);
INSERT INTO `login_ticket` VALUES (10, 10, 'TICKET10', '2019-01-08 22:29:16', 2);
INSERT INTO `login_ticket` VALUES (11, 11, 'TICKET11', '2019-01-09 03:29:16', 2);
INSERT INTO `login_ticket` VALUES (12, 12, '0a1bee398b584313a238abfa3cba5f2e', '2019-01-08 01:30:09', 1);
INSERT INTO `login_ticket` VALUES (13, 12, 'f4efe52386f64b93ba5d018adc39c95b', '2019-01-08 05:18:57', 0);
INSERT INTO `login_ticket` VALUES (14, 12, 'f03a1afd30104b93a8aaa8961be176cd', '2019-01-10 01:37:24', 0);
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `content` text,
  `created_date` datetime DEFAULT NULL,
  `has_read` int(11) DEFAULT NULL,
  `conversation_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`),
  KEY `created_date` (`created_date`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (1, 12, 4, 'hello', '2019-01-07 02:23:58', 0, '4_12');
INSERT INTO `message` VALUES (2, 4, 4, 'hello', '2019-01-07 02:24:17', 0, '4_4');
INSERT INTO `message` VALUES (3, 5, 6, 'hello', '2019-01-07 02:24:23', 0, '5_6');
INSERT INTO `message` VALUES (4, 6, 12, 'hello', '2019-01-07 02:24:29', 0, '6_12');
INSERT INTO `message` VALUES (5, 2, 3, 'hello', '2019-01-07 02:26:07', 0, '2_3');
INSERT INTO `message` VALUES (6, 2, 6, 'hello', '2019-01-07 02:26:11', 0, '2_6');
INSERT INTO `message` VALUES (7, 8, 2, 'hello', '2019-01-07 02:26:21', 0, '2_8');
INSERT INTO `message` VALUES (8, 8, 3, 'hello', '2019-01-07 02:26:26', 0, '3_8');
INSERT INTO `message` VALUES (9, 8, 2, 'hello1', '2019-01-07 02:43:41', 0, '2_8');
INSERT INTO `message` VALUES (10, 8, 2, 'hello2', '2019-01-07 02:43:45', 0, '2_8');
INSERT INTO `message` VALUES (11, 8, 2, 'hello3', '2019-01-07 02:43:49', 0, '2_8');
INSERT INTO `message` VALUES (15, 12, 1, 'hello12', '2019-01-07 04:23:44', 0, '1_12');
INSERT INTO `message` VALUES (16, 12, 2, 'hello13', '2019-01-07 04:23:52', 0, '2_12');
INSERT INTO `message` VALUES (17, 12, 2, 'hello12', '2019-01-07 04:31:03', 0, '2_12');
INSERT INTO `message` VALUES (18, 12, 2, 'hello12', '2019-01-07 04:31:05', 0, '2_12');
INSERT INTO `message` VALUES (19, 2, 12, 'hello12', '2019-01-07 04:31:11', 0, '2_12');
INSERT INTO `message` VALUES (20, 2, 12, 'hello12', '2019-01-07 04:31:11', 0, '2_12');
COMMIT;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `link` varchar(256) NOT NULL DEFAULT '',
  `image` varchar(256) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
BEGIN;
INSERT INTO `news` VALUES (1, 'TITLE{0}', 'http://www.nowcoder.com/0.html', 'http://images.nowcoder.com/head/157m.png', 1, 0, '2019-01-07 01:29:15', 1);
INSERT INTO `news` VALUES (2, 'TITLE{1}', 'http://www.nowcoder.com/1.html', 'http://images.nowcoder.com/head/709m.png', 2, 1, '2019-01-07 06:29:15', 2);
INSERT INTO `news` VALUES (3, 'TITLE{2}', 'http://www.nowcoder.com/2.html', 'http://images.nowcoder.com/head/924m.png', 3, 2, '2019-01-07 11:29:15', 3);
INSERT INTO `news` VALUES (4, 'TITLE{3}', 'http://www.nowcoder.com/3.html', 'http://images.nowcoder.com/head/974m.png', 4, 3, '2019-01-07 16:29:15', 4);
INSERT INTO `news` VALUES (5, 'TITLE{4}', 'http://www.nowcoder.com/4.html', 'http://images.nowcoder.com/head/551m.png', 5, 4, '2019-01-07 21:29:15', 5);
INSERT INTO `news` VALUES (6, 'TITLE{5}', 'http://www.nowcoder.com/5.html', 'http://images.nowcoder.com/head/446m.png', 1, 5, '2019-01-08 02:29:15', 6);
INSERT INTO `news` VALUES (7, 'TITLE{6}', 'http://www.nowcoder.com/6.html', 'http://images.nowcoder.com/head/223m.png', 1, 6, '2019-01-08 07:29:16', 7);
INSERT INTO `news` VALUES (8, 'TITLE{7}', 'http://www.nowcoder.com/7.html', 'http://images.nowcoder.com/head/83m.png', 1, 7, '2019-01-08 12:29:16', 8);
INSERT INTO `news` VALUES (9, 'TITLE{8}', 'http://www.nowcoder.com/8.html', 'http://images.nowcoder.com/head/922m.png', 1, 8, '2019-01-08 17:29:16', 9);
INSERT INTO `news` VALUES (10, 'TITLE{9}', 'http://www.nowcoder.com/9.html', 'http://images.nowcoder.com/head/509m.png', 1, 9, '2019-01-08 22:29:16', 10);
INSERT INTO `news` VALUES (11, 'TITLE{10}', 'http://www.nowcoder.com/10.html', 'http://images.nowcoder.com/head/80m.png', 1, 5, '2019-01-09 03:29:16', 11);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `salt` varchar(32) NOT NULL DEFAULT '',
  `head_url` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (2, 'USER1', 'newpassword', '', 'http://images.nowcoder.com/head/220t.png');
INSERT INTO `user` VALUES (3, 'USER2', 'newpassword', '', 'http://images.nowcoder.com/head/645t.png');
INSERT INTO `user` VALUES (4, 'USER3', 'newpassword', '', 'http://images.nowcoder.com/head/56t.png');
INSERT INTO `user` VALUES (5, 'USER4', 'newpassword', '', 'http://images.nowcoder.com/head/500t.png');
INSERT INTO `user` VALUES (6, 'USER5', 'newpassword', '', 'http://images.nowcoder.com/head/668t.png');
INSERT INTO `user` VALUES (7, 'USER6', 'newpassword', '', 'http://images.nowcoder.com/head/90t.png');
INSERT INTO `user` VALUES (8, 'USER7', 'newpassword', '', 'http://images.nowcoder.com/head/395t.png');
INSERT INTO `user` VALUES (9, 'USER8', 'newpassword', '', 'http://images.nowcoder.com/head/351t.png');
INSERT INTO `user` VALUES (10, 'USER9', 'newpassword', '', 'http://images.nowcoder.com/head/105t.png');
INSERT INTO `user` VALUES (11, 'USER10', 'newpassword', '', 'http://images.nowcoder.com/head/269t.png');
INSERT INTO `user` VALUES (12, 'qq', '4D4FEB19956B179FF1AFAF045EA2E27D', '5893b', 'http://images.nowcoder.com/head/151t.png');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
