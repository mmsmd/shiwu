/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : db_shiwu

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2013-05-15 15:38:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) default NULL,
  `userPw` varchar(50) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for `t_bumen`
-- ----------------------------
DROP TABLE IF EXISTS `t_bumen`;
CREATE TABLE `t_bumen` (
  `id` int(4) NOT NULL auto_increment,
  `mingcheng` varchar(50) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bumen
-- ----------------------------
INSERT INTO `t_bumen` VALUES ('2', '组织部', 'no');
INSERT INTO `t_bumen` VALUES ('3', '秘书处', 'no');

-- ----------------------------
-- Table structure for `t_gangwei`
-- ----------------------------
DROP TABLE IF EXISTS `t_gangwei`;
CREATE TABLE `t_gangwei` (
  `id` int(4) NOT NULL auto_increment,
  `mingcheng` varchar(50) default NULL,
  `qishi` varchar(50) default NULL,
  `jiezhi` varchar(50) default NULL,
  `neirong` varchar(50) default NULL,
  `baochou` varchar(50) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gangwei
-- ----------------------------
INSERT INTO `t_gangwei` VALUES ('1', '迪信通开业', '2013-05-15', '2013-05-15', '帮助迪信通开业活动', '80', 'no');

-- ----------------------------
-- Table structure for `t_hdry`
-- ----------------------------
DROP TABLE IF EXISTS `t_hdry`;
CREATE TABLE `t_hdry` (
  `id` int(4) NOT NULL auto_increment,
  `huodong_id` int(4) default NULL,
  `user_id` int(4) default NULL,
  `zhize` varchar(50) default NULL,
  `fankui` varchar(50) default NULL,
  `fankuishi` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hdry
-- ----------------------------
INSERT INTO `t_hdry` VALUES ('4', '1', '3', '现场咨询', 'ddddd', '2013-05-10 20:52:28');
INSERT INTO `t_hdry` VALUES ('5', '1', '4', '现场秩序维持', '活动很有意义', '2013-05-12 13:52:40');
INSERT INTO `t_hdry` VALUES ('6', '1', '2', '现场指挥', null, null);

-- ----------------------------
-- Table structure for `t_huodong`
-- ----------------------------
DROP TABLE IF EXISTS `t_huodong`;
CREATE TABLE `t_huodong` (
  `id` int(4) NOT NULL auto_increment,
  `mingcheng` varchar(50) default NULL,
  `shijian` varchar(50) default NULL,
  `didian` varchar(50) default NULL,
  `neirong` varchar(2000) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_huodong
-- ----------------------------
INSERT INTO `t_huodong` VALUES ('1', '新生入学引导', '2013-05-22', '操场', '协助新生入校', 'no');

-- ----------------------------
-- Table structure for `t_kaoping`
-- ----------------------------
DROP TABLE IF EXISTS `t_kaoping`;
CREATE TABLE `t_kaoping` (
  `id` int(4) NOT NULL auto_increment,
  `user_id` int(4) default NULL,
  `shijian` varchar(50) default NULL,
  `fenshu` varchar(50) default NULL,
  `shuoming` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_kaoping
-- ----------------------------
INSERT INTO `t_kaoping` VALUES ('1', '3', '2013-05-05', '80', '表现较好');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(4) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `content` varchar(50) default NULL,
  `shijian` varchar(50) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '12界新生欢迎晚会顺利举行', '本校于2012年10月20日在小礼堂举行2012界新生欢迎会', '2013-05-05', 'no');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(4) NOT NULL auto_increment,
  `loginname` varchar(50) default NULL,
  `loginpw` varchar(50) default NULL,
  `bumen_id` int(4) default NULL,
  `xingming` varchar(50) default NULL,
  `xingbie` varchar(50) default NULL,
  `banji` varchar(50) default NULL,
  `lianxi` varchar(50) default NULL,
  `qq` varchar(50) default NULL,
  `type` int(4) default NULL,
  `del` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'zs', '0', '2', '张三', '男', '计算机系09级2级', '13888888888', '234876', '1', 'no');
INSERT INTO `t_user` VALUES ('3', 'zm', '0', '3', '赵明', '男', '计算机系08及1班', '1566666666666', '234552', '2', 'no');
INSERT INTO `t_user` VALUES ('4', 'wxh', '0', '2', '王小红', '女', '计算机系2009级1班', '13222222222', '323455211', '2', 'no');
