/*
Navicat MySQL Data Transfer

Source Server         : MySQL172.0.0.1
Source Server Version : 50710
Source Host           : 127.0.0.1:3306
Source Database       : ssm_test

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-04-14 15:13:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
