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

 Date: 02/02/2021 15:04:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
