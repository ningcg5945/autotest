/*
Navicat MySQL Data Transfer

Source Server         : autotest
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : autotest

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-01 16:39:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `apitest_apis`
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apis`;
CREATE TABLE `apitest_apis` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，单一接口编号',
  `apiname` varchar(100) NOT NULL COMMENT '用例名称',
  `apiurl` varchar(200) NOT NULL COMMENT '接口URL',
  `apiparamvalue` varchar(800) NOT NULL COMMENT '接口参数和值',
  `apimethod` varchar(200) DEFAULT NULL COMMENT '接口方法',
  `apiresult` varchar(200) NOT NULL COMMENT '接口预期结果',
  `apistatus` tinyint(1) NOT NULL COMMENT '测试结果',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Product_id` int(11) DEFAULT NULL COMMENT '关联产品ID',
  `apitester` varchar(16) DEFAULT NULL,
  `apiresponse` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apitest_apis_Product_id_d86ce861_fk_product_product_id` (`Product_id`),
  CONSTRAINT `apitest_apis_Product_id_d86ce861_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apitest_apis
-- ----------------------------
INSERT INTO `apitest_apis` VALUES ('1', '登录接口', 'www.autotestplat.com/login', 'null', 'get', 'err', '0', '2018-01-30 12:07:22.000000', '10', 'fin', '﻿<!DOCTYPE html>\nNing\n<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<head>\n     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/> \n    <title>AutotestPlat</title>\n<style> body{text-align:center} </style> \n</head>\n<body>\n<div>\n<font size=\"1\">\n<h1>《自动化平台测试开发》书</h1>\n</font>\n<form method=\"post\" action=\"/login/\">\n<input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'HiKbddOmBpoUZWfYEhLlSe2lEnRGuTc0WnJXwAzix8Gg2N6Gs9tDBL20kKEMUEWf\' />\n<br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" ><!--placeholder=\"test\"   value=\"test\"-->\n<br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\"><!-- placeholder=\"test123456\" value=\"test123456\"-->\n<br><br>\n&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> \n</form>\n</div>\n</body>\n</html>');
INSERT INTO `apitest_apis` VALUES ('2', '登录接口', 'www.autotestplat.com/login', 'null', 'get', 'login', '1', '2018-01-30 12:07:22.000000', '10', 'fin', '﻿<!DOCTYPE html>\nNing\n<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<head>\n     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/> \n    <title>AutotestPlat</title>\n<style> body{text-align:center} </style> \n</head>\n<body>\n<div>\n<font size=\"1\">\n<h1>《自动化平台测试开发》书</h1>\n</font>\n<form method=\"post\" action=\"/login/\">\n<input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'w7kxuO5tN3nY4Pxp5zUq4YbwoLiU0AVlYK6uJAtBVgd0QS98iWtPEf21QWxvsgDV\' />\n<br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" ><!--placeholder=\"test\"   value=\"test\"-->\n<br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\"><!-- placeholder=\"test123456\" value=\"test123456\"-->\n<br><br>\n&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> \n</form>\n</div>\n</body>\n</html>');

-- ----------------------------
-- Table structure for `apitest_apistep`
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apistep`;
CREATE TABLE `apitest_apistep` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，步骤接口编号',
  `apiname` varchar(100) NOT NULL COMMENT '用例名称',
  `apiurl` varchar(200) NOT NULL COMMENT '接口URL',
  `apiparamvalue` varchar(800) NOT NULL COMMENT '接口参数和值',
  `apimethod` varchar(200) DEFAULT NULL COMMENT '接口方法',
  `apiresult` varchar(200) NOT NULL COMMENT '接口预期结果',
  `apistatus` tinyint(1) NOT NULL COMMENT '测试结果',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Apitest_id` int(11) NOT NULL COMMENT '关联业务流程接口',
  `apistep` varchar(100) DEFAULT NULL COMMENT '步骤',
  `apiresponse` varchar(5000) DEFAULT NULL COMMENT '响应数据',
  PRIMARY KEY (`id`),
  KEY `apitest_apistep_Apitest_id_ceefdb33_fk_apitest_apitest_id` (`Apitest_id`),
  CONSTRAINT `apitest_apistep_Apitest_id_ceefdb33_fk_apitest_apitest_id` FOREIGN KEY (`Apitest_id`) REFERENCES `apitest_apitest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apitest_apistep
-- ----------------------------
INSERT INTO `apitest_apistep` VALUES ('1', '登录', '{seturl}/login', 'null', 'get', 'login', '1', '2018-01-30 12:07:27.000000', '2', '第一步', '﻿<!DOCTYPE html>\nNing\n<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<head>\n     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/> \n    <title>AutotestPlat</title>\n<style> body{text-align:center} </style> \n</head>\n<body>\n<div>\n<font size=\"1\">\n<h1>《自动化平台测试开发》书</h1>\n</font>\n<form method=\"post\" action=\"/login/\">\n<input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'sr7qBcBPXYK3r17nnfpUuNLsSQaYlfAH3XFOqAvcnOdQd39FWZ8YYYHuFjB8Efuv\' />\n<br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" ><!--placeholder=\"test\"   value=\"test\"-->\n<br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\"><!-- placeholder=\"test123456\" value=\"test123456\"-->\n<br><br>\n&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> \n</form>\n</div>\n</body>\n</html>');
INSERT INTO `apitest_apistep` VALUES ('2', '购物', '{seturl}/login', 'null', 'get', 'logout', '0', '2018-01-30 12:07:27.000000', '2', '第二步', '﻿<!DOCTYPE html>\nNing\n<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<head>\n     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/> \n    <title>AutotestPlat</title>\n<style> body{text-align:center} </style> \n</head>\n<body>\n<div>\n<font size=\"1\">\n<h1>《自动化平台测试开发》书</h1>\n</font>\n<form method=\"post\" action=\"/login/\">\n<input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'YodMuuGA7EOIpaxXVKPuEmOFRNxBFmzY8103nl3Puwzb9NhMUr8z7vzt2ucxjHt0\' />\n<br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" ><!--placeholder=\"test\"   value=\"test\"-->\n<br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\"><!-- placeholder=\"test123456\" value=\"test123456\"-->\n<br><br>\n&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> \n</form>\n</div>\n</body>\n</html>');
INSERT INTO `apitest_apistep` VALUES ('3', '登录', '{seturl}/login', 'null', 'get', 'login', '1', '2018-01-30 11:27:22.124137', '3', '第一步', 'null');

-- ----------------------------
-- Table structure for `apitest_apitest`
-- ----------------------------
DROP TABLE IF EXISTS `apitest_apitest`;
CREATE TABLE `apitest_apitest` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，用例编号',
  `apitestname` varchar(64) NOT NULL COMMENT '用例名称',
  `apitester` varchar(16) NOT NULL COMMENT '测试负责人',
  `apitestresult` tinyint(1) NOT NULL COMMENT '测试结果',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Product_id` int(11) DEFAULT NULL COMMENT '关联产品ID',
  `apitestdesc` varchar(64) DEFAULT NULL COMMENT '用例描述',
  PRIMARY KEY (`id`),
  KEY `apitest_apitest_Product_id_260d36dd_fk_apitest_product_id` (`Product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apitest_apitest
-- ----------------------------
INSERT INTO `apitest_apitest` VALUES ('2', '登录购物支付test', 'Ning', '0', '2018-01-30 12:07:28.000000', '2', '接口流程测试');
INSERT INTO `apitest_apitest` VALUES ('3', '登录购物支付', 'Ning', '1', '2018-01-30 11:27:22.124137', '2', '接口流程测试');

-- ----------------------------
-- Table structure for `apptest_appcase`
-- ----------------------------
DROP TABLE IF EXISTS `apptest_appcase`;
CREATE TABLE `apptest_appcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，App用例编号',
  `appcasename` varchar(200) NOT NULL COMMENT '用例名称',
  `apptestresult` tinyint(1) NOT NULL COMMENT '测试结果',
  `apptester` varchar(16) NOT NULL COMMENT '测试负责人',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Product_id` int(11) DEFAULT NULL COMMENT '关联产品ID',
  PRIMARY KEY (`id`),
  KEY `apptest_appcase_Product_id_2cfe383a_fk_product_product_id` (`Product_id`),
  CONSTRAINT `apptest_appcase_Product_id_2cfe383a_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apptest_appcase
-- ----------------------------
INSERT INTO `apptest_appcase` VALUES ('1', '计算器计算1+1=2', '0', 'Ning', '2018-01-11 23:05:25.337294', '3');
INSERT INTO `apptest_appcase` VALUES ('2', '登录csdn', '0', 'Ning', '2018-01-29 13:14:48.088808', '3');

-- ----------------------------
-- Table structure for `apptest_appcasestep`
-- ----------------------------
DROP TABLE IF EXISTS `apptest_appcasestep`;
CREATE TABLE `apptest_appcasestep` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，App用例步骤编号',
  `appteststep` varchar(200) NOT NULL COMMENT '用例步骤',
  `apptestobjname` varchar(200) NOT NULL COMMENT '操作对象名称',
  `appfindmethod` varchar(200) NOT NULL COMMENT '定位方式',
  `appevelement` varchar(800) NOT NULL COMMENT '元素控件',
  `appoptmethod` varchar(200) NOT NULL COMMENT '操作方法',
  `appassertdata` varchar(200) NOT NULL COMMENT '验证数据',
  `apptestresult` tinyint(1) NOT NULL COMMENT '测试结果',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Appcase_id` int(11) NOT NULL COMMENT '关联APP用例ID',
  `apptestdata` varchar(200) DEFAULT NULL COMMENT '测试数据',
  PRIMARY KEY (`id`),
  KEY `apptest_appcasestep_Appcase_id_f2f5be83_fk_apptest_appcase_id` (`Appcase_id`),
  CONSTRAINT `apptest_appcasestep_Appcase_id_f2f5be83_fk_apptest_appcase_id` FOREIGN KEY (`Appcase_id`) REFERENCES `apptest_appcase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apptest_appcasestep
-- ----------------------------
INSERT INTO `apptest_appcasestep` VALUES ('1', '第一步', '输入1', 'find_element_by_name', '1', 'click', 'null', '1', '2018-01-12 00:02:25.000000', '1', 'null');
INSERT INTO `apptest_appcasestep` VALUES ('2', '第二步', '输入+', 'find_element_by_name', '+', 'click', 'null', '1', '2018-01-12 00:02:39.000000', '1', 'null');
INSERT INTO `apptest_appcasestep` VALUES ('3', '第三步', '输入1', 'find_element_by_name', '1', 'click', 'null', '1', '2018-01-12 00:02:52.000000', '1', 'null');
INSERT INTO `apptest_appcasestep` VALUES ('4', '第四步', '输入=', 'find_element_by_name', '=', 'click', 'null', '1', '2018-01-12 00:03:07.000000', '1', 'null');
INSERT INTO `apptest_appcasestep` VALUES ('7', '第一步', '输入1', 'find_element_by_name', '1', 'click', 'null', '0', '2018-01-03 09:06:21.830679', '2', 'null');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add apistep', '7', 'add_apistep');
INSERT INTO `auth_permission` VALUES ('20', 'Can change apistep', '7', 'change_apistep');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete apistep', '7', 'delete_apistep');
INSERT INTO `auth_permission` VALUES ('22', 'Can add apitest', '8', 'add_apitest');
INSERT INTO `auth_permission` VALUES ('23', 'Can change apitest', '8', 'change_apitest');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete apitest', '8', 'delete_apitest');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 单一接口', '9', 'add_apis');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 单一接口', '9', 'change_apis');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 单一接口', '9', 'delete_apis');
INSERT INTO `auth_permission` VALUES ('28', 'Can add product', '10', 'add_product');
INSERT INTO `auth_permission` VALUES ('29', 'Can change product', '10', 'change_product');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete product', '10', 'delete_product');
INSERT INTO `auth_permission` VALUES ('31', 'Can add app测试用例', '11', 'add_appcase');
INSERT INTO `auth_permission` VALUES ('32', 'Can change app测试用例', '11', 'change_appcase');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete app测试用例', '11', 'delete_appcase');
INSERT INTO `auth_permission` VALUES ('34', 'Can add appcasestep', '12', 'add_appcasestep');
INSERT INTO `auth_permission` VALUES ('35', 'Can change appcasestep', '12', 'change_appcasestep');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete appcasestep', '12', 'delete_appcasestep');
INSERT INTO `auth_permission` VALUES ('37', 'Can add web测试用例', '13', 'add_webcase');
INSERT INTO `auth_permission` VALUES ('38', 'Can change web测试用例', '13', 'change_webcase');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete web测试用例', '13', 'delete_webcase');
INSERT INTO `auth_permission` VALUES ('40', 'Can add webcasestep', '14', 'add_webcasestep');
INSERT INTO `auth_permission` VALUES ('41', 'Can change webcasestep', '14', 'change_webcasestep');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete webcasestep', '14', 'delete_webcasestep');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 接口产品管理', '15', 'add_product');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 接口产品管理', '15', 'change_product');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 接口产品管理', '15', 'delete_product');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 系统设置', '16', 'add_set');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 系统设置', '16', 'change_set');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 系统设置', '16', 'delete_set');
INSERT INTO `auth_permission` VALUES ('49', 'Can add bug管理', '17', 'add_bugs');
INSERT INTO `auth_permission` VALUES ('50', 'Can change bug管理', '17', 'change_bugs');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete bug管理', '17', 'delete_bugs');
INSERT INTO `auth_permission` VALUES ('52', 'Can add bug管理', '18', 'add_bug');
INSERT INTO `auth_permission` VALUES ('53', 'Can change bug管理', '18', 'change_bug');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete bug管理', '18', 'delete_bug');
INSERT INTO `auth_permission` VALUES ('55', 'Can add interval', '19', 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES ('56', 'Can change interval', '19', 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete interval', '19', 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES ('58', 'Can add crontab', '20', 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES ('59', 'Can change crontab', '20', 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete crontab', '20', 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES ('61', 'Can add periodic task', '21', 'add_periodictask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change periodic task', '21', 'change_periodictask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete periodic task', '21', 'delete_periodictask');
INSERT INTO `auth_permission` VALUES ('64', 'Can add periodic tasks', '22', 'add_periodictasks');
INSERT INTO `auth_permission` VALUES ('65', 'Can change periodic tasks', '22', 'change_periodictasks');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete periodic tasks', '22', 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES ('67', 'Can add task state', '23', 'add_taskmeta');
INSERT INTO `auth_permission` VALUES ('68', 'Can change task state', '23', 'change_taskmeta');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete task state', '23', 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES ('70', 'Can add saved group result', '24', 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('71', 'Can change saved group result', '24', 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete saved group result', '24', 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('73', 'Can add worker', '25', 'add_workerstate');
INSERT INTO `auth_permission` VALUES ('74', 'Can change worker', '25', 'change_workerstate');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete worker', '25', 'delete_workerstate');
INSERT INTO `auth_permission` VALUES ('76', 'Can add task', '26', 'add_taskstate');
INSERT INTO `auth_permission` VALUES ('77', 'Can change task', '26', 'change_taskstate');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete task', '26', 'delete_taskstate');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$k69eCA0MqrHc$USWk9R1ucarsptDj2kdDId8h4ayjnsTufPafu08k7lA=', '2018-02-01 13:09:13.392952', '1', 'admin', '', '', '7980068@qq.com', '1', '1', '2017-12-25 16:37:47.957918');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$100000$7GhDDHQWKIsV$ARBExGxsyF13MYmOeUppIpcHJ2N9+xCD6TTt41NvHdM=', '2018-01-25 15:37:43.963178', '0', 'test', '', '', '7980068@qq.com', '1', '1', '2017-12-26 11:31:00.000000');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$100000$bxAAhzafixGM$O7U5PbxedTfzulNjdnS8FQV/TuVt1/omGakcjfuWZGA=', null, '0', 'dev', '', '', '', '0', '1', '2018-01-22 22:59:00.000000');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('10', '2', '19');
INSERT INTO `auth_user_user_permissions` VALUES ('11', '2', '20');
INSERT INTO `auth_user_user_permissions` VALUES ('12', '2', '22');
INSERT INTO `auth_user_user_permissions` VALUES ('13', '2', '23');
INSERT INTO `auth_user_user_permissions` VALUES ('14', '2', '25');
INSERT INTO `auth_user_user_permissions` VALUES ('15', '2', '26');
INSERT INTO `auth_user_user_permissions` VALUES ('16', '2', '28');
INSERT INTO `auth_user_user_permissions` VALUES ('17', '2', '29');
INSERT INTO `auth_user_user_permissions` VALUES ('18', '2', '31');
INSERT INTO `auth_user_user_permissions` VALUES ('1', '2', '32');
INSERT INTO `auth_user_user_permissions` VALUES ('2', '2', '34');
INSERT INTO `auth_user_user_permissions` VALUES ('3', '2', '35');
INSERT INTO `auth_user_user_permissions` VALUES ('4', '2', '37');
INSERT INTO `auth_user_user_permissions` VALUES ('5', '2', '38');
INSERT INTO `auth_user_user_permissions` VALUES ('6', '2', '40');
INSERT INTO `auth_user_user_permissions` VALUES ('7', '2', '41');
INSERT INTO `auth_user_user_permissions` VALUES ('8', '2', '43');
INSERT INTO `auth_user_user_permissions` VALUES ('9', '2', '44');
INSERT INTO `auth_user_user_permissions` VALUES ('20', '2', '46');
INSERT INTO `auth_user_user_permissions` VALUES ('21', '2', '47');
INSERT INTO `auth_user_user_permissions` VALUES ('22', '2', '49');
INSERT INTO `auth_user_user_permissions` VALUES ('23', '2', '50');
INSERT INTO `auth_user_user_permissions` VALUES ('24', '2', '52');
INSERT INTO `auth_user_user_permissions` VALUES ('25', '2', '53');
INSERT INTO `auth_user_user_permissions` VALUES ('19', '2', '77');

-- ----------------------------
-- Table structure for `bug_bug`
-- ----------------------------
DROP TABLE IF EXISTS `bug_bug`;
CREATE TABLE `bug_bug` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，Bug编号',
  `bugname` varchar(64) NOT NULL COMMENT 'Bug名称', 
  `bugdetail` varchar(2000) NOT NULL COMMENT '详情',
  `bugstatus` varchar(200) DEFAULT NULL COMMENT '解决状态',
  `buglevel` varchar(200) DEFAULT NULL COMMENT '严重程度',
  `bugcreater` varchar(200) NOT NULL COMMENT '创建人',
  `bugassign` varchar(200) NOT NULL COMMENT '分配给',
  `created_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Product_id` int(11) DEFAULT NULL COMMENT '关联产品ID',
  PRIMARY KEY (`id`),
  KEY `bug_bug_Product_id_5f035205_fk_product_product_id` (`Product_id`),
  CONSTRAINT `bug_bug_Product_id_5f035205_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bug_bug
-- ----------------------------
INSERT INTO `bug_bug` VALUES ('2', '2登录_出错了', '请求数据\"\"\"http://127.0.0.1:8000/login\"\"\"预期结果\"\"\"loginerror\"\"\"\"\"\"响应数据\"\"\"\"\"\"﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'7Ay6KouXXGB3zZD6BdsmBHTNZSCiolFC2HvP2YSywlEreM8obkVfPlrvwmbA4Way\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" ><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:14.184647', '2');
INSERT INTO `bug_bug` VALUES ('3', '2登录_出错了', '[请求数据]<br />http://127.0.0.1:8000/login<br/>[预期结果]<br/>loginerror<br/><br/>[响应数据]<br /><br/>﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'aIKqS6uF8rnGd4Q5Wj205E4QG8Rs0DCZ61w0ICA8IVYNBqyeZgwodGB7Qqe4MD6d\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" ><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:17.106557', '2');
INSERT INTO `bug_bug` VALUES ('4', '2_登录_出错了', '[请求数据]<br />http://127.0.0.1:8000/login<br/>[预期结果]<br/>loginerror<br/><br/>[响应数据]<br /><br/>﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'cT3p4qam0HsqVk2EPlHZf93oguFmlmz5SqWMk2AIAJOFbxXOy3GL67Cy3uHlp7lo\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" value=\"test\"><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\" value=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:19.934693', '2');
INSERT INTO `bug_bug` VALUES ('5', '2_登录_出错了', '[请求数据]<br />http://127.0.0.1:8000/login<br/>[预期结果]<br/>loginerror<br/><br/>[响应数据]<br /><br/>﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'5soRvqAvdx1UL6Aadi5jxT9d3NrXorCj9cR1myh2gsOL7PGvoDX02aG4CgMxud7m\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" value=\"test\"><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\" value=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:29.841006', '2');
INSERT INTO `bug_bug` VALUES ('6', '2_登录_出错了', '[请求数据]<br />http://127.0.0.1:8000/login<br/>[预期结果]<br/>loginerror<br/><br/>[响应数据]<br /><br/>﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'3GvalBJHx9fB49j6MfH1npvjHqQe1UH70WM7Egod3BSmDBCEueYKeb6BpYHxYXI5\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" value=\"test\"><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\" value=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:22.231573', '2');
INSERT INTO `bug_bug` VALUES ('7', '2_登录_出错了', '[请求数据]<br />http://127.0.0.1:8000/login<br/>[预期结果]<br/>loginerror<br/><br/>[响应数据]<br /><br/>﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'9FxPslSHhXAApggqnyo6CRR31QcVL4DY6FEfOw7f64yRzGuCeHRjyjVwnqEBIwq2\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" value=\"test\"><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\" value=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:24.731595', '2');
INSERT INTO `bug_bug` VALUES ('8', '2_登录_出错了', '[请求数据]<br />http://127.0.0.1:8000/login<br/>[预期结果]<br/>loginerror<br/><br/>[响应数据]<br /><br/>﻿<!DOCTYPE html><html><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><head>     <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>     <title>AutotestPlat</title><style> body{text-align:center} </style> </head><body><div><font size=\"1\"><h1>《自动化平台测试开发》书</h1></font><form method=\"post\" action=\"/login/\"><input type=\'hidden\' name=\'csrfmiddlewaretoken\' value=\'N9IkYWBmpNBOt05StXE2pnTA2GUsqwVJ70cLja8NQljBxwz3CLqePz0nR2K3LxhP\' /><br><a>&nbsp;&nbsp;用户名：</a> <input name=\"username\" type=\"text\" placeholder=\"test\" value=\"test\"><br><br>  <a>&nbsp;&nbsp;密 &nbsp;&nbsp; 码：</a> <input name=\"password\" type=\"password\" placeholder=\"test123456\" value=\"test123456\"><br><br>&nbsp; <button style=\"width:220px;height:28px;\" id=\"submit\" type=\"submit\">登 录</button> </form></div></body></html>', '激活', '1', 'Ning', 'Ning', '2018-01-29 13:20:07.356493', '2');

-- ----------------------------
-- Table structure for `celery_taskmeta`
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------
INSERT INTO `celery_taskmeta` VALUES ('45', 'fd7be496-ce66-4529-9fe6-12047c5ccf3a', 'SUCCESS', null, '2018-01-17 10:13:16.538237', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('50', 'e9daf5b8-939d-4e91-93a6-a168f3439949', 'SUCCESS', null, '2018-01-17 10:32:59.870418', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('51', '8125f15d-ca86-4bea-a7a2-d1937183cced', 'SUCCESS', null, '2018-01-17 10:33:00.174622', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('52', 'ea13892b-019f-4710-aa7b-2d61df9179dc', 'SUCCESS', null, '2018-01-17 10:33:04.940159', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('53', '8456684c-6f59-436e-8594-beff61ff0727', 'SUCCESS', null, '2018-01-17 10:33:04.953167', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('54', 'c4c53ea3-879e-4f6a-971a-0250b5b49b8c', 'SUCCESS', null, '2018-01-17 10:33:09.080100', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('55', '8b8c6d96-8008-42f9-96f2-2b1a1f762f18', 'SUCCESS', null, '2018-01-17 10:33:09.300248', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('56', '71e8d89a-76fa-4329-8bde-3d8e124387e6', 'SUCCESS', null, '2018-01-17 10:33:12.559829', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('57', '901c0958-7e0f-411f-9945-277cd26df102', 'SUCCESS', null, '2018-01-17 10:33:12.702434', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('58', '33d8d0de-ca2f-4d24-8b83-fa7a6dc031f2', 'SUCCESS', null, '2018-01-17 10:33:16.557303', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('59', 'e97f6be5-8fcf-4c67-8652-4825de9d384f', 'SUCCESS', null, '2018-01-17 10:33:16.963606', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('60', 'ea896da0-497c-45fe-b44c-9483a5d4286a', 'SUCCESS', null, '2018-01-17 10:33:19.687145', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('61', 'ef9a8cf9-d99a-4ea1-bd01-710b916408ae', 'SUCCESS', null, '2018-01-17 10:33:19.910776', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('62', '9eaa3a5e-d7f0-466e-836e-d28d426868bd', 'SUCCESS', null, '2018-01-17 10:33:23.899299', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('63', 'd0e717ac-1649-4073-99a8-c115efac0745', 'SUCCESS', null, '2018-01-17 10:33:24.040421', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('64', 'a35ba641-2117-4a1a-8c91-ffcac9e13158', 'SUCCESS', null, '2018-01-17 10:33:26.796988', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('65', '23d45fb7-918f-47f3-8cef-baffd8a60984', 'SUCCESS', null, '2018-01-17 10:33:26.815092', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('66', '35096c0f-167f-48ff-8b09-656b419f177a', 'SUCCESS', null, '2018-01-17 10:33:30.840257', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('67', '1711af89-df59-41f9-bb29-df4e145d1759', 'SUCCESS', null, '2018-01-17 10:33:31.303633', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('68', 'e84ee47b-0304-4d16-8ec4-55eb939f00bf', 'SUCCESS', null, '2018-01-17 10:33:35.528732', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('69', '75d9b6bc-abc4-4931-b3ce-40a8ed26f7d9', 'SUCCESS', null, '2018-01-17 10:33:35.667324', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('70', '62fd1533-c8ce-4a49-a351-27305c7ef71d', 'SUCCESS', null, '2018-01-17 10:33:38.809309', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('71', 'b699a167-95e7-4057-a6f5-4edd1bbfec74', 'SUCCESS', null, '2018-01-17 10:33:38.859361', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('72', 'da4e6b07-60d4-4517-858a-19393a607738', 'SUCCESS', null, '2018-01-17 10:33:42.194056', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('73', '0deb89c1-9ea8-4563-aec1-b91483ed32ee', 'SUCCESS', null, '2018-01-17 10:33:42.536285', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('74', '069b88f2-b918-4156-87b3-12cb697614fd', 'SUCCESS', null, '2018-01-17 10:33:45.506872', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('75', '912b1558-f8d5-471c-bb80-01c8c9336be1', 'SUCCESS', null, '2018-01-17 10:33:45.945449', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('76', '1f6e4164-9892-4375-84a6-d6916d6dc28a', 'SUCCESS', null, '2018-01-17 10:33:48.189926', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('77', '4bab19c2-1cb4-4b47-9761-154ed55c07c1', 'SUCCESS', null, '2018-01-17 10:33:49.735794', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('78', '41720813-d41f-4b77-8923-d827b233131d', 'SUCCESS', null, '2018-01-17 10:33:52.283228', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('79', '73fb75be-f61a-49b8-b243-1ae29f926133', 'SUCCESS', null, '2018-01-17 10:33:53.240403', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('80', 'a3d3dde4-51cc-4f72-9b4f-e669c20e8022', 'SUCCESS', null, '2018-01-17 10:33:56.568967', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('81', 'cf0eb0eb-4d76-4bcb-afcc-2c0a340eddb4', 'SUCCESS', null, '2018-01-17 10:33:57.919823', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('82', '3408927e-fa6f-4845-bebd-630b718f6978', 'SUCCESS', null, '2018-01-17 10:33:59.338857', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('83', '8cd6b894-113f-46c6-8dfb-8d268edd8595', 'SUCCESS', null, '2018-01-17 10:34:00.513911', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('84', 'f6bc3f10-005e-4f0c-9c20-acab9816a9fa', 'SUCCESS', null, '2018-01-17 10:34:01.594465', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('85', '3547d759-bb99-4df0-9441-24fe567eb45a', 'SUCCESS', null, '2018-01-17 10:34:03.726502', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('86', '53f9d402-3fc5-422b-b6ed-dcde05174199', 'SUCCESS', null, '2018-01-17 10:34:05.051118', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('87', 'd8dd998e-9be4-4204-a110-1d16c974dccb', 'SUCCESS', null, '2018-01-17 10:34:06.258081', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('88', 'b10fbbe1-7393-4a05-aa44-ac8b4641d7e5', 'SUCCESS', null, '2018-01-17 10:34:06.944298', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('89', '50ba6165-6b5e-432f-87ca-5558bd5792e2', 'SUCCESS', null, '2018-01-17 10:34:07.702394', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('90', '48eb15dd-c1e1-428b-aff9-70f38dde4eb4', 'SUCCESS', null, '2018-01-17 10:34:08.730053', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('91', '93f8c6fc-249a-407c-8cfa-d77286ce2a03', 'SUCCESS', null, '2018-01-17 10:34:09.760757', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('92', '3c95518b-86bf-433e-94b7-c0ecf0051381', 'SUCCESS', null, '2018-01-17 10:34:10.807685', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('93', 'c5f98233-0bb1-48c5-a163-433a45b8493e', 'SUCCESS', null, '2018-01-17 10:34:11.525336', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('94', '03a5fd4c-8c0d-4187-8447-4fd6abaa1431', 'SUCCESS', null, '2018-01-17 10:34:12.193572', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('95', 'fc761a91-50ba-4f70-952a-7435ab0b75d9', 'SUCCESS', null, '2018-01-17 10:34:13.268517', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('96', '4a40a96e-7774-4215-a9bf-ea7fe22a437a', 'SUCCESS', null, '2018-01-17 10:34:14.004368', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('97', '49f97d7a-8abd-4b7d-8170-116674a3a902', 'SUCCESS', null, '2018-01-17 10:34:15.496951', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('98', '553e4f10-435a-4da8-bd0a-8a5ec3afd9e9', 'SUCCESS', null, '2018-01-17 10:34:16.703417', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('99', '0b609a02-73cd-4013-87eb-a25967d890c5', 'SUCCESS', null, '2018-01-17 10:34:17.285078', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('100', '14415b17-0310-47e4-ad93-b833d5196f44', 'SUCCESS', null, '2018-01-17 10:34:18.375278', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('101', 'ac84303e-f250-4fcd-b477-00add141d738', 'SUCCESS', null, '2018-01-17 10:34:19.287657', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('102', '0043cea7-f8aa-47d3-932f-8f3e1539c040', 'SUCCESS', null, '2018-01-17 10:34:21.249967', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('103', '6ef64435-f729-4f54-ac49-447232b6e247', 'SUCCESS', null, '2018-01-17 10:34:22.951630', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('104', '851fdb84-de10-4a4d-985d-c3660faf727b', 'SUCCESS', null, '2018-01-17 10:34:24.847780', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('105', '51fb71c9-0494-418b-b4c6-97d10d827b86', 'SUCCESS', null, '2018-01-17 10:34:25.682877', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('106', '8f64591d-c633-494e-9e27-1f88e1eaa688', 'SUCCESS', null, '2018-01-17 10:34:27.915331', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('107', '7384a593-e5fa-4d91-9e5f-03c9dc98bed3', 'SUCCESS', null, '2018-01-17 10:34:28.961029', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('108', '9060ca86-86de-4783-9b02-f95a8401abf7', 'SUCCESS', null, '2018-01-17 10:34:30.083107', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('109', '71e2219a-7ffb-4f20-b14f-299e80ebb2f4', 'SUCCESS', null, '2018-01-17 10:34:30.680405', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('110', 'fa1f836c-239d-4394-9107-e9999ef2e4f2', 'SUCCESS', null, '2018-01-17 10:34:32.243707', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('111', 'b615b078-29cd-42b2-b618-e8daaa70a862', 'SUCCESS', null, '2018-01-17 10:34:33.259753', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('112', '72dd4458-602f-4b9d-9ed4-441cf83269e9', 'SUCCESS', null, '2018-01-17 10:34:37.016875', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('113', '3f44246d-09df-48d9-b904-a2762fdaf46b', 'SUCCESS', null, '2018-01-17 10:34:38.033554', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('114', '13dcc790-c1e3-4887-837a-e63d6d768538', 'SUCCESS', null, '2018-01-17 10:34:40.684433', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('115', '70305e1c-9627-4a51-977d-a21539f9999f', 'SUCCESS', null, '2018-01-17 10:34:41.776163', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('116', '2a92b0c4-7808-4750-85e1-9d45c0b9d785', 'SUCCESS', null, '2018-01-17 10:34:46.124610', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('117', '16e6d8fb-408c-4805-bc1c-90fdfc2f2251', 'SUCCESS', null, '2018-01-17 10:34:47.249361', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('118', '643f1114-9319-4ff4-b91b-db65f7d7c874', 'SUCCESS', null, '2018-01-17 10:35:08.313855', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('119', 'f277c9fc-8c75-4e40-ace3-bcc78b83b97d', 'SUCCESS', null, '2018-01-17 10:36:08.873355', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('120', '81241f7b-1e17-4f0c-9449-9808b43e1bf1', 'SUCCESS', null, '2018-01-17 10:37:08.790969', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('121', '7970907d-0cbe-4a3a-b399-b2c3890b4fab', 'SUCCESS', null, '2018-01-17 10:38:08.149988', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('122', '84cf499e-cb46-490f-9a53-d6dced003620', 'SUCCESS', null, '2018-01-17 10:39:07.971309', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('123', 'e8f218a8-52f2-422d-9607-00025c0ed4f4', 'SUCCESS', null, '2018-01-17 10:40:08.897242', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('124', '8684bb98-7e89-428a-920c-e80325107639', 'SUCCESS', null, '2018-01-17 10:41:08.314245', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('125', '36346be9-d1a3-4ecb-b18f-23e789753751', 'SUCCESS', null, '2018-01-17 10:42:08.169136', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('126', '4ac51bf5-95a1-4f4b-b4c7-3dfc2e3df9ae', 'SUCCESS', null, '2018-01-17 10:43:08.102027', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('127', 'd41308c5-2b69-4b88-8f21-6edeee2e3277', 'SUCCESS', null, '2018-01-17 10:44:08.345475', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('128', '2ebf7799-d085-43e6-852b-d431e4b58640', 'SUCCESS', null, '2018-01-17 10:45:08.376830', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('129', 'd62012dc-9e68-4d8e-b5b9-17553451cfba', 'SUCCESS', null, '2018-01-17 10:46:08.319611', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('130', '7334245a-d85c-4063-b3c3-a050d089b23e', 'SUCCESS', null, '2018-01-17 10:47:10.542201', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('131', '495286ec-3dff-4dd1-ace1-aee6ebd4672b', 'SUCCESS', null, '2018-01-17 10:48:08.218915', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('132', '6bc5f7fc-8d1a-420e-af4a-9236b803e823', 'SUCCESS', null, '2018-01-17 10:49:09.224364', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('133', 'ca301a8c-5b29-4303-8f15-a0f531124892', 'SUCCESS', null, '2018-01-17 10:50:08.911943', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('134', 'f86d9405-2177-48a0-a9b4-00c4884e1298', 'SUCCESS', null, '2018-01-17 10:51:08.940038', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('135', 'a629d981-5f49-4b82-8756-0a6a4f845741', 'SUCCESS', null, '2018-01-17 10:52:08.716630', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('136', '4139475f-e65c-45a2-b313-69d1e395e1df', 'SUCCESS', null, '2018-01-17 10:53:08.825255', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('137', '06c76333-e843-49f6-b07f-7521e370dce5', 'SUCCESS', null, '2018-01-17 11:45:44.470529', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('138', 'a67dca25-2ec2-4f3f-816c-0bb0e42f0c67', 'SUCCESS', null, '2018-01-17 13:31:46.385654', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('139', '9b0c44fc-4349-4b01-9124-cc61a19fe843', 'SUCCESS', null, '2018-01-17 15:14:40.652449', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('140', '4865f3df-66f8-4a9a-9b17-fb32ffa8f863', 'SUCCESS', null, '2018-01-17 16:15:31.902637', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('141', 'f2575769-d59a-4083-b59a-90c9348d7916', 'SUCCESS', null, '2018-01-17 17:14:46.715859', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('142', '9dee1c7e-9a23-420e-83ef-08aa857dfae8', 'SUCCESS', null, '2018-01-17 18:14:42.530297', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('143', '3eb508c3-c8d9-4ddc-aa58-184de6cbc0cb', 'SUCCESS', null, '2018-01-17 18:27:01.240508', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('144', 'c6fddf7f-f322-4c92-b018-568ccf6b76c2', 'SUCCESS', null, '2018-01-17 18:27:03.847245', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('145', 'cd8d09b9-3245-47f2-b1c0-cf5e5bcc9108', 'SUCCESS', null, '2018-01-17 19:14:39.068826', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('146', '574d942d-85dd-4379-a5f6-032e263bf057', 'SUCCESS', null, '2018-01-17 20:14:38.835521', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('147', '572e85fd-a616-4e97-8743-8eecbb653dcd', 'SUCCESS', null, '2018-01-17 21:14:37.772849', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('148', 'b583109e-3562-4d00-a985-90f1b56f84d1', 'SUCCESS', null, '2018-01-17 22:14:41.488184', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('149', 'bb8cd6e3-f8f9-4912-9bbf-dfe269c80281', 'SUCCESS', null, '2018-01-17 23:52:03.330141', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('150', '8f4872ea-01da-4c5f-a642-c921993be8af', 'SUCCESS', null, '2018-01-17 23:52:03.351156', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('151', '5250959a-8dfe-43e0-91b5-865404aa4ba9', 'SUCCESS', null, '2018-01-18 08:28:04.327503', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('152', '5ba6ef7d-3d25-45c0-a80f-f64217ae258f', 'SUCCESS', null, '2018-01-18 08:28:13.597832', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('153', 'f845e243-90eb-4c21-8dc0-b8d0429da59e', 'SUCCESS', null, '2018-01-18 10:35:04.897078', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('154', '36dc01e6-6c8a-417e-b98b-0ea95688f6eb', 'SUCCESS', null, '2018-01-18 10:35:06.113898', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('155', '68c78694-0dc7-4b6c-8164-af7f9d33ac32', 'SUCCESS', null, '2018-01-18 11:27:51.665632', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('156', 'ee54a1a8-a99b-4814-b075-f5db818fd4ef', 'SUCCESS', null, '2018-01-18 12:27:36.311874', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('157', '9bc5b111-0c5f-4652-b905-3989a65166de', 'SUCCESS', null, '2018-01-18 13:27:37.006874', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('158', '4c85a0dc-afce-4129-872a-81aecd9a098f', 'SUCCESS', null, '2018-01-18 14:27:36.067446', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('159', 'b36af3a0-344a-4aad-b6ac-6fe691dc4f29', 'SUCCESS', null, '2018-01-18 15:27:35.619314', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('160', 'f0d2a56d-fdfc-43ba-867e-a9f22d5db997', 'SUCCESS', null, '2018-01-18 16:05:35.508799', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('161', '905f58a9-5b1e-43a5-a711-0a33ee3d3a92', 'SUCCESS', null, '2018-01-18 16:06:46.138051', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('162', '65117fc4-badc-486f-964a-631901cd81c7', 'SUCCESS', null, '2018-01-18 16:07:40.820211', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('163', '4edcab08-cf47-4d45-ab77-fb1bb4f341bd', 'SUCCESS', null, '2018-01-18 16:10:07.990055', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('164', 'bcbd0b24-9a46-4e75-a1d1-2fa1773a0595', 'SUCCESS', null, '2018-01-18 16:13:43.568745', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('165', 'eafc3b11-d507-4540-a1ce-ad276a55f12b', 'SUCCESS', null, '2018-01-18 16:14:35.616648', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('166', '96e2a14a-791c-4e7e-b31c-ce85bd747f86', 'SUCCESS', null, '2018-01-18 16:16:32.999489', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('167', '4dbf4284-834b-4124-904c-f110b4eb20f2', 'SUCCESS', null, '2018-01-18 16:17:38.760754', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('168', 'd863eaa5-628e-4177-81d4-1d7c6053fc3d', 'SUCCESS', null, '2018-01-18 16:26:16.963237', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('169', 'c5bd4b87-62a6-4ee8-baa6-53ac16809fed', 'SUCCESS', null, '2018-01-18 16:26:17.388574', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('170', 'c5324b35-a59e-40cb-94b7-119ff68981bf', 'SUCCESS', null, '2018-01-18 16:26:17.392577', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('171', '5f25d80d-ed99-4f7e-bfb1-8e4bd27bf4c6', 'SUCCESS', null, '2018-01-18 16:29:39.393041', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('172', '318cb856-b13c-452c-9f4c-13b0cc75d3e6', 'SUCCESS', null, '2018-01-18 16:30:01.654689', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('173', '019dfea9-d92f-4c4b-93cc-e54b93b636dc', 'SUCCESS', null, '2018-01-18 16:38:05.449367', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('174', '8208849b-76a8-4836-a0e4-b2b997adba9d', 'FAILURE', 'gAJjc2VsZW5pdW0uY29tbW9uLmV4Y2VwdGlvbnMKV2ViRHJpdmVyRXhjZXB0aW9uCnEAWCoAAABQcm9jZXNzIHVuZXhwZWN0ZWRseSBjbG9zZWQgd2l0aCBzdGF0dXM6IDBxAU5Oh3ECUnEDfXEEKFgDAAAAbXNncQVoAVgGAAAAc2NyZWVucQZOWAoAAABzdGFja3RyYWNlcQdOdWIu', '2018-01-18 16:39:20.655175', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 30, in web_readSQLcase\n    driver =webdriver.Firefox()\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\selenium-3.8.0-py3.6.egg\\selenium\\webdriver\\firefox\\webdriver.py\", line 158, in __init__\n    keep_alive=True)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\selenium-3.8.0-py3.6.egg\\selenium\\webdriver\\remote\\webdriver.py\", line 154, in __init__\n    self.start_session(desired_capabilities, browser_profile)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\selenium-3.8.0-py3.6.egg\\selenium\\webdriver\\remote\\webdriver.py\", line 243, in start_session\n    response = self.execute(Command.NEW_SESSION, parameters)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\selenium-3.8.0-py3.6.egg\\selenium\\webdriver\\remote\\webdriver.py\", line 311, in execute\n    self.error_handler.check_response(response)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\selenium-3.8.0-py3.6.egg\\selenium\\webdriver\\remote\\errorhandler.py\", line 237, in check_response\n    raise exception_class(message, screen, stacktrace)\nselenium.common.exceptions.WebDriverException: Message: Process unexpectedly closed with status: 0\n\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('175', '75e0dd8e-40ad-48ca-83ae-dd6a19f25e88', 'SUCCESS', null, '2018-01-18 16:42:52.586905', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('176', '0700bc3c-d1b7-4204-a5bb-a46fc1b79508', 'SUCCESS', null, '2018-01-18 16:42:52.712797', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('177', '97e16569-7704-46da-8b1a-2c65ee185f8d', 'SUCCESS', null, '2018-01-18 16:42:53.146085', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('178', '4740ab40-0b54-4c66-b0db-84c727d079fa', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:44:26.727509', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    info = cursor.fetchmany(aa)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    print (case)\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('179', 'e0602fac-26f1-42f0-a873-d609fe68a688', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:44:27.424959', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    info = cursor.fetchmany(aa)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    print (case)\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('180', '95722fda-cc6d-4236-b1e6-2f6ce5145fde', 'SUCCESS', null, '2018-01-18 16:44:27.635464', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('181', 'dffb198c-1d67-4f51-a4b6-157141e5d6fe', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:47:57.196084', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    info = cursor.fetchmany(aa)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    print (case)\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('182', 'ecbd252a-c04e-4d12-ace7-ab4619065454', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:47:57.311194', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    info = cursor.fetchmany(aa)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    print (case)\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('183', '1592606c-5209-47ae-9346-432355784d03', 'SUCCESS', null, '2018-01-18 16:52:39.843029', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('184', 'a4488ba2-e6b5-40e6-887b-bfd956dde5cb', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:53:10.479298', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    info = cursor.fetchmany(aa)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    print (case)\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('185', '36c1ec4f-7624-465a-94f4-48012501a3c7', 'SUCCESS', null, '2018-01-18 16:56:21.522601', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('186', 'ee51cb3b-0d43-463e-b908-b65170622dd1', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:56:59.268087', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    aa=cursor.execute(sql)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    return \'测试用例格式不正确！%s\'%e\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('187', '0720bfe3-fabf-4557-bde8-cf078034aed3', 'SUCCESS', null, '2018-01-18 16:59:13.889703', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('188', 'f65ec11d-ceae-4eae-b029-1b1adf19dfa0', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 16:59:47.924244', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    info = cursor.fetchmany(aa)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    return \'测试用例格式不正确！%s\'%e\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('189', '16abb1b7-cb7a-464f-bb82-d57e8a923c27', 'SUCCESS', null, '2018-01-18 17:03:36.222036', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('190', '22a6d477-1d3d-4613-966b-1fd7f3b11da1', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:04:06.310096', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    for ii in info:\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    except Exception as e:\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('191', 'b0e12df3-9cc4-493b-be76-cb3b6c6b444e', 'SUCCESS', null, '2018-01-18 17:07:08.185804', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('192', 'd58be0e7-a342-46f2-948e-5a1187017f2b', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:07:29.069858', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    for ii in info:\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    return \'测试用例格式不正确！%s\'%e\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('193', 'a7f02ea5-7253-4508-a1b6-e7b5a4ec3438', 'SUCCESS', null, '2018-01-18 17:15:55.922745', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('194', '07e60f8e-400d-429b-aea7-c7c5e0528d5c', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:16:38.921326', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    aa=cursor.execute(sql)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    optmethod = case[3]\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('195', '0cb9a794-1691-4743-8185-f0633f1b6f38', 'SUCCESS', null, '2018-01-18 17:20:05.372327', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('196', 'aa30d681-ae85-4f1a-8737-c2d70c6b00e2', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:20:59.474921', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    cursor = coon.cursor()\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    evelement = case[2]\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('197', '0896f690-cbe0-4afe-9bfb-31915f3165b4', 'SUCCESS', null, '2018-01-18 17:25:06.230209', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('198', 'bbbea824-c398-48f4-a901-d4c4c0fd69a1', 'SUCCESS', null, '2018-01-18 17:25:06.669501', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('199', '1419e9d9-a922-40b9-b4bf-f3cc84eb2605', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:26:16.141433', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    case_list = []\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    return \'测试用例格式不正确！%s\'%e\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('200', '076ba59c-ea44-4099-919b-bb2b67465f5a', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:26:16.720066', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    case_list = []\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    return \'测试用例格式不正确！%s\'%e\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('201', '8b36f755-28b6-4c6c-b290-26dfd6460f16', 'SUCCESS', null, '2018-01-18 17:29:58.026640', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('202', '3a8870a1-fbb5-4a2b-b34d-b971b5314b02', 'SUCCESS', null, '2018-01-18 17:32:44.657873', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('203', 'fbd14157-b304-46ee-a2a2-57fbe1404aa5', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:33:24.107589', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    time.sleep(1)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    driver.get(\"http://www.baidu.com\")\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('204', 'd1ffae32-1f12-4da2-b148-a0757a97fb37', 'SUCCESS', null, '2018-01-18 17:36:03.789656', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('205', '381824d5-fe5f-4da6-bbb7-1a71b4db9ddc', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:36:29.043552', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    driver.quit()\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    def webtestcase(case_list):\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('206', 'f58d99cd-6d19-4301-a1cc-60ec7458617e', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:42:39.656911', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    driver.quit()\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    def webtestcase(case_list):\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('207', '7a492480-df47-40da-841f-1221cf417707', 'SUCCESS', null, '2018-01-18 17:44:24.534754', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('208', '807a25e7-c820-4c93-8e16-f2131d49b9b0', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:44:48.750245', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    driver.quit()\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\n    #    for case in case_list:\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('209', '4924b79e-c0d5-4045-a177-22b13cc2fed9', 'SUCCESS', null, '2018-01-18 17:46:22.453809', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('210', 'e2ba947a-cff3-45f4-9bc1-d999490733fa', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 17:46:56.718172', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 40, in web_readSQLcase\n    driver.quit()\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 369, in webtestcase\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('211', '016f0496-aed4-4da1-84cb-1d844842d161', 'SUCCESS', null, '2018-01-18 17:52:03.911575', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('212', '14041371-1039-4bf2-82d0-b49ee5b893ab', 'SUCCESS', null, '2018-01-18 17:56:48.012762', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('213', '04f73ceb-7873-4644-935e-5eb45b96c31d', 'SUCCESS', null, '2018-01-18 17:56:48.526584', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('214', '27e150d2-fc00-4a1a-b1b4-9450e292fd6b', 'SUCCESS', null, '2018-01-18 17:57:19.235277', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('215', 'b30f00b1-d1c1-4905-b696-123d07ffe5f4', 'SUCCESS', null, '2018-01-18 18:00:43.330648', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('216', '710f91e3-dad1-45cf-902b-7819f7daae1f', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHQAAAG5hbWUgJ2Zjb25maWcnIGlzIG5vdCBkZWZpbmVkcQGFcQJScQMu', '2018-01-18 18:00:43.400024', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 35, in web_readSQLcase\n    coon = pymysql.connect(user=\'root\',passwd=\'test123456\',db=\'autotest\',port=3306,host=fconfig.getConfig(\"database\", \"host\"),charset=\'utf8\')\nNameError: name \'fconfig\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('217', 'adaf042c-048a-4a91-adfa-ff19fbb76277', 'SUCCESS', null, '2018-01-18 18:02:43.430971', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('218', 'c3ad7348-a16e-46cb-89bb-3ae967c36a8f', 'SUCCESS', null, '2018-01-18 18:04:06.476267', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('219', '5bcc17ea-b576-4521-9d44-2ce7f909278c', 'SUCCESS', null, '2018-01-18 18:07:14.709474', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('220', 'e54c85e9-eb80-4ccd-b441-a755acd20b30', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpOYW1lRXJyb3IKcQBYHAAAAG5hbWUgJ2RyaXZlcicgaXMgbm90IGRlZmluZWRxAYVxAlJxAy4=', '2018-01-18 18:09:04.691580', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 44, in web_readSQLcase\n    webtestcase(case_list)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\Scripts\\autotest\\apitest\\tasks.py\", line 372, in webtestcase\n    driver.find_element_by_id(evelement).send_keys(testdata)\nNameError: name \'driver\' is not defined\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('221', 'b5c3f3e4-4a18-47a1-a7a4-d7f2af3b2396', 'SUCCESS', null, '2018-01-18 18:14:51.625296', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('222', '78a3c3a3-7b4c-4bb7-8213-e609e62664ef', 'FAILURE', 'gAJjZXhjZXB0aW9ucwpUeXBlRXJyb3IKcQBYQAAAAHdlYl9yZWFkU1FMY2FzZSgpIG1pc3NpbmcgMSByZXF1aXJlZCBwb3NpdGlvbmFsIGFyZ3VtZW50OiAnc2VsZidxAYVxAlJxAy4=', '2018-01-18 18:14:51.797469', 'Traceback (most recent call last):\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\zh\\AppData\\Local\\Programs\\Python\\Python36\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\nTypeError: web_readSQLcase() missing 1 required positional argument: \'self\'\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('223', '78b2774d-542b-4931-bf4d-997f989794f1', 'SUCCESS', null, '2018-01-18 18:17:00.457861', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('224', '268e7403-acc7-47ce-96df-db5adb151451', 'SUCCESS', null, '2018-01-18 18:23:17.955009', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('225', 'a8b6df7d-6c09-4b2b-b820-f9630a8847b9', 'SUCCESS', null, '2018-01-18 18:29:36.859532', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('226', '17535988-793e-413f-b5bb-d8983d5cb90e', 'SUCCESS', null, '2018-01-18 18:29:40.979539', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('227', '087207b4-7d52-4b8c-91cb-62ab3e51ad96', 'SUCCESS', null, '2018-01-18 18:31:52.244163', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('228', '6c60cb8f-9483-449a-8f93-e6756565e7e4', 'SUCCESS', null, '2018-01-18 18:33:52.099879', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('229', '9450aea1-2232-44dd-96f9-3a947c396fda', 'SUCCESS', null, '2018-01-22 09:57:01.183915', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('230', '17f91186-0803-4964-bade-ee418a4a18ba', 'SUCCESS', null, '2018-01-22 09:59:50.129466', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('231', '012bfe94-7db7-4767-853f-91114ebb4e4d', 'SUCCESS', null, '2018-01-22 10:05:15.394308', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('232', '693d886a-1784-4221-a66f-80babf71029b', 'SUCCESS', null, '2018-01-22 10:06:20.207386', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('233', 'fe3bd2df-603d-4886-a91f-9243eb90b8ce', 'SUCCESS', null, '2018-01-22 10:07:08.917822', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('234', '2da3a524-973b-42bc-854e-dbd6204115cb', 'SUCCESS', null, '2018-01-22 10:08:27.476289', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('235', '6b96800c-5e31-491a-a209-1603482f4103', 'SUCCESS', null, '2018-01-22 10:12:21.047410', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('236', '632e6c34-3128-434d-a924-8932f458823f', 'SUCCESS', null, '2018-01-22 10:57:14.615007', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('237', '622dd782-bd3a-4605-af52-8a960bec04f8', 'SUCCESS', null, '2018-01-22 11:00:32.105119', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('238', '96c927eb-838f-445f-8653-3acab0dfb659', 'SUCCESS', null, '2018-01-22 11:02:56.064016', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('239', '8b6c1bf0-9d0a-43f2-8a50-1c0bf13e8ebc', 'SUCCESS', null, '2018-01-22 11:03:07.621039', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('240', '99d6749c-f67a-4d03-91b7-96af4bbbef11', 'SUCCESS', null, '2018-01-25 11:39:45.719496', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('241', '061b4795-e3b2-45b3-b190-bd232d626487', 'FAILURE', 'gAJjdXJsbGliMgpVUkxFcnJvcgpxAGNzb2NrZXQKZ2FpZXJyb3IKcQFN+SpYEgAAAGdldGFkZHJpbmZvIGZhaWxlZHEChnEDUnEEhXEFUnEGfXEHWAYAAAByZWFzb25xCGgEc2Iu', '2018-01-25 11:39:45.768317', 'Traceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1318, in do_open\n    encode_chunked=req.has_header(\'Transfer-encoding\'))\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1239, in request\n    self._send_request(method, url, body, headers, encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1285, in _send_request\n    self.endheaders(body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1234, in endheaders\n    self._send_output(message_body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1026, in _send_output\n    self.send(msg)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 964, in send\n    self.connect()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 936, in connect\n    (self.host,self.port), self.timeout, self.source_address)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 704, in create_connection\n    for res in getaddrinfo(host, port, 0, SOCK_STREAM):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 745, in getaddrinfo\n    for res in _socket.getaddrinfo(host, port, family, type, proto, flags):\nsocket.gaierror: [Errno 11001] getaddrinfo failed\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 43, in apisauto_testcase\n    interfaceTest(case_list)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 302, in interfaceTest\n    results = urllib.request.urlopen(req).read()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 223, in urlopen\n    return opener.open(url, data, timeout)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 526, in open\n    response = self._open(req, data)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 544, in _open\n    \'_open\', req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 504, in _call_chain\n    result = func(*args)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1346, in http_open\n    return self.do_open(http.client.HTTPConnection, req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1320, in do_open\n    raise URLError(err)\nurllib.error.URLError: <urlopen error [Errno 11001] getaddrinfo failed>\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('242', '29e66f15-8344-4a97-9af5-1441fb3926a0', 'SUCCESS', null, '2018-01-25 11:40:15.824952', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('243', 'da26cacd-0a67-4ddf-8bd3-47ca2b7242b7', 'FAILURE', 'gAJjdXJsbGliMgpVUkxFcnJvcgpxAGNleGNlcHRpb25zCk9TRXJyb3IKcQEoTU0nWDMAAADnlLHkuo7nm67moIforqHnrpfmnLrnp6/mnoHmi5Lnu53vvIzml6Dms5Xov57mjqXjgIJxAk5NTSdOdHEDUnEEhXEFUnEGfXEHWAYAAAByZWFzb25xCGgEc2Iu', '2018-01-25 11:40:17.023250', 'Traceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1318, in do_open\n    encode_chunked=req.has_header(\'Transfer-encoding\'))\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1239, in request\n    self._send_request(method, url, body, headers, encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1285, in _send_request\n    self.endheaders(body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1234, in endheaders\n    self._send_output(message_body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1026, in _send_output\n    self.send(msg)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 964, in send\n    self.connect()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 936, in connect\n    (self.host,self.port), self.timeout, self.source_address)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 724, in create_connection\n    raise err\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 713, in create_connection\n    sock.connect(sa)\nConnectionRefusedError: [WinError 10061] 由于目标计算机积极拒绝，无法连接。\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 43, in apisauto_testcase\n    interfaceTest(case_list)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 302, in interfaceTest\n    results = urllib.request.urlopen(req).read()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 223, in urlopen\n    return opener.open(url, data, timeout)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 526, in open\n    response = self._open(req, data)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 544, in _open\n    \'_open\', req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 504, in _call_chain\n    result = func(*args)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1346, in http_open\n    return self.do_open(http.client.HTTPConnection, req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1320, in do_open\n    raise URLError(err)\nurllib.error.URLError: <urlopen error [WinError 10061] 由于目标计算机积极拒绝，无法连接。>\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('244', '7a5f2ef5-333a-47f1-8364-c0c8beaa53d0', 'SUCCESS', null, '2018-01-25 11:45:45.234915', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('245', '0e2134d4-92a4-40d9-8508-3066b0f9421e', 'FAILURE', 'gAJjdXJsbGliMgpVUkxFcnJvcgpxAGNleGNlcHRpb25zCk9TRXJyb3IKcQEoTU0nWDMAAADnlLHkuo7nm67moIforqHnrpfmnLrnp6/mnoHmi5Lnu53vvIzml6Dms5Xov57mjqXjgIJxAk5NTSdOdHEDUnEEhXEFUnEGfXEHWAYAAAByZWFzb25xCGgEc2Iu', '2018-01-25 11:45:46.317946', 'Traceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1318, in do_open\n    encode_chunked=req.has_header(\'Transfer-encoding\'))\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1239, in request\n    self._send_request(method, url, body, headers, encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1285, in _send_request\n    self.endheaders(body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1234, in endheaders\n    self._send_output(message_body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1026, in _send_output\n    self.send(msg)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 964, in send\n    self.connect()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 936, in connect\n    (self.host,self.port), self.timeout, self.source_address)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 724, in create_connection\n    raise err\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 713, in create_connection\n    sock.connect(sa)\nConnectionRefusedError: [WinError 10061] 由于目标计算机积极拒绝，无法连接。\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 43, in apisauto_testcase\n    interfaceTest(case_list)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 302, in interfaceTest\n    results = urllib.request.urlopen(req).read()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 223, in urlopen\n    return opener.open(url, data, timeout)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 526, in open\n    response = self._open(req, data)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 544, in _open\n    \'_open\', req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 504, in _call_chain\n    result = func(*args)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1346, in http_open\n    return self.do_open(http.client.HTTPConnection, req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1320, in do_open\n    raise URLError(err)\nurllib.error.URLError: <urlopen error [WinError 10061] 由于目标计算机积极拒绝，无法连接。>\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('246', 'c7630a0c-c5c3-4d5a-819a-5883db3606c7', 'SUCCESS', null, '2018-01-25 11:46:34.636917', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('247', '047dedda-7eb9-49c0-bb37-b45b6a948fd0', 'FAILURE', 'gAJjdXJsbGliMgpVUkxFcnJvcgpxAGNleGNlcHRpb25zCk9TRXJyb3IKcQEoTU0nWDMAAADnlLHkuo7nm67moIforqHnrpfmnLrnp6/mnoHmi5Lnu53vvIzml6Dms5Xov57mjqXjgIJxAk5NTSdOdHEDUnEEhXEFUnEGfXEHWAYAAAByZWFzb25xCGgEc2Iu', '2018-01-25 11:46:35.887146', 'Traceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1318, in do_open\n    encode_chunked=req.has_header(\'Transfer-encoding\'))\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1239, in request\n    self._send_request(method, url, body, headers, encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1285, in _send_request\n    self.endheaders(body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1234, in endheaders\n    self._send_output(message_body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1026, in _send_output\n    self.send(msg)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 964, in send\n    self.connect()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 936, in connect\n    (self.host,self.port), self.timeout, self.source_address)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 724, in create_connection\n    raise err\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 713, in create_connection\n    sock.connect(sa)\nConnectionRefusedError: [WinError 10061] 由于目标计算机积极拒绝，无法连接。\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 43, in apisauto_testcase\n    interfaceTest(case_list)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 302, in interfaceTest\n    results = urllib.request.urlopen(req).read()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 223, in urlopen\n    return opener.open(url, data, timeout)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 526, in open\n    response = self._open(req, data)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 544, in _open\n    \'_open\', req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 504, in _call_chain\n    result = func(*args)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1346, in http_open\n    return self.do_open(http.client.HTTPConnection, req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1320, in do_open\n    raise URLError(err)\nurllib.error.URLError: <urlopen error [WinError 10061] 由于目标计算机积极拒绝，无法连接。>\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('248', 'd9d85126-f7da-4e8e-ab02-695cb4f4e0ed', 'SUCCESS', null, '2018-01-25 11:47:44.147049', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('249', '254f4cc6-e454-4d23-8708-ccc3abca06b8', 'FAILURE', 'gAJjdXJsbGliMgpVUkxFcnJvcgpxAGNleGNlcHRpb25zCk9TRXJyb3IKcQEoTU0nWDMAAADnlLHkuo7nm67moIforqHnrpfmnLrnp6/mnoHmi5Lnu53vvIzml6Dms5Xov57mjqXjgIJxAk5NTSdOdHEDUnEEhXEFUnEGfXEHWAYAAAByZWFzb25xCGgEc2Iu', '2018-01-25 11:47:45.224089', 'Traceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1318, in do_open\n    encode_chunked=req.has_header(\'Transfer-encoding\'))\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1239, in request\n    self._send_request(method, url, body, headers, encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1285, in _send_request\n    self.endheaders(body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1234, in endheaders\n    self._send_output(message_body, encode_chunked=encode_chunked)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 1026, in _send_output\n    self.send(msg)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 964, in send\n    self.connect()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\http\\client.py\", line 936, in connect\n    (self.host,self.port), self.timeout, self.source_address)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 724, in create_connection\n    raise err\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\socket.py\", line 713, in create_connection\n    sock.connect(sa)\nConnectionRefusedError: [WinError 10061] 由于目标计算机积极拒绝，无法连接。\n\nDuring handling of the above exception, another exception occurred:\n\nTraceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 43, in apisauto_testcase\n    interfaceTest(case_list)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 302, in interfaceTest\n    results = urllib.request.urlopen(req).read()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 223, in urlopen\n    return opener.open(url, data, timeout)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 526, in open\n    response = self._open(req, data)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 544, in _open\n    \'_open\', req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 504, in _call_chain\n    result = func(*args)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1346, in http_open\n    return self.do_open(http.client.HTTPConnection, req)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\urllib\\request.py\", line 1320, in do_open\n    raise URLError(err)\nurllib.error.URLError: <urlopen error [WinError 10061] 由于目标计算机积极拒绝，无法连接。>\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('250', 'ac0aec4b-e8c1-4eea-a3da-c966a01df8be', 'SUCCESS', null, '2018-01-25 11:50:21.704491', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('251', '06bb035f-1b2f-4090-9a5d-d9fddb388677', 'SUCCESS', null, '2018-01-25 11:50:22.260956', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('252', '61c25e7c-a2a3-40c9-af52-f4c22c50bb94', 'SUCCESS', null, '2018-01-25 12:10:44.549631', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('253', 'a18ab77b-3757-4c8f-b829-943af9db4333', 'SUCCESS', null, '2018-01-25 12:10:44.843502', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('254', '8e0bd1be-9ce5-4773-96e2-2230b4aae7c9', 'SUCCESS', null, '2018-01-25 13:13:56.713835', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('255', 'e5a2b110-7237-455d-baed-217c73982c3a', 'SUCCESS', null, '2018-01-25 13:13:56.735334', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('256', 'b9f5749f-7250-4f62-8c3e-befc8ba0b4e6', 'SUCCESS', null, '2018-01-25 13:13:57.187462', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('257', '0b62b531-6c6d-44a4-9d6c-a8dd440e73ce', 'SUCCESS', null, '2018-01-25 13:14:24.243511', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('258', 'cc1e9aab-64f5-4cc6-b325-8174f8691602', 'SUCCESS', null, '2018-01-25 13:14:24.865863', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('259', '68aaeb43-a5ba-4799-8cb8-827210655021', 'SUCCESS', null, '2018-01-25 13:33:35.884582', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('260', '0d1285cd-b312-4227-8f8c-0abcad7b622a', 'SUCCESS', null, '2018-01-25 13:33:36.258638', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('261', '99479a39-4a44-4e29-8e5d-f18a46627ea6', 'SUCCESS', null, '2018-01-25 13:33:50.481412', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('262', '59781bf8-3336-48bf-b8a2-f7e0fffddaa9', 'SUCCESS', null, '2018-01-25 13:33:50.854244', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('263', '2760acfa-06f1-4478-8c4a-69ae77a7d78e', 'SUCCESS', null, '2018-01-25 13:34:57.881019', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('264', 'f9ec27e4-da5d-4604-88a6-159b07d4af7c', 'SUCCESS', null, '2018-01-25 13:34:58.240539', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('265', 'dcf7cdb2-8bef-4c6b-aaac-8033b92e3eaa', 'SUCCESS', null, '2018-01-25 13:38:54.569097', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('266', '72a0fdd5-06b2-4c01-9f58-2259301fbd85', 'SUCCESS', null, '2018-01-25 13:38:54.917959', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('267', 'e659427e-944e-4cd1-82b0-b938393668f0', 'SUCCESS', null, '2018-01-25 13:39:57.080503', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('268', 'b4d94ff4-769e-471b-98ed-96e6b4d082db', 'SUCCESS', null, '2018-01-25 13:39:57.639020', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('269', '94a0a226-c757-426a-ba0b-264cabf5c7de', 'SUCCESS', null, '2018-01-25 13:41:34.874927', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('270', 'a885e2eb-ad78-4e8f-9dfc-df22c9325ead', 'SUCCESS', null, '2018-01-25 13:41:35.286074', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('271', '614d8916-3b88-4832-a843-af69a9660f0b', 'SUCCESS', null, '2018-01-25 13:44:45.604501', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('272', '85c41f6d-555c-4f8b-b2f3-e1a3382feb78', 'SUCCESS', null, '2018-01-25 13:45:45.935233', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('273', 'd9ec5f44-b94b-485b-ae1c-f9c53bacebe5', 'SUCCESS', null, '2018-01-25 13:45:50.711609', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('274', '284377fd-5090-4bb4-955c-b1505164aec4', 'SUCCESS', null, '2018-01-25 13:46:52.026218', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('275', 'e6eb5dfc-6e12-4f4a-aebb-9a00b51accc2', 'SUCCESS', null, '2018-01-25 13:47:19.534463', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('276', '30415b3f-611b-4657-9250-8e5023048aca', 'SUCCESS', null, '2018-01-26 09:55:25.981833', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('277', 'fc9fe190-457d-4d58-bd58-633c3ff3a75f', 'SUCCESS', null, '2018-01-26 09:55:26.006237', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('278', 'f16316c3-cd35-4676-9ff4-eddd5749e69b', 'SUCCESS', null, '2018-01-25 14:04:02.907926', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('279', 'd22dfb98-9e8a-487a-aab7-a2259b922c86', 'SUCCESS', null, '2018-01-25 14:04:02.923449', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('280', 'c65f5ecc-0130-4987-86de-53efa04008fe', 'SUCCESS', null, '2018-01-25 14:04:11.220367', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('281', '5a80f85c-e458-45f7-a686-dd6e1f661ce1', 'SUCCESS', null, '2018-01-25 13:59:20.064216', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('282', 'ccdf971f-7075-49bd-a013-aff004c8de9b', 'SUCCESS', null, '2018-01-25 13:59:20.499805', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('283', 'b30d3b78-7d54-466e-b3f2-2d00347c06a0', 'SUCCESS', null, '2018-01-25 14:25:19.696384', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('284', '0b6c76d6-7c8a-43ee-a629-93bd7e575fbc', 'SUCCESS', null, '2018-01-25 14:25:41.900057', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('285', 'd71d33fe-2afe-45f3-89bf-fbe0fbdc44c2', 'SUCCESS', null, '2018-01-25 14:25:42.165606', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('286', 'fc55fcd3-a6ed-44e8-8ce3-3c39b1f78a85', 'SUCCESS', null, '2018-01-25 15:52:44.747890', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('287', 'c5b1e82b-05b8-4ffa-81d8-ade9b6e980f8', 'SUCCESS', null, '2018-01-25 15:52:44.780603', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('288', '0e39b8d0-f182-4317-99d4-8602cb0bb83b', 'SUCCESS', null, '2018-01-25 15:52:45.638628', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('289', '1eb64827-1da2-42fa-b701-bb2dcd95a4f7', 'SUCCESS', null, '2018-01-25 16:02:05.192631', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('290', '3b89509d-3b80-4009-858e-57c6a973aa24', 'SUCCESS', null, '2018-01-25 17:16:26.227962', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('291', 'fb4a4d73-bc14-4f5a-9d08-f2f530019704', 'SUCCESS', null, '2018-01-25 17:16:26.493601', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('292', 'eb031d16-d83e-4057-af2c-d7011a4991c7', 'SUCCESS', null, '2018-01-25 21:36:56.212313', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('293', '417473cf-b2f1-48d9-8ba5-b3968068cc72', 'SUCCESS', null, '2018-01-25 21:36:56.417381', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('294', '1aa18a8c-5afa-46b9-a23e-bd0c87e4cd11', 'SUCCESS', null, '2018-01-26 09:55:26.029677', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('295', '135c88fd-4212-4cd9-85ea-851fcbcb0ba2', 'SUCCESS', null, '2018-01-26 09:55:26.612684', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('296', '333fd7b3-a051-464e-a790-dccdfc9959c5', 'SUCCESS', null, '2018-01-29 13:47:21.601221', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('297', '4b802866-f639-42f8-b212-039eee1b6936', 'SUCCESS', null, '2018-01-29 13:47:21.616851', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('298', '27efdd64-4d9b-498d-a28b-09b0728550ab', 'FAILURE', 'gAJjcHlteXNxbC5lcnIKRGF0YUVycm9yCnEATX4FWC8AAABEYXRhIHRvbyBsb25nIGZvciBjb2x1bW4gJ2FwaXJlc3BvbnNlJyBhdCByb3cgMXEBhnECUnEDLg==', '2018-01-29 13:47:21.726229', 'Traceback (most recent call last):\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 240, in trace_task\n    R = retval = fun(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\celery-3.1.25-py3.6.egg\\celery\\app\\trace.py\", line 438, in __protected_call__\n    return self.run(*args, **kwargs)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 48, in apisauto_testcase\n    interfaceTest1(case_list)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 103, in interfaceTest1\n    caseWriteResult1(case_id,results,\'0\')\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\Scripts\\autotest\\apitest\\tasks.py\", line 204, in caseWriteResult1\n    cursor.execute(sql,param)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\cursors.py\", line 165, in execute\n    result = self._query(query)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\cursors.py\", line 321, in _query\n    conn.query(q)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\connections.py\", line 860, in query\n    self._affected_rows = self._read_query_result(unbuffered=unbuffered)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\connections.py\", line 1061, in _read_query_result\n    result.read()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\connections.py\", line 1349, in read\n    first_packet = self.connection._read_packet()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\connections.py\", line 1018, in _read_packet\n    packet.check_error()\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\connections.py\", line 384, in check_error\n    err.raise_mysql_exception(self._data)\n  File \"C:\\Users\\Administrator\\AppData\\Local\\Programs\\Python\\Python36-32\\lib\\site-packages\\pymysql-0.8.0-py3.6.egg\\pymysql\\err.py\", line 107, in raise_mysql_exception\n    raise errorclass(errno, errval)\npymysql.err.DataError: (1406, \"Data too long for column \'apiresponse\' at row 1\")\n', '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('299', '9496c858-c4ca-42b6-932d-8ff7243bdf35', 'SUCCESS', null, '2018-01-29 13:53:27.947379', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('300', '3113bf0a-dec6-4802-91c8-de64ed571aac', 'SUCCESS', null, '2018-01-29 13:54:48.494598', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('301', '088bd9bb-c15c-4dfb-bcbe-26b66964111a', 'SUCCESS', null, '2018-01-29 13:56:00.760315', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('302', '144420a9-feef-4276-a3ee-0a3bcb824ff9', 'SUCCESS', null, '2018-01-29 13:56:01.025917', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('303', 'aaf2a96d-d061-45a9-9094-1b5de2216291', 'SUCCESS', null, '2018-01-30 11:29:52.201244', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('304', '2da9dc1a-6da5-4fed-a58e-c227290a9cd5', 'SUCCESS', null, '2018-01-30 11:49:49.662278', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('305', 'f3aab2d0-3c89-442b-8ebf-b6c1d2bf2a2d', 'SUCCESS', null, '2018-01-30 11:49:49.677913', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('306', '4a655ab7-777e-41c1-9d2b-e0305203c74d', 'SUCCESS', null, '2018-01-30 11:49:49.802914', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('307', '7d67dceb-5fbb-45fb-9edd-28a5328c1bf1', 'SUCCESS', null, '2018-01-30 11:49:49.834180', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('308', '63ea056b-de1e-4686-8d7c-56b17e67c1d9', 'SUCCESS', null, '2018-01-30 12:07:08.624389', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('309', '5d1dad0d-1ed3-466a-858c-541c4280b5ee', 'SUCCESS', null, '2018-01-30 12:07:08.640024', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('310', '47b6dff1-2bd4-4b3d-93c3-969f8b81a999', 'SUCCESS', null, '2018-01-30 11:49:49.912525', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('311', '0d6de42a-9caf-49cd-9f82-0890749e6b17', 'SUCCESS', null, '2018-01-30 11:49:50.099804', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('312', 'fb24642a-c156-4083-90d3-681153084f48', 'SUCCESS', null, '2018-01-30 12:07:21.905640', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('313', '7c832795-009e-4a53-9311-64df50860d4d', 'SUCCESS', null, '2018-01-30 12:07:22.108754', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('314', '71b3805b-f92f-47f1-b3ed-7f78e57aa595', 'SUCCESS', null, '2018-01-30 12:07:27.936866', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');

-- ----------------------------
-- Table structure for `celery_tasksetmeta`
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_tasksetmeta
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-12-25 16:41:03.552498', '1', '接口平台', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apitest\", \"object\": \"\\u767b\\u5f55\"}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-12-25 16:41:21.859551', '2', 'app平台', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-12-25 16:41:42.260925', '1', '接口平台', '3', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-12-25 16:41:55.771562', '3', 'api平台', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-12-25 16:43:47.488021', '2', '登录购物支付', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\"}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-12-26 02:09:43.320379', '1', '买家', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-12-26 02:09:53.644766', '2', '卖家', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-12-26 06:43:23.981271', '2', '登录购物支付test', '2', '[{\"changed\": {\"fields\": [\"apitestname\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-12-26 11:31:09.414427', '2', 'test', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-12-26 11:33:35.761087', '2', 'test', '2', '[{\"changed\": {\"fields\": [\"is_staff\", \"user_permissions\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-12-26 11:34:04.267272', '2', 'test', '2', '[{\"changed\": {\"fields\": [\"email\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-12-26 13:39:55.803717', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('13', '2017-12-26 13:39:57.925830', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('14', '2017-12-26 13:55:26.699985', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('15', '2017-12-26 14:01:48.422333', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('16', '2017-12-26 14:02:58.165053', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiresult\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('17', '2017-12-26 14:23:55.629820', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('18', '2017-12-26 14:31:45.718179', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('19', '2017-12-26 14:32:47.444990', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiresult\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '2');
INSERT INTO `django_admin_log` VALUES ('20', '2017-12-27 10:47:42.596463', '3', '登录购物支付', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-12-27 10:49:35.037763', '4', '登录购物支付aa', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-12-27 11:10:03.091142', '5', '登录购物支付bb', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2017-12-27 11:41:44.120388', '7', '登录购物支付cc', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2017-12-27 11:42:07.824395', '8', '登录购物支付dd', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2017-12-27 12:53:07.670682', '2', '卖家', '2', '[]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2017-12-27 12:53:42.465714', '3', '第三方', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"\\u6d41\\u7a0b\\u573a\\u666f\\u63a5\\u53e3\", \"object\": \"\\u7b2c\\u4e09\\u65b9\\u767b\\u5f55\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2017-12-27 12:54:26.473706', '12', '第三方登录购物支付', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u7b2c\\u4e09\\u65b9\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2017-12-27 12:54:40.076119', '1', '买家', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2017-12-27 12:54:53.935910', '4', '卖家', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2017-12-27 12:55:30.201319', '13', '卖家登录购物支付', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u5356\\u5bb6\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2017-12-27 12:55:49.452905', '4', '买家', '2', '[{\"changed\": {\"fields\": [\"productname\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2017-12-27 12:57:53.041389', '4', '买家', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2017-12-27 13:02:25.787049', '10', '买家', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2017-12-27 13:14:04.392055', '10', '买家', '2', '[{\"added\": {\"name\": \"\\u6d41\\u7a0b\\u573a\\u666f\\u63a5\\u53e3\", \"object\": \"\\u4e70\\u5bb6\\u767b\\u5f55\"}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2017-12-27 13:14:37.259643', '27', '买家登录购物支付aa', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u4e70\\u5bb6\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2017-12-28 11:21:10.396513', '3', '第三方', '2', '[{\"changed\": {\"name\": \"\\u6d41\\u7a0b\\u573a\\u666f\\u63a5\\u53e3\", \"object\": \"\\u7b2c\\u4e09\\u65b9\\u767b\\u5f55\\u8d2d\\u7269\\u652f\\u4ed8\", \"fields\": [\"apitestresult\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2017-12-30 05:18:20.507869', '1', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2017-12-30 05:47:59.098695', '2', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2017-12-30 05:48:12.854167', '3', 'a', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2017-12-30 05:48:27.299284', '4', 'a', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2017-12-30 05:48:42.858959', '5', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2017-12-30 05:48:55.582107', '6', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2017-12-30 05:53:35.609438', '1', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2017-12-30 06:57:35.042447', '1', '计算器计算1+1=2', '2', '[{\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2017-12-30 08:00:26.468921', '1', '百度搜索《自动化平台测试开发》', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u81ea\\u52a8\\u5316\\u5e73\\u53f0\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\"}}, {\"added\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u81ea\\u52a8\\u5316\\u5e73\\u53f0\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\"}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2017-12-30 08:35:53.347740', '1', '计算器计算1+1=2', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2017-12-30 08:53:37.677670', '11', 'web产品', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2017-12-30 08:53:45.818698', '1', '百度搜索《自动化平台测试开发》', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2017-12-30 09:00:09.650368', '3', 'app产品', '2', '[{\"changed\": {\"fields\": [\"productname\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2017-12-30 10:29:24.848788', '6', '登录', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2017-12-30 10:29:32.404480', '5', '登录', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2017-12-30 10:29:40.216404', '4', 'a', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2017-12-30 10:29:46.357957', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2017-12-30 10:29:52.485056', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2017-12-30 10:30:23.505536', '3', 'a', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2018-01-03 03:13:33.779398', '7', 'a', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2018-01-03 03:14:17.474599', '8', 'a', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2018-01-03 03:15:12.951082', '9', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2018-01-03 03:15:59.752143', '10', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2018-01-03 03:16:27.787509', '12', '接口平台', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2018-01-03 03:37:44.908394', '11', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2018-01-03 03:39:36.992155', '13', '买买家', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2018-01-03 03:40:03.680951', '12', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2018-01-03 03:49:01.207801', '13', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2018-01-03 03:49:21.740072', '14', '买买家', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2018-01-03 03:49:41.397304', '14', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2018-01-03 09:06:24.501504', '2', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2018-01-03 09:12:00.957482', '3', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2018-01-03 09:18:01.181108', '15', '买买家1', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2018-01-03 09:28:03.214380', '16', 'apptest平台', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2018-01-03 09:28:53.630107', '4', '1', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2018-01-03 09:50:42.141852', '5', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2018-01-03 09:56:36.897877', '6', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2018-01-03 10:08:01.261176', '7', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2018-01-03 10:11:56.845232', '8', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2018-01-03 10:17:12.015436', '9', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2018-01-04 02:50:24.587587', '10', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2018-01-04 02:59:25.775696', '11', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2018-01-04 03:25:13.685304', '12', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2018-01-04 03:57:10.863927', '13', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2018-01-04 03:58:32.807704', '14', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2018-01-04 04:04:26.566596', '15', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2018-01-04 04:18:34.321128', '16', '计算器计算1+1=2', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"appcasestep\", \"object\": \"\\u8ba1\\u7b97\\u56681+1=2\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2018-01-04 04:30:56.761313', '28', '买家登录购物支付', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u4e70\\u5bb6\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2018-01-04 04:38:44.507903', '15', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2018-01-04 04:44:38.636128', '2', '百度搜索《自动化平台测试开发》', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u81ea\\u52a8\\u5316\\u5e73\\u53f0\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\"}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2018-01-04 04:49:19.440354', '17', 'app平台2', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2018-01-04 06:48:32.849496', '29', '卖家登录购物支付', '1', '[{\"added\": {}}, {\"added\": {\"name\": \"apistep\", \"object\": \"\\u5356\\u5bb6\\u767b\\u5f55\"}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2018-01-04 08:13:09.323911', '18', '产品11', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2018-01-04 08:59:27.267175', '19', '测试产品', '1', '[{\"added\": {}}]', '15', '2');
INSERT INTO `django_admin_log` VALUES ('91', '2018-01-05 07:15:21.094941', '2', '登录购物支付test', '2', '[{\"changed\": {\"fields\": [\"apitestdesc\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apistep\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apistep\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2018-01-05 07:21:47.411232', '7', '登录购物支付cc', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2018-01-05 07:23:13.071878', '29', '卖家登录购物支付', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2018-01-05 07:25:43.830409', '2', '登录购物支付test', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2018-01-06 09:02:34.126978', '1', 'url', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2018-01-06 14:52:17.044446', '2', 'host', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2018-01-06 14:56:11.782126', '3', 'host', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2018-01-06 14:56:25.258523', '4', 'host', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2018-01-06 14:56:34.692452', '5', 'url', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2018-01-06 14:56:42.902980', '6', 'url', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2018-01-06 14:56:52.903416', '7', 'url', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2018-01-08 14:02:36.233765', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2018-01-08 14:02:57.838578', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2018-01-08 14:03:07.123270', '3', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2018-01-08 14:03:15.473913', '4', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2018-01-08 14:03:29.148804', '7', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2018-01-08 14:03:37.364217', '8', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2018-01-08 14:08:34.691444', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2018-01-08 22:23:11.684317', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2018-01-08 23:04:21.672013', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2018-01-08 23:22:33.369902', '1', 'url', '2', '[{\"changed\": {\"fields\": [\"setvalue\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2018-01-08 23:23:25.403333', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2018-01-08 23:54:00.733817', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2018-01-08 23:56:06.902820', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2018-01-09 00:05:44.141314', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2018-01-09 00:16:05.582198', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2018-01-09 15:56:53.083306', '1', 'UrlValue', '2', '[{\"changed\": {\"fields\": [\"setname\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2018-01-09 16:16:25.707321', '1', 'url', '2', '[{\"changed\": {\"fields\": [\"setname\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2018-01-09 16:21:00.574304', '1', 'urlvalue', '2', '[{\"changed\": {\"fields\": [\"setname\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2018-01-09 16:29:41.659288', '1', 'seturl', '2', '[{\"changed\": {\"fields\": [\"setname\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2018-01-09 16:36:33.180767', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2018-01-09 16:38:37.061318', '1', 'seturl1', '2', '[{\"changed\": {\"fields\": [\"setname\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('123', '2018-01-09 16:39:31.584479', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('124', '2018-01-09 16:56:33.941291', '1', 'seturl', '2', '[{\"changed\": {\"fields\": [\"setname\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('125', '2018-01-09 16:56:47.476119', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('126', '2018-01-09 16:58:24.460377', '1', 'seturl', '2', '[{\"changed\": {\"fields\": [\"setvalue\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('127', '2018-01-09 16:58:58.516557', '1', 'seturl', '2', '[{\"changed\": {\"fields\": [\"setvalue\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('128', '2018-01-10 19:38:58.350926', '16', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('129', '2018-01-11 23:05:25.411872', '1', '计算器计算1+1=2', '2', '[{\"deleted\": {\"name\": \"appcasestep\", \"object\": \"\\u7b2c\\u4e94\\u6b65\"}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('130', '2018-01-12 11:24:45.563353', '2', '百度搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"fields\": [\"webcasename\"]}}, {\"added\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u8f6f\\u4ef6\\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\"}}, {\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u8f6f\\u4ef6\\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webcasename\", \"webtestobjname\", \"webtestdata\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('131', '2018-01-14 23:06:10.911087', '1', 'every hour', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('132', '2018-01-14 23:06:25.721874', '1', 'api_autotest: every hour', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('133', '2018-01-14 23:07:31.525358', '1', 'every second', '2', '[{\"changed\": {\"fields\": [\"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('134', '2018-01-14 23:07:34.921419', '1', 'api_autotest: every second', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('135', '2018-01-14 23:20:20.707755', '1', '127.0.0.1', '1', '[{\"added\": {}}]', '25', '1');
INSERT INTO `django_admin_log` VALUES ('136', '2018-01-15 13:58:40.695826', '1', 'api_autotest: every second', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('137', '2018-01-15 14:47:56.189178', '1', 'every 20 minutes', '2', '[{\"changed\": {\"fields\": [\"every\", \"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('138', '2018-01-15 14:48:16.759574', '1', 'api_autotest: every 20 minutes', '2', '[{\"changed\": {\"fields\": [\"regtask\", \"task\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('139', '2018-01-15 14:59:47.090121', '1', 'api_autotest: every 20 minutes', '2', '[{\"changed\": {\"fields\": [\"regtask\", \"task\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('140', '2018-01-15 15:01:50.400853', '1', 'every 20 seconds', '2', '[{\"changed\": {\"fields\": [\"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('141', '2018-01-15 15:01:55.626703', '1', 'api_autotest: every 20 seconds', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('142', '2018-01-15 23:21:33.268185', '1', '30 23 1 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('143', '2018-01-15 23:22:18.822875', '1', 'api_autotest: 30 23 1 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"interval\", \"crontab\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('144', '2018-01-15 23:32:40.618203', '1', '35 23 1 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"minute\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('145', '2018-01-15 23:32:51.369805', '1', 'api_autotest: 35 23 1 1 2018 (m/h/d/dM/MY)', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('146', '2018-01-15 23:38:51.793581', '1', '40 23 1 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"minute\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('147', '2018-01-15 23:38:58.096497', '1', 'api_autotest: 40 23 1 1 2018 (m/h/d/dM/MY)', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('148', '2018-01-16 00:03:27.943869', '1', '单一接口测试用例执行: 40 23 1 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('149', '2018-01-16 00:04:36.478066', '1', '单一接口用例-测试执行: 40 23 1 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('150', '2018-01-16 00:25:16.724198', '2', '单一接口用例周期任务: every 20 seconds', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('151', '2018-01-16 00:26:17.580589', '1', 'every 10 seconds', '2', '[{\"changed\": {\"fields\": [\"every\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('152', '2018-01-16 09:33:16.289342', '2', '50 9 16 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('153', '2018-01-16 09:33:56.742518', '3', '单一接口用例周期任务2: 50 9 16 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('154', '2018-01-16 09:34:27.631053', '3', '单一接口用例-测试执行2: 50 9 16 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('155', '2018-01-16 11:37:03.743823', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('156', '2018-01-16 21:17:40.449769', '4', 'celery.backend_cleanup: 0 4 * * * (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"regtask\", \"task\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('157', '2018-01-16 21:19:25.339611', '3', '22 21 16 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"minute\", \"hour\", \"day_of_week\", \"day_of_month\", \"month_of_year\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('158', '2018-01-16 21:19:30.823864', '4', 'celery.backend_cleanup: 22 21 16 1 2018 (m/h/d/dM/MY)', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('159', '2018-01-16 21:23:33.326021', '3', '26 21 16 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"minute\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('160', '2018-01-16 21:23:36.431264', '4', 'celery.backend_cleanup: 26 21 16 1 2018 (m/h/d/dM/MY)', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('161', '2018-01-17 09:08:28.777697', '4', 'celery.backend_cleanup: 0 4 * * * (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('162', '2018-01-17 10:19:43.157211', '5', '25 10 3 17 1 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('163', '2018-01-17 10:19:48.278964', '5', '单一接口用例-测试执行3: 25 10 3 17 1 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('164', '2018-01-17 10:21:09.588010', '6', '23 10 17 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('165', '2018-01-17 10:21:12.466845', '6', '单一接口用例-测试执行4: 23 10 17 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('166', '2018-01-17 10:22:55.766164', '7', '30 18 17 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('167', '2018-01-17 10:23:00.262426', '7', '单一接口用例-测试执行5: 30 18 17 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('168', '2018-01-17 10:23:59.928221', '8', '28 2 17 1 2108 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('169', '2018-01-17 10:24:10.435219', '8', '28 2 17 1 2018 (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"month_of_year\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('170', '2018-01-17 10:24:14.701247', '8', '单一接口用例-测试执行6: 28 2 17 1 2018 (m/h/d/dM/MY)', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('171', '2018-01-17 10:27:24.903558', '1', 'every minute', '2', '[{\"changed\": {\"fields\": [\"every\", \"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('172', '2018-01-17 10:27:27.567569', '2', '单一接口用例周期任务: every minute', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('173', '2018-01-17 10:47:04.567930', '1', 'every hour', '2', '[{\"changed\": {\"fields\": [\"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('174', '2018-01-17 10:53:19.339767', '2', '单一接口用例周期任务: every hour', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('175', '2018-01-17 10:56:40.048753', '1', 'every 6 hours', '2', '[{\"changed\": {\"fields\": [\"every\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('176', '2018-01-17 10:56:43.905672', '2', '单一接口用例周期任务: every 6 hours', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('177', '2018-01-17 11:22:23.131001', '4', 'celery.backend_cleanup: 0 4 * * * (m/h/d/dM/MY)', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('178', '2018-01-17 11:44:56.704341', '1', 'every 10 hours', '2', '[{\"changed\": {\"fields\": [\"every\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('179', '2018-01-17 11:45:11.693208', '2', '单一接口用例周期任务: every 10 hours', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('180', '2018-01-17 11:45:36.722771', '1', 'every minute', '2', '[{\"changed\": {\"fields\": [\"every\", \"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('181', '2018-01-17 11:45:38.420576', '2', '单一接口用例周期任务: every minute', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('182', '2018-01-17 11:46:15.317664', '1', 'every hour', '2', '[{\"changed\": {\"fields\": [\"period\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('183', '2018-01-17 11:46:18.088396', '2', '单一接口用例周期任务: every hour', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('184', '2018-01-17 17:06:09.864762', '1', '40 23 * * * (m/h/d/dM/MY)', '2', '[{\"changed\": {\"fields\": [\"day_of_week\", \"day_of_month\", \"month_of_year\"]}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('185', '2018-01-17 17:06:12.926556', '1', '单一接口用例-测试执行: 40 23 * * * (m/h/d/dM/MY)', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('186', '2018-01-17 18:26:42.411245', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('187', '2018-01-17 20:45:58.964347', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('188', '2018-01-18 10:09:43.677644', '7', '单一接口用例-测试执行5: 30 18 17 1 2018 (m/h/d/dM/MY)', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('189', '2018-01-18 10:09:53.695797', '8', '单一接口用例-测试执行6: 28 2 17 1 2018 (m/h/d/dM/MY)', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('190', '2018-01-18 10:10:03.488254', '9', 'celery.backend_cleanup: 0 4 * * * (m/h/d/dM/MY)', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('191', '2018-01-18 11:25:10.218583', '17', '登录', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('192', '2018-01-18 16:03:19.907248', '3', '单一接口用例-测试执行2: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\", \"interval\", \"crontab\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('193', '2018-01-18 16:14:28.651066', '3', '单一接口用例-测试执行2: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('194', '2018-01-18 16:19:26.861701', '3', 'web测试用例-测试执行: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('195', '2018-01-18 16:21:18.897233', '10', 'web测试用例: every hour', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('196', '2018-01-18 16:25:21.100658', '10', 'web测试用例: every hour', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('197', '2018-01-18 16:25:30.928909', '3', 'web测试用例-测试执行: every hour', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('198', '2018-01-18 16:25:52.809442', '3', 'web测试用例-测试执行: every hour', '2', '[]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('199', '2018-01-18 16:26:05.535856', '3', 'web测试用例-测试执行: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('200', '2018-01-18 16:42:00.924868', '11', 'celery.backend_cleanup: 0 4 * * * (m/h/d/dM/MY)', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('201', '2018-01-18 18:06:40.466553', '12', 'celery.backend_cleanup: 0 4 * * * (m/h/d/dM/MY)', '3', '', '21', '1');
INSERT INTO `django_admin_log` VALUES ('202', '2018-01-18 18:27:37.187723', '5', 'web搜索：软件自动化测试开发: every hour', '2', '[{\"changed\": {\"fields\": [\"name\", \"regtask\", \"interval\", \"crontab\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('203', '2018-01-18 18:31:24.089992', '2', '百度搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u8f6f\\u4ef6\\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('204', '2018-01-18 18:32:52.573531', '2', '百度搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u8f6f\\u4ef6\\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webtestobjname\", \"webtestdata\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('205', '2018-01-22 09:56:10.031518', '6', '单一接口用例-测试执行4: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\", \"interval\", \"crontab\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('206', '2018-01-22 09:56:42.025600', '6', 'app登录用例: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('207', '2018-01-22 10:59:15.190446', '2', '单一接口用例周期任务: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('208', '2018-01-22 11:00:19.693354', '6', 'app登录用例: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('209', '2018-01-22 20:01:27.471726', '2', '业务流程接口测试: every hour', '2', '[{\"changed\": {\"fields\": [\"name\", \"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('210', '2018-01-22 20:02:07.541063', '1', '单一接口扫描测试: every hour', '2', '[{\"changed\": {\"fields\": [\"name\", \"regtask\", \"interval\", \"crontab\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('211', '2018-01-22 20:02:45.661112', '3', 'web搜索：自动化平台测试开发: every hour', '2', '[{\"changed\": {\"fields\": [\"name\", \"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('212', '2018-01-22 20:03:07.693139', '5', 'web搜索：软件自动化测试开发: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('213', '2018-01-22 20:03:16.504818', '3', 'web搜索：自动化平台测试开发: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('214', '2018-01-22 22:59:03.052679', '3', 'dev', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('215', '2018-01-22 23:02:39.044690', '3', 'dev', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('216', '2018-01-25 11:40:10.286698', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\", \"apimethod\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('217', '2018-01-25 11:45:08.438814', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apimethod\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('218', '2018-01-25 11:45:21.418728', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('219', '2018-01-25 11:46:19.823929', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('220', '2018-01-25 11:46:29.610374', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('221', '2018-01-25 11:47:31.936588', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('222', '2018-01-25 11:48:00.435570', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('223', '2018-01-25 11:48:06.218937', '3', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('224', '2018-01-25 11:48:11.431029', '4', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('225', '2018-01-25 11:48:15.809072', '6', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('226', '2018-01-25 11:48:20.056290', '7', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('227', '2018-01-25 11:48:24.921664', '8', 'a', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('228', '2018-01-25 11:48:38.751213', '17', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('229', '2018-01-25 11:48:48.836526', '16', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('230', '2018-01-25 11:48:51.962573', '15', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('231', '2018-01-25 11:48:54.955045', '14', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('232', '2018-01-25 11:49:20.288616', '7', 'a', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('233', '2018-01-25 11:49:26.788777', '8', 'a', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('234', '2018-01-25 11:49:46.054884', '5', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('235', '2018-01-25 11:49:52.462304', '13', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('236', '2018-01-25 11:49:56.200682', '12', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('237', '2018-01-25 11:49:58.526060', '11', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('238', '2018-01-25 11:50:00.743756', '10', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('239', '2018-01-25 11:50:03.134450', '9', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('240', '2018-01-25 12:10:14.402280', '1', '单一接口扫描测试: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('241', '2018-01-25 12:43:04.008487', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('242', '2018-01-25 12:43:20.458931', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\", \"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('243', '2018-01-25 13:14:19.125265', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('244', '2018-01-25 13:39:37.459968', '2', '业务流程接口测试: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('245', '2018-01-25 13:55:37.404670', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiurl\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiurl\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('246', '2018-01-25 14:27:07.198509', '2', '登录购物支付test', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('247', '2018-01-25 14:27:22.495695', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresult\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('248', '2018-01-25 15:37:26.775686', '2', 'test', '2', '[{\"changed\": {\"fields\": [\"user_permissions\", \"last_login\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('249', '2018-01-26 09:47:56.805291', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('250', '2018-01-26 09:48:19.084373', '2', '登录', '2', '[{\"changed\": {\"fields\": [\"apiurl\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('251', '2018-01-26 09:56:06.087380', '1', '登录', '2', '[{\"changed\": {\"fields\": [\"apiresult\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('252', '2018-01-26 09:56:25.212345', '8', 'a', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('253', '2018-01-26 10:01:25.727998', '7', 'a', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('254', '2018-01-28 12:57:56.812059', '19', '测试产品', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('255', '2018-01-28 12:58:09.876429', '18', '产品11', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('256', '2018-01-28 12:58:38.595040', '17', 'app平台2', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('257', '2018-01-28 12:58:43.813770', '16', 'apptest平台', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('258', '2018-01-28 12:59:15.563567', '15', '买买家1', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('259', '2018-01-28 12:59:21.266645', '14', '买买家', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('260', '2018-01-28 17:22:14.183582', '7', 'app登录：csdn: every hour', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('261', '2018-01-28 17:23:07.929394', '5', 'app计算：1+1=: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('262', '2018-01-28 17:23:31.494611', '1', '单一接口：扫描测试: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('263', '2018-01-28 17:23:39.465253', '2', '业务流程：接口测试: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('264', '2018-01-28 17:24:21.882057', '2', '流程接口：数据测试: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('265', '2018-01-28 17:24:41.140654', '2', '流程接口：业务测试: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('266', '2018-01-28 17:24:53.850601', '1', '单一接口：扫描: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('267', '2018-01-28 17:25:01.838778', '2', '流程接口：业务: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('268', '2018-01-28 17:25:12.566243', '2', '流程接口：功能业务: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('269', '2018-01-28 17:26:03.961422', '2', '流程接口：业务场景: every hour', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('270', '2018-01-28 21:04:22.080859', '5', 'app计算：1+1=: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('271', '2018-01-28 21:04:45.362744', '3', 'web搜索：自动化平台测试开发: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('272', '2018-01-28 21:04:56.904660', '4', 'web搜索：软件自动化测试开发: every hour', '2', '[{\"changed\": {\"fields\": [\"regtask\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('273', '2018-01-28 21:21:54.455789', '2', '计算器计算1+1=2', '2', '[{\"changed\": {\"fields\": [\"Product\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('274', '2018-01-29 13:05:48.647862', '13', '买买家', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('275', '2018-01-29 13:06:53.163911', '10', '自动化平台', '2', '[{\"changed\": {\"fields\": [\"productname\", \"producter\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('276', '2018-01-29 13:07:08.445255', '12', '接口平台', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('277', '2018-01-29 13:07:39.773546', '2', '商城', '2', '[{\"changed\": {\"fields\": [\"productname\", \"producter\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('278', '2018-01-29 13:07:48.804869', '3', 'app产品', '2', '[{\"changed\": {\"fields\": [\"producter\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('279', '2018-01-29 13:08:40.305179', '10', '自动化平台', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('280', '2018-01-29 13:08:59.070950', '3', 'app产品', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('281', '2018-01-29 13:09:11.399134', '11', 'web产品', '2', '[{\"changed\": {\"fields\": [\"productdesc\", \"producter\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('282', '2018-01-29 13:09:23.602361', '2', '商城', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('283', '2018-01-29 13:12:32.134841', '16', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('284', '2018-01-29 13:12:35.697356', '15', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('285', '2018-01-29 13:12:38.634872', '14', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('286', '2018-01-29 13:12:41.572374', '13', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('287', '2018-01-29 13:12:44.650510', '12', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('288', '2018-01-29 13:12:53.900573', '11', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('289', '2018-01-29 13:13:04.775629', '10', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('290', '2018-01-29 13:13:19.213298', '9', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('291', '2018-01-29 13:13:21.900744', '8', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('292', '2018-01-29 13:13:24.478869', '7', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('293', '2018-01-29 13:13:27.072659', '6', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('294', '2018-01-29 13:13:31.557024', '5', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('295', '2018-01-29 13:13:34.791423', '3', '计算器计算1+1=2', '3', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('296', '2018-01-29 13:14:12.072916', '2', 'csdn登录', '2', '[{\"changed\": {\"fields\": [\"appcasename\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('297', '2018-01-29 13:14:48.104433', '2', '登录csdn', '2', '[{\"changed\": {\"fields\": [\"appcasename\"]}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('298', '2018-01-29 13:15:08.823293', '3', '登录', '2', '[{\"changed\": {\"fields\": [\"apiname\", \"apitester\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('299', '2018-01-29 13:15:20.542126', '4', '登录', '2', '[{\"changed\": {\"fields\": [\"apiname\", \"apitester\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('300', '2018-01-29 13:15:42.995432', '6', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('301', '2018-01-29 13:16:03.589304', '10', '自动化平台', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('302', '2018-01-29 13:16:16.198782', '3', 'app产品', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('303', '2018-01-29 13:18:14.261990', '42', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('304', '2018-01-29 13:18:18.980750', '41', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('305', '2018-01-29 13:18:21.715188', '40', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('306', '2018-01-29 13:18:24.496492', '39', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('307', '2018-01-29 13:18:26.793300', '38', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('308', '2018-01-29 13:18:29.262060', '36', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('309', '2018-01-29 13:18:31.683995', '35', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('310', '2018-01-29 13:18:34.449632', '34', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('311', '2018-01-29 13:18:40.059038', '37', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('312', '2018-01-29 13:18:45.012223', '33', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('313', '2018-01-29 13:18:47.965340', '32', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('314', '2018-01-29 13:18:50.715359', '31', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('315', '2018-01-29 13:18:53.824802', '30', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('316', '2018-01-29 13:18:56.465416', '29', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('317', '2018-01-29 13:18:58.887285', '27', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('318', '2018-01-29 13:19:01.387338', '26', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('319', '2018-01-29 13:19:06.356108', '28', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('320', '2018-01-29 13:19:10.199845', '25', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('321', '2018-01-29 13:19:12.840567', '24', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('322', '2018-01-29 13:19:15.340531', '23', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('323', '2018-01-29 13:19:17.684298', '21', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('324', '2018-01-29 13:19:20.121854', '20', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('325', '2018-01-29 13:19:22.918716', '19', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('326', '2018-01-29 13:19:25.559332', '18', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('327', '2018-01-29 13:19:30.684383', '22', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('328', '2018-01-29 13:19:34.278146', '17', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('329', '2018-01-29 13:19:37.121923', '16', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('330', '2018-01-29 13:19:39.637625', '15', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('331', '2018-01-29 13:19:42.168971', '14', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('332', '2018-01-29 13:19:44.965719', '13', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('333', '2018-01-29 13:19:47.590723', '12', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('334', '2018-01-29 13:19:49.794019', '11', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('335', '2018-01-29 13:19:52.231377', '10', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('336', '2018-01-29 13:19:59.887740', '9', '2_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('337', '2018-01-29 13:20:07.356493', '8', '2_登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('338', '2018-01-29 13:20:10.747154', '6', '2_登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('339', '2018-01-29 13:20:14.200277', '2', '2登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('340', '2018-01-29 13:20:17.106557', '3', '2登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('341', '2018-01-29 13:20:19.934693', '4', '2_登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('342', '2018-01-29 13:20:22.247184', '6', '2_登录_出错了', '2', '[]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('343', '2018-01-29 13:20:24.747250', '7', '2_登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('344', '2018-01-29 13:20:29.841006', '5', '2_登录_出错了', '2', '[{\"changed\": {\"fields\": [\"bugdetail\", \"bugstatus\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('345', '2018-01-29 14:10:31.916534', '10', '自动化测试平台', '2', '[{\"changed\": {\"fields\": [\"productname\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('346', '2018-01-29 14:10:47.682170', '10', '自动化测试平台', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('347', '2018-01-29 14:28:50.854036', '44', '1_登录_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('348', '2018-01-29 14:28:59.432193', '43', '2_购物_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('349', '2018-01-29 14:33:43.150950', '10', '自动化平台', '2', '[{\"changed\": {\"fields\": [\"productname\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('350', '2018-01-29 14:35:50.088528', '10', '自动化测试平台', '2', '[{\"changed\": {\"fields\": [\"productname\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('351', '2018-01-30 10:27:32.553360', '1', '登录接口', '2', '[{\"changed\": {\"fields\": [\"apiname\", \"apitester\", \"apiresponse\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('352', '2018-01-30 10:27:52.678208', '2', '登录接口', '2', '[{\"changed\": {\"fields\": [\"apiname\", \"apitester\", \"apiresponse\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('353', '2018-01-30 10:28:57.646565', '5', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('354', '2018-01-30 10:29:02.380904', '4', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('355', '2018-01-30 10:29:05.505888', '3', '登录', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('356', '2018-01-30 10:29:28.958843', '28', '买家登录购物支付', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('357', '2018-01-30 10:29:31.724484', '27', '买家登录购物支付aa', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('358', '2018-01-30 10:29:34.552613', '26', '买家登录', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('359', '2018-01-30 10:29:40.693119', '13', '卖家登录购物支付', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('360', '2018-01-30 10:29:46.630669', '12', '第三方登录购物支付', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('361', '2018-01-30 10:29:50.818086', '11', '第三方登录', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('362', '2018-01-30 10:29:57.286870', '8', '登录购物支付dd', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('363', '2018-01-30 10:30:00.552429', '5', '登录购物支付bb', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('364', '2018-01-30 10:30:07.239846', '4', '登录购物支付aa', '3', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('365', '2018-01-30 10:31:22.567504', '3', '登录购物支付', '2', '[{\"changed\": {\"fields\": [\"apitestdesc\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apistep\", \"apiresponse\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('366', '2018-01-30 10:33:55.082139', '10', '自动化平台', '2', '[{\"changed\": {\"fields\": [\"productname\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('367', '2018-01-30 10:50:47.981867', '2', '百度搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u8f6f\\u4ef6\\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webtestdata\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('368', '2018-01-30 10:51:22.966069', '1', '百度搜索《自动化平台测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u81ea\\u52a8\\u5316\\u5e73\\u53f0\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('369', '2018-01-30 10:51:50.450223', '1', '百度搜索《自动化平台测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u81ea\\u52a8\\u5316\\u5e73\\u53f0\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('370', '2018-01-30 10:52:04.762668', '2', '百度搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u767e\\u5ea6\\u641c\\u7d22\\u300a\\u8f6f\\u4ef6\\u81ea\\u52a8\\u5316\\u6d4b\\u8bd5\\u5f00\\u53d1\\u300b\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('371', '2018-01-30 11:00:02.040909', '2', '百度搜索《软件自动化测试开发》', '2', '[]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('372', '2018-01-30 11:00:12.728514', '2', '百度搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u8f93\\u5165 \\u6d4b\\u8bd5\\u6570\\u636e\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('373', '2018-01-30 11:02:27.680594', '1', '搜索《自动化平台测试开发》', '2', '[{\"changed\": {\"fields\": [\"webcasename\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('374', '2018-01-30 11:02:39.102364', '2', '搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"fields\": [\"webcasename\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('375', '2018-01-30 11:03:31.398917', '1', '搜索《自动化平台测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u7b2c\\u4e00\\u6b65\", \"fields\": [\"webtestobjname\"]}}, {\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u7b2c\\u4e8c\\u6b65\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('376', '2018-01-30 11:03:45.414471', '2', '搜索《软件自动化测试开发》', '2', '[{\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u7b2c\\u4e00\\u6b65\", \"fields\": [\"webtestobjname\"]}}, {\"changed\": {\"name\": \"webcasestep\", \"object\": \"\\u7b2c\\u4e8c\\u6b65\", \"fields\": [\"webtestobjname\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('377', '2018-01-30 11:18:34.455600', '2', '登录购物支付test', '2', '[{\"changed\": {\"fields\": [\"apitestdesc\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiresponse\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiresponse\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('378', '2018-01-30 11:18:58.064772', '3', '登录购物支付', '2', '[{\"changed\": {\"fields\": [\"apitestdesc\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('379', '2018-01-30 11:19:07.424156', '2', '登录购物支付test', '2', '[{\"changed\": {\"fields\": [\"apitestdesc\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('380', '2018-01-30 11:27:13.046045', '2', '登录购物支付test', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiurl\"]}}, {\"changed\": {\"name\": \"apistep\", \"object\": \"\\u8d2d\\u7269\", \"fields\": [\"apiurl\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('381', '2018-01-30 11:27:22.124137', '3', '登录购物支付', '2', '[{\"changed\": {\"name\": \"apistep\", \"object\": \"\\u767b\\u5f55\", \"fields\": [\"apiurl\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('382', '2018-01-30 11:27:32.717784', '1', 'seturl', '2', '[{\"changed\": {\"fields\": [\"setvalue\"]}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('383', '2018-01-30 11:50:24.349640', '47', '1_登录接口_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('384', '2018-01-30 11:50:27.193368', '46', '1_登录接口_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('385', '2018-01-30 11:50:32.255857', '45', '2_购物_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('386', '2018-01-30 14:15:51.713667', '48', '1_登录接口_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('387', '2018-01-30 14:15:57.965578', '49', '2_购物_出错了', '3', '', '18', '1');
INSERT INTO `django_admin_log` VALUES ('388', '2018-01-30 14:28:23.835791', '7', 'url', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('389', '2018-01-30 14:28:26.710768', '6', 'url', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('390', '2018-01-30 14:28:29.413892', '5', 'url', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('391', '2018-01-30 14:28:32.158189', '4', 'host', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('392', '2018-01-30 14:28:34.488046', '3', 'host', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('393', '2018-01-30 14:28:38.663841', '2', 'host', '3', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('394', '2018-01-30 20:00:00.795719', '2', '商城', '2', '[{\"changed\": {\"fields\": [\"productdesc\"]}}]', '15', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('9', 'apitest', 'apis');
INSERT INTO `django_content_type` VALUES ('7', 'apitest', 'apistep');
INSERT INTO `django_content_type` VALUES ('8', 'apitest', 'apitest');
INSERT INTO `django_content_type` VALUES ('10', 'apitest', 'product');
INSERT INTO `django_content_type` VALUES ('11', 'apptest', 'appcase');
INSERT INTO `django_content_type` VALUES ('12', 'apptest', 'appcasestep');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('18', 'bug', 'bug');
INSERT INTO `django_content_type` VALUES ('17', 'bugs', 'bugs');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('20', 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES ('19', 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES ('21', 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES ('22', 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES ('23', 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES ('24', 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES ('26', 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES ('25', 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES ('15', 'product', 'product');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('16', 'set', 'set');
INSERT INTO `django_content_type` VALUES ('13', 'webtest', 'webcase');
INSERT INTO `django_content_type` VALUES ('14', 'webtest', 'webcasestep');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-12-25 16:36:24.966037');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-12-25 16:36:36.334450');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-12-25 16:36:39.285749');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-12-25 16:36:39.379482');
INSERT INTO `django_migrations` VALUES ('5', 'apitest', '0001_initial', '2017-12-25 16:36:39.715141');
INSERT INTO `django_migrations` VALUES ('6', 'apitest', '0002_auto_20171215_1802', '2017-12-25 16:36:42.698131');
INSERT INTO `django_migrations` VALUES ('7', 'apitest', '0003_apis', '2017-12-25 16:36:43.068578');
INSERT INTO `django_migrations` VALUES ('8', 'apitest', '0004_auto_20171220_1126', '2017-12-25 16:36:43.127178');
INSERT INTO `django_migrations` VALUES ('9', 'apitest', '0005_auto_20171226_0012', '2017-12-25 16:36:45.263444');
INSERT INTO `django_migrations` VALUES ('10', 'apptest', '0001_initial', '2017-12-25 16:36:47.152907');
INSERT INTO `django_migrations` VALUES ('11', 'apptest', '0002_appcasestep_apptestdata', '2017-12-25 16:36:48.314497');
INSERT INTO `django_migrations` VALUES ('12', 'apptest', '0003_auto_20171226_0012', '2017-12-25 16:36:48.371549');
INSERT INTO `django_migrations` VALUES ('13', 'contenttypes', '0002_remove_content_type_name', '2017-12-25 16:36:50.071185');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0002_alter_permission_name_max_length', '2017-12-25 16:36:51.209076');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0003_alter_user_email_max_length', '2017-12-25 16:36:52.709679');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0004_alter_user_username_opts', '2017-12-25 16:36:52.778732');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0005_alter_user_last_login_null', '2017-12-25 16:36:53.483300');
INSERT INTO `django_migrations` VALUES ('18', 'auth', '0006_require_contenttypes_0002', '2017-12-25 16:36:53.614613');
INSERT INTO `django_migrations` VALUES ('19', 'auth', '0007_alter_validators_add_error_messages', '2017-12-25 16:36:53.703956');
INSERT INTO `django_migrations` VALUES ('20', 'auth', '0008_alter_user_username_max_length', '2017-12-25 16:36:56.530475');
INSERT INTO `django_migrations` VALUES ('21', 'auth', '0009_alter_user_last_name_max_length', '2017-12-25 16:36:57.563689');
INSERT INTO `django_migrations` VALUES ('22', 'sessions', '0001_initial', '2017-12-25 16:36:58.334036');
INSERT INTO `django_migrations` VALUES ('23', 'webtest', '0001_initial', '2017-12-25 16:37:00.245521');
INSERT INTO `django_migrations` VALUES ('24', 'webtest', '0002_webcasestep_webtestdata', '2017-12-25 16:37:00.915681');
INSERT INTO `django_migrations` VALUES ('25', 'webtest', '0003_auto_20171226_0012', '2017-12-25 16:37:00.961216');
INSERT INTO `django_migrations` VALUES ('26', 'apitest', '0006_auto_20171226_0954', '2017-12-26 01:55:08.676214');
INSERT INTO `django_migrations` VALUES ('27', 'product', '0001_initial', '2017-12-26 02:01:57.292829');
INSERT INTO `django_migrations` VALUES ('28', 'product', '0002_auto_20171226_1051', '2017-12-30 02:54:18.350353');
INSERT INTO `django_migrations` VALUES ('29', 'product', '0003_auto_20171230_1054', '2017-12-30 02:54:18.852515');
INSERT INTO `django_migrations` VALUES ('30', 'apitest', '0007_auto_20171226_1051', '2017-12-30 03:42:43.050201');
INSERT INTO `django_migrations` VALUES ('31', 'apitest', '0008_apis_product', '2017-12-30 03:42:45.036290');
INSERT INTO `django_migrations` VALUES ('32', 'apitest', '0009_auto_20171230_1126', '2017-12-30 03:42:45.137839');
INSERT INTO `django_migrations` VALUES ('33', 'apptest', '0004_auto_20171230_1126', '2017-12-30 03:42:45.224897');
INSERT INTO `django_migrations` VALUES ('34', 'product', '0004_auto_20171230_1126', '2017-12-30 03:42:45.283936');
INSERT INTO `django_migrations` VALUES ('35', 'webtest', '0004_auto_20171230_1126', '2017-12-30 03:42:45.324963');
INSERT INTO `django_migrations` VALUES ('36', 'apitest', '0010_auto_20171230_1157', '2017-12-30 03:57:18.338269');
INSERT INTO `django_migrations` VALUES ('37', 'product', '0005_auto_20171230_1157', '2017-12-30 03:57:18.432527');
INSERT INTO `django_migrations` VALUES ('38', 'apptest', '0005_auto_20171230_1633', '2017-12-30 08:33:19.902444');
INSERT INTO `django_migrations` VALUES ('39', 'webtest', '0005_auto_20171230_1652', '2017-12-30 08:53:01.738411');
INSERT INTO `django_migrations` VALUES ('40', 'product', '0006_product_producter', '2018-01-04 07:21:14.135213');
INSERT INTO `django_migrations` VALUES ('41', 'apitest', '0011_apistep_apistep', '2018-01-05 05:14:34.905170');
INSERT INTO `django_migrations` VALUES ('42', 'apptest', '0006_remove_appcasestep_appcasename', '2018-01-05 05:14:35.952089');
INSERT INTO `django_migrations` VALUES ('43', 'apptest', '0007_appcase_appcasestep', '2018-01-05 05:44:59.170387');
INSERT INTO `django_migrations` VALUES ('44', 'apptest', '0008_remove_appcase_appcasestep', '2018-01-05 05:51:47.849465');
INSERT INTO `django_migrations` VALUES ('45', 'set', '0001_initial', '2018-01-06 08:47:49.751567');
INSERT INTO `django_migrations` VALUES ('46', 'set', '0002_auto_20180107_0947', '2018-01-07 01:48:15.293893');
INSERT INTO `django_migrations` VALUES ('47', 'bugs', '0001_initial', '2018-01-10 09:44:20.999193');
INSERT INTO `django_migrations` VALUES ('48', 'bugs', '0002_auto_20180110_0946', '2018-01-10 09:46:27.750180');
INSERT INTO `django_migrations` VALUES ('49', 'bug', '0001_initial', '2018-01-10 10:02:56.324484');
INSERT INTO `django_migrations` VALUES ('50', 'bug', '0002_auto_20180110_1107', '2018-01-10 11:07:07.890193');
INSERT INTO `django_migrations` VALUES ('51', 'djcelery', '0001_initial', '2018-01-14 22:57:08.392111');
INSERT INTO `django_migrations` VALUES ('52', 'apitest', '0012_auto_20180118_1114', '2018-01-18 11:14:25.516954');
INSERT INTO `django_migrations` VALUES ('53', 'apitest', '0013_auto_20180125_1020', '2018-01-28 11:23:22.329876');
INSERT INTO `django_migrations` VALUES ('54', 'apitest', '0014_auto_20180128_1123', '2018-01-28 11:23:22.706972');
INSERT INTO `django_migrations` VALUES ('55', 'bug', '0003_auto_20180128_2144', '2018-01-28 22:11:49.955354');
INSERT INTO `django_migrations` VALUES ('56', 'apitest', '0015_auto_20180129_1345', '2018-01-29 13:45:29.069358');
INSERT INTO `django_migrations` VALUES ('57', 'apitest', '0016_auto_20180129_1350', '2018-01-29 13:51:55.306151');
INSERT INTO `django_migrations` VALUES ('58', 'webtest', '0006_remove_webcasestep_webcasename', '2018-01-30 10:55:03.167690');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('3dmzop0vp4uq8uh6lv8pcbfgdo4onom1', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-15 13:09:13.408576');
INSERT INTO `django_session` VALUES ('457fs5t4mtszv2nme7f58r0xka9e1i6v', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-13 22:35:28.336599');
INSERT INTO `django_session` VALUES ('786d9a2qyqz8d0mmdtbmeyg2kjkv8jg5', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-10 10:19:25.350156');
INSERT INTO `django_session` VALUES ('e5deziqruzjw37t2ykmhxv0mhie72kzt', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-10 10:17:53.294609');
INSERT INTO `django_session` VALUES ('hk9524pbgwcin1db3lmup8hrcu975gd9', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-05 22:02:41.616995');
INSERT INTO `django_session` VALUES ('vm4jdxipnb1rjdayr5e2v41psrdua0rg', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-15 11:16:32.549218');
INSERT INTO `django_session` VALUES ('wb67acoxp9kfs1j83yymer8lsh9nhrcl', 'N2YzNTQwM2EyMGU1ZTUzOWNjY2FmOGE2ZDI4MTBkZDJjMDcxOWNmZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIiwidXNlciI6ImFkbWluIn0=', '2018-02-09 11:45:16.366617');
INSERT INTO `django_session` VALUES ('xbkaxu57x91pp7yihkycnamffczjescs', 'YTEyN2YyNWMzYWFhYTE4NGEwYTFjMDg0ODU5MzBmYmExOTA3YTJmMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0YTkxYjBmNjIzYmQwZTFiY2MyYzE3NTQxZWMyYWM2ZTRiZmM3NjMzIn0=', '2018-01-30 21:38:52.854667');

-- ----------------------------
-- Table structure for `djcelery_crontabschedule`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------
INSERT INTO `djcelery_crontabschedule` VALUES ('1', '40', '23', '*', '*', '*');
INSERT INTO `djcelery_crontabschedule` VALUES ('2', '50', '9', '16', '1', '2018');
INSERT INTO `djcelery_crontabschedule` VALUES ('3', '26', '21', '16', '1', '2018');
INSERT INTO `djcelery_crontabschedule` VALUES ('4', '0', '4', '*', '*', '*');
INSERT INTO `djcelery_crontabschedule` VALUES ('5', '25', '10', '3', '17', '1');
INSERT INTO `djcelery_crontabschedule` VALUES ('6', '23', '10', '17', '1', '2018');
INSERT INTO `djcelery_crontabschedule` VALUES ('7', '30', '18', '17', '1', '2018');
INSERT INTO `djcelery_crontabschedule` VALUES ('8', '28', '2', '17', '1', '2018');

-- ----------------------------
-- Table structure for `djcelery_intervalschedule`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_intervalschedule
-- ----------------------------
INSERT INTO `djcelery_intervalschedule` VALUES ('1', '1', 'hours');

-- ----------------------------
-- Table structure for `djcelery_periodictask`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` (`crontab_id`),
  KEY `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` (`interval_id`),
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------
INSERT INTO `djcelery_periodictask` VALUES ('1', '单一接口：扫描', 'apitest.tasks.apisauto_testcase', '[]', '{}', null, null, null, null, '1', '2018-01-17 15:40:00.281458', '1', '2018-01-28 17:24:53.850601', '', null, '1');
INSERT INTO `djcelery_periodictask` VALUES ('2', '流程接口：业务场景', 'apitest.tasks.apitest_testcase', '[]', '{}', null, null, null, null, '1', '2018-01-18 09:27:33.397229', '107', '2018-01-28 17:26:03.959471', '', null, '1');
INSERT INTO `djcelery_periodictask` VALUES ('3', 'web搜索：自动化平台测试开发', 'apitest.webtasks.webauto_testcase', '[]', '{}', null, null, null, null, '1', '2018-01-18 09:42:03.219392', '1', '2018-01-28 21:04:45.359809', '', null, '1');
INSERT INTO `djcelery_periodictask` VALUES ('4', 'web搜索：软件自动化测试开发', 'apitest.webtasks.webauto_testcase2', '[]', '{}', null, null, null, null, '1', '2018-01-17 02:25:00.007972', '1', '2018-01-28 21:04:56.902704', '', null, '1');
INSERT INTO `djcelery_periodictask` VALUES ('5', 'app计算：1+1=', 'apitest.apptasks.appauto_testcase', '[]', '{}', null, null, null, null, '1', null, '0', '2018-01-28 21:04:22.077735', '', null, '1');
INSERT INTO `djcelery_periodictask` VALUES ('7', 'app登录：csdn', 'apitest.apptasks.appauto_testcase2', '[]', '{}', null, null, null, null, '1', null, '0', '2018-01-28 17:22:14.179870', '', null, '1');

-- ----------------------------
-- Table structure for `djcelery_periodictasks`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------
INSERT INTO `djcelery_periodictasks` VALUES ('1', '2018-01-28 21:04:56.898808');

-- ----------------------------
-- Table structure for `djcelery_taskstate`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_workerstate`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------
INSERT INTO `djcelery_workerstate` VALUES ('1', '127.0.0.1', null);

-- ----------------------------
-- Table structure for `product_product`
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产键，产品编号',
  `productname` varchar(64) NOT NULL COMMENT '产品名称',
  `productdesc` varchar(200) NOT NULL COMMENT '产品描述',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `producter` varchar(200) DEFAULT NULL COMMENT '产品负责人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_product
-- ----------------------------
INSERT INTO `product_product` VALUES ('2', '商城', '图书', '2018-01-30 20:00:00.792766', 'Ning');
INSERT INTO `product_product` VALUES ('3', 'app产品', '计算器，Csdn', '2018-01-29 13:16:16.183156', 'Ning');
INSERT INTO `product_product` VALUES ('10', '自动化平台', '包括API、WebUI、AppUI自动化测试', '2018-01-30 10:33:55.082139', 'Ning');
INSERT INTO `product_product` VALUES ('11', 'web产品', '百度搜索', '2018-01-29 13:09:11.383555', 'Ning');

-- ----------------------------
-- Table structure for `set_set`
-- ----------------------------
DROP TABLE IF EXISTS `set_set`;
CREATE TABLE `set_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，设置编号',
  `setname` varchar(64) NOT NULL COMMENT '主机或URL地址等',
  `setvalue` varchar(200) NOT NULL COMMENT '设置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_set
-- ----------------------------
INSERT INTO `set_set` VALUES ('1', 'seturl', 'www.autotestplat.com');

-- ----------------------------
-- Table structure for `webtest_webcase`
-- ----------------------------
DROP TABLE IF EXISTS `webtest_webcase`;
CREATE TABLE `webtest_webcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，Web用例编号',
  `webcasename` varchar(200) NOT NULL COMMENT '用例名称',
  `webtestresult` tinyint(1) NOT NULL COMMENT '测试结果',
  `webtester` varchar(16) NOT NULL COMMENT '测试负责人',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Product_id` int(11) DEFAULT NULL COMMENT '关联产品ID',
  PRIMARY KEY (`id`),
  KEY `webtest_webcase_Product_id_dfe176e9_fk_product_product_id` (`Product_id`),
  CONSTRAINT `webtest_webcase_Product_id_dfe176e9_fk_product_product_id` FOREIGN KEY (`Product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webtest_webcase
-- ----------------------------
INSERT INTO `webtest_webcase` VALUES ('1', '搜索《自动化平台测试开发》', '0', 'Ning', '2018-01-30 11:03:31.398917', '11');
INSERT INTO `webtest_webcase` VALUES ('2', '搜索《软件自动化测试开发》', '0', 'Ning', '2018-01-30 11:03:45.414471', '11');

-- ----------------------------
-- Table structure for `webtest_webcasestep`
-- ----------------------------
DROP TABLE IF EXISTS `webtest_webcasestep`;
CREATE TABLE `webtest_webcasestep` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，Web用例步骤编号',
  `webteststep` varchar(200) NOT NULL COMMENT '用例步骤',
  `webtestobjname` varchar(200) NOT NULL COMMENT '操作对象名称',
  `webfindmethod` varchar(200) NOT NULL COMMENT '定位方式',
  `webevelement` varchar(800) NOT NULL COMMENT '元素控件',
  `weboptmethod` varchar(200) NOT NULL COMMENT '操作方法',
  `webassertdata` varchar(200) NOT NULL COMMENT '校验数据',
  `webtestresult` tinyint(1) NOT NULL COMMENT '测试结果',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `Webcase_id` int(11) NOT NULL COMMENT '关联Web用例',
  `webtestdata` varchar(200) DEFAULT NULL COMMENT '测试数据',
  PRIMARY KEY (`id`),
  KEY `webtest_webcasestep_Webcase_id_c8229174_fk_webtest_webcase_id` (`Webcase_id`),
  CONSTRAINT `webtest_webcasestep_Webcase_id_c8229174_fk_webtest_webcase_id` FOREIGN KEY (`Webcase_id`) REFERENCES `webtest_webcase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webtest_webcasestep
-- ----------------------------
INSERT INTO `webtest_webcasestep` VALUES ('1', '第一步', '输入', 'find_element_by_id', 'kw', 'sendkeys', 'null', '0', '2018-01-30 11:03:31.398917', '1', '自动化平台测试开发');
INSERT INTO `webtest_webcasestep` VALUES ('2', '第二步', '点击 搜索', 'find_element_by_id', 'su', 'click', 'null', '0', '2018-01-30 11:03:31.398917', '1', 'null');
INSERT INTO `webtest_webcasestep` VALUES ('3', '第一步', '输入', 'find_element_by_id', 'kw', 'sendkeys', 'null', '0', '2018-01-30 11:03:45.414471', '2', '软件自动化测试开发');
INSERT INTO `webtest_webcasestep` VALUES ('4', '第二步', '点击 搜索', 'find_element_by_id', 'su', 'click', 'null', '0', '2018-01-30 11:03:45.414471', '2', 'null');
