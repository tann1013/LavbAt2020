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

 Date: 25/11/2020 11:13:44
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES (1, 'admin', '$2y$10$53COVs9CGTP1uYkqYCWyc.mHJjjaMB8jb.qGsy7/6R5hGJHpDA.Ti', '', '', '', 10, '2020-11-25 10:14:39', '127.0.0.1', 0, '2020-11-24 15:08:51', '2020-11-24 15:08:51');
INSERT INTO `admins` VALUES (3, 'test', '$2y$10$xzi4MzSgt2.LQNPAWRqz2eect0TSgIAKpDk4besOLCIq4QhyShpdy', '', '', '', 10, '2020-11-24 17:07:25', '', 0, '2020-11-24 17:07:25', '2020-11-24 17:07:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='RBAC - 权限表';

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (2, 0, 0, '系统管理', '/system', '', '', 'solution', 1, 0, 0, '2020-10-29 11:36:45', '2020-10-29 10:36:48');
INSERT INTO `permissions` VALUES (3, 2, 1, '用户管理', '/system/users', 'SystemUserPage', '', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-29 20:36:13');
INSERT INTO `permissions` VALUES (4, 2, 1, '角色管理', '/system/roles', 'SystemRolePage', '', '', 3, 0, 0, '2020-10-29 11:36:45', '2020-10-29 10:25:01');
INSERT INTO `permissions` VALUES (5, 2, 1, '菜单管理', '/system/menus', 'SystemMenuPage', 'system:menu:page', '', 3, 0, 0, '2020-10-29 11:36:45', '2020-10-28 17:30:31');
INSERT INTO `permissions` VALUES (6, 3, 2, '用户数据', '', '', 'system:user:search', '', 0, 0, 0, '2020-10-29 11:36:45', '2020-10-28 11:35:12');
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

SET FOREIGN_KEY_CHECKS = 1;
