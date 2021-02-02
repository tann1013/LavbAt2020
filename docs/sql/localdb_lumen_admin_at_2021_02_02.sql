/*
 Navicat Premium Data Transfer

 Source Server         : 坤时--测试-本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : localdb_lumen_admin

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 02/02/2021 15:52:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `admin_id` bigint(20) unsigned NOT NULL COMMENT '管理员ID',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`permission_id`,`admin_id`),
  CONSTRAINT `admin_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (3, 2);
INSERT INTO `admin_permissions` VALUES (3, 3);
INSERT INTO `admin_permissions` VALUES (3, 4);
INSERT INTO `admin_permissions` VALUES (3, 5);
INSERT INTO `admin_permissions` VALUES (3, 6);
INSERT INTO `admin_permissions` VALUES (3, 7);
INSERT INTO `admin_permissions` VALUES (3, 8);
INSERT INTO `admin_permissions` VALUES (3, 9);
INSERT INTO `admin_permissions` VALUES (3, 36);
INSERT INTO `admin_permissions` VALUES (3, 37);
INSERT INTO `admin_permissions` VALUES (3, 38);
INSERT INTO `admin_permissions` VALUES (3, 39);
INSERT INTO `admin_permissions` VALUES (3, 40);
INSERT INTO `admin_permissions` VALUES (3, 93);
INSERT INTO `admin_permissions` VALUES (3, 96);
INSERT INTO `admin_permissions` VALUES (3, 102);
INSERT INTO `admin_permissions` VALUES (3, 103);
INSERT INTO `admin_permissions` VALUES (3, 104);
INSERT INTO `admin_permissions` VALUES (1, 108);
INSERT INTO `admin_permissions` VALUES (3, 108);
INSERT INTO `admin_permissions` VALUES (3, 121);
INSERT INTO `admin_permissions` VALUES (3, 122);
INSERT INTO `admin_permissions` VALUES (1, 123);
INSERT INTO `admin_permissions` VALUES (3, 123);
COMMIT;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '管理员账号',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '登录密码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `status` tinyint(1) NOT NULL DEFAULT '10' COMMENT '账号状态[-1:已删除;0:已禁用;10:正常;]',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已删除[0:否;1:是]',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES (1, 'admin', '$2y$10$53COVs9CGTP1uYkqYCWyc.mHJjjaMB8jb.qGsy7/6R5hGJHpDA.Ti', '', '', '', 10, '2021-02-02 15:48:07', '127.0.0.1', 0, '2020-11-24 15:08:51', '2020-11-24 15:08:51');
INSERT INTO `admins` VALUES (3, 'test', '$2y$10$xzi4MzSgt2.LQNPAWRqz2eect0TSgIAKpDk4besOLCIq4QhyShpdy', '', '', '', 10, '2020-11-24 17:07:25', '', 0, '2020-11-24 17:07:25', '2020-11-24 17:07:25');
INSERT INTO `admins` VALUES (4, 'tanjian', '$2y$10$Q26BQkNZt56TGvUFeZyuUeCTP/omyFVeJaLafVIty261Rg1H/eDkK', '', '', '', 10, '2020-11-25 17:52:16', '', 0, '2020-11-25 17:52:16', '2020-11-25 17:52:16');
INSERT INTO `admins` VALUES (5, 'test2', '$2y$10$sPlmKC1qyTqcIYDg6I.pC.D5tNJnRkjERm96xnAwGZAUIaWr8/4Wm', '', '', '', 10, '2021-02-01 15:30:32', '', 0, '2021-02-01 15:30:32', '2021-02-01 15:30:32');
INSERT INTO `admins` VALUES (7, 'test33', '$2y$10$sIO0jISdhEBQj10wcB14m.EAj4IIYNB9zR0x438hp1NCtGR515Eh.', '', '', '', 10, '2021-02-01 15:58:16', '', 0, '2021-02-01 15:58:16', '2021-02-01 15:58:16');
COMMIT;

-- ----------------------------
-- Table structure for bage_bill
-- ----------------------------
DROP TABLE IF EXISTS `bage_bill`;
CREATE TABLE `bage_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(2) DEFAULT NULL,
  `op_eat` int(2) DEFAULT NULL,
  `op_traffic` int(2) DEFAULT NULL,
  `op_other` int(2) DEFAULT NULL,
  `op_other_notes` varchar(200) DEFAULT NULL,
  `total` int(2) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  `op_today_profit` varchar(5) DEFAULT NULL COMMENT '每日理财收益',
  `op_today_reading` varchar(5) DEFAULT NULL COMMENT '每日读书时长/分钟',
  `op_today_running` varchar(5) DEFAULT NULL COMMENT '每日跑步里程/公里',
  `every_month_wages` varchar(5) DEFAULT NULL COMMENT '工资收入',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bage_bill
-- ----------------------------
BEGIN;
INSERT INTO `bage_bill` VALUES (1, 10, 16, 8, 130, '物美超市购买生活用品和下周的晚饭菜等', 154, '2015-06-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (2, 10, 35, 2, 1, 'null', 38, '2015-06-29', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (3, 10, 33, 2, 1, '', 36, '2015-06-30', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (4, 10, 21, 5, 1, '', 27, '2015-07-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (5, 10, 21, 10, 1, '', 32, '2015-07-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (6, 10, 17, 7, 170, '', 194, '2015-07-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (7, 10, 20, 17, 65, '', 102, '2015-07-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (8, 10, 30, 20, 120, '买衣服', 170, '2015-08-04', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (9, 10, 13, 1, 1, '', 15, '2015-08-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (10, 10, 38, 1, 1, '', 40, '2015-08-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (11, 10, 18, 1, 321, '买鞋', 340, '2015-08-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (12, 10, 30, 4, 1, '', 35, '2015-08-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (13, 10, 3, 1, 1, '', 5, '2015-08-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (14, 10, 11, 13, 60, '买桌子60', 84, '2015-08-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (15, 10, 35, 5, 16, '饮料和沐浴露', 56, '2015-08-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (16, 10, 27, 10, 2, '可乐', 39, '2015-08-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (17, 10, 23, 10, 0, '', 33, '2015-08-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (18, 10, 22, 7, 16, '超市购买水果', 45, '2015-08-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (19, 10, 23, 10, 0, '', 33, '2015-08-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (20, 10, 0, 8, 47, '超市买牛肉等', 55, '2015-08-16', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (21, 10, 34, 8, 0, '', 42, '2015-08-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (22, 10, 16, 65, 0, '', 81, '2015-08-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (23, 10, 34, 30, 0, '打车费21', 64, '2015-08-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (24, 10, 24, 0, 0, '', 24, '2015-08-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (25, 10, 26, 0, 0, '', 26, '2015-08-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (26, 10, 140, 0, 0, '心情不好请大家吃饭。', 140, '2015-08-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (27, 10, 36, 5, 0, '', 41, '2015-08-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (28, 10, 18, 5, 34, '超市买水果', 57, '2015-08-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (29, 10, 4, 10, 0, '', 14, '2015-08-29', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (30, 10, 15, 10, 52, '超市购买牛奶等', 77, '2015-08-30', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (31, 10, 33, 5, 0, '', 38, '2015-08-31', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (32, 10, 34, 10, 0, '', 44, '2015-09-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (33, 10, 23, 10, 0, '', 33, '2015-09-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (34, 10, 30, 0, 0, '', 30, '2015-09-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (35, 10, 15, 5, 0, '', 20, '2015-09-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (36, 10, 34, 10, 0, '', 44, '2015-09-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (37, 10, 22, 10, 225, '手机套和衣服', 257, '2015-09-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (38, 10, 15, 0, 130, '130登山杖', 145, '2015-09-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (39, 10, 18, 10, 0, '', 28, '2015-09-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (40, 10, 32, 6, 0, '', 38, '2016-03-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (41, 10, 32, 13, 70, '看电影', 115, '2016-03-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (42, 10, 36, 0, 7, '', 43, '2016-04-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (43, 10, 51, 6, 0, '没有啦', 57, '2016-04-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (44, 10, 49, 6, 20, '水果', 75, '2016-04-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (45, 10, 50, 6, 0, '', 56, '2016-04-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (46, 10, 40, 11, 158, '去了趟超市', 209, '2016-04-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (47, 10, 0, 21, 0, '', 21, '2016-04-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (48, 10, 49, 6, 0, '', 55, '2016-04-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (49, 10, 78, 7, 0, '', 85, '2016-04-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (50, 10, 53, 0, 0, '', 53, '2016-04-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (51, 10, 27, 18, 100, '地铁充值100', 145, '2016-04-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (52, 10, 15, 12, 130, '和朋友出去玩吃饭', 157, '2016-04-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (53, 10, 69, 15, 5000, '信用卡还款', 5084, '2016-04-18', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (54, 10, 60, 17, 5, '打针', 82, '2016-04-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (55, 10, 17, 8, 15, '注射和财付通', 40, '2016-04-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (56, 10, 25, 1, 100, '食堂充卡108', 126, '2016-04-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (57, 10, 79, 0, 0, '', 79, '2016-04-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (58, 10, 20, 271, 150, '请朋友吃饭和打火车到大连考试', 441, '2016-05-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (59, 10, 20, 261, 630, '买回京车票释放压力，住宿130', 911, '2016-05-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (60, 10, 24, 5, 110, '请吃饭110', 139, '2016-05-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (61, 10, 33, 5, 0, '', 38, '2016-05-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (62, 10, 18, 5, 0, '', 23, '2016-05-29', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (63, 10, 16, 15, 230, '请周卓大排档130和买衬衫100', 261, '2016-06-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (64, 10, 24, 10, 39, '和兴旺看X战警', 73, '2016-06-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (65, 10, 15, 10, 90, '看电影吃饭', 115, '2016-06-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (66, 10, 25, 10, 135, '请大家吃饭135', 170, '2016-06-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (67, 10, 39, 10, 10, '', 59, '2016-07-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (68, 10, 18, 8, 0, '', 26, '2016-07-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (69, 10, 0, 250, 570, '0', 820, '2016-07-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (70, 10, 110, 10, 0, '和马吃烧烤80', 120, '2016-08-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (71, 10, 220, 10, 5, '买', 235, '2016-09-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (72, 10, 35, 10, 0, '0', 45, '2016-09-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (73, 10, 0, 0, 0, '0', 0, '2016-09-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (74, 10, 46, 10, 0, '', 56, '2016-09-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (75, 10, 21, 11, 0, '', 32, '2016-09-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (76, 10, 37, 10, 1300, '购买衣服和鞋子1300', 1347, '2016-10-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (77, 10, 53, 8, 0, '', 61, '2016-10-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (78, 10, 48, 20, 0, '1300', 68, '2016-10-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (79, 10, 54, 5, 0, '', 59, '2016-10-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (80, 10, 30, 11, 0, '', 41, '2016-11-04', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (81, 10, 38, 10, 0, '', 48, '2016-11-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (82, 10, 25, 10, 0, '', 35, '2016-12-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (83, 10, 22, 0, 0, '0', 22, '2016-12-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (84, 10, 45, 0, 28, '', 73, '2016-12-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (85, 10, 56, 10, 15, 'coffee', 81, '2016-12-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (86, 10, 28, 0, 0, '0', 28, '2016-12-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (87, 10, 50, 0, 0, '0', 50, '2016-12-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (88, 10, 71, 10, 0, '', 81, '2016-12-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (89, 10, 35, 0, 0, '', 35, '2016-12-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (90, 10, 83, 10, 0, '', 93, '2016-12-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (91, 10, 3, 10, 100, '交通卡充值100', 113, '2016-12-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (92, 10, 58, 0, 0, '', 58, '2016-12-18', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (93, 10, 51, 15, 1070, '中关村配眼镜-1070', 1136, '2016-12-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (94, 10, 44, 0, 100, '嘴唇上火看医生加上最近失眠看doctor消费100元', 144, '2016-12-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (95, 10, 68, 0, 0, '', 68, '2016-12-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (96, 10, 55, 10, 0, '', 65, '2016-12-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (97, 10, 57, 0, 0, '', 57, '2016-12-24', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (98, 10, 24, 0, 0, '0', 24, '2016-12-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (99, 10, 59, 11, 1450, '换表带20，京东购买送自己的2016年的礼物1430', 1520, '2016-12-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (100, 10, 38, 0, 48, '买些水果和写字板等48', 86, '2016-12-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (101, 10, 53, 10, 25, '超市购买水等等', 88, '2016-12-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (102, 10, 0, 0, 1, '', 1, '2016-12-30', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (103, 10, 0, 7, 2, '共享单车2元', 9, '2016-12-31', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (104, 10, 26, 2, 0, '', 28, '2017-01-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (105, 10, 10, 2, 0, '35', 12, '2017-01-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (106, 10, 12, 11, 0, '', 23, '2017-01-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (107, 10, 46, 12, 0, '', 58, '2017-01-04', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (108, 10, 0, 1, 1, '', 2, '2017-01-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (109, 10, 53, 12, 0, '', 65, '2017-01-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (110, 10, 24, 2, 0, '', 26, '2017-01-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (111, 10, 27, 13, 0, '', 40, '2017-01-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (112, 10, 38, 10, 7, '日用品', 55, '2017-01-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (113, 10, 21, 3, 4, '网吧上网4', 28, '2017-01-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (114, 10, 38, 20, 0, '', 58, '2017-01-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (115, 10, 30, 600, 0, '高铁500', 630, '2017-01-24', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (116, 10, 10, 0, 1600, '买衣服', 1610, '2017-01-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (117, 10, 50, 10, 300, '超市购买做饭工具等', 360, '2017-02-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (118, 10, 54, 10, 0, '', 64, '2017-02-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (119, 10, 31, 10, 0, '', 41, '2017-02-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (120, 10, 23, 15, 260, '超市购买下周的牛奶等等生活必备。', 298, '2017-02-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (121, 10, 5, 10, 100, '充值公交卡', 115, '2017-02-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (122, 10, 45, 10, 0, '', 55, '2017-02-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (123, 10, 32, 10, 18, '', 60, '2017-02-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (124, 10, 18, 0, 0, '', 18, '2017-02-18', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (125, 10, 17, 0, 36, '超市水果', 53, '2017-02-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (126, 10, 50, 10, 0, '', 60, '2017-02-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (127, 10, 39, 10, 0, '', 49, '2017-02-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (128, 10, 0, 15, 130, '聚餐', 145, '2017-02-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (129, 10, 11, 10, 210, '买毛衣', 231, '2017-02-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (130, 10, 51, 10, 0, '', 61, '2017-03-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (131, 10, 56, 10, 0, '', 66, '2017-03-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (132, 10, 53, 10, 0, '', 63, '2017-03-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (133, 10, 45, 10, 0, '', 55, '2017-03-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (134, 10, 56, 10, 179, '买衣服', 245, '2017-03-16', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (135, 10, 20, 10, 200, '', 230, '2017-03-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (136, 10, 30, 10, 0, '', 40, '2017-03-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (137, 10, 33, 10, 50, '注销189号码补交欠费', 93, '2017-03-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (138, 10, 0, 10, 70, '周黑鸭70', 80, '2017-03-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (139, 10, 41, 10, 0, '', 51, '2017-03-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (140, 10, 26, 10, 0, '0', 36, '2017-03-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (141, 10, 15, 10, 0, '', 25, '2017-03-31', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (142, 10, 22, 0, 0, '', 22, '2017-04-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (143, 10, 46, 10, 0, '', 56, '2017-04-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (144, 10, 49, 10, 120, '超市购买生活用品', 179, '2017-04-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (145, 10, 43, 10, 0, '', 53, '2017-05-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (146, 10, 0, 1, 3, '商店购买可乐3和共享单车1', 4, '2017-05-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (147, 10, 49, 0, 75, '超市购买水果等和停车费20', 124, '2017-05-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (148, 10, 34, 70, 370, '50超市，120汽车补胎，199电饭煲', 474, '2017-05-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (149, 10, 45, 10, 0, '', 55, '2017-05-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (150, 10, 0, 12, 0, '', 12, '2017-06-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (151, 10, 54, 10, 0, '0', 64, '2017-06-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (152, 10, 5, 0, 0, '0', 5, '2017-06-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (153, 10, 20, 0, 102, '超市购买下周口粮', 122, '2017-06-04', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (154, 10, 62, 10, 0, '', 72, '2017-06-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (155, 10, 38, 10, 0, '0', 48, '2017-06-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (156, 10, 62, 10, 0, '0', 72, '2017-06-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (157, 10, 55, 10, 0, '0', 65, '2017-06-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (158, 10, 14, 0, 68, '超市购买水果等', 82, '2017-06-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (159, 10, 34, 10, 0, '', 44, '2017-06-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (160, 10, 30, 10, 10, '咖啡', 50, '2017-06-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (161, 10, 40, 10, 0, '', 50, '2017-06-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (162, 10, 39, 10, 0, '', 49, '2017-06-16', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (163, 10, 11, 0, 325, '买三条短裤', 336, '2017-06-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (164, 10, 39, 10, 0, '', 49, '2017-06-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (165, 10, 56, 10, 0, '', 66, '2017-06-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (166, 10, 54, 10, 0, '', 64, '2017-06-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (167, 10, 0, 10, 29, '和朋友出去玩kfc消费29', 39, '2017-06-24', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (168, 10, 34, 0, 30, '理发30', 64, '2017-06-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (169, 10, 64, 10, 0, '', 74, '2017-06-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (170, 10, 49, 10, 198, '深马购买衣服', 257, '2017-06-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (171, 10, 18, 6, 22, '0', 46, '2017-07-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (172, 10, 0, 0, 182, '超市购买下周生活用品', 182, '2017-07-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (173, 10, 52, 10, 36, '手表换表带30', 98, '2017-07-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (174, 10, 40, 10, 1200, '给老板买手表1200', 1250, '2017-07-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (175, 10, 46, 6, 0, '0', 52, '2017-07-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (176, 10, 61, 10, 0, '', 71, '2017-09-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (177, 10, 41, 10, 0, '0', 51, '2017-09-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (178, 10, 49, 10, 6, '', 65, '2017-09-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (179, 10, 37, 10, 0, '', 47, '2017-09-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (180, 10, 0, 2, 1000, '买药700，换眼镜框300', 1002, '2017-09-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (181, 10, 49, 10, 0, '0', 59, '2017-09-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (182, 10, 57, 10, 0, '', 67, '2017-11-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (183, 10, 47, 6, 0, '', 53, '2017-11-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (184, 10, 1, 1, 1, '', 3, '2017-11-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (185, 10, 78, 160, 330, '购买稻香村和住宿', 568, '2017-11-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (186, 10, 18, 340, 0, '购买返程车票', 358, '2017-11-26', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (187, 10, 45, 10, 0, '', 55, '2017-11-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (188, 10, 40, 10, 0, '', 50, '2017-11-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (189, 10, 57, 10, 0, '', 67, '2017-11-29', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (190, 10, 27, 10, 0, '', 37, '2017-12-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (191, 10, 0, 0, 210, '超市180，理发30', 210, '2017-12-02', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (192, 10, 14, 10, 0, '', 24, '2017-12-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (193, 10, 30, 7, 0, '', 37, '2017-12-04', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (194, 10, 45, 7, 0, '', 52, '2017-12-05', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (195, 10, 34, 7, 0, '', 41, '2017-12-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (196, 10, 17, 7, 60, '两杯咖啡60', 84, '2017-12-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (197, 10, 32, 10, 0, '', 42, '2017-12-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (198, 10, 22, 0, 0, '', 22, '2017-12-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (199, 10, 30, 7, 0, '', 37, '2017-12-12', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (200, 10, 26, 7, 31, '咖啡', 64, '2017-12-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (201, 10, 43, 7, 31, '咖啡', 81, '2017-12-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (202, 10, 74, 100, 0, '', 174, '2017-12-16', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (203, 10, 55, 7, 0, '', 62, '2017-12-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (204, 10, 40, 7, 0, '', 47, '2017-12-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (205, 10, 255, 0, 0, '聚餐255', 255, '2017-12-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (206, 10, 44, 7, 0, '', 51, '2017-12-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (207, 10, 17, 300, 180, '郑州住宿', 497, '2017-12-27', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (208, 10, 27, 740, 240, '深圳住宿240', 1007, '2017-12-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (209, 10, 70, 80, 2200, '租房子2000和超市购买生活用品', 2350, '2017-12-31', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (210, 10, 60, 7, 0, '', 67, '2018-01-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (211, 10, 60, 7, 0, '', 67, '2018-01-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (212, 10, 36, 7, 0, '', 43, '2018-01-04', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (213, 10, 0, 7, 400, '朋友聚餐', 407, '2018-01-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (214, 10, 50, 30, 350, '寄送生活用品到杭州', 430, '2018-01-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (215, 10, 24, 25, 21, '药', 70, '2018-01-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (216, 10, 32, 0, 75, '超市购买生活用品', 107, '2018-01-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (217, 10, 45, 3, 0, '', 48, '2018-01-14', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (218, 10, 44, 6, 0, '', 50, '2018-01-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (219, 10, 46, 0, 0, '', 46, '2018-01-18', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (220, 10, 64, 10, 117, '充值公交卡100+买水果17', 191, '2018-01-19', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (221, 10, 31, 1, 11, '11电费', 43, '2018-01-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (222, 10, 50, 5, 45, '干洗衣服45', 100, '2018-01-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (227, 10, 36, 10, 11, '', 57, '2018-01-30', '-30', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (228, 10, 27, 0, 10, '咖啡10', 37, '2018-01-31', '41', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (229, 10, 22, 10, 69, '', 101, '2018-02-01', '-100', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (230, 10, 38, 10, 46, '打车46', 94, '2018-02-02', '72', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (231, 10, 18, 0, 0, '', 18, '2018-02-03', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (232, 10, 37, 0, 35, '理发35', 72, '2018-02-05', '-52', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (233, 10, 57, 1, 27, '', 85, '2018-02-09', '-304', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (234, 10, 26, 0, 0, '0', 26, '2018-02-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (235, 10, 45, 0, 0, '', 45, '2018-02-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (236, 10, 32, 2, 7101, '搬家140，换地方押一付三7061', 7135, '2018-02-25', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (237, 10, 39, 399, 0, '返程回杭州399', 438, '2018-02-24', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (238, 10, 55, 12, 0, '', 67, '2018-02-26', '160', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (239, 10, 39, 0, 0, '', 39, '2018-02-27', '-63', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (240, 10, 33, 2, 260, '100超市生活用品，160购买在线软件', 295, '2018-03-01', '114', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (241, 10, 32, 10, 130, '', 172, '2018-03-02', '-80', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (242, 10, 28, 0, 0, '', 28, '2018-03-05', '16', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (243, 10, 45, 10, 500, '换眼镜框500', 555, '2018-03-06', '138', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (244, 10, 38, 10, 0, '', 48, '2018-03-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (245, 10, 40, 5, 240, '去郑州240', 285, '2018-03-16', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (246, 10, 81, 10, 0, '', 91, '2018-03-20', '25', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (247, 10, 52, 32, 300, '', 384, '2018-03-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (248, 10, 40, 10, 151, '电脑包和烟12', 201, '2018-03-28', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (249, 10, 42, 10, 21, '超市咖啡20', 73, '2018-03-31', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (250, 10, 31, 14, 0, '', 45, '2018-04-06', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (251, 10, 43, 0, 0, '0', 43, '2018-04-07', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (252, 10, 50, 12, 0, '0', 62, '2018-04-08', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (253, 10, 33, 12, 7, '0', 52, '2018-04-09', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (254, 10, 63, 10, 0, '', 73, '2018-04-11', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (255, 10, 63, 10, 0, '', 73, '2018-04-10', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (256, 10, 27, 10, 150, '吃坏肚子去医院150', 187, '2018-04-13', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (257, 10, 41, 4, 0, '', 45, '2018-04-15', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (258, 10, 49, 8, 0, '0', 57, '2018-04-18', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (259, 10, 49, 8, 0, '0', 57, '2018-04-17', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (260, 10, 66, 8, 7, '打车70', 81, '2018-04-20', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (261, 10, 29, 58, 1814, '约会53，买衣服1097，hdmi线34', 1901, '2018-04-21', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (262, 10, 49, 10, 30, '回来打不到公交车打车30', 89, '2018-04-22', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (263, 10, 38, 8, 0, '', 46, '2018-04-23', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (264, 10, 9, 8, 34, '咖啡和wl沟通事情', 51, '2018-04-24', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (265, 10, 33, 32, 813, '鞋子260和眼镜框', 878, '2018-04-30', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (266, 10, 49, 0, 88, '最近工作压力大减压88', 137, '2018-04-29', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (267, 10, 35, 4, 14, '饮料14', 53, '2018-05-01', '0', NULL, NULL, NULL);
INSERT INTO `bage_bill` VALUES (269, 10, 10, 10, 1000, '', 1020, '2018-10-14', '-100', '30', '60', NULL);
INSERT INTO `bage_bill` VALUES (270, 10, 10, 10, 1000, '', 1020, '2018-10-15', '-100', '30', '60', NULL);
INSERT INTO `bage_bill` VALUES (271, 101, 2, 22, 2, '22', 26, '2021-01-01', '2', '2', '2', NULL);
INSERT INTO `bage_bill` VALUES (272, 101, 2, 22, 2, '22', 26, '2021-01-02', '2', '2', '2', NULL);
INSERT INTO `bage_bill` VALUES (273, 101, 1, 1, 1, '1', 3, '2021-01-08', '1', '1', NULL, '1');
INSERT INTO `bage_bill` VALUES (274, 101, 1, 1, 1, '1', 3, '2021-01-07', '1', '1', NULL, '11111');
INSERT INTO `bage_bill` VALUES (275, 101, 28, 12, 6, ' 下午茶5.5', 45, '2021-02-01', ' 0', ' 0', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for bage_post
-- ----------------------------
DROP TABLE IF EXISTS `bage_post`;
CREATE TABLE `bage_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '用户',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `author` varchar(100) NOT NULL DEFAULT '' COMMENT '作者',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `title_second` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `title_alias` char(50) NOT NULL DEFAULT '' COMMENT '别名 ',
  `title_style` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式',
  `title_style_serialize` varchar(255) NOT NULL DEFAULT '' COMMENT '标题样式序列化',
  `html_path` varchar(100) NOT NULL DEFAULT '' COMMENT 'html路径',
  `html_file` varchar(100) NOT NULL DEFAULT '' COMMENT 'html文件名',
  `template` varchar(60) NOT NULL DEFAULT '' COMMENT '模板',
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `special_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '专题编号',
  `intro` text COMMENT '摘要',
  `image_list` text COMMENT '组图',
  `seo_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `seo_description` text COMMENT 'SEO描述',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `content` mediumtext NOT NULL COMMENT '内容',
  `copy_from` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `copy_url` varchar(255) NOT NULL DEFAULT '' COMMENT '来源url',
  `redirect_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转URL',
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT 'tags',
  `view_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '查看次数',
  `commend` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '推荐',
  `attach_status` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '是否上传附件',
  `attach_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `attach_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '附件缩略图',
  `favorite_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `attention_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注次数',
  `top_line` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '头条',
  `last_update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `reply_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复次数',
  `reply_allow` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '允许评论',
  `sort_desc` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `acl` varchar(100) NOT NULL DEFAULT 'Y' COMMENT '权限检测',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '新闻状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='内容管理';

-- ----------------------------
-- Records of bage_post
-- ----------------------------
BEGIN;
INSERT INTO `bage_post` VALUES (100, 1, '', '', '面试题目setcookie的尴尬', '', '', '', '', '', '', '', 18, 0, '面试题目setcookie', '', '', '', '', '<span>&nbsp; &nbsp; &nbsp;今天参见面试被问到一个关于cookie的问题。问题大概是这样的，若不使用</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#0000BB;\">setcookie</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#007700;\">(</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#DD0000;\">\"TestCookie\"</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#007700;\">,&nbsp;</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#0000BB;\">$value</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#007700;\">,&nbsp;</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#0000BB;\">time</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#007700;\">()+</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#0000BB;\">3600</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#007700;\">); 函数，有没有其他的方式种cookie。这个问题当时的第一感觉，实在考察curl。</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;color:#007700;\">查询资料才知道，原来是考察setrawcookie函数。这个函数和setcookie共同的作用，向客户端发送一个cookie，唯一的区别就是<strong><span style=\"background-color:#E53333;color:#E53333;\"></span></strong><strong><span style=\"background-color:#FFFFFF;color:#E53333;\">setrawcookie发送的cookie未经过URL编码</span></strong>。</span>', '', '', '', '', 86, 'N', 'N', '', '', 0, 0, 'N', 1516628011, 0, 'Y', 0, '', 'Y', 1516376327);
INSERT INTO `bage_post` VALUES (92, 1, '', '', '五一京北城市承德之行', '', '', '', '', '', '', '', 19, 0, '', '', '五一京北城市承德之行', '五一京北城市承德之行', '五一京北城市承德之行', '<p>rn	&nbsp; &nbsp; &nbsp;走大广京承高速段用时六小时全程往返五百公里。自15年公司组织去过草原感受草原风情，途径承德，觉得城市环境依山伴水，环境应该不错，又有避暑山庄胜地，便一直打算去京北一走。约大学同学成斌、老贺和军军加我四个人便下午四点从北京出发。一路我一直开到密云都是车水马龙，后一直按照导航推荐行驶，后发现导航软件和成斌的不同，原来导航设置错误，一直走的是国道，耽搁一些时间，直到约九点才抵达市内，后来是找好酒店住下。第二天，去了所谓的五a和世界文化遗产的避暑山庄。如下图，大家觉得如何呢？rn</p>rn<p>rn	避暑山庄（图）rn</p>rn<p>rn	<br />rn</p>rn<p>rn	&nbsp; &nbsp; &nbsp;后来我们中午便找个地方好好的吃上一顿。如下图。rn</p>rn<p>rn	&nbsp; &nbsp; &nbsp;酒足饭饱之后，便开始启程回京，自己估计再也不会来这里了，这个地方确实很一般，起初觉得这个地方应该是和颐和园相当，事实是差距悬殊。在回京的路上，到司马台长城附近，便和大家商量住一晚上明天去司马台长城一看，毕竟这里的长城使出了名的险峻。可出师不利，正好感到景区入口再修路，因全是锋利的石头便放弃了，继续回京，可这一路很是拥堵，至少八起以上的交通事故，所以这一路甚是辛苦，这次自驾让我对京北城市没了好感，也让我第一次知道当司机一定得肾好，遇上堵车更是麻烦，还有就是提前做好准备功课（1、景点和目的地的确认，口碑如何，2、路况的了解 &nbsp;3、提前定好酒店和规划旅游路线 ）rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>rn<p>rn	<br />rn</p>', '', '', '', '承德,五一,自驾', 224, 'N', 'N', '', '', 0, 0, 'N', 1497923528, 0, 'Y', 0, '', 'Y', 1493691349);
INSERT INTO `bage_post` VALUES (93, 1, '', '', '移动端开发工具分享和一些坑', '', '', '', '', '', '', '', 18, 0, '现在移动端唱主角的时代，作为PHP工程师，会经常和移动端的同事配合进行接口的开发，具体的交付物就是接口文档。', '', '移动端开发工具分享', '移动端开发工具分享和一些坑', '移动端开发工具分享', '<p>\r\n	现在移动端唱主角的时代，作为PHP工程师，会经常和移动端的同事配合进行接口的开发，具体的交付物就是接口文档。\r\n</p>\r\n<p>\r\n	一、工具分享rn\r\n</p>\r\n<p>\r\n	文档书写工具markdown。（教程如下）&nbsp;\r\n</p>\r\n<p>\r\n	接口测试工具postmanrn 移动端抓包工具Charless，这个先确保手机和pc 在同一个网段，可以给手机设置代理。Charless有许多功能，具体使用我会在后续的博客单独说明。\r\n</p>\r\n<p>\r\n	二、和移动端同事沟通的专业术语整理rn\r\n</p>\r\n<p>\r\n	数据字典、token\r\n</p>\r\n<p>\r\n	三、设计API一般流程和注意事项\r\n</p>\r\n<p>\r\n	四、实际开发的一些坑<span style=\"line-height:1.5;\"><span style=\"line-height:2.5;\"><span style=\"line-height:1;\"></span></span></span> rn\r\n</p>', '', '', '', '', 349, 'N', 'N', '', '', 0, 0, 'N', 1516635649, 0, 'Y', 0, '', 'Y', 1494754987);
INSERT INTO `bage_post` VALUES (97, 1, '', '', '48周笔记之我在校内外技术要点整理', '', '', '', '', '', '', '', 18, 0, '去年一月十七号至今已有快一年的时间了，在此期间有许多的开发工具都是第一次使用，也都能比较熟练操作了，但是并非完全的掌握其中的技能（比如，从搭建到运用和解决常见问题的技巧等等），所以打算进行总结总结。', '', '', '', '', '&nbsp; &nbsp;去年一月十七号至今已有快一年的时间了，在此期间有许多的开发工具都是第一次使用，也都能比较熟练操作了，但是并非完全的掌握和理解其中的道道（比如，从搭建到运用和解决常见问题的技巧等等），所以打算总结出要点，后续再做进一步深入。&nbsp;<br />\r\n1、电脑，Mac Pro，本机搭建docker环境，giT环境，一些实用的脚本，如G，F 。&nbsp;<br />\r\n2、运维容器工具，docker&nbsp;<br />\r\n3、版本控制，giT&nbsp;<br />\r\n4、接口调试工具，Charles，postMan&nbsp;<br />\r\n5、数据库，MySQL，Redis，memecached&nbsp;<br />\r\n6、文档书写，gitlab,Markdown&nbsp;<br />\r\n7、PHP框架，laravel5.4&nbsp;<br />\r\n8、IDE，phpstpm,vim&nbsp;<br />\r\n9、前端框架：Vue，smarty&nbsp;<br />\r\n10、队列，rabitmq&nbsp;<br />\r\n11、搜索，elasticsearch，sphinx&nbsp;<br />\r\n12、 PHP用来管理依赖关系的工具 ，composer&nbsp;<br />\r\n13、邮件第三方服务，sendcloud，mailgun&nbsp;<br />\r\n14、单元测试，phpunit&nbsp;<br />\r\n15、代码规范，参考阿里巴巴代码规范&nbsp;<br />\r\n16、代码审查机制，gitMergeRequest&nbsp;<br />\r\n17、代码快速上线和普通版本迭代机制，周迭代，149，develop，alpha各个环境之间的代码通讯机制，hotfix。&nbsp;<br />\r\n18、定时计划任务和有用的脚本，cronjob，g 等等。<br />\r\n19、移动端接口开发规范和大致流程。&nbsp;<br />\r\n20、移动端版本控制大致流程。&nbsp;<br />\r\n21、移动支付，微信，支付宝，银联。&nbsp;<br />\r\n22、网易直播jdk&nbsp;<br />\r\n23、班级空间数据缓存机制&nbsp;<br />\r\n24、班级空间数据架构，读写分离，缓存机制&nbsp;<br />\r\n25、等想到了在做补充。。。&nbsp;<br />\r\n<div>\r\n	<br />\r\n</div>\r\n<div id=\"2674-1512218076275\" style=\"font-size:14px;\">\r\n</div>\r\n<!--5f39ae17-8c62-4a45-bc43-b32064c9388a:W3siYmxvY2tJZCI6IjI2NzQtMTUxMjIxODA3NjI3NSIsImJsb2NrVHlwZSI6ImhlYWRpbmciLCJzdHlsZXMiOnt9LCJ0eXBlIjoiaGVhZGluZyIsInRleHQiOnsiZGF0YSI6W3siY2hhciI6IuWOuyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5bm0Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuIAiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaciCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5Y2BIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuIMiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWPtyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6IezIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLku4oiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuW3siIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5pyJIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlv6siLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuS4gCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5bm0Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnmoQiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaXtiIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6Ze0Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuoYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iu+8jCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5ZyoIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmraQiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuacnyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6Ze0Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmnIkiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuiuuCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5aSaIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnmoQiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuW8gCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5Y+RIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlt6UiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWFtyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6YO9Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmmK8iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuesrCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LiAIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmrKEiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuS9vyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi55SoIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLvvIwiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuS5nyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6YO9Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLog70iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuavlCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6L6DIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnhp8iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iue7gyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5pONIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkvZwiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuS6hiIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi77yMIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkvYYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaYryIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5bm2Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLpnZ4iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWujCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5YWoIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnmoQiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaOjCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5o+hIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlhbYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuS4rSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi55qEIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmioAiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuiDvSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi77yIIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmr5QiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWmgiIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi77yMIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLku44iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaQrSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5bu6Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLliLAiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iui/kCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi55SoIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlkowiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuinoyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5YazIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLluLgiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuingSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6ZeuIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLpopgiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IueahCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5oqAIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlt6ciLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuetiSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi562JIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLvvIkiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iu+8jCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5omAIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLku6UiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaJkyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi566XIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLov5siLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuihjCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5oC7Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnu5MiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaAuyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi57uTIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLjgIIiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX0sInJpY2hUZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiLljrsiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuW5tCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LiAIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmnIgiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWNgSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LiDIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlj7ciLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuiHsyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LuKIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlt7IiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaciSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5b+rIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuIAiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuW5tCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi55qEIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLml7YiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IumXtCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LqGIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLvvIwiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWcqCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5q2kIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmnJ8iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IumXtCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5pyJIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLorrgiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWkmiIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi55qEIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlvIAiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWPkSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5belIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlhbciLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IumDvSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5pivIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnrKwiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuS4gCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5qyhIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkvb8iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IueUqCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi77yMIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuZ8iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IumDvSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6IO9Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmr5QiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iui+gyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi54afIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnu4MiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaTjSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5L2cIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuoYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iu+8jCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5L2GIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmmK8iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuW5tiIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6Z2eIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlrowiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWFqCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi55qEIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmjowiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaPoSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5YW2Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLkuK0iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IueahCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5oqAIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLog70iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iu+8iCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5q+UIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLlpoIiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iu+8jCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LuOIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmkK0iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuW7uiIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5YiwIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLov5AiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IueUqCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5ZKMIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLop6MiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuWGsyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5bi4Iiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLop4EiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IumXriIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6aKYIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnmoQiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaKgCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5benIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLnrYkiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuetiSIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi77yJIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLvvIwiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaJgCIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi5LulIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmiZMiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IueulyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi6L+bIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLooYwiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6IuaAuyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi57uTIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fSx7ImNoYXIiOiLmgLsiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZSwiZm9udC1zaXplIjoxOCwiY29sb3IiOiIjNTk1OTU5In19LHsiY2hhciI6Iue7kyIsInN0eWxlcyI6eyJib2xkIjp0cnVlLCJmb250LXNpemUiOjE4LCJjb2xvciI6IiM1OTU5NTkifX0seyJjaGFyIjoi44CCIiwic3R5bGVzIjp7ImJvbGQiOnRydWUsImZvbnQtc2l6ZSI6MTgsImNvbG9yIjoiIzU5NTk1OSJ9fV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9LCJsZXZlbCI6ImIifSx7ImJsb2NrSWQiOiI2ODE5LTE1MTIyMjA3NzA1NzIiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnt9LCJ0eXBlIjoicGFyYWdyYXBoIiwidGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMSJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IueUtSJ9LHsiY2hhciI6IuiEkSJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6Ik0ifSx7ImNoYXIiOiJhIn0seyJjaGFyIjoiYyJ9LHsiY2hhciI6IiAifSx7ImNoYXIiOiJQIn0seyJjaGFyIjoiciJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiLmnKwifSx7ImNoYXIiOiLmnLoifSx7ImNoYXIiOiLmkK0ifSx7ImNoYXIiOiLlu7oifSx7ImNoYXIiOiJkIn0seyJjaGFyIjoibyJ9LHsiY2hhciI6ImMifSx7ImNoYXIiOiJrIn0seyJjaGFyIjoiZSJ9LHsiY2hhciI6InIifSx7ImNoYXIiOiLnjq8ifSx7ImNoYXIiOiLlooMifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJnIn0seyJjaGFyIjoiaSJ9LHsiY2hhciI6IlQifSx7ImNoYXIiOiLnjq8ifSx7ImNoYXIiOiLlooMifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiLkuIAifSx7ImNoYXIiOiLkupsifSx7ImNoYXIiOiLlrp4ifSx7ImNoYXIiOiLnlKgifSx7ImNoYXIiOiLnmoQifSx7ImNoYXIiOiLohJoifSx7ImNoYXIiOiLmnKwifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiLlpoIifSx7ImNoYXIiOiJHIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoiRiJ9LHsiY2hhciI6IiAifSx7ImNoYXIiOiLjgIIifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI2MDg5LTE1MTIyMjExNTQ5MDAiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnt9LCJ0eXBlIjoicGFyYWdyYXBoIiwidGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6Iui/kCJ9LHsiY2hhciI6Iue7tCJ9LHsiY2hhciI6IuWuuSJ9LHsiY2hhciI6IuWZqCJ9LHsiY2hhciI6IuW3pSJ9LHsiY2hhciI6IuWFtyJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6ImQifSx7ImNoYXIiOiJvIn0seyJjaGFyIjoiYyJ9LHsiY2hhciI6ImsifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoiciJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6Ijc0NzMtMTUxMjIyMTE3MDcwNyIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIzIn0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoi54mIIn0seyJjaGFyIjoi5pysIn0seyJjaGFyIjoi5o6nIn0seyJjaGFyIjoi5Yi2In0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoiZyJ9LHsiY2hhciI6ImkifSx7ImNoYXIiOiJUIn1dLCJpc1JpY2hUZXh0Ijp0cnVlLCJrZWVwTGluZUJyZWFrIjp0cnVlfX0seyJibG9ja0lkIjoiNjk1My0xNTEyMjIxMTk1NzYzIiwiYmxvY2tUeXBlIjoicGFyYWdyYXBoIiwic3R5bGVzIjp7fSwidHlwZSI6InBhcmFncmFwaCIsInRleHQiOnsiZGF0YSI6W3siY2hhciI6IjQifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiLmjqUifSx7ImNoYXIiOiLlj6MifSx7ImNoYXIiOiLosIMifSx7ImNoYXIiOiLor5UifSx7ImNoYXIiOiLlt6UifSx7ImNoYXIiOiLlhbcifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJDIn0seyJjaGFyIjoiaCJ9LHsiY2hhciI6ImEifSx7ImNoYXIiOiJyIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiJzIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoicCJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiJzIn0seyJjaGFyIjoidCJ9LHsiY2hhciI6Ik0ifSx7ImNoYXIiOiJhIn0seyJjaGFyIjoibiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjE2ODUtMTUxMjIyMTQ3NDUwNSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiI1In0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoi5pWwIn0seyJjaGFyIjoi5o2uIn0seyJjaGFyIjoi5bqTIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoiTSJ9LHsiY2hhciI6InkifSx7ImNoYXIiOiJTIn0seyJjaGFyIjoiUSJ9LHsiY2hhciI6IkwifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJSIn0seyJjaGFyIjoiZSJ9LHsiY2hhciI6ImQifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoicyJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6Im0ifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoibSJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiJjIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6ImMifSx7ImNoYXIiOiJoIn0seyJjaGFyIjoiZSJ9LHsiY2hhciI6ImQifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI0NjczLTE1MTIyMjE1MzIwMTUiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnt9LCJ0eXBlIjoicGFyYWdyYXBoIiwidGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiNiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuaWhyJ9LHsiY2hhciI6IuahoyJ9LHsiY2hhciI6IuS5piJ9LHsiY2hhciI6IuWGmSJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6ImcifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoidCJ9LHsiY2hhciI6ImwifSx7ImNoYXIiOiJhIn0seyJjaGFyIjoiYiJ9LHsiY2hhciI6IiwifSx7ImNoYXIiOiJNIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6InIifSx7ImNoYXIiOiJrIn0seyJjaGFyIjoiZCJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiJ3In0seyJjaGFyIjoibiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjU5ODItMTUxMjIyMTU1Mzg3MyIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiI3In0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoiUCJ9LHsiY2hhciI6IkgifSx7ImNoYXIiOiJQIn0seyJjaGFyIjoi5qGGIn0seyJjaGFyIjoi5p62In0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6ImEifSx7ImNoYXIiOiJyIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6InYifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6IjUifSx7ImNoYXIiOiIuIn0seyJjaGFyIjoiNCJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6Ijg0NDgtMTUxMjIyMTU4MjM5MiIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiI4In0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoiSSJ9LHsiY2hhciI6IkQifSx7ImNoYXIiOiJFIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoicCJ9LHsiY2hhciI6ImgifSx7ImNoYXIiOiJwIn0seyJjaGFyIjoicyJ9LHsiY2hhciI6InQifSx7ImNoYXIiOiJwIn0seyJjaGFyIjoibSJ9LHsiY2hhciI6IiwifSx7ImNoYXIiOiJ2In0seyJjaGFyIjoiaSJ9LHsiY2hhciI6Im0ifSx7ImNoYXIiOiIgIn1dLCJpc1JpY2hUZXh0Ijp0cnVlLCJrZWVwTGluZUJyZWFrIjp0cnVlfX0seyJibG9ja0lkIjoiNDM0Mi0xNTEyMjIxNjYwODQyIiwiYmxvY2tUeXBlIjoicGFyYWdyYXBoIiwic3R5bGVzIjp7fSwidHlwZSI6InBhcmFncmFwaCIsInRleHQiOnsiZGF0YSI6W3siY2hhciI6IjkifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiLliY0ifSx7ImNoYXIiOiLnq68ifSx7ImNoYXIiOiLmoYYifSx7ImNoYXIiOiLmnrYifSx7ImNoYXIiOiLvvJoifSx7ImNoYXIiOiJWIn0seyJjaGFyIjoidSJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJzIn0seyJjaGFyIjoibSJ9LHsiY2hhciI6ImEifSx7ImNoYXIiOiJyIn0seyJjaGFyIjoidCJ9LHsiY2hhciI6InkifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI0NzcwLTE1MTIyMjE3MTgyOTEiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnt9LCJ0eXBlIjoicGFyYWdyYXBoIiwidGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMSJ9LHsiY2hhciI6IjAifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiLpmJ8ifSx7ImNoYXIiOiLliJcifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJyIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6ImIifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoidCJ9LHsiY2hhciI6Im0ifSx7ImNoYXIiOiJxIn1dLCJpc1JpY2hUZXh0Ijp0cnVlLCJrZWVwTGluZUJyZWFrIjp0cnVlfX0seyJibG9ja0lkIjoiNjk2OS0xNTEyMjIxNjU2NjczIiwiYmxvY2tUeXBlIjoicGFyYWdyYXBoIiwic3R5bGVzIjp7fSwidHlwZSI6InBhcmFncmFwaCIsInRleHQiOnsiZGF0YSI6W3siY2hhciI6IjEifSx7ImNoYXIiOiIxIn0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoi5pCcIn0seyJjaGFyIjoi57SiIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoiZSJ9LHsiY2hhciI6ImwifSx7ImNoYXIiOiJhIn0seyJjaGFyIjoicyJ9LHsiY2hhciI6InQifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoiYyJ9LHsiY2hhciI6InMifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6InIifSx7ImNoYXIiOiJjIn0seyJjaGFyIjoiaCJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6InMifSx7ImNoYXIiOiJwIn0seyJjaGFyIjoiaCJ9LHsiY2hhciI6ImkifSx7ImNoYXIiOiJuIn0seyJjaGFyIjoieCJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjgwNzItMTUxMjIyMTg0NzUzNiIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIxIn0seyJjaGFyIjoiMiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IiAifSx7ImNoYXIiOiJQIn0seyJjaGFyIjoiSCJ9LHsiY2hhciI6IlAifSx7ImNoYXIiOiLnlKgifSx7ImNoYXIiOiLmnaUifSx7ImNoYXIiOiLnrqEifSx7ImNoYXIiOiLnkIYifSx7ImNoYXIiOiLkvp0ifSx7ImNoYXIiOiLotZYifSx7ImNoYXIiOiLlhbMifSx7ImNoYXIiOiLns7sifSx7ImNoYXIiOiLnmoQifSx7ImNoYXIiOiLlt6UifSx7ImNoYXIiOiLlhbcifSx7ImNoYXIiOiIgIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoiYyJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiJtIn0seyJjaGFyIjoicCJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiJzIn0seyJjaGFyIjoiZSJ9LHsiY2hhciI6InIifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI4Mzc2LTE1MTIyMjE1ODY4ODkiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnt9LCJ0eXBlIjoicGFyYWdyYXBoIiwidGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMSJ9LHsiY2hhciI6IjMifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiLpgq4ifSx7ImNoYXIiOiLku7YifSx7ImNoYXIiOiLnrKwifSx7ImNoYXIiOiLkuIkifSx7ImNoYXIiOiLmlrkifSx7ImNoYXIiOiLmnI0ifSx7ImNoYXIiOiLliqEifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJzIn0seyJjaGFyIjoiZSJ9LHsiY2hhciI6Im4ifSx7ImNoYXIiOiJkIn0seyJjaGFyIjoiYyJ9LHsiY2hhciI6ImwifSx7ImNoYXIiOiJvIn0seyJjaGFyIjoidSJ9LHsiY2hhciI6ImQifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJtIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6ImkifSx7ImNoYXIiOiJsIn0seyJjaGFyIjoiZyJ9LHsiY2hhciI6InUifSx7ImNoYXIiOiJuIn1dLCJpc1JpY2hUZXh0Ijp0cnVlLCJrZWVwTGluZUJyZWFrIjp0cnVlfX0seyJibG9ja0lkIjoiNzk3Ny0xNTEyMjIyMDIzMDM4IiwiYmxvY2tUeXBlIjoicGFyYWdyYXBoIiwic3R5bGVzIjp7fSwidHlwZSI6InBhcmFncmFwaCIsInRleHQiOnsiZGF0YSI6W3siY2hhciI6IjEifSx7ImNoYXIiOiI0In0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoi5Y2VIn0seyJjaGFyIjoi5YWDIn0seyJjaGFyIjoi5rWLIn0seyJjaGFyIjoi6K+VIn0seyJjaGFyIjoi77yMIn0seyJjaGFyIjoicCJ9LHsiY2hhciI6ImgifSx7ImNoYXIiOiJwIn0seyJjaGFyIjoidSJ9LHsiY2hhciI6Im4ifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoidCJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjIwNDMtMTUxMjIyMjA2MzIxMyIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIxIn0seyJjaGFyIjoiNSJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6IueggSJ9LHsiY2hhciI6IuinhCJ9LHsiY2hhciI6IuiMgyJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuWPgiJ9LHsiY2hhciI6IuiAgyJ9LHsiY2hhciI6IumYvyJ9LHsiY2hhciI6IumHjCJ9LHsiY2hhciI6IuW3tCJ9LHsiY2hhciI6IuW3tCJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6IueggSJ9LHsiY2hhciI6IuinhCJ9LHsiY2hhciI6IuiMgyJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjE0MjItMTUxMjIyMjE0Mjg2MSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIxIn0seyJjaGFyIjoiNiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6IueggSJ9LHsiY2hhciI6IuWuoSJ9LHsiY2hhciI6IuafpSJ9LHsiY2hhciI6IuacuiJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6ImcifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoidCJ9LHsiY2hhciI6Ik0ifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoiciJ9LHsiY2hhciI6ImcifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoiUiJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiJxIn0seyJjaGFyIjoidSJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiJzIn0seyJjaGFyIjoidCJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjMyOTMtMTUxMjIyMTU0MzQyOSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIxIn0seyJjaGFyIjoiNyJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6IueggSJ9LHsiY2hhciI6IuW/qyJ9LHsiY2hhciI6IumAnyJ9LHsiY2hhciI6IuS4iiJ9LHsiY2hhciI6Iue6vyJ9LHsiY2hhciI6IuWSjCJ9LHsiY2hhciI6IuaZriJ9LHsiY2hhciI6IumAmiJ9LHsiY2hhciI6IueJiCJ9LHsiY2hhciI6IuacrCJ9LHsiY2hhciI6Iui/rSJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6IuacuiJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuWRqCJ9LHsiY2hhciI6Iui/rSJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IjEifSx7ImNoYXIiOiI0In0seyJjaGFyIjoiOSJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6ImQifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoidiJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiJsIn0seyJjaGFyIjoibyJ9LHsiY2hhciI6InAifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJhIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6InAifSx7ImNoYXIiOiJoIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6IuWQhCJ9LHsiY2hhciI6IuS4qiJ9LHsiY2hhciI6IueOryJ9LHsiY2hhciI6IuWigyJ9LHsiY2hhciI6IuS5iyJ9LHsiY2hhciI6IumXtCJ9LHsiY2hhciI6IueahCJ9LHsiY2hhciI6IuS7oyJ9LHsiY2hhciI6IueggSJ9LHsiY2hhciI6IumAmiJ9LHsiY2hhciI6IuiuryJ9LHsiY2hhciI6IuacuiJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6ImgifSx7ImNoYXIiOiJvIn0seyJjaGFyIjoidCJ9LHsiY2hhciI6ImYifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoieCJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjMzOTQtMTUxMjIyMjI2ODEzNSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIxIn0seyJjaGFyIjoiOCJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuWumiJ9LHsiY2hhciI6IuaXtiJ9LHsiY2hhciI6IuiuoSJ9LHsiY2hhciI6IuWIkiJ9LHsiY2hhciI6IuS7uyJ9LHsiY2hhciI6IuWKoSJ9LHsiY2hhciI6IuWSjCJ9LHsiY2hhciI6IuaciSJ9LHsiY2hhciI6IueUqCJ9LHsiY2hhciI6IueahCJ9LHsiY2hhciI6IuiEmiJ9LHsiY2hhciI6IuacrCJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6ImMifSx7ImNoYXIiOiJyIn0seyJjaGFyIjoibyJ9LHsiY2hhciI6Im4ifSx7ImNoYXIiOiJqIn0seyJjaGFyIjoibyJ9LHsiY2hhciI6ImIifSx7ImNoYXIiOiLvvIwifSx7ImNoYXIiOiJnIn0seyJjaGFyIjoiICJ9LHsiY2hhciI6IuetiSJ9LHsiY2hhciI6IuetiSJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjkwOTktMTUxMjIyMjMzOTU2NCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIxIn0seyJjaGFyIjoiOSJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuenuyJ9LHsiY2hhciI6IuWKqCJ9LHsiY2hhciI6IuerryJ9LHsiY2hhciI6IuaOpSJ9LHsiY2hhciI6IuWPoyJ9LHsiY2hhciI6IuW8gCJ9LHsiY2hhciI6IuWPkSJ9LHsiY2hhciI6IuinhCJ9LHsiY2hhciI6IuiMgyJ9LHsiY2hhciI6IuWSjCJ9LHsiY2hhciI6IuWkpyJ9LHsiY2hhciI6IuiHtCJ9LHsiY2hhciI6Iua1gSJ9LHsiY2hhciI6IueoiyJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjIwMzktMTUxMjIyMjQzMzk2MSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIyIn0seyJjaGFyIjoiMCJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuenuyJ9LHsiY2hhciI6IuWKqCJ9LHsiY2hhciI6IuerryJ9LHsiY2hhciI6IueJiCJ9LHsiY2hhciI6IuacrCJ9LHsiY2hhciI6IuaOpyJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6IuWkpyJ9LHsiY2hhciI6IuiHtCJ9LHsiY2hhciI6Iua1gSJ9LHsiY2hhciI6IueoiyJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6Ijk1MTUtMTUxMjIyMjQ1MDU3MSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIyIn0seyJjaGFyIjoiMSJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuenuyJ9LHsiY2hhciI6IuWKqCJ9LHsiY2hhciI6IuaUryJ9LHsiY2hhciI6IuS7mCJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuW+riJ9LHsiY2hhciI6IuS/oSJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuaUryJ9LHsiY2hhciI6IuS7mCJ9LHsiY2hhciI6IuWunSJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IumTtiJ9LHsiY2hhciI6IuiBlCJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjAwNTktMTUxMjIyMjUwMDMzMCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIyIn0seyJjaGFyIjoiMiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6Iue9kSJ9LHsiY2hhciI6IuaYkyJ9LHsiY2hhciI6IuebtCJ9LHsiY2hhciI6IuaSrSJ9LHsiY2hhciI6ImoifSx7ImNoYXIiOiJkIn0seyJjaGFyIjoiayJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6Ijc2MzgtMTUxMjIyMjUyMjA2NSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIyIn0seyJjaGFyIjoiMyJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuePrSJ9LHsiY2hhciI6Iue6pyJ9LHsiY2hhciI6IuepuiJ9LHsiY2hhciI6IumXtCJ9LHsiY2hhciI6IuaVsCJ9LHsiY2hhciI6IuaNriJ9LHsiY2hhciI6Iue8kyJ9LHsiY2hhciI6IuWtmCJ9LHsiY2hhciI6IuacuiJ9LHsiY2hhciI6IuWItiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjQ0OTItMTUxMjIyMjU1OTUxMyIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIyIn0seyJjaGFyIjoiNCJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuePrSJ9LHsiY2hhciI6Iue6pyJ9LHsiY2hhciI6IuepuiJ9LHsiY2hhciI6IumXtCJ9LHsiY2hhciI6IuaVsCJ9LHsiY2hhciI6IuaNriJ9LHsiY2hhciI6IuaetiJ9LHsiY2hhciI6IuaehCJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuivuyJ9LHsiY2hhciI6IuWGmSJ9LHsiY2hhciI6IuWIhiJ9LHsiY2hhciI6IuemuyJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6Iue8kyJ9LHsiY2hhciI6IuWtmCJ9LHsiY2hhciI6IuacuiJ9LHsiY2hhciI6IuWItiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjY2MjUtMTUxMjIyMjc2NjY1OCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6e30sInR5cGUiOiJwYXJhZ3JhcGgiLCJ0ZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIyIn0seyJjaGFyIjoiNSJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuetiSJ9LHsiY2hhciI6IuaDsyJ9LHsiY2hhciI6IuWIsCJ9LHsiY2hhciI6IuS6hiJ9LHsiY2hhciI6IuWcqCJ9LHsiY2hhciI6IuWBmiJ9LHsiY2hhciI6IuihpSJ9LHsiY2hhciI6IuWFhSJ9LHsiY2hhciI6IuOAgiJ9LHsiY2hhciI6IuOAgiJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19XQ==-->', '', '', '', '', 245, 'N', 'N', '', '', 0, 0, 'N', 1516774476, 0, 'Y', 0, '', 'Y', 1512223240);
INSERT INTO `bage_post` VALUES (101, 1, '', '', '面试题awk的考察', '', '', '', '', '', '', '', 18, 0, '面试题awk的考察', '', '', '', '', '<p>\r\n	&nbsp; &nbsp; 原题大致意思是这样的，给了一个文件tmp.log其结构如下：\r\n<pre class=\"prettyprint\">url:url_2:visit:2\r\nurl:url_3:visit:3\r\nurl:url_7:visit:7 \r\n\r\n</pre>\r\n</p>\r\n<p>\r\n	现在需要输出前两行url且排名降序排列（visist对应为访客量），请设计脚本按要求输出？\r\n</p>\r\n<p class=\"p1\">\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-bsh\">//cat f11.txt| awk \' BEGIN {FS=\":\"} {print $2 \"\\t\" $4}\' | sort -nr\r\ntail -2 f11.txt| awk \' BEGIN {FS=\":\"} {print $2 \"\\t\" $4}\' | sort -nr</pre>\r\n<pre class=\"prettyprint lang-bsh\"><img src=\"/uploads/201801/815deee0fcaf94a79a1473d1dfbbf345.png\" alt=\"\" /> </pre>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', 'awk', 78, 'N', 'N', '', '', 0, 0, 'N', 1516979607, 0, 'Y', 0, '', 'Y', 1516978624);
INSERT INTO `bage_post` VALUES (102, 1, '', '', 'B\\S软件三层结构的理解', '', '', '', '', '', '', '', 18, 0, '今天在面试中被问到一个关于直播课项目架构图的问题，当时第一反应想到的是bs常见的三层架构图。', '', '软件三层结构', '软件三层结构', '软件三层结构', '<p>\r\n	&nbsp; &nbsp; &nbsp; 今天在面试中被问到一个关于直播课项目架构图的问题，当时第一反应想到的是bs常见的三层架构图。我们先思考三个问题？\r\n</p>\r\n<ul>\r\n	<li>\r\n		1，什么是三层？\r\n	</li>\r\n	<li>\r\n		2，为什么使用三层？\r\n	</li>\r\n	<li>\r\n		3，三层与以往使用的两层相比有什么不同？它的优势在哪里？\r\n	</li>\r\n	<li>\r\n		4，如何学好三层？如何应用三层？\r\n	</li>\r\n</ul>\r\n<h2>\r\n	1、什么是三层？\r\n</h2>\r\n<ul>\r\n	<li>\r\n		UI(表现层):主要是指与用户交互的界面。用于接收用户输入的数据和显示处理后用户需要的数据。&nbsp;\r\n	</li>\r\n	<li>\r\n		BLL:(业务逻辑层):UI层和DAL层之间的桥梁。实现业务逻辑。业务逻辑具体包含：验证、计算、业务规则等等。\r\n	</li>\r\n	<li>\r\n		DAL:(数据访问层):与数据库打交道。主要实现对数据的增、删、改、查。将存储在数据库中的数据提交给业务层，同时将业务层处理的数据保存到数据库。（当然这些操作都是基于UI层的。用户的需求反映给界面（UI），UI反映给BLL，BLL反映给DAL，DAL进行数据的操作，操作后再一一返回，直到将用户所需数据反馈给用户）\r\n	</li>\r\n</ul>\r\n<p>\r\n	<img src=\"/uploads/201801/5ab8c62831389b273420cf8438e9ed78.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	每一层都各负其责，那么该如何将三层联系起来呢？\r\n</p>\r\n<p>\r\n	1&gt;单项引用（见下图）\r\n</p>\r\n<p>\r\n	2&gt;这时候实体层（Entity）来了。（注：当然，实体层的作用不止这些）\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	Entity(实体层)：它不属于三层中的任何一层，但是它是必不可少的一层。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	Entity在三层架构中的作用：\r\n</p>\r\n<p>\r\n	1,实现面向对象思想中的\"封装\";\r\n</p>\r\n<p>\r\n	2，贯穿于三层，在三层之间传递数据;\r\n</p>\r\n<p>\r\n	（注：确切的说实体层贯穿于三层之间，来连接三层）\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	3，对于初学者来说，可以这样理解：每张数据表对应一个实体，即每个数据表中的字段对应实体中的属性（注：当然，事实上不是这样。为什么？\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	1＞，可能我们需要的实体在数据表对应的实体中并不存在；\r\n</p>\r\n<p>\r\n	2＞，我们完全可以将所有数据表中的所有字段都放在一个实体里）\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	4，每一层（UI—&gt;BLL—&gt;DAL）之间的数据传递（单向）是靠变量或实体作为参数来传递的，这样就构造了三层之间的联系，完成了功能的实现。\r\n</p>\r\n<p>\r\n	但是对于大量的数据来说，用变量做参数有些复杂，因为参数量太多，容易搞混。比如：我要把员工信息传递到下层，信息包括：员工号、姓名、年龄、性别、工资．．．．用变量做参数的话，那么我们的方法中的参数就会很多，极有可能在使用时，将参数匹配搞混。这时候，如果用实体做参数，就会很方便，不用考虑参数匹配的问题，用到实体中哪个属性拿来直接用就可以，很方便。这样做也提高了效率。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	（注：这里为什么说可以暂时理解为每个数据表对应一个实体？？\r\n</p>\r\n<p>\r\n	答：大家都知道，我们做系统的目的，是为用户提供服务，用户可不关心你的系统后台是怎么工作的，用户只关心软件是不是好用，界面是不是符合自己心意。\r\n</p>\r\n<p>\r\n	用户在界面上轻松的增、删、改、查，那么数据库中也要有相应的增、删、改、查，而增删改查具体操作对象就是数据库中的数据，说白了就是表中的字段。\r\n</p>\r\n<p>\r\n	所以，将每个数据表作为一个实体类，实体类封装的属性对应到表中的字段，这样的话，实体在贯穿于三层之间时，就可以实现增删改查数据了）\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	综上所述:三层及实体层之间的依赖关系:\r\n</p>\r\n<img src=\"/uploads/201801/7f584256a820c2d5e14edf434d00ec71.png\" alt=\"\" /> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h3>\r\n	<span style=\"font-size:32px;color:#E53333;\">思想来源于生活：</span> \r\n</h3>\r\n<h3>\r\n	<u><u><span style=\"color:#E53333;\"><br />\r\n</span></u></u> \r\n</h3>\r\n<p>\r\n	<span style=\"color:#E53333;\"><span style=\"color:#E53333;\"><span style=\"color:#000000;\">###################################################################</span></span><span style=\"color:#E53333;\"><span style=\"color:#000000;\"></span></span><br />\r\n</span> \r\n</p>\r\n<h3>\r\n	<u><u><span style=\"color:#E53333;\">&nbsp; </span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; </span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></u><u><span style=\"color:#E53333;\">&nbsp; &nbsp;</span></u></u> \r\n</h3>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"/uploads/201801/217e8251ecdc5042efb9b013a675a28d.png\" alt=\"\" /> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	服务员：只管接待客人；\r\n</p>\r\n<p>\r\n	厨师：只管做客人点的菜；\r\n</p>\r\n<p>\r\n	采购员：只管按客人点菜的要求采购食材；\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	他们各负其职，服务员不用了解厨师如何做菜，不用了解采购员如何采购食材；\r\n</p>\r\n<p>\r\n	厨师不用知道服务员接待了哪位客人，不用知道采购员如何采购食材；\r\n</p>\r\n<p>\r\n	同样，采购员不用知道服务员接待了哪位客人，不用知道厨师如何做菜。\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	他们三者是如何联系的？\r\n</p>\r\n<p>\r\n	比如：厨师会做：炒茄子、炒鸡蛋、炒面——此时构建三个方法（&nbsp;cookEggplant()、cookEgg()、cookNoodle())\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	顾客直接和服务员打交道，顾客和服务员（UI层）说：我要一个炒茄子，而服务员不负责炒茄子，她就把请求往上递交，传递给厨师（BLL层），厨师需要茄子，就把请求往上递交，传递给采购员（DAL层），采购员从仓库里取来茄子传回给厨师，厨师响应cookEggplant()方法，做好炒茄子后，又传回给服务员，服务员把茄子呈现给顾客。\r\n</p>\r\n<p>\r\n	这样就完成了一个完整的操作。\r\n</p>\r\n<p>\r\n	在此过程中，<strong><span style=\"color:#E53333;\">茄子作为参数在三层中传递，</span></strong>如果顾客点炒鸡蛋，则鸡蛋作为参数（这是变量做参数）。\r\n</p>\r\n<p>\r\n	如果，用户增加需求，我们还得在方法中添加参数，一个方法添加一个，一个方法设计到三层；何况实际中并不止设计到一个方法的更改。所以，为了解决这个问题，我们可以把茄子、鸡蛋、面条作为属性定义到顾客实体中，一旦顾客增加了炒鸡蛋需求，直接把鸡蛋属性拿出来用即可，不用再去考虑去每层的方法中添加参数了，更不用考虑参数的匹配问题。\r\n</p>\r\n<p>\r\n	这样讲，不知道大家是不是可以明白。（待会实例解释吧）\r\n</p>\r\n<p>\r\n	###################################################################\r\n</p>\r\n<p>\r\n	<u><u> </u></u> \r\n</p>\r\n<div>\r\n	<u><u><u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u><u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u></u> </u></u> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	2，为什么使用三层？\r\n</h2>\r\n<p>\r\n	使用三层架构的目的：<span style=\"font-size:32px;color:#009900;\">解耦！！！</span><br />\r\n同样拿上面饭店的例子来讲：<br />\r\n（1）服务员（UI层）请假——另找服务员；\r\n</p>\r\n<p>\r\n	厨师（BLL层）辞职——招聘另一个厨师；\r\n</p>\r\n<p>\r\n	采购员（DAL）辞职——招聘另一个采购员；<br />\r\n（2）顾客反映：<br />\r\n1&gt;你们店服务态度不好——服务员的问题。开除服务员；<br />\r\n2&gt;你们店菜里有虫子——厨师的问题。换厨师；<br />\r\n<span style=\"color:#E53333;\">&nbsp;任何一层发生变化都不会影响到另外一层！！！</span> \r\n</p>\r\n<h2>\r\n	3、与两层的区别？\r\n</h2>\r\n<p>\r\n	两层：\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/201801/2af63b9022ef2a05dccee383a2baae2c.png\" alt=\"\" /><br />\r\n<br />\r\n（当任何一个地方发生变化时，都需要重新开发整个系统。“多层”放在一层，分工不明确耦合度高——难以适应需求变化，可维护性低、可扩展性低）\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	三层：\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/201801/f52a5d555afe47d0e06f59f532f8ede4.png\" alt=\"\" /><br />\r\n（发生在哪一层的变化，只需更改该层，不需要更改整个系统。层次清晰，分工明确，每层之间耦合度低——提高了效率，适应需求变化，可维护性高，可扩展性高）\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	综上：三层架构的<span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-size:16px;\">优势：</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#333333;\"><u><em>1</em></u></span><span style=\"color:#333333;\"><u><em>，结构清晰、耦合度低</em></u></span><span style=\"color:#333333;\"><u><em>,</em></u></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#333333;\"><u><em>2</em></u></span><span style=\"color:#333333;\"><u><em>，可维护性高，可扩展性高；</em></u></span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#333333;\"><u><em>3</em></u></span><span style=\"color:#333333;\"><u><em>，利于开发任务同步进行；容易适应需求变化</em></u></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#E53333;font-size:14px;\">劣势：</span><span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:SimHei;\"><em>1</em></span><em><span style=\"font-family:SimHei;\">、降低了系统的性能。这是不言而喻的。如果不采用分层式结构，很多业务可以直接造访数据库，以此获取相应的数据，如今却必须通过中间层来完成。</span></em><span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:SimHei;\"><em>2</em></span><em><span style=\"font-family:SimHei;\">、有时会导致级联的修改。这种修改尤其体现在自上而下的方向。如果在表示层中需要增加一个功能，为保证其设计符合分层式结构，可能需要在相应的业务逻辑层和数据访问层中都增加相应的代码</span></em><span></span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:SimHei;\"><em>3</em></span><em><span style=\"font-family:SimHei;\">、增加了代码量，增加了工作量</span></em> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	文章出处：http://blog.csdn.net/hanxuemin12345/article/details/8544957\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '三层结构', 67, 'N', 'N', '', '', 0, 0, 'N', 1517386082, 0, 'Y', 0, '', 'Y', 1517327796);
INSERT INTO `bage_post` VALUES (95, 1, '', '', '支付宝付款码如何做到防止盗刷的', '', '', '', '', '', '', '', 18, 0, '支付宝付款码如何做到被盗用的', '', '', '支付宝付款码如何做到被盗用的', '', '<p>\r\n	&nbsp; &nbsp; 最近在超市购物又没带现金，我边让旁边的哥们用手机把我的付款码拍下，以防手机没电无法支付的尴尬，之后手机还算给你支撑到了付款，后来我也要求这位把拍摄的二维码彻底删除。我再回来的路上，思考若别人拿你的支付码做文章会不会出现被盗刷的现象呢。&nbsp; 通过查询百度知乎等支付宝付款码可能采取的安全措施\r\n</p>\r\n<ol>\r\n	<li>\r\n		付款码里的二维码是有时间限制的，每分钟会自动更新一次。rn\r\n	</li>\r\n	<li>\r\n		rn		虽然没有深入研究，不过我认为以当前时间（估计能精确到毫秒级别）为种子生成随机数，再将数据信息、验证信息和此随机数结合生成验证码就可以了吧。\r\n	</li>\r\n	<li>\r\n		rn		9.0版本引入”安全大脑“（支付宝最先进的功能）在你使用扫码付款时，它具有识别主人的功能，但凡发现不是主人在使用支付宝，会立刻开启保护模式。（<a href=\"http://m.9553.com/article/35384.htm\" target=\"_blank\">详细介绍</a>&nbsp;）<a href=\"https://www.zhihu.com/question/33267586\" target=\"_blank\">知乎讨论：</a>\r\n	</li>\r\n</ol>', '', '', '', '支付宝,如何', 339, 'N', 'N', '', '', 0, 0, 'N', 1517398063, 0, 'Y', 0, '', 'Y', 1496581838);
INSERT INTO `bage_post` VALUES (103, 1, '', '', '如何提高自己的商业头脑', '', '', '', '', '', '', '', 20, 0, '', '', '商业头脑', '商业头脑', '商业头脑', '&nbsp; &nbsp; &nbsp; &nbsp;如果你是一名想要创业的人，或者已经在创业的阶梯上，遇到这类问题，我觉得可以从不断地打拼和失败、社交中磨练、提升自己。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>第一，多看这方面的书籍，增加大脑知识裤的容量，像网上的一些畅销书，我想任何一本只要仔细阅读都可以加深你对经商的热情。因为任何实践都离不开理论知识的奠基，才能在实践是更快更有利地吸收、融入进去。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>第二，要熟练地掌握有效地沟通技巧。首先多耐心地倾听别人的想法，看别人怎么做，多听多练，用最真诚的话语打动对方，语气不能太过强硬，要学会多说赞美的话，然后多向别人推销自己，像产品一样多在‘市场上’被广大人群所知道。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>第三，要学会忍耐，不断地在失败中磨练自己，从失败中提取失败的原因加以炼化，保持求胜的意志和信心，然后越挫越勇。每一位成功者的背后都会有无数次失败和煎熬，痛苦与想要放弃的念头，但他坚持下来了，所以成功了。人要学会不放过自己，让自己在逆境中走得越来越高。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>第四，在这千万的企业中，有已经很成熟并且能力好，稳固的，有新崛起和你一样打拼的，你要发掘自己的优势，善于和竞争对手比巧智，敢于争夺和开辟市场，这样才能在行业中脱颖而出，不然你凭什么让客户放弃那些根基稳定的企业选择初出茅庐的你。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>第五，经商者要懂得把握分寸，要抬得起价格，抓得住底线。与人合作，最主要的是诚信，要与人利益，与己利益，不要面对客户的刁难就放松了警惕让自己走在与己不利的边缘，而悔了自己。<span>&nbsp; &nbsp; &nbsp; &nbsp;</span><br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>创业，首先就是经商头脑，在这其中需要有的就是诚信、变通、合作、道德、野心和能力，缺一不可。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>提升自己的经商头脑，首先自己必须要有经商的概念，如果你都不知道什么是经商，那么更不用提怎么提升经商头脑了。其次，要明白经商的市场变化，关注政策变化，然后从中观察。最后，学习前人经验，从中获取重要信息。<br />\r\n提升自我的经商头脑，首先我们要对经商有一个深入的了解，我认为在这个阶段应该多读读有关经商方面的书籍，或者参加一些有关课程教育，深入了解经商，从中获取相关信息，并能用自己的方式去理解这一概念，培养对经商的兴趣。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>多去观察，多去调查，不能只坐在家里看新闻，看报道，这只是纸上谈兵，不能很好的提高自己的经商头脑，多关注一些国家对商业的规划和限制，在市场中发现商机，收集相关资料，做出整理，并从中研究，商业的奥秘。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>多学习前人经验，虽说成功不能复制，但可以从中获得一些对自己有利的商业观念。就比如说，为什么马云能把网络做的如此顺畅，那是因为他用发展的眼光去看待市场发展，具有前瞻性，虽说不是每个人都有这种头脑，但我们可以去借鉴，去学习，把别人的变成自己的，从而提高自己的商业头脑。<br />\r\n大家一定知道最近播放的比较火的电视剧《那年花开月正圆》，孙俪在剧中饰演了一位从一个什么也不懂的民间女子变成了远近知名的秦商首富，她就是在不断学习中，才有如此的经商头脑，她的成功离不开公公的教导和影响，公公对她以后的经商之路起到了铺垫作用。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>要想提升自己的经商头脑首先你得让自己接触接触经商，懂得经商的定义与经商的意义，对经商这件事有些特别的兴趣和独特的看法。在平时的生活当中要自己多主动去了解经商，用经商的思想思考问题，同时在空闲时间你也可以多读一些关于经商的书籍，让自己从书本当中学到自己想要了解的经商知识，并且通过对经商书籍的阅读总结出自己对经商的看法和对作者所写的关于经商的评价。<br />\r\n这样你所读的经商书籍才能对你提升自己的经商头脑起到作用，使自己对经商有些更加深刻的认识，并且以后遇到经商问题时才能使自己有更多的知识储备，用自己学到的知识独自去解答经商问题。<br />\r\n<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>除此之外，你也可以选择多与那些从事经商的成功人士交流，像他们学习先进科学的经商经验，孜孜不倦的汲取他们所拥有的经商知识，恭敬耐心的像他们询问自己的疑惑，让他们帮助你解决你自身存在的一些问题，希望他们给你指导性的意见，让你学会如何经商学会更好的经商。<br />\r\n<p>\r\n	<span>&nbsp; &nbsp; &nbsp; &nbsp;</span>这样从成功人士当中学到的经商知识是极其宝贵的，他可以让你以后经商时知道那些成功商人是如何成功的，可以让自己模范那些成功人士的经商方式，同时也可以让自己从那些成功人士当中遇见但自己可能将会遇到的问题，这样对提升你的经商头脑有着很大的作用。\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; 来源：https://zhidao.baidu.com/question/1900255146421852820.html\r\n</p>\r\n<p>\r\n</p>', '', '', '', '商业头脑', 42, 'N', 'N', '', '', 0, 0, 'N', 1517479671, 0, 'Y', 0, '', 'Y', 1517479554);
INSERT INTO `bage_post` VALUES (96, 1, '', '', '客观评价【武汉】和【杭州】两座省会城市', '', '', 'font-weight:bold;', 'a:1:{s:4:\"bold\";s:1:\"Y\";}', '', '', '', 18, 0, '', '', '', ' 我是个在杭州IT三巨头工作的武汉人，之前全国已去过十几个城市旅游，已在杭州买了13W左右的代步车，目前还未决定定居杭州，客观评价下武汉和杭州两座城市优劣。', '', '&nbsp;<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">我是个在杭州IT三巨头工作的武汉人，之前全国已去过十几个城市旅游，已在杭州买了13W左右的代步车，目前还未决定定居杭州，客观评价下武汉和杭州两座城市优劣。</span><br />\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">【杭州】</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\"><img src=\"/uploads/201801/b102a514f734960e4c42bf7f67520130.jpeg\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">优点：民营企业多且发展良好，市民素质高，百姓很友善，人均收入高于武汉，生活物价水平与武汉基本平齐。就业机会和选择面较宽。</span><br />\r\n<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">缺点：房价高，均价2.6W是保守，相比武汉均价1W来说，作为外地人就是月薪拿1W也很难买房定居杭州，当然如果你选择炒房产，杭州新区萧山余杭的房价增幅空间非常大，这里投资回报率会比武汉高。交通差：从地铁建设和地面交通建设看落后武汉不止3年，地面交通来看杭州几乎可以说没有什么立体交通规划，立交桥建设少的可怜，导致我在杭州高架上开车基本是蚂蚁走路走走停停，大跌眼镜。地铁交通：1号线建成不久，而且线路走的很偏实用性很低。剩下2号线预估最快在2017年建设，这和武汉今年要开通的3号线比起来，地铁建设落后太多。</span><br />\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">【武汉】</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\"><img src=\"/uploads/201801/795688cd1624a217cd1801e061b1bf5a.jpeg\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">优点：作为在家乡待了二十多年的人来说，最大印象就是武汉遍地美食，是杭州乃至其他城市无法比拟的，从种类繁多的早餐，到各种美味的夜宵，相信无论是外地人还是本地人都会留下深刻印象。其次武汉房价在全国来讲属于中下价位，对于买房定居来讲9000-1W的均价会让你在武汉比起杭州活的很轻松。交通武汉的主城区基本已完成70%立体交通建设，每个主路口都有立体高架桥，同时有机场快速通道。地铁：武汉基本保持一年通一线的高效建设，去年2号线，今天4号线，随着地铁线路的快速覆盖，加之武汉房价仍然偏低，未来5年武汉房价依然会稳步提升。</span><br />\r\nrn<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">缺点：去过很多城市，不单看杭州的话，武汉人的素质是偏低的，这点还是要客观承认，武汉人每次提到素质问题就会归咎于外地人多影响了武汉形象，这点诚然，但不能作为理由。据我所知，杭州总人口750W多，武汉900W多，杭州外地人口也占据了400W多，人家的人文管理为何就这么有秩序，为何外地人到武汉就变成那样，不得不反思，环境改变人。经济：由于武汉是重工业城市，科教、医疗、工业均优于杭州，由于每年众多的大学毕业生，使武汉工作待遇低，竞争激烈，就业选择面狭窄，当然如果你在这座城市从事公务员、大学教师、医疗工作者那就另一说了。所以武汉需要学习杭州大力发展实体经济、扶持中小民营企业的发展才能更好的把武汉发展壮大。</span><br />\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">PS：说些歪的，武汉的美女要远多过杭州，但是穿衣时尚上杭州女人更会搭配，同时奢侈品消费需求也高于武汉，杭州偶遇的街头美女很少并且都是杭州周边非本地人，这点比较惋惜。再就是杭州的菜偏甜，实在吃不惯，当然跟上海比起来好多了。最后不得不说杭州作为上海的后花园，在经济发展上得到很多实惠，要是武汉能真正得到中央拨款就好了，每年中年都说要大力发展中部，结果都是口号，到了地方要钱的时候，中央又不给了，比较惋惜。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">&nbsp; &nbsp; &nbsp; 如果要旅游的话，杭州的风景名胜较多，历史底蕴也深厚，旅游产业的发展值得武汉学习。每次杭州的朋友要去武汉玩，我都说你把武汉小吃吃遍然后再乘船对比武汉东湖的大气与杭州西湖的精致就玩到了，黄鹤楼和雷峰塔一样，外面看看就行，进去就是坑爹货。哈哈</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">最后欢迎大家加入讨论，文明冷静就好，勿喷我哈~</span> \r\n</p>\r\n<p>\r\n	&nbsp;<a href=\"http://tieba.baidu.com/p/2582807135\" target=\"_blank\">http://tieba.baidu.com/p/2582807135</a> \r\n</p>\r\n<br />', '', '', '', '', 308, 'N', 'N', '', '', 0, 0, 'N', 1516774216, 0, 'Y', 0, '', 'Y', 1497023411);
INSERT INTO `bage_post` VALUES (98, 1, '', '', '49周之mysql读写分离原理以及在校内外的应用', '49周之mysql读写分离原理以及在校内外的应用', '', '', '', '', '', '', 18, 0, '', '', '', 'mysql读写分离原理', '', '&nbsp; &nbsp;MySQL复制，是指将主数据库的ddl和dml操作，通过二进制日志传到复制服务器（从库）上，然后在从库上对这些日志重新执行（也叫重做），从而实现主从库数据同步。<br />\r\nMySQL复制的原理<br />\r\n<span> </span>1、主库在事物提交时将数据变更为事件记录在Binlog（二进制文件）中<br />\r\n<span> </span>2、主库推送binlog中的事件到从库的RelayLog（中继日志）<br />\r\n<span> </span>3、从库根据relaylog重新做数据变更操作（通过逻辑复制达到主从数据一致）<br />\r\n主从复制中三个线程的变化<br />\r\n<span> </span>主库：binlogDump线程<br />\r\n<span> </span>从库：I/O线程和sql线程<br />\r\n<span> </span>主库启动复制<br />\r\n<span> </span>1、创建IO线程连接主库；<br />\r\n<span> </span>2、主库创建binlogDump线程读取数据库事件并发送给I/O线程；<br />\r\n<span> </span>3、I/O线程获取到事件数据后更新到从库的中继日志中<br />\r\n<span> </span>4、从库SQL线程读取中继日志中更新的数据库事件并应用<br />\r\n<div style=\"font-size:14px;\">\r\n</div>\r\n<!--5f39ae17-8c62-4a45-bc43-b32064c9388a:W3siYmxvY2tJZCI6IjU3ODMtMTUxMjkwNzcxNzg4MCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiICIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiICIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiICIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiICIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiTSIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoieSIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiUyIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiUSIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiTCIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi5aSNIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLliLYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuaYryJ9LHsiY2hhciI6IuaMhyJ9LHsiY2hhciI6IuWwhiJ9LHsiY2hhciI6IuS4uyJ9LHsiY2hhciI6IuaVsCJ9LHsiY2hhciI6IuaNriJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IueahCJ9LHsiY2hhciI6ImQifSx7ImNoYXIiOiJkIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6IuWSjCJ9LHsiY2hhciI6ImQifSx7ImNoYXIiOiJtIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6IuaTjSJ9LHsiY2hhciI6IuS9nCJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IumAmiJ9LHsiY2hhciI6Iui/hyJ9LHsiY2hhciI6IuS6jCJ9LHsiY2hhciI6Iui/myJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6IuaXpSJ9LHsiY2hhciI6IuW/lyJ9LHsiY2hhciI6IuS8oCJ9LHsiY2hhciI6IuWIsCJ9LHsiY2hhciI6IuWkjSJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6IuacjSJ9LHsiY2hhciI6IuWKoSJ9LHsiY2hhciI6IuWZqCJ9LHsiY2hhciI6Iu+8iCJ9LHsiY2hhciI6IuS7jiJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6Iu+8iSJ9LHsiY2hhciI6IuS4iiJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IueEtiJ9LHsiY2hhciI6IuWQjiJ9LHsiY2hhciI6IuWcqCJ9LHsiY2hhciI6IuS7jiJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IuS4iiJ9LHsiY2hhciI6IuWvuSJ9LHsiY2hhciI6Iui/mSJ9LHsiY2hhciI6IuS6myJ9LHsiY2hhciI6IuaXpSJ9LHsiY2hhciI6IuW/lyJ9LHsiY2hhciI6IumHjSJ9LHsiY2hhciI6IuaWsCJ9LHsiY2hhciI6IuaJpyJ9LHsiY2hhciI6IuihjCJ9LHsiY2hhciI6Iu+8iCJ9LHsiY2hhciI6IuS5nyJ9LHsiY2hhciI6IuWPqyJ9LHsiY2hhciI6IumHjSJ9LHsiY2hhciI6IuWBmiJ9LHsiY2hhciI6Iu+8iSJ9LHsiY2hhciI6Iu+8jCJ9LHsiY2hhciI6IuS7jiJ9LHsiY2hhciI6IuiAjCJ9LHsiY2hhciI6IuWuniJ9LHsiY2hhciI6IueOsCJ9LHsiY2hhciI6IuS4uyJ9LHsiY2hhciI6IuS7jiJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IuaVsCJ9LHsiY2hhciI6IuaNriJ9LHsiY2hhciI6IuWQjCJ9LHsiY2hhciI6IuatpSJ9LHsiY2hhciI6IuOAgiJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjEyODAtMTUxNDIxNDg5MDM2MCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiTSIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoieSIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiUyIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiUSIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiTCIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi5aSNIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLliLYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6IueahCIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi5Y6fIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLnkIYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6Ijc4NDQtMTUxNDIxNDU2NTI4MCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMSJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuS4uyJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IuWcqCJ9LHsiY2hhciI6IuS6iyJ9LHsiY2hhciI6IueJqSJ9LHsiY2hhciI6IuaPkCJ9LHsiY2hhciI6IuS6pCJ9LHsiY2hhciI6IuaXtiJ9LHsiY2hhciI6IuWwhiJ9LHsiY2hhciI6IuaVsCJ9LHsiY2hhciI6IuaNriJ9LHsiY2hhciI6IuWPmCJ9LHsiY2hhciI6IuabtCJ9LHsiY2hhciI6IuS4uiJ9LHsiY2hhciI6IuS6iyJ9LHsiY2hhciI6IuS7tiJ9LHsiY2hhciI6IuiusCJ9LHsiY2hhciI6IuW9lSJ9LHsiY2hhciI6IuWcqCJ9LHsiY2hhciI6IkIifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoibiJ9LHsiY2hhciI6ImwifSx7ImNoYXIiOiJvIn0seyJjaGFyIjoiZyJ9LHsiY2hhciI6Iu+8iCJ9LHsiY2hhciI6IuS6jCJ9LHsiY2hhciI6Iui/myJ9LHsiY2hhciI6IuWItiJ9LHsiY2hhciI6IuaWhyJ9LHsiY2hhciI6IuS7tiJ9LHsiY2hhciI6Iu+8iSJ9LHsiY2hhciI6IuS4rSJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjQ5MTEtMTUxNDIxNDcwMzU4MSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuS4uyJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IuaOqCJ9LHsiY2hhciI6IumAgSJ9LHsiY2hhciI6ImIifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoibiJ9LHsiY2hhciI6ImwifSx7ImNoYXIiOiJvIn0seyJjaGFyIjoiZyJ9LHsiY2hhciI6IuS4rSJ9LHsiY2hhciI6IueahCJ9LHsiY2hhciI6IuS6iyJ9LHsiY2hhciI6IuS7tiJ9LHsiY2hhciI6IuWIsCJ9LHsiY2hhciI6IuS7jiJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IueahCJ9LHsiY2hhciI6IlIifSx7ImNoYXIiOiJlIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6ImEifSx7ImNoYXIiOiJ5In0seyJjaGFyIjoiTCJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiJnIn0seyJjaGFyIjoi77yIIn0seyJjaGFyIjoi5LitIn0seyJjaGFyIjoi57unIn0seyJjaGFyIjoi5pelIn0seyJjaGFyIjoi5b+XIn0seyJjaGFyIjoi77yJIn1dLCJpc1JpY2hUZXh0Ijp0cnVlLCJrZWVwTGluZUJyZWFrIjp0cnVlfX0seyJibG9ja0lkIjoiMjE4MC0xNTE0MjE0NzkwOTk0IiwiYmxvY2tUeXBlIjoicGFyYWdyYXBoIiwic3R5bGVzIjp7ImFsaWduIjoibGVmdCIsImluZGVudCI6MCwidGV4dC1pbmRlbnQiOjAsImxpbmUtaGVpZ2h0IjoxLjc1fSwidHlwZSI6InBhcmFncmFwaCIsInJpY2hUZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiIzIn0seyJjaGFyIjoi44CBIn0seyJjaGFyIjoi5LuOIn0seyJjaGFyIjoi5bqTIn0seyJjaGFyIjoi5qC5In0seyJjaGFyIjoi5o2uIn0seyJjaGFyIjoiciJ9LHsiY2hhciI6ImUifSx7ImNoYXIiOiJsIn0seyJjaGFyIjoiYSJ9LHsiY2hhciI6InkifSx7ImNoYXIiOiJsIn0seyJjaGFyIjoibyJ9LHsiY2hhciI6ImcifSx7ImNoYXIiOiLph40ifSx7ImNoYXIiOiLmlrAifSx7ImNoYXIiOiLlgZoifSx7ImNoYXIiOiLmlbAifSx7ImNoYXIiOiLmja4ifSx7ImNoYXIiOiLlj5gifSx7ImNoYXIiOiLmm7QifSx7ImNoYXIiOiLmk40ifSx7ImNoYXIiOiLkvZwifSx7ImNoYXIiOiLvvIgifSx7ImNoYXIiOiLpgJoifSx7ImNoYXIiOiLov4cifSx7ImNoYXIiOiLpgLsifSx7ImNoYXIiOiLovpEifSx7ImNoYXIiOiLlpI0ifSx7ImNoYXIiOiLliLYifSx7ImNoYXIiOiLovr4ifSx7ImNoYXIiOiLliLAifSx7ImNoYXIiOiLkuLsifSx7ImNoYXIiOiLku44ifSx7ImNoYXIiOiLmlbAifSx7ImNoYXIiOiLmja4ifSx7ImNoYXIiOiLkuIAifSx7ImNoYXIiOiLoh7QifSx7ImNoYXIiOiLvvIkifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiIyNTE3LTE1MTQyMTQ4OTcwMTgiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnsiYWxpZ24iOiJsZWZ0IiwiaW5kZW50IjowLCJ0ZXh0LWluZGVudCI6MCwibGluZS1oZWlnaHQiOjEuNzV9LCJ0eXBlIjoicGFyYWdyYXBoIiwicmljaFRleHQiOnsiZGF0YSI6W3siY2hhciI6IuS4uyIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi5LuOIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLlpI0iLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6IuWItiIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi5LitIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLkuIkiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6IuS4qiIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi57q/Iiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLnqIsiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6IueahCIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoi5Y+YIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLljJYiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjI2ODQtMTUxNDIxNTAwNTkwNyIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoi5Li7Iiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLlupMiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6Iu+8miIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiYiJ9LHsiY2hhciI6ImkifSx7ImNoYXIiOiJuIn0seyJjaGFyIjoibCJ9LHsiY2hhciI6Im8ifSx7ImNoYXIiOiJnIn0seyJjaGFyIjoiRCJ9LHsiY2hhciI6InUifSx7ImNoYXIiOiJtIn0seyJjaGFyIjoicCJ9LHsiY2hhciI6Iue6vyJ9LHsiY2hhciI6IueoiyJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjM0OTgtMTUxNDIxNTAxNjc3NSIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoi5LuOIiwic3R5bGVzIjp7ImJvbGQiOnRydWV9fSx7ImNoYXIiOiLlupMiLCJzdHlsZXMiOnsiYm9sZCI6dHJ1ZX19LHsiY2hhciI6Iu+8miIsInN0eWxlcyI6eyJib2xkIjp0cnVlfX0seyJjaGFyIjoiSSJ9LHsiY2hhciI6Ii8ifSx7ImNoYXIiOiJPIn0seyJjaGFyIjoi57q/In0seyJjaGFyIjoi56iLIn0seyJjaGFyIjoi5ZKMIn0seyJjaGFyIjoicyJ9LHsiY2hhciI6InEifSx7ImNoYXIiOiJsIn0seyJjaGFyIjoi57q/In0seyJjaGFyIjoi56iLIn1dLCJpc1JpY2hUZXh0Ijp0cnVlLCJrZWVwTGluZUJyZWFrIjp0cnVlfX0seyJibG9ja0lkIjoiNjA2Ni0xNTE0MjE1MjI0NDA3IiwiYmxvY2tUeXBlIjoicGFyYWdyYXBoIiwic3R5bGVzIjp7ImFsaWduIjoibGVmdCIsImluZGVudCI6MCwidGV4dC1pbmRlbnQiOjAsImxpbmUtaGVpZ2h0IjoxLjc1fSwidHlwZSI6InBhcmFncmFwaCIsInJpY2hUZXh0Ijp7ImRhdGEiOlt7ImNoYXIiOiLkuLsifSx7ImNoYXIiOiLlupMifSx7ImNoYXIiOiLlkK8ifSx7ImNoYXIiOiLliqgifSx7ImNoYXIiOiLlpI0ifSx7ImNoYXIiOiLliLYifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI1NTkwLTE1MTQyMTUyNzI4MDYiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnsiYWxpZ24iOiJsZWZ0IiwiaW5kZW50IjowLCJ0ZXh0LWluZGVudCI6MCwibGluZS1oZWlnaHQiOjEuNzV9LCJ0eXBlIjoicGFyYWdyYXBoIiwicmljaFRleHQiOnsiZGF0YSI6W3siY2hhciI6IjEifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiLliJsifSx7ImNoYXIiOiLlu7oifSx7ImNoYXIiOiJJIn0seyJjaGFyIjoiTyJ9LHsiY2hhciI6Iue6vyJ9LHsiY2hhciI6IueoiyJ9LHsiY2hhciI6Iui/niJ9LHsiY2hhciI6IuaOpSJ9LHsiY2hhciI6IuS4uyJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6Iu+8myJ9XSwiaXNSaWNoVGV4dCI6dHJ1ZSwia2VlcExpbmVCcmVhayI6dHJ1ZX19LHsiYmxvY2tJZCI6IjY3ODktMTUxNDIxNTMxNTA5MCIsImJsb2NrVHlwZSI6InBhcmFncmFwaCIsInN0eWxlcyI6eyJhbGlnbiI6ImxlZnQiLCJpbmRlbnQiOjAsInRleHQtaW5kZW50IjowLCJsaW5lLWhlaWdodCI6MS43NX0sInR5cGUiOiJwYXJhZ3JhcGgiLCJyaWNoVGV4dCI6eyJkYXRhIjpbeyJjaGFyIjoiMiJ9LHsiY2hhciI6IuOAgSJ9LHsiY2hhciI6IuS4uyJ9LHsiY2hhciI6IuW6kyJ9LHsiY2hhciI6IuWImyJ9LHsiY2hhciI6IuW7uiJ9LHsiY2hhciI6ImIifSx7ImNoYXIiOiJpIn0seyJjaGFyIjoibiJ9LHsiY2hhciI6ImwifSx7ImNoYXIiOiJvIn0seyJjaGFyIjoiZyJ9LHsiY2hhciI6IkQifSx7ImNoYXIiOiJ1In0seyJjaGFyIjoibSJ9LHsiY2hhciI6InAifSx7ImNoYXIiOiLnur8ifSx7ImNoYXIiOiLnqIsifSx7ImNoYXIiOiLor7sifSx7ImNoYXIiOiLlj5YifSx7ImNoYXIiOiLmlbAifSx7ImNoYXIiOiLmja4ifSx7ImNoYXIiOiLlupMifSx7ImNoYXIiOiLkuosifSx7ImNoYXIiOiLku7YifSx7ImNoYXIiOiLlubYifSx7ImNoYXIiOiLlj5EifSx7ImNoYXIiOiLpgIEifSx7ImNoYXIiOiLnu5kifSx7ImNoYXIiOiJJIn0seyJjaGFyIjoiLyJ9LHsiY2hhciI6Ik8ifSx7ImNoYXIiOiLnur8ifSx7ImNoYXIiOiLnqIsifSx7ImNoYXIiOiLvvJsifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI2MDYxLTE1MTQyMTUzODM5MjciLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnsiYWxpZ24iOiJsZWZ0IiwiaW5kZW50IjowLCJ0ZXh0LWluZGVudCI6MCwibGluZS1oZWlnaHQiOjEuNzV9LCJ0eXBlIjoicGFyYWdyYXBoIiwicmljaFRleHQiOnsiZGF0YSI6W3siY2hhciI6IjMifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiJJIn0seyJjaGFyIjoiLyJ9LHsiY2hhciI6Ik8ifSx7ImNoYXIiOiLnur8ifSx7ImNoYXIiOiLnqIsifSx7ImNoYXIiOiLojrcifSx7ImNoYXIiOiLlj5YifSx7ImNoYXIiOiLliLAifSx7ImNoYXIiOiLkuosifSx7ImNoYXIiOiLku7YifSx7ImNoYXIiOiLmlbAifSx7ImNoYXIiOiLmja4ifSx7ImNoYXIiOiLlkI4ifSx7ImNoYXIiOiLmm7QifSx7ImNoYXIiOiLmlrAifSx7ImNoYXIiOiLliLAifSx7ImNoYXIiOiLku44ifSx7ImNoYXIiOiLlupMifSx7ImNoYXIiOiLnmoQifSx7ImNoYXIiOiLkuK0ifSx7ImNoYXIiOiLnu6cifSx7ImNoYXIiOiLml6UifSx7ImNoYXIiOiLlv5cifSx7ImNoYXIiOiLkuK0ifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fSx7ImJsb2NrSWQiOiI0NTkwLTE1MTQyMTU0NjUyMTIiLCJibG9ja1R5cGUiOiJwYXJhZ3JhcGgiLCJzdHlsZXMiOnsiYWxpZ24iOiJsZWZ0IiwiaW5kZW50IjowLCJ0ZXh0LWluZGVudCI6MCwibGluZS1oZWlnaHQiOjEuNzV9LCJ0eXBlIjoicGFyYWdyYXBoIiwicmljaFRleHQiOnsiZGF0YSI6W3siY2hhciI6IjQifSx7ImNoYXIiOiLjgIEifSx7ImNoYXIiOiLku44ifSx7ImNoYXIiOiLlupMifSx7ImNoYXIiOiJTIn0seyJjaGFyIjoiUSJ9LHsiY2hhciI6IkwifSx7ImNoYXIiOiLnur8ifSx7ImNoYXIiOiLnqIsifSx7ImNoYXIiOiLor7sifSx7ImNoYXIiOiLlj5YifSx7ImNoYXIiOiLkuK0ifSx7ImNoYXIiOiLnu6cifSx7ImNoYXIiOiLml6UifSx7ImNoYXIiOiLlv5cifSx7ImNoYXIiOiLkuK0ifSx7ImNoYXIiOiLmm7QifSx7ImNoYXIiOiLmlrAifSx7ImNoYXIiOiLnmoQifSx7ImNoYXIiOiLmlbAifSx7ImNoYXIiOiLmja4ifSx7ImNoYXIiOiLlupMifSx7ImNoYXIiOiLkuosifSx7ImNoYXIiOiLku7YifSx7ImNoYXIiOiLlubYifSx7ImNoYXIiOiLlupQifSx7ImNoYXIiOiLnlKgifV0sImlzUmljaFRleHQiOnRydWUsImtlZXBMaW5lQnJlYWsiOnRydWV9fV0=-->', '', '', '', '读写分离原理', 79, 'N', 'N', '', '', 0, 0, 'N', 1516628162, 0, 'Y', 0, '', 'Y', 1514185011);
INSERT INTO `bage_post` VALUES (104, 1, '', '', '如何php防止XSS攻击', '', '', '', '', '', '', '', 18, 0, '面试被问及到xss', '', 'xss', 'xss', 'xss', 'xss 原称Cross Site Scripting<br />\r\n如何产生的<br />\r\nXSS攻击也可以算是对HTML和JS的一种注入<br />\r\n<p>\r\n	用户提交了别有用心的可执行js或其他脚本。\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/201802/7363c6f9b6a8d4b9ebd5eed9a96cfa00.jpg\" alt=\"\" /> \r\n</p>\r\n如何避免？<br />\r\n<h3>\r\n	1、htmlentities(string , [可选]flags, [可选]character-set , [可选]double_encode) 把字符转换为HTML实体。\r\n</h3>\r\n<span> </span> \r\n<p>\r\n	例如：\r\n</p>\r\n<pre class=\"prettyprint lang-php\">&lt;?php  \r\n$str = \"Jane &amp; \'Tarzan\'\";  \r\necho htmlentities($str, ENT_COMPAT); // Will only convert double quotes  \r\necho \"&lt;br&gt;\";  \r\necho htmlentities($str, ENT_QUOTES); // Converts double and single quotes  \r\necho \"&lt;br&gt;\";  \r\necho htmlentities($str, ENT_NOQUOTES); // Does not convert any quotes  \r\n?&gt; </pre>\r\n&nbsp;<br />\r\n<span> </span>//查看源码<br />\r\n<pre class=\"prettyprint lang-html\">&lt;!DOCTYPE html&gt;  \r\n&lt;html&gt;  \r\n&lt;body&gt;  \r\nJane &amp; \'Tarzan\'&lt;br&gt;  \r\nJane &amp; \'Tarzan\'&lt;br&gt;  \r\nJane &amp; \'Tarzan\'  \r\n&lt;/body&gt;  \r\n&lt;/html&gt;  </pre>\r\n<br />\r\n<span> </span>//浏览器查看<br />\r\n<pre class=\"prettyprint lang-php\">Jane &amp; \'Tarzan\'\r\nJane &amp; \'Tarzan\'\r\nJane &amp; \'Tarzan\'\r\n</pre>\r\n<br />\r\n<h3>\r\n	2、方法二 对COOKIE进行IP绑定\r\n</h3>\r\ncookie里面一般有自动登录的信息和session_id。对cookie进行IP绑定（当然也可以同时绑定客户端其他用户信息，根据用户的IP来判断这个cookie是不是原始授权用户。<br />\r\n&nbsp; &nbsp; //代码如下<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-php\">    用户设置了自动登录时保存自动登录信息:\r\n    $auto=I(\'post.auto\');//用户设置了自动登录\r\n    if(!empty($auto)){\r\n        cookie(\'auto\',encrypt(serialize($data)));//将登录信息保存到cookie,其中$data里含有加密后的帐号，密码，和用户的IP，这里的cookie已在全局中设置过期日期为一周\r\n    }\r\n    用户关闭浏览器再次访问网站时，进行自动登录\r\n    if (!is_login()) {//是否未登录状态?\r\n        $auth=cookie(\'auto\');\r\n        if(!empty($auth)){//是否未有自动登录cookie?\r\n            $data=unserialize(decrypt($auth));\r\n            if(!empty($data) &amp;&amp; !empty($data[\'username\']) &amp;&amp; !empty($data[\'password\']) &amp;&amp; !empty($data[\'last_login_ip\'])){\r\n                $user=M(\'Member\')-&gt;where(array(\'username\'=&gt;$data[\'username\'],\'password\'=&gt;$data[\'password\']))-&gt;find();\r\n                if(!empty($user[\'id\'])&amp;&amp;($user[\'last_login_ip\']==get_client_ip())){//cookie帐号密码是否有效?//IP来源是否相同?\r\n                    login_session($user[\'id\'], $user[\'username\'], $data[\'last_login_ip\']);//用户自动登录成功\r\n                }\r\n            }\r\n        }\r\n    }\r\n</pre>\r\n<pre class=\"prettyprint lang-php\">3、CSRF</pre>\r\n<pre class=\"prettyprint lang-php\">   跨站请求伪造（英语：Cross-site request forgery），也被称为one-click attack或者session riding，</pre>\r\n<pre class=\"prettyprint lang-php\">通常缩写为CSRF或者XSRF， 是一种挟制用户在当前已登录的Web应用程序上执行非本意的操作的攻击方法。</pre>\r\n<pre class=\"prettyprint lang-php\">【案例】laravel中的跨站请求伪造</pre>\r\n<pre class=\"prettyprint lang-php\">   跨站请求伪造是一种通过伪装授权用户的请求来利用授信网站的恶意漏洞。Laravel 使得防止应用\r\n遭到跨站请求伪造攻击变得简单。\r\nLaravel 自动为每一个被应用管理的有效用户会话生成一个 CSRF “令牌”，该令牌用于验证授权用户和发起请求者是否是同一个人。\r\n原理图如下：</pre>\r\n<pre class=\"prettyprint lang-php\"><img src=\"/uploads/201802/bf2895fd6903fac614527c967fb2d0e3.png\" alt=\"\" /> </pre>\r\n<pre class=\"prettyprint lang-php\">整理至互联网，后续继续总结！</pre>\r\n<pre class=\"prettyprint lang-php\">\r\n	\r\n<div>\r\n	\r\n</div>\r\n</pre>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '', 54, 'N', 'N', '', '', 0, 0, 'N', 1517487279, 0, 'Y', 0, '', 'Y', 1517486297);
INSERT INTO `bage_post` VALUES (105, 1, '', '', 'web中网站用户信息redis的hash方式存储', '', '', '', '', '', '', '', 18, 0, '', '', 'redis的hash方式存储', 'redis的hash方式存储', 'redis的hash方式存储', '&nbsp; &nbsp; &nbsp;存储一个用户信息对象数据(name、age、birthday),uid 作为key ,存储的value用户对象包含姓名，年龄，生日等用户信息 userInfoObj。<br />\r\n<ul>\r\n	<li>\r\n		方法一、序列化用户信息对象-userInfoObj，弊端是增加序列化/反序列化的开销。\r\n	</li>\r\n	<li>\r\n		方法二、存储多个key-value对，比如8000_name=tanjian,8000_age=29。弊端用户ID为重复存储，如果存在大量这样的数据，会造成内存浪费。\r\n	</li>\r\n	<li>\r\n		总结：那么Redis提供的Hash很好的解决了这个问题，Redis的Hash实际是内部存储的Value为一个HashMap，并提供了直接存取这个Map成员的接口,如下图：\r\n	</li>\r\n</ul>\r\n<br />\r\n<img src=\"/uploads/201802/0149bc298e10c507f0f331c488604962.jpeg\" alt=\"\" /><br />\r\n也就是说，Key仍然是用户ID, value是一个Map，这个Map的key是成员的属性名，value是属性值，这样对数据的修改和存取都可以直接通过其内部Map的Key(Redis里称内部Map的key为field), 也就是通过 key(用户ID) + field(属性标签) 就可以操作对应属性数据了，既不需要重复存储数据，也不会带来序列化和并发修改控制的问题。很好的解决了问题。<br />\r\n<p style=\"color:#333333;font-family:verdana, &quot;font-size:14px;background-color:#FAF7EF;\">\r\n	这里同时需要注意，Redis提供了接口(hgetall)可以直接取到全部的属性数据,但是如果内部Map的成员很多，那么涉及到遍历整个内部Map的操作，由于Redis单线程模型的缘故，这个遍历操作可能会比较耗时，而另其它客户端的请求完全不响应，这点需要格外注意。\r\n</p>\r\n<p style=\"color:#333333;font-family:verdana, &quot;font-size:14px;background-color:#FAF7EF;\">\r\n	<strong>实现方式：</strong> \r\n</p>\r\n<p style=\"color:#333333;font-family:verdana, &quot;font-size:14px;background-color:#FAF7EF;\">\r\n	&nbsp; &nbsp; &nbsp; 上面已经说到Redis Hash对应Value内部实际就是一个HashMap，实际这里会有2种不同实现，这个Hash的成员比较少时Redis为了节省内存会采用类似一维数组的方式来紧凑存储，而不会采用真正的HashMap结构，对应的value redisObject的encoding为zipmap,当成员数量增大时会自动转成真正的HashMap,此时encoding为ht。如图\r\n</p>\r\n<p style=\"color:#333333;font-family:verdana, &quot;font-size:14px;background-color:#FAF7EF;\">\r\n	<img src=\"/uploads/201802/424d09cf8b62ed3c3c176186b03e2e4e.png\" alt=\"\" /> \r\n</p>\r\n<br />\r\n<br />', '', '', '', 'redis,hash', 89, 'N', 'N', '', '', 0, 0, 'N', 0, 0, 'Y', 0, '', 'Y', 1517585241);
INSERT INTO `bage_post` VALUES (106, 1, '', '', '使用scrapy爬虫分析全杭州小区价格', '', '', '', '', '', '', '', 18, 0, '    第一次写爬虫的博客，主要分析了杭州的小区价格情况，本次采集的是安居客约1500条数据。', '', '使用scrapy爬虫分析全杭州小区价格', 'scrapy', 'scrapy', '<p>\r\n	&nbsp; &nbsp;使用了比较常见的一款分布式企业级的爬虫软件scrapy。首先你得安装好爬虫环境，我基于mac安装的是1.4.0版本。\r\n</p>\r\n<p>\r\n	&nbsp; &nbsp;大致步骤如下\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<ul>\r\n	<li>\r\n		1、dom结构分析\r\n	</li>\r\n	<li>\r\n		2、编写spider实例-anjuke/spiders/anjuke_spider.py\r\n	</li>\r\n	<li>\r\n		3、编写管道--anjuke/pipelines.py\r\n	</li>\r\n	<li>\r\n		4、修改配置anjuke/settings.py\r\n	</li>\r\n	<li>\r\n		5、编写执行脚本anjuke/spiders/run.py\r\n	</li>\r\n</ul>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; 现在就各个步骤详细说明\r\n</p>\r\n<h4>\r\n	1、dom结构分析\r\n</h4>\r\n<p>\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>&nbsp; &nbsp; URL地址为：<a href=\"https://hangzhou.anjuke.com/community/p15/\">https://hangzhou.anjuke.com/community/p15/</a>，其实dom结构比较耗费时间的，需要好好总结。</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/uploads/201802/db5a5fa2564dcd9b8acbc3e07010e6d3.png\" alt=\"\" /> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<h4>\r\n	2、编写spider实例-anjuke/spiders/anjuke_spider.py\r\n</h4>\r\n<p>\r\n	<img src=\"/uploads/201802/25a2474095469cef631d77f90b124b93.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h4>\r\n	3、编写管道--anjuke/pipelines.py\r\n</h4>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp;设计表结构和编写数据处理。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-css\">| anjuke_tb | CREATE TABLE `anjuke_tb` (\r\n  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,\r\n  `name` varchar(100) DEFAULT NULL COMMENT \'地址或商铺名称\',\r\n  `avg_price` int(5) DEFAULT NULL COMMENT \'均价\',\r\n  `request_url` varchar(100) DEFAULT NULL COMMENT \'请求URL\',\r\n  `c_time` varchar(10) DEFAULT NULL COMMENT \'录入时间\',\r\n  PRIMARY KEY (`id`)</pre>\r\n<h4>\r\n	4、修改配置anjuke/settings.py\r\n</h4>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-py\">BOT_NAME = \'anjuke\'\r\nSPIDER_MODULES = [\'anjuke.spiders\']\r\nNEWSPIDER_MODULE = \'anjuke.spiders\'\r\nDEPTH_LIMIT = 100 #4\r\nDOWNLOAD_DELAY = 2\r\nUSER_AGENT = \'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36\'\r\nFEED_EXPORT_ENCODING = \'utf-8\'\r\nITEM_PIPELINES = {\r\n   \'anjuke.pipelines.AnjukePipeline\': 300,\r\n}\r\n</pre>\r\n<h4>\r\n	5、编写执行脚本anjuke/spiders/run.py\r\n</h4>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-php\"># coding:utf-8\r\nfrom scrapy import cmdline\r\ncmdline.execute(\"scrapy crawl ajk_community -o review_xzl.json\".split())\r\n</pre>\r\n<h4>\r\n	6、执行脚本\r\n</h4>\r\n<p>\r\n	<img src=\"/uploads/201802/31177b72e429ead6196cd7b19d40a402.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/uploads/201802/796d711bf07bf5cdc2061817290d6ef4.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h4>\r\n	7、数据分析\r\n</h4>\r\n<p>\r\n	<span>本次采集的是安居客约1500条数据。</span>\r\n</p>\r\n<p>\r\n	全杭州最贵的五个豪宅\r\n</p>\r\n<h3>\r\n	<span></span> \r\n</h3>\r\n<p class=\"MsoNormal\">\r\n	<span>+------+-----------------------+-----------+</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>| id&nbsp;&nbsp;\r\n| name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |\r\navg_price |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>+------+-----------------------+-----------+</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n188 | </span>绿城江南里<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;\r\n193548 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n702 | </span>绿城云栖玫瑰园<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;\r\n141578 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;&nbsp;\r\n76 | </span>元福里<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 133333 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#E53333;\">|&nbsp;\r\n186 | </span><span style=\"color:#E53333;\">武林壹号</span><span style=\"color:#E53333;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; 99358 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n986 | </span>云栖蝶谷<span>(</span>别墅<span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; 95008 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n918 | </span>钱塘帝景<span>(</span>别墅<span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; 86687 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>| 1069 | </span>嘉禾苑<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; 86131 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n457 | </span>武林外滩<span>(</span>公寓<span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; 82403 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n659 | </span>杭州阳明谷<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; 81885 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>|&nbsp;\r\n346 | </span>阳明谷度假村<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;\r\n76460 |</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>&nbsp;</span> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>+------+-----------------------+-----------+</span> \r\n</p>\r\n&nbsp; &nbsp; &nbsp; 第一次写爬虫教程，多有不足请多包涵或给出建议。\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<pre class=\"prettyprint lang-php\"></pre>\r\n<pre class=\"prettyprint lang-php\"></pre>\r\n<pre class=\"prettyprint lang-php\"></pre>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', 'scrapy,杭州豪宅', 196, 'N', 'N', '', '', 0, 0, 'N', 1517850558, 0, 'Y', 0, '', 'Y', 1517850269);
INSERT INTO `bage_post` VALUES (107, 1, '', '', 'MyISAM的锁调度机制', '', '', '', '', '', '', '', 18, 0, '', '', 'MyISAM的锁调度机制', 'MyISAM的锁调度机制', 'MyISAM的锁调度机制', '<p>\r\n	&nbsp; &nbsp; &nbsp;MyISAM的锁调度机制,如图。\r\n</p>\r\n<p>\r\n	<img src=\"/uploads/201802/4763d1c03a403d2316d9c25e5c4b4709.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '', 26, 'N', 'N', '', '', 0, 0, 'N', 0, 0, 'Y', 0, '', 'Y', 1518356672);
INSERT INTO `bage_post` VALUES (109, 1, '', '', 'http长连接和短链接的理解', '', '', '', '', '', '', '', 18, 0, '', '', '', '', '', '<h2>\r\n	短连接\r\n</h2>\r\n<span style=\"font-size:16px;\">浏览器client发起并建立TCP连接&nbsp;</span><br />\r\n<span style=\"font-size:16px;\"> -&gt; client发送HttpRequest报文&nbsp;</span><br />\r\n<span style=\"font-size:16px;\"> -&gt; server接收到报文</span><br />\r\n<span style=\"font-size:16px;\"> -&gt;server handle并发送HttpResponse报文给前端,发送完毕之后立即调用socket.close方法</span><br />\r\n<span style=\"font-size:16px;\"> -&gt;client接收response报文</span><br />\r\n<span style=\"font-size:16px;\"> -&gt;client最终会收到server端断开TCP连接的信号</span><br />\r\n<span style=\"font-size:16px;\"> -&gt;client 端断开TCP连接，具体就是调用close方法</span><br />\r\n<span style=\"font-size:16px;\"> 也可以这样说：</span><br />\r\n<span style=\"font-size:16px;\"> 短连接是指SOCKET连接后，发送接收完数据后马上断开连接。</span><br />\r\n<p>\r\n	<span style=\"font-size:16px;\">因为连接后接收了数据就断开了，所以每次数据接受处理不会有联系。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">这也是HTTP协议无状态的原因之一。</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '', '', '', '', 29, 'N', 'N', '', '', 0, 0, 'N', 1521807842, 0, 'Y', 0, '', 'Y', 1521807813);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2020_05_30_115810_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2020_10_04_214137_create_admins_table', 1);
INSERT INTO `migrations` VALUES (3, '2020_10_12_110758_create_auth_tables', 1);
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父权限ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '权限类型[0:目录;1:菜单;2:权限]',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '权限标题',
  `path` varchar(255) DEFAULT '' COMMENT '权限路由地址',
  `component` varchar(255) NOT NULL DEFAULT '' COMMENT '前端页面组件名称',
  `perms` varchar(255) NOT NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序[值越小越靠前]',
  `hidden` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序[值越小越靠前]',
  `is_frame` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否外链[0:否;1:是]',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='RBAC - 权限表';

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (2, 0, 0, '系统管理', '/system', '', '', 'solution', 1, 0, 0, '2020-10-29 11:36:45', '2020-10-29 10:36:48');
INSERT INTO `permissions` VALUES (3, 2, 1, '用户管理', '/system/users', 'SystemUserPage', '', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-29 20:36:13');
INSERT INTO `permissions` VALUES (4, 2, 1, '角色管理', '/system/roles', 'SystemRolePage', '', '', 3, 0, 0, '2020-10-29 11:36:45', '2020-10-29 10:25:01');
INSERT INTO `permissions` VALUES (5, 2, 1, '菜单管理', '/system/menus', 'SystemMenuPage', 'system:menu:page', '', 3, 0, 0, '2020-10-29 11:36:45', '2020-10-28 17:30:31');
INSERT INTO `permissions` VALUES (6, 3, 2, '用户数据', '', '', 'system:user:search', '', 0, 0, 0, '2020-10-29 11:36:45', '2021-02-01 18:03:49');
INSERT INTO `permissions` VALUES (7, 3, 2, '用户新增', '', '', 'system:user:insert', '', 1, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:35:58');
INSERT INTO `permissions` VALUES (8, 3, 2, '修改状态', '', '', 'system:user:change-status', '', 3, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:36:49');
INSERT INTO `permissions` VALUES (9, 4, 2, '角色数据', '', '', 'system:role:search', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:37:37');
INSERT INTO `permissions` VALUES (36, 3, 2, '修改密码', '', '', 'system:user:change-password', '', 4, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:37:05');
INSERT INTO `permissions` VALUES (37, 4, 2, '角色新增', '', '', 'system:role:insert', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:37:58');
INSERT INTO `permissions` VALUES (38, 4, 2, '角色编辑', '', '', 'system:role:edit', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-29 21:00:16');
INSERT INTO `permissions` VALUES (39, 4, 2, '角色删除', '', '', 'system:role:delete', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:38:45');
INSERT INTO `permissions` VALUES (40, 5, 2, '菜单新增', '', '', 'system:menu:insert', '', 1, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:40:46');
INSERT INTO `permissions` VALUES (93, 4, 2, '角色分配权限', '', '', 'system:role:give-perms', '', 0, 0, 0, '2020-10-21 13:55:33', '2020-10-28 11:39:10');
INSERT INTO `permissions` VALUES (96, 3, 2, '用户删除', '', '', 'system:user:delete', '', 3, 0, 0, '2020-10-22 14:35:20', '2020-10-29 11:36:55');
INSERT INTO `permissions` VALUES (102, 5, 2, '菜单编辑', '', '', 'system:menu:edit', '', 2, 0, 0, '2020-10-25 21:36:21', '2020-10-28 11:41:11');
INSERT INTO `permissions` VALUES (103, 5, 2, '菜单删除', '', '', 'system:menu:delete', '', 3, 0, 0, '2020-10-25 21:36:50', '2020-10-28 11:41:19');
INSERT INTO `permissions` VALUES (104, 5, 2, '菜单数据', '', '', 'system:menu:search', '', 0, 0, 0, '2020-10-25 21:40:57', '2020-10-28 11:40:28');
INSERT INTO `permissions` VALUES (108, 0, 1, '自定义组件', '/other/list', 'component', '', 'dot-chart', 0, 0, 0, '2020-10-28 17:34:03', '2020-10-30 11:29:01');
INSERT INTO `permissions` VALUES (121, 3, 2, '分配角色', '', '', 'system:user:give-role', '', 5, 0, 0, '2020-10-29 11:31:53', '2020-10-29 11:32:06');
INSERT INTO `permissions` VALUES (122, 3, 2, '用户编辑', '', '', 'system:user:edit', '', 2, 0, 0, '2020-10-29 11:36:32', '2020-10-29 11:36:45');
INSERT INTO `permissions` VALUES (123, 108, 1, '订单管理', 'order', 'component', '', '', 0, 0, 0, '2020-11-25 09:21:08', '2020-11-25 09:21:08');
INSERT INTO `permissions` VALUES (124, 0, 1, '个人收支V1', '/bill/list', 'ExtBillPage', '', '', 0, 0, 0, '2021-01-17 00:23:28', '2021-01-17 00:25:27');
COMMIT;

-- ----------------------------
-- Table structure for role_admin
-- ----------------------------
DROP TABLE IF EXISTS `role_admin`;
CREATE TABLE `role_admin` (
  `admin_id` bigint(20) unsigned NOT NULL COMMENT '管理员用户ID',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`admin_id`,`role_id`),
  UNIQUE KEY `role_admin_admin_id_unique` (`admin_id`),
  KEY `role_admin_role_id_foreign` (`role_id`),
  CONSTRAINT `role_admin_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_admin_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RBAC - 角色、用户关联表';

-- ----------------------------
-- Records of role_admin
-- ----------------------------
BEGIN;
INSERT INTO `role_admin` VALUES (1, 2);
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_permission_role_id_foreign` (`role_id`),
  CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RBAC - 角色、权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (2, 2);
INSERT INTO `role_permission` VALUES (2, 3);
INSERT INTO `role_permission` VALUES (2, 4);
INSERT INTO `role_permission` VALUES (2, 5);
INSERT INTO `role_permission` VALUES (2, 6);
INSERT INTO `role_permission` VALUES (2, 7);
INSERT INTO `role_permission` VALUES (2, 8);
INSERT INTO `role_permission` VALUES (2, 9);
INSERT INTO `role_permission` VALUES (2, 36);
INSERT INTO `role_permission` VALUES (2, 37);
INSERT INTO `role_permission` VALUES (2, 38);
INSERT INTO `role_permission` VALUES (2, 39);
INSERT INTO `role_permission` VALUES (2, 40);
INSERT INTO `role_permission` VALUES (2, 93);
INSERT INTO `role_permission` VALUES (2, 96);
INSERT INTO `role_permission` VALUES (2, 102);
INSERT INTO `role_permission` VALUES (2, 103);
INSERT INTO `role_permission` VALUES (2, 104);
INSERT INTO `role_permission` VALUES (2, 108);
INSERT INTO `role_permission` VALUES (2, 121);
INSERT INTO `role_permission` VALUES (2, 122);
INSERT INTO `role_permission` VALUES (2, 123);
INSERT INTO `role_permission` VALUES (3, 2);
INSERT INTO `role_permission` VALUES (3, 3);
INSERT INTO `role_permission` VALUES (3, 4);
INSERT INTO `role_permission` VALUES (3, 5);
INSERT INTO `role_permission` VALUES (3, 6);
INSERT INTO `role_permission` VALUES (3, 7);
INSERT INTO `role_permission` VALUES (3, 8);
INSERT INTO `role_permission` VALUES (3, 9);
INSERT INTO `role_permission` VALUES (3, 36);
INSERT INTO `role_permission` VALUES (3, 37);
INSERT INTO `role_permission` VALUES (3, 38);
INSERT INTO `role_permission` VALUES (3, 39);
INSERT INTO `role_permission` VALUES (3, 40);
INSERT INTO `role_permission` VALUES (3, 93);
INSERT INTO `role_permission` VALUES (3, 96);
INSERT INTO `role_permission` VALUES (3, 102);
INSERT INTO `role_permission` VALUES (3, 103);
INSERT INTO `role_permission` VALUES (3, 104);
INSERT INTO `role_permission` VALUES (3, 121);
INSERT INTO `role_permission` VALUES (3, 122);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(255) NOT NULL COMMENT '角色名',
  `display_name` varchar(255) DEFAULT NULL COMMENT '角色显示名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='RBAC - 角色表';

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (2, 'tec', '技术', '技术', '2020-11-25 17:49:53', '2020-11-25 17:49:53');
INSERT INTO `roles` VALUES (3, 'yunying', '运营', '运营', '2020-11-25 17:50:39', '2020-11-25 17:50:39');
INSERT INTO `roles` VALUES (4, 'xiaoshou', '销售', '销售。。。', '2021-02-01 17:34:36', '2021-02-01 17:34:36');
INSERT INTO `roles` VALUES (5, ' xiaoshou2', ' 销售2', ' \"销售。。。\"', '2021-02-01 17:49:40', '2021-02-01 17:49:40');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '登录密码',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像地址',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别[0:未知;1:男;2:女]',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员用户信息表';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, '13888888888', '$2y$10$hQ/XVu8VbugnsbijQUOAaOQ2c/OO7w/ze0T38XdqeLI/EITt3hMfu', 'YANQPsiCI3', '', 0, 1606201731);
INSERT INTO `users` VALUES (2, '18072936938', '$2y$10$eBdq2z6vSRaYrWgpdS7bk.mBCU68Ws6zD117aayiCd1swD3pg5Dfu', '18072936938', '', 0, 1606202209);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
