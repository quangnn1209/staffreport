/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : staffreport

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2015-01-28 08:35:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `fk_Admin_Employees1_idx` (`emp_id`),
  CONSTRAINT `fk_Admin_Employees1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '1');

-- ----------------------------
-- Table structure for division
-- ----------------------------
DROP TABLE IF EXISTS `division`;
CREATE TABLE `division` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(30) NOT NULL,
  PRIMARY KEY (`division_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of division
-- ----------------------------
INSERT INTO `division` VALUES ('1', 'division1');
INSERT INTO `division` VALUES ('2', 'division2');
INSERT INTO `division` VALUES ('3', 'division3');

-- ----------------------------
-- Table structure for employeehistory
-- ----------------------------
DROP TABLE IF EXISTS `employeehistory`;
CREATE TABLE `employeehistory` (
  `emp_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(30) DEFAULT NULL,
  `division_name` varchar(30) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_history_id`),
  KEY `fk_EmployeeHistory_Employees1_idx` (`emp_id`),
  CONSTRAINT `fk_EmployeeHistory_Employees1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeehistory
-- ----------------------------

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_full_name` varchar(30) NOT NULL,
  `join_date` date NOT NULL,
  `emp_skills` text,
  `emp_birthday` date DEFAULT NULL,
  `emp_phone` varchar(20) DEFAULT NULL,
  `emp_contact` varchar(50) DEFAULT NULL,
  `emp_avatar` varchar(100) DEFAULT NULL,
  `emp_status` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_Employees_division1_idx` (`division_id`),
  KEY `fk_Employees_team1_idx` (`team_id`),
  CONSTRAINT `fk_Employees_division1` FOREIGN KEY (`division_id`) REFERENCES `division` (`division_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', 'admin', '2015-01-26', null, null, null, null, null, null, '1', '1');
INSERT INTO `employees` VALUES ('2', 'user', '2015-01-20', 'skills', null, 'phone', 'contact', 'avatar', '0', '2', '2');
INSERT INTO `employees` VALUES ('3', 'quangnn', '2015-01-27', 'skills', null, 'phone', 'contact', 'avatar', '0', '3', '3');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(50) NOT NULL,
  `content` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(30) NOT NULL,
  `create_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_team_division1_idx` (`division_id`),
  CONSTRAINT `fk_team_division1` FOREIGN KEY (`division_id`) REFERENCES `division` (`division_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('1', 'gulliver', '2015-01-20', null, '1');
INSERT INTO `team` VALUES ('2', 'god', '2015-01-19', null, '2');
INSERT INTO `team` VALUES ('3', 'psa', '2015-01-20', null, '3');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(45) NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
