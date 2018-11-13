/*
 Navicat Premium Data Transfer

 Source Server         : APP
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : int_adapter_jdbc

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 13/11/2018 13:38:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for INT_CHANNEL_MESSAGE
-- ----------------------------
DROP TABLE IF EXISTS `INT_CHANNEL_MESSAGE`;
CREATE TABLE `INT_CHANNEL_MESSAGE` (
  `MESSAGE_ID` char(36) COLLATE utf8mb4_bin NOT NULL,
  `GROUP_KEY` char(36) COLLATE utf8mb4_bin NOT NULL,
  `CREATED_DATE` bigint(20) NOT NULL,
  `MESSAGE_PRIORITY` bigint(20) DEFAULT NULL,
  `MESSAGE_SEQUENCE` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_BYTES` blob,
  `REGION` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`GROUP_KEY`,`MESSAGE_ID`,`REGION`),
  UNIQUE KEY `MESSAGE_SEQUENCE` (`MESSAGE_SEQUENCE`),
  KEY `INT_CHANNEL_MSG_DATE_IDX` (`CREATED_DATE`,`MESSAGE_SEQUENCE`),
  KEY `INT_CHANNEL_MSG_PRIORITY_IDX` (`MESSAGE_PRIORITY`,`CREATED_DATE`,`MESSAGE_SEQUENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for INT_GROUP_TO_MESSAGE
-- ----------------------------
DROP TABLE IF EXISTS `INT_GROUP_TO_MESSAGE`;
CREATE TABLE `INT_GROUP_TO_MESSAGE` (
  `GROUP_KEY` char(36) COLLATE utf8mb4_bin NOT NULL,
  `MESSAGE_ID` char(36) COLLATE utf8mb4_bin NOT NULL,
  `REGION` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`GROUP_KEY`,`MESSAGE_ID`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for INT_LOCK
-- ----------------------------
DROP TABLE IF EXISTS `INT_LOCK`;
CREATE TABLE `INT_LOCK` (
  `LOCK_KEY` char(36) COLLATE utf8mb4_bin NOT NULL,
  `REGION` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `CLIENT_ID` char(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  PRIMARY KEY (`LOCK_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for INT_MESSAGE
-- ----------------------------
DROP TABLE IF EXISTS `INT_MESSAGE`;
CREATE TABLE `INT_MESSAGE` (
  `MESSAGE_ID` char(36) COLLATE utf8mb4_bin NOT NULL,
  `REGION` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  `MESSAGE_BYTES` blob,
  PRIMARY KEY (`MESSAGE_ID`,`REGION`),
  KEY `INT_MESSAGE_IX1` (`CREATED_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for INT_MESSAGE_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `INT_MESSAGE_GROUP`;
CREATE TABLE `INT_MESSAGE_GROUP` (
  `GROUP_KEY` char(36) COLLATE utf8mb4_bin NOT NULL,
  `REGION` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `MARKED` bigint(20) DEFAULT NULL,
  `COMPLETE` bigint(20) DEFAULT NULL,
  `LAST_RELEASED_SEQUENCE` bigint(20) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  `UPDATED_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GROUP_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for INT_METADATA_STORE
-- ----------------------------
DROP TABLE IF EXISTS `INT_METADATA_STORE`;
CREATE TABLE `INT_METADATA_STORE` (
  `METADATA_KEY` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `METADATA_VALUE` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `REGION` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`METADATA_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
INSERT INTO `test` VALUES (1, '文本字段');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
