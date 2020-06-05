/*
 Navicat Premium Data Transfer

 Source Server         : bt
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.205.10:3306
 Source Schema         : wx_admin

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/06/2020 22:23:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_activity
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity`;
CREATE TABLE `admin_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `addtime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `endtime` datetime(0) NOT NULL COMMENT '结束时间',
  `money` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需要金额',
  `describe` blob NULL COMMENT '描述',
  `theme` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `number_people` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参加人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_activity
-- ----------------------------
INSERT INTO `admin_activity` VALUES (2, 'test', '2020-06-11 16:19:00', '2020-06-12 16:20:00', '111', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for admin_activity_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity_user`;
CREATE TABLE `admin_activity_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '活动列表id',
  `uid` int(11) NOT NULL COMMENT '用户列表id',
  `is_join` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for admin_code
-- ----------------------------
DROP TABLE IF EXISTS `admin_code`;
CREATE TABLE `admin_code`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `p_code_id` int(11) NOT NULL COMMENT '父id',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新用户',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_code
-- ----------------------------

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `controller_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制器ID',
  `action_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法ID',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  `func_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能',
  `right_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法',
  `client_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_create_date`(`create_date`) USING BTREE,
  INDEX `index_create_index`(`create_user`) USING BTREE,
  INDEX `index_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 456 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_log
-- ----------------------------
INSERT INTO `admin_log` VALUES (1, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-01 22:55:32');
INSERT INTO `admin_log` VALUES (2, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-02 21:01:45');
INSERT INTO `admin_log` VALUES (3, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-02 21:01:46');
INSERT INTO `admin_log` VALUES (4, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-02 21:01:47');
INSERT INTO `admin_log` VALUES (5, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-02 21:01:51');
INSERT INTO `admin_log` VALUES (6, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-02 21:01:54');
INSERT INTO `admin_log` VALUES (7, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-02 21:04:13');
INSERT INTO `admin_log` VALUES (8, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-02 21:04:15');
INSERT INTO `admin_log` VALUES (9, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-02 21:04:17');
INSERT INTO `admin_log` VALUES (10, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 21:33:26');
INSERT INTO `admin_log` VALUES (11, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-02 21:47:30');
INSERT INTO `admin_log` VALUES (12, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-02 22:33:55');
INSERT INTO `admin_log` VALUES (13, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-02 22:52:14');
INSERT INTO `admin_log` VALUES (14, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-02 22:52:32');
INSERT INTO `admin_log` VALUES (15, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-02 22:53:13');
INSERT INTO `admin_log` VALUES (16, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-02 22:53:23');
INSERT INTO `admin_log` VALUES (17, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 22:57:35');
INSERT INTO `admin_log` VALUES (18, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 22:57:56');
INSERT INTO `admin_log` VALUES (19, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 22:58:47');
INSERT INTO `admin_log` VALUES (20, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 22:58:50');
INSERT INTO `admin_log` VALUES (21, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:00:24');
INSERT INTO `admin_log` VALUES (22, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:00:40');
INSERT INTO `admin_log` VALUES (23, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:01:17');
INSERT INTO `admin_log` VALUES (24, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:01:24');
INSERT INTO `admin_log` VALUES (25, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:08:55');
INSERT INTO `admin_log` VALUES (26, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:09:34');
INSERT INTO `admin_log` VALUES (27, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:10:26');
INSERT INTO `admin_log` VALUES (28, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:10:28');
INSERT INTO `admin_log` VALUES (29, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-02 23:11:55');
INSERT INTO `admin_log` VALUES (30, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 11:59:51');
INSERT INTO `admin_log` VALUES (31, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 12:12:07');
INSERT INTO `admin_log` VALUES (32, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 12:43:06');
INSERT INTO `admin_log` VALUES (33, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 12:44:04');
INSERT INTO `admin_log` VALUES (34, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 12:46:04');
INSERT INTO `admin_log` VALUES (35, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 12:46:12');
INSERT INTO `admin_log` VALUES (36, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 12:46:15');
INSERT INTO `admin_log` VALUES (37, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 12:53:22');
INSERT INTO `admin_log` VALUES (38, 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 12:53:57');
INSERT INTO `admin_log` VALUES (39, 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 12:54:01');
INSERT INTO `admin_log` VALUES (40, 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 12:54:08');
INSERT INTO `admin_log` VALUES (41, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 12:54:15');
INSERT INTO `admin_log` VALUES (42, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 12:54:19');
INSERT INTO `admin_log` VALUES (43, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 12:54:25');
INSERT INTO `admin_log` VALUES (44, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 12:54:39');
INSERT INTO `admin_log` VALUES (45, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 12:56:36');
INSERT INTO `admin_log` VALUES (46, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 13:11:28');
INSERT INTO `admin_log` VALUES (47, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:12:28');
INSERT INTO `admin_log` VALUES (48, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-03 13:14:09');
INSERT INTO `admin_log` VALUES (49, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:09');
INSERT INTO `admin_log` VALUES (50, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:12');
INSERT INTO `admin_log` VALUES (51, 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-03 13:14:14');
INSERT INTO `admin_log` VALUES (52, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:15');
INSERT INTO `admin_log` VALUES (53, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:18');
INSERT INTO `admin_log` VALUES (54, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:20');
INSERT INTO `admin_log` VALUES (55, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:29');
INSERT INTO `admin_log` VALUES (56, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:34');
INSERT INTO `admin_log` VALUES (57, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:14:47');
INSERT INTO `admin_log` VALUES (58, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:50');
INSERT INTO `admin_log` VALUES (59, 'admin-module', 'delete', 'admin-module/delete', '菜单用户权限', '菜单管理', '一级菜单删除', '::1', 'admin', '2020-06-03 13:14:58');
INSERT INTO `admin_log` VALUES (60, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:14:59');
INSERT INTO `admin_log` VALUES (61, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:15:01');
INSERT INTO `admin_log` VALUES (62, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:15:38');
INSERT INTO `admin_log` VALUES (63, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-03 13:16:19');
INSERT INTO `admin_log` VALUES (64, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:16:19');
INSERT INTO `admin_log` VALUES (65, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:16:20');
INSERT INTO `admin_log` VALUES (66, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-03 13:17:17');
INSERT INTO `admin_log` VALUES (67, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:17:18');
INSERT INTO `admin_log` VALUES (68, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:17:22');
INSERT INTO `admin_log` VALUES (69, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 13:17:30');
INSERT INTO `admin_log` VALUES (70, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:17:39');
INSERT INTO `admin_log` VALUES (71, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:41');
INSERT INTO `admin_log` VALUES (72, 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '::1', 'admin', '2020-06-03 13:17:43');
INSERT INTO `admin_log` VALUES (73, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:45');
INSERT INTO `admin_log` VALUES (74, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:46');
INSERT INTO `admin_log` VALUES (75, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:49');
INSERT INTO `admin_log` VALUES (76, 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '::1', 'admin', '2020-06-03 13:17:51');
INSERT INTO `admin_log` VALUES (77, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:53');
INSERT INTO `admin_log` VALUES (78, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:54');
INSERT INTO `admin_log` VALUES (79, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:57');
INSERT INTO `admin_log` VALUES (80, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:17:58');
INSERT INTO `admin_log` VALUES (81, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 13:18:14');
INSERT INTO `admin_log` VALUES (82, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:18:19');
INSERT INTO `admin_log` VALUES (83, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:18:25');
INSERT INTO `admin_log` VALUES (84, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:37');
INSERT INTO `admin_log` VALUES (85, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:42');
INSERT INTO `admin_log` VALUES (86, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:45');
INSERT INTO `admin_log` VALUES (87, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:46');
INSERT INTO `admin_log` VALUES (88, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:51');
INSERT INTO `admin_log` VALUES (89, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:52');
INSERT INTO `admin_log` VALUES (90, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:18:59');
INSERT INTO `admin_log` VALUES (91, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:19:00');
INSERT INTO `admin_log` VALUES (92, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:19:13');
INSERT INTO `admin_log` VALUES (93, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:19:49');
INSERT INTO `admin_log` VALUES (94, 'admin-module', 'delete', 'admin-module/delete', '菜单用户权限', '菜单管理', '一级菜单删除', '::1', 'admin', '2020-06-03 13:19:53');
INSERT INTO `admin_log` VALUES (95, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:19:53');
INSERT INTO `admin_log` VALUES (96, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-03 13:20:04');
INSERT INTO `admin_log` VALUES (97, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:20:04');
INSERT INTO `admin_log` VALUES (98, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:20:06');
INSERT INTO `admin_log` VALUES (99, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:20:07');
INSERT INTO `admin_log` VALUES (100, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:20:10');
INSERT INTO `admin_log` VALUES (101, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-03 13:20:28');
INSERT INTO `admin_log` VALUES (102, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:20:29');
INSERT INTO `admin_log` VALUES (103, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:20:31');
INSERT INTO `admin_log` VALUES (104, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:20:32');
INSERT INTO `admin_log` VALUES (105, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:20:38');
INSERT INTO `admin_log` VALUES (106, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:20:40');
INSERT INTO `admin_log` VALUES (107, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:21:49');
INSERT INTO `admin_log` VALUES (108, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:21:50');
INSERT INTO `admin_log` VALUES (109, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:21:52');
INSERT INTO `admin_log` VALUES (110, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:21:54');
INSERT INTO `admin_log` VALUES (111, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-03 13:22:26');
INSERT INTO `admin_log` VALUES (112, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:22:26');
INSERT INTO `admin_log` VALUES (113, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:22:28');
INSERT INTO `admin_log` VALUES (114, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:22:29');
INSERT INTO `admin_log` VALUES (115, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:22:32');
INSERT INTO `admin_log` VALUES (116, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 13:22:41');
INSERT INTO `admin_log` VALUES (117, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:22:43');
INSERT INTO `admin_log` VALUES (118, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:29:37');
INSERT INTO `admin_log` VALUES (119, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:32:45');
INSERT INTO `admin_log` VALUES (120, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:34:56');
INSERT INTO `admin_log` VALUES (121, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:35:11');
INSERT INTO `admin_log` VALUES (122, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 13:35:14');
INSERT INTO `admin_log` VALUES (123, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:35:25');
INSERT INTO `admin_log` VALUES (124, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:35:29');
INSERT INTO `admin_log` VALUES (125, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:35:30');
INSERT INTO `admin_log` VALUES (126, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:35:33');
INSERT INTO `admin_log` VALUES (127, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:35:34');
INSERT INTO `admin_log` VALUES (128, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:35:36');
INSERT INTO `admin_log` VALUES (129, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:35:38');
INSERT INTO `admin_log` VALUES (130, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:37:54');
INSERT INTO `admin_log` VALUES (131, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:37:55');
INSERT INTO `admin_log` VALUES (132, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:38:01');
INSERT INTO `admin_log` VALUES (133, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:38:05');
INSERT INTO `admin_log` VALUES (134, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:38:06');
INSERT INTO `admin_log` VALUES (135, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:38:06');
INSERT INTO `admin_log` VALUES (136, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:38:08');
INSERT INTO `admin_log` VALUES (137, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:38:10');
INSERT INTO `admin_log` VALUES (138, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 13:38:11');
INSERT INTO `admin_log` VALUES (139, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:38:22');
INSERT INTO `admin_log` VALUES (140, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:40:19');
INSERT INTO `admin_log` VALUES (141, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:42:04');
INSERT INTO `admin_log` VALUES (142, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:42:30');
INSERT INTO `admin_log` VALUES (143, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:43:21');
INSERT INTO `admin_log` VALUES (144, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:45:44');
INSERT INTO `admin_log` VALUES (145, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:45:48');
INSERT INTO `admin_log` VALUES (146, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:45:48');
INSERT INTO `admin_log` VALUES (147, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:46:05');
INSERT INTO `admin_log` VALUES (148, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:49:57');
INSERT INTO `admin_log` VALUES (149, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:49:59');
INSERT INTO `admin_log` VALUES (150, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:50:02');
INSERT INTO `admin_log` VALUES (151, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:50:03');
INSERT INTO `admin_log` VALUES (152, 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:50:06');
INSERT INTO `admin_log` VALUES (153, 'admin-right', 'update', 'admin-right/update', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_log` VALUES (154, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:50:12');
INSERT INTO `admin_log` VALUES (155, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:50:18');
INSERT INTO `admin_log` VALUES (156, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:51:10');
INSERT INTO `admin_log` VALUES (157, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:51:11');
INSERT INTO `admin_log` VALUES (158, 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '::1', 'admin', '2020-06-03 13:51:13');
INSERT INTO `admin_log` VALUES (159, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:51:16');
INSERT INTO `admin_log` VALUES (160, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:51:17');
INSERT INTO `admin_log` VALUES (161, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:51:20');
INSERT INTO `admin_log` VALUES (162, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:51:23');
INSERT INTO `admin_log` VALUES (163, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:51:25');
INSERT INTO `admin_log` VALUES (164, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:51:28');
INSERT INTO `admin_log` VALUES (165, 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:51:30');
INSERT INTO `admin_log` VALUES (166, 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:51:36');
INSERT INTO `admin_log` VALUES (167, 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 13:51:48');
INSERT INTO `admin_log` VALUES (168, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:51:54');
INSERT INTO `admin_log` VALUES (169, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:51:57');
INSERT INTO `admin_log` VALUES (170, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:52:31');
INSERT INTO `admin_log` VALUES (171, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:52:39');
INSERT INTO `admin_log` VALUES (172, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:52:44');
INSERT INTO `admin_log` VALUES (173, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:52:48');
INSERT INTO `admin_log` VALUES (174, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:52:56');
INSERT INTO `admin_log` VALUES (175, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:53:58');
INSERT INTO `admin_log` VALUES (176, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:54:07');
INSERT INTO `admin_log` VALUES (177, 'activity', 'create', 'activity/create', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:54:10');
INSERT INTO `admin_log` VALUES (178, 'activity', 'create', 'activity/create', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:54:21');
INSERT INTO `admin_log` VALUES (179, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:54:21');
INSERT INTO `admin_log` VALUES (180, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:54:37');
INSERT INTO `admin_log` VALUES (181, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 13:54:39');
INSERT INTO `admin_log` VALUES (182, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 13:54:41');
INSERT INTO `admin_log` VALUES (183, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:55:08');
INSERT INTO `admin_log` VALUES (184, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:55:09');
INSERT INTO `admin_log` VALUES (185, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:55:10');
INSERT INTO `admin_log` VALUES (186, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:55:11');
INSERT INTO `admin_log` VALUES (187, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:56:03');
INSERT INTO `admin_log` VALUES (188, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:56:16');
INSERT INTO `admin_log` VALUES (189, 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-03 13:56:25');
INSERT INTO `admin_log` VALUES (190, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:56:25');
INSERT INTO `admin_log` VALUES (191, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:57:45');
INSERT INTO `admin_log` VALUES (192, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-03 13:58:14');
INSERT INTO `admin_log` VALUES (193, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:58:14');
INSERT INTO `admin_log` VALUES (194, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:58:24');
INSERT INTO `admin_log` VALUES (195, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:58:24');
INSERT INTO `admin_log` VALUES (196, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:58:26');
INSERT INTO `admin_log` VALUES (197, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:58:28');
INSERT INTO `admin_log` VALUES (198, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 13:58:29');
INSERT INTO `admin_log` VALUES (199, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 13:58:34');
INSERT INTO `admin_log` VALUES (200, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 13:58:36');
INSERT INTO `admin_log` VALUES (201, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 14:00:30');
INSERT INTO `admin_log` VALUES (202, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 14:01:42');
INSERT INTO `admin_log` VALUES (203, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:03:31');
INSERT INTO `admin_log` VALUES (204, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:03:33');
INSERT INTO `admin_log` VALUES (205, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-03 14:04:16');
INSERT INTO `admin_log` VALUES (206, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:04:16');
INSERT INTO `admin_log` VALUES (207, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:04:18');
INSERT INTO `admin_log` VALUES (208, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:04:20');
INSERT INTO `admin_log` VALUES (209, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:04:25');
INSERT INTO `admin_log` VALUES (210, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:04:26');
INSERT INTO `admin_log` VALUES (211, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 14:04:27');
INSERT INTO `admin_log` VALUES (212, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 14:04:29');
INSERT INTO `admin_log` VALUES (213, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_log` VALUES (214, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_log` VALUES (215, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:05:01');
INSERT INTO `admin_log` VALUES (216, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:05:03');
INSERT INTO `admin_log` VALUES (217, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:05:06');
INSERT INTO `admin_log` VALUES (218, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:05:15');
INSERT INTO `admin_log` VALUES (219, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-03 14:06:18');
INSERT INTO `admin_log` VALUES (220, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:07:39');
INSERT INTO `admin_log` VALUES (221, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:07:39');
INSERT INTO `admin_log` VALUES (222, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:08:09');
INSERT INTO `admin_log` VALUES (223, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:08:13');
INSERT INTO `admin_log` VALUES (224, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:08:15');
INSERT INTO `admin_log` VALUES (225, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:08:17');
INSERT INTO `admin_log` VALUES (226, 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-03 14:08:34');
INSERT INTO `admin_log` VALUES (227, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:08:35');
INSERT INTO `admin_log` VALUES (228, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:08:40');
INSERT INTO `admin_log` VALUES (229, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:08:56');
INSERT INTO `admin_log` VALUES (230, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 14:09:03');
INSERT INTO `admin_log` VALUES (231, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:09:05');
INSERT INTO `admin_log` VALUES (232, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:09:06');
INSERT INTO `admin_log` VALUES (233, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:11:36');
INSERT INTO `admin_log` VALUES (234, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:12:47');
INSERT INTO `admin_log` VALUES (235, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:13:05');
INSERT INTO `admin_log` VALUES (236, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:13:14');
INSERT INTO `admin_log` VALUES (237, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:13:17');
INSERT INTO `admin_log` VALUES (238, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:13:38');
INSERT INTO `admin_log` VALUES (239, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:13:40');
INSERT INTO `admin_log` VALUES (240, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:13:41');
INSERT INTO `admin_log` VALUES (241, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:03');
INSERT INTO `admin_log` VALUES (242, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:10');
INSERT INTO `admin_log` VALUES (243, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:11');
INSERT INTO `admin_log` VALUES (244, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:13');
INSERT INTO `admin_log` VALUES (245, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:13');
INSERT INTO `admin_log` VALUES (246, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:14');
INSERT INTO `admin_log` VALUES (247, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:14');
INSERT INTO `admin_log` VALUES (248, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:32');
INSERT INTO `admin_log` VALUES (249, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:32');
INSERT INTO `admin_log` VALUES (250, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:32');
INSERT INTO `admin_log` VALUES (251, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:14:33');
INSERT INTO `admin_log` VALUES (252, 'wechat-config', 'create', 'wechat-config/create', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:15:02');
INSERT INTO `admin_log` VALUES (253, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:15:03');
INSERT INTO `admin_log` VALUES (254, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:15:19');
INSERT INTO `admin_log` VALUES (255, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:17:07');
INSERT INTO `admin_log` VALUES (256, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:17:37');
INSERT INTO `admin_log` VALUES (257, 'activity', 'create', 'activity/create', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:17:57');
INSERT INTO `admin_log` VALUES (258, 'activity', 'create', 'activity/create', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:18:04');
INSERT INTO `admin_log` VALUES (259, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:18:05');
INSERT INTO `admin_log` VALUES (260, 'activity', 'delete', 'activity/delete', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:18:09');
INSERT INTO `admin_log` VALUES (261, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:18:09');
INSERT INTO `admin_log` VALUES (262, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:18:38');
INSERT INTO `admin_log` VALUES (263, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:18:40');
INSERT INTO `admin_log` VALUES (264, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:22:43');
INSERT INTO `admin_log` VALUES (265, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:22:44');
INSERT INTO `admin_log` VALUES (266, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:22:47');
INSERT INTO `admin_log` VALUES (267, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-03 14:23:12');
INSERT INTO `admin_log` VALUES (268, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:23:12');
INSERT INTO `admin_log` VALUES (269, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 14:23:16');
INSERT INTO `admin_log` VALUES (270, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 14:23:17');
INSERT INTO `admin_log` VALUES (271, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_log` VALUES (272, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-03 14:23:39');
INSERT INTO `admin_log` VALUES (273, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:23:41');
INSERT INTO `admin_log` VALUES (274, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:23:42');
INSERT INTO `admin_log` VALUES (275, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:23:44');
INSERT INTO `admin_log` VALUES (276, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:23:52');
INSERT INTO `admin_log` VALUES (277, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:23:55');
INSERT INTO `admin_log` VALUES (278, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:24:15');
INSERT INTO `admin_log` VALUES (279, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:24:21');
INSERT INTO `admin_log` VALUES (280, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 14:24:37');
INSERT INTO `admin_log` VALUES (281, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:24:38');
INSERT INTO `admin_log` VALUES (282, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:39');
INSERT INTO `admin_log` VALUES (283, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:24:43');
INSERT INTO `admin_log` VALUES (284, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:44');
INSERT INTO `admin_log` VALUES (285, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:24:45');
INSERT INTO `admin_log` VALUES (286, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:45');
INSERT INTO `admin_log` VALUES (287, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:24:46');
INSERT INTO `admin_log` VALUES (288, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:47');
INSERT INTO `admin_log` VALUES (289, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:24:48');
INSERT INTO `admin_log` VALUES (290, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:24:50');
INSERT INTO `admin_log` VALUES (291, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:52');
INSERT INTO `admin_log` VALUES (292, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:24:53');
INSERT INTO `admin_log` VALUES (293, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:24:54');
INSERT INTO `admin_log` VALUES (294, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:55');
INSERT INTO `admin_log` VALUES (295, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:24:56');
INSERT INTO `admin_log` VALUES (296, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:24:57');
INSERT INTO `admin_log` VALUES (297, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:24:59');
INSERT INTO `admin_log` VALUES (298, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:25:00');
INSERT INTO `admin_log` VALUES (299, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:25:01');
INSERT INTO `admin_log` VALUES (300, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:25:02');
INSERT INTO `admin_log` VALUES (301, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:25:03');
INSERT INTO `admin_log` VALUES (302, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:25:04');
INSERT INTO `admin_log` VALUES (303, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:25:05');
INSERT INTO `admin_log` VALUES (304, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:25:09');
INSERT INTO `admin_log` VALUES (305, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:25:10');
INSERT INTO `admin_log` VALUES (306, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:25:11');
INSERT INTO `admin_log` VALUES (307, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:25:11');
INSERT INTO `admin_log` VALUES (308, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 14:25:13');
INSERT INTO `admin_log` VALUES (309, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:25:14');
INSERT INTO `admin_log` VALUES (310, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:25:15');
INSERT INTO `admin_log` VALUES (311, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:25:16');
INSERT INTO `admin_log` VALUES (312, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 14:25:27');
INSERT INTO `admin_log` VALUES (313, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:25:29');
INSERT INTO `admin_log` VALUES (314, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:25:29');
INSERT INTO `admin_log` VALUES (315, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:25:30');
INSERT INTO `admin_log` VALUES (316, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:26:09');
INSERT INTO `admin_log` VALUES (317, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:26:10');
INSERT INTO `admin_log` VALUES (318, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:26:11');
INSERT INTO `admin_log` VALUES (319, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:26:13');
INSERT INTO `admin_log` VALUES (320, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '微信公众平台管理', '微信配置', '::1', 'admin', '2020-06-03 14:26:20');
INSERT INTO `admin_log` VALUES (321, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:26:25');
INSERT INTO `admin_log` VALUES (322, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:26:27');
INSERT INTO `admin_log` VALUES (323, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:26:29');
INSERT INTO `admin_log` VALUES (324, 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-03 14:26:56');
INSERT INTO `admin_log` VALUES (325, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-03 14:26:57');
INSERT INTO `admin_log` VALUES (326, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-03 14:27:07');
INSERT INTO `admin_log` VALUES (327, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 14:41:30');
INSERT INTO `admin_log` VALUES (328, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 14:41:31');
INSERT INTO `admin_log` VALUES (329, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 14:41:32');
INSERT INTO `admin_log` VALUES (330, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:41:34');
INSERT INTO `admin_log` VALUES (331, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:41:35');
INSERT INTO `admin_log` VALUES (332, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:41:37');
INSERT INTO `admin_log` VALUES (333, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:41:38');
INSERT INTO `admin_log` VALUES (334, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:41:43');
INSERT INTO `admin_log` VALUES (335, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 14:45:13');
INSERT INTO `admin_log` VALUES (336, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:45:26');
INSERT INTO `admin_log` VALUES (337, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:45:29');
INSERT INTO `admin_log` VALUES (338, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 14:45:32');
INSERT INTO `admin_log` VALUES (339, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-03 15:41:40');
INSERT INTO `admin_log` VALUES (340, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 15:41:45');
INSERT INTO `admin_log` VALUES (341, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 15:41:46');
INSERT INTO `admin_log` VALUES (342, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 15:41:47');
INSERT INTO `admin_log` VALUES (343, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 15:41:48');
INSERT INTO `admin_log` VALUES (344, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 15:41:48');
INSERT INTO `admin_log` VALUES (345, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 15:43:08');
INSERT INTO `admin_log` VALUES (346, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 15:43:08');
INSERT INTO `admin_log` VALUES (347, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-03 15:43:10');
INSERT INTO `admin_log` VALUES (348, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 15:43:13');
INSERT INTO `admin_log` VALUES (349, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 15:43:13');
INSERT INTO `admin_log` VALUES (350, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 18:16:24');
INSERT INTO `admin_log` VALUES (351, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 18:16:25');
INSERT INTO `admin_log` VALUES (352, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 18:16:26');
INSERT INTO `admin_log` VALUES (353, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-03 18:16:29');
INSERT INTO `admin_log` VALUES (354, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 18:16:32');
INSERT INTO `admin_log` VALUES (355, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 18:16:33');
INSERT INTO `admin_log` VALUES (356, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 18:17:19');
INSERT INTO `admin_log` VALUES (357, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 18:17:20');
INSERT INTO `admin_log` VALUES (358, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 18:17:21');
INSERT INTO `admin_log` VALUES (359, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 18:17:26');
INSERT INTO `admin_log` VALUES (360, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 18:17:26');
INSERT INTO `admin_log` VALUES (361, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-03 18:17:28');
INSERT INTO `admin_log` VALUES (362, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 18:17:31');
INSERT INTO `admin_log` VALUES (363, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 18:17:46');
INSERT INTO `admin_log` VALUES (364, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-03 18:17:47');
INSERT INTO `admin_log` VALUES (365, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-03 18:18:40');
INSERT INTO `admin_log` VALUES (366, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-03 18:18:42');
INSERT INTO `admin_log` VALUES (367, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 18:18:44');
INSERT INTO `admin_log` VALUES (368, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 18:18:45');
INSERT INTO `admin_log` VALUES (369, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 18:18:47');
INSERT INTO `admin_log` VALUES (370, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 18:18:48');
INSERT INTO `admin_log` VALUES (371, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-03 18:19:06');
INSERT INTO `admin_log` VALUES (372, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-03 18:19:07');
INSERT INTO `admin_log` VALUES (373, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-03 18:19:07');
INSERT INTO `admin_log` VALUES (374, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-03 21:05:40');
INSERT INTO `admin_log` VALUES (375, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 21:05:51');
INSERT INTO `admin_log` VALUES (376, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:06:24');
INSERT INTO `admin_log` VALUES (377, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:06:27');
INSERT INTO `admin_log` VALUES (378, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:06:28');
INSERT INTO `admin_log` VALUES (379, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:06:30');
INSERT INTO `admin_log` VALUES (380, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:28:35');
INSERT INTO `admin_log` VALUES (381, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-03 21:47:49');
INSERT INTO `admin_log` VALUES (382, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:48:06');
INSERT INTO `admin_log` VALUES (383, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:48:08');
INSERT INTO `admin_log` VALUES (384, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:48:09');
INSERT INTO `admin_log` VALUES (385, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:48:42');
INSERT INTO `admin_log` VALUES (386, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:48:51');
INSERT INTO `admin_log` VALUES (387, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-03 21:49:02');
INSERT INTO `admin_log` VALUES (388, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:51:31');
INSERT INTO `admin_log` VALUES (389, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:56:28');
INSERT INTO `admin_log` VALUES (390, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:56:32');
INSERT INTO `admin_log` VALUES (391, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:56:33');
INSERT INTO `admin_log` VALUES (392, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:57:06');
INSERT INTO `admin_log` VALUES (393, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:58:35');
INSERT INTO `admin_log` VALUES (394, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:58:40');
INSERT INTO `admin_log` VALUES (395, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:58:41');
INSERT INTO `admin_log` VALUES (396, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:59:13');
INSERT INTO `admin_log` VALUES (397, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 21:59:20');
INSERT INTO `admin_log` VALUES (398, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 21:59:21');
INSERT INTO `admin_log` VALUES (399, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:00:02');
INSERT INTO `admin_log` VALUES (400, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:00:34');
INSERT INTO `admin_log` VALUES (401, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:00:37');
INSERT INTO `admin_log` VALUES (402, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:00:38');
INSERT INTO `admin_log` VALUES (403, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:00:39');
INSERT INTO `admin_log` VALUES (404, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:01:01');
INSERT INTO `admin_log` VALUES (405, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:01:42');
INSERT INTO `admin_log` VALUES (406, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:01:49');
INSERT INTO `admin_log` VALUES (407, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:02:25');
INSERT INTO `admin_log` VALUES (408, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:02:29');
INSERT INTO `admin_log` VALUES (409, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:02:32');
INSERT INTO `admin_log` VALUES (410, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:02:34');
INSERT INTO `admin_log` VALUES (411, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:03:57');
INSERT INTO `admin_log` VALUES (412, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:03:59');
INSERT INTO `admin_log` VALUES (413, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:04:00');
INSERT INTO `admin_log` VALUES (414, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:04:00');
INSERT INTO `admin_log` VALUES (415, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:04:00');
INSERT INTO `admin_log` VALUES (416, 'wechat-config', 'view', 'wechat-config/view', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:04:02');
INSERT INTO `admin_log` VALUES (417, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:04:24');
INSERT INTO `admin_log` VALUES (418, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:04:26');
INSERT INTO `admin_log` VALUES (419, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:04:27');
INSERT INTO `admin_log` VALUES (420, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:04:29');
INSERT INTO `admin_log` VALUES (421, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:05:38');
INSERT INTO `admin_log` VALUES (422, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:05:40');
INSERT INTO `admin_log` VALUES (423, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:05:46');
INSERT INTO `admin_log` VALUES (424, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:11:57');
INSERT INTO `admin_log` VALUES (425, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:11:58');
INSERT INTO `admin_log` VALUES (426, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-03 22:12:08');
INSERT INTO `admin_log` VALUES (427, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:12:10');
INSERT INTO `admin_log` VALUES (428, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:12:11');
INSERT INTO `admin_log` VALUES (429, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:12:12');
INSERT INTO `admin_log` VALUES (430, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:12:14');
INSERT INTO `admin_log` VALUES (431, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:12:20');
INSERT INTO `admin_log` VALUES (432, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '192.168.205.1', 'admin', '2020-06-03 22:12:43');
INSERT INTO `admin_log` VALUES (433, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:12:43');
INSERT INTO `admin_log` VALUES (434, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:12:45');
INSERT INTO `admin_log` VALUES (435, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:12:48');
INSERT INTO `admin_log` VALUES (436, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:14:13');
INSERT INTO `admin_log` VALUES (437, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:14:15');
INSERT INTO `admin_log` VALUES (438, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '192.168.205.1', 'admin', '2020-06-03 22:14:37');
INSERT INTO `admin_log` VALUES (439, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-03 22:14:38');
INSERT INTO `admin_log` VALUES (440, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-03 22:14:39');
INSERT INTO `admin_log` VALUES (441, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-03 22:14:41');
INSERT INTO `admin_log` VALUES (442, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '192.168.205.1', 'admin', '2020-06-03 22:15:17');
INSERT INTO `admin_log` VALUES (443, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-03 22:15:18');
INSERT INTO `admin_log` VALUES (444, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-03 22:15:21');
INSERT INTO `admin_log` VALUES (445, 'admin-user-role', 'index', 'admin-user-role/index', '菜单用户权限', '角色管理', '分配用户', '192.168.205.1', 'admin', '2020-06-03 22:15:22');
INSERT INTO `admin_log` VALUES (446, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-03 22:15:24');
INSERT INTO `admin_log` VALUES (447, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-03 22:15:26');
INSERT INTO `admin_log` VALUES (448, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_log` VALUES (449, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:17:27');
INSERT INTO `admin_log` VALUES (450, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:39:28');
INSERT INTO `admin_log` VALUES (451, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:39:29');
INSERT INTO `admin_log` VALUES (452, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-03 22:39:31');
INSERT INTO `admin_log` VALUES (453, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:41:25');
INSERT INTO `admin_log` VALUES (454, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-03 22:46:10');
INSERT INTO `admin_log` VALUES (455, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-04 20:38:21');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code',
  `menu_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `module_id` int(11) NOT NULL COMMENT '模块id',
  `display_label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示名',
  `des` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `display_order` int(5) NULL DEFAULT NULL COMMENT '显示顺序',
  `entry_right_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入口地址名称',
  `entry_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入口地址',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作ID',
  `controller` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器ID',
  `has_lef` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE,
  INDEX `fk_module_id`(`module_id`) USING BTREE,
  CONSTRAINT `fk_module_id` FOREIGN KEY (`module_id`) REFERENCES `admin_module` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 'menu_manger', '菜单管理', 1, '菜单管理', '菜单管理', 1, '菜单管理', 'admin-module/index', 'index', 'backend\\controllers\\AdminMenuController', 'n', 'admin', '2016-08-11 16:44:11', 'admin', '2016-08-11 16:44:11');
INSERT INTO `admin_menu` VALUES (2, 'menu_role', '角色管理', 1, '角色管理', '角色管理', 2, '角色管理', 'admin-role/index', 'index', 'backend\\controllers\\AdminRoleController', 'n', 'admin', '2016-08-11 16:51:56', 'admin', '2016-08-11 16:51:56');
INSERT INTO `admin_menu` VALUES (3, 'menu_user', '用户管理', 1, '用户管理', '用户管理', 3, '用户管理', 'admin-user/index', 'index', 'backend\\controllers\\AdminUserController', 'n', 'admin', '2016-08-11 16:58:43', 'admin', '2016-08-11 16:58:43');
INSERT INTO `admin_menu` VALUES (4, 'coazaorizhi', '操作日志', 2, '操作日志', '操作日志', 1, '', 'admin-log/index', 'index', 'backend\\controllers\\AdminLogController', 'n', 'test', '2016-08-14 06:54:17', 'test', '2016-08-14 06:54:17');
INSERT INTO `admin_menu` VALUES (6, 'activityList', '活动列表', 5, '活动列表', '活动列表', 1, '活动列表', 'activity/index', 'index', 'backend\\controllers\\ActivityController', 'n', 'admin', '2020-06-03 13:20:28', 'admin', '2020-06-03 13:20:28');
INSERT INTO `admin_menu` VALUES (7, 'wechatConfig', '应用配置', 6, '应用配置', '应用配置', 5, '应用配置', 'wechat-config/index', 'index', 'backend\\controllers\\WechatConfigController', 'n', 'admin', '2020-06-03 14:04:16', 'admin', '2020-06-03 14:26:56');
INSERT INTO `admin_menu` VALUES (8, 'activityUserList', '活动用户列表', 5, '活动用户列表', '活动用户列表', 2, '活动用户列表', 'activity-user/index', 'index', 'backend\\controllers\\ActivityUserController', 'n', 'admin', '2020-06-03 14:23:12', 'admin', '2020-06-03 14:23:12');
INSERT INTO `admin_menu` VALUES (9, 'order', '订单列表', 7, '订单列表', '订单列表', 1, '订单列表', 'order/index', 'index', 'backend\\controllers\\OrderController', 'n', 'admin', '2020-06-03 22:14:37', 'admin', '2020-06-03 22:14:37');

-- ----------------------------
-- Table structure for admin_message
-- ----------------------------
DROP TABLE IF EXISTS `admin_message`;
CREATE TABLE `admin_message`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `expiry_days` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '有效天数',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_message
-- ----------------------------
INSERT INTO `admin_message` VALUES (1, '测试文本', 1, 'admin', '2014-11-21 18:47:20', 'admin', '2014-11-21 18:47:27');

-- ----------------------------
-- Table structure for admin_module
-- ----------------------------
DROP TABLE IF EXISTS `admin_module`;
CREATE TABLE `admin_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'code',
  `display_label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示名称',
  `has_lef` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `des` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `entry_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入口地址',
  `display_order` int(5) NULL DEFAULT NULL COMMENT '顺序',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_module
-- ----------------------------
INSERT INTO `admin_module` VALUES (1, 'menu_manage', '菜单用户权限', 'n', '菜单管理', '', 1, 'admin', '2016-08-11 15:26:21', 'admin', '2016-08-11 16:31:08');
INSERT INTO `admin_module` VALUES (2, 'rizhimaanage', '日志管理', 'n', '日志管理', '', 2, 'test', '2016-08-14 06:53:13', 'test', '2016-08-14 06:53:13');
INSERT INTO `admin_module` VALUES (5, 'activity_manage', '活动管理', 'n', '相关活动', NULL, 3, 'admin', '2020-06-03 13:20:04', 'admin', '2020-06-03 13:56:25');
INSERT INTO `admin_module` VALUES (6, 'wechat_manage', '微信公众平台管理', 'n', '微信公众平台管理', NULL, 5, 'admin', '2020-06-03 13:58:14', 'admin', '2020-06-03 13:58:14');
INSERT INTO `admin_module` VALUES (7, 'order_manage', '订单管理', 'n', '订单管理', NULL, 6, 'admin', '2020-06-03 22:12:43', 'admin', '2020-06-03 22:12:43');

-- ----------------------------
-- Table structure for admin_order
-- ----------------------------
DROP TABLE IF EXISTS `admin_order`;
CREATE TABLE `admin_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(35) NOT NULL COMMENT '订单号',
  `aid` int(11) NOT NULL COMMENT '活动id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `is_pay` tinyint(1) NOT NULL COMMENT '是否支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_order
-- ----------------------------

-- ----------------------------
-- Table structure for admin_right
-- ----------------------------
DROP TABLE IF EXISTS `admin_right`;
CREATE TABLE `admin_right`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '功能主键',
  `right_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `display_label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示名',
  `des` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `display_order` int(5) NULL DEFAULT NULL COMMENT '显示顺序',
  `has_lef` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_admin_right`(`menu_id`) USING BTREE,
  INDEX `index_menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `FK_admin_right` FOREIGN KEY (`menu_id`) REFERENCES `admin_menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_right
-- ----------------------------
INSERT INTO `admin_right` VALUES (4, 2, '角色操作', '角色操作', '角色操作', 1, 'n', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right` VALUES (5, 2, '分配用户', '分配用户', '分配用户', 2, 'n', 'admin', '2016-08-13 17:05:04', 'test', '2016-08-14 08:22:13');
INSERT INTO `admin_right` VALUES (6, 2, '分配权限', '分配权限', '分配权限', 3, 'n', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right` VALUES (7, 3, '用户操作', '用户操作', '用户操作', 1, 'n', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `admin_right` VALUES (8, 4, '操作', '操作', '操作', 1, 'n', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `admin_right` VALUES (13, 1, '一级菜单查看', '一级菜单查看', '一级菜单查看', 1, 'n', 'test', '2016-08-16 15:52:45', 'test', '2016-08-16 15:52:45');
INSERT INTO `admin_right` VALUES (14, 1, '一级菜单添加', '一级菜单添加', '一级菜单添加', 2, 'n', 'test', '2016-08-16 15:53:10', 'test', '2016-08-16 15:58:30');
INSERT INTO `admin_right` VALUES (15, 1, '一级菜单删除', '一级菜单删除', '一级菜单删除', 3, 'n', 'test', '2016-08-16 15:53:44', 'test', '2016-08-16 15:53:44');
INSERT INTO `admin_right` VALUES (16, 1, '二级菜单查看', '二级菜单查看', '二级菜单查看', 4, 'n', 'test', '2016-08-16 15:55:02', 'test', '2016-08-16 15:55:02');
INSERT INTO `admin_right` VALUES (17, 1, '二级菜单添加', '二级菜单修改', '二级菜单添加', 5, 'n', 'test', '2016-08-16 15:55:21', 'test', '2016-08-16 15:58:50');
INSERT INTO `admin_right` VALUES (18, 1, '二级菜单删除', '二级菜单删除', '二级菜单删除', 6, 'n', 'test', '2016-08-16 15:55:58', 'test', '2016-08-16 15:55:58');
INSERT INTO `admin_right` VALUES (19, 1, '路由查看', '路由查看', '路由查看', 7, 'n', 'test', '2016-08-16 15:56:32', 'test', '2016-08-16 15:57:14');
INSERT INTO `admin_right` VALUES (20, 1, '路由添加', '路由添加', '路由添加', 8, 'n', 'test', '2016-08-16 15:57:46', 'test', '2016-08-16 15:57:46');
INSERT INTO `admin_right` VALUES (21, 1, '路由删除', '路由删除', '路由删除', 9, 'n', 'test', '2016-08-16 15:58:05', 'test', '2016-08-16 15:58:05');
INSERT INTO `admin_right` VALUES (22, 6, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-03 13:22:26', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_right` VALUES (23, 7, '微信配置', '微信配置', '微信配置', 1, 'n', 'admin', '2020-06-03 14:05:00', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_right` VALUES (24, 8, '用户列表', '用户列表', '用户列表', 1, 'n', 'admin', '2020-06-03 14:23:38', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_right` VALUES (25, 9, '查看', '查看', 'index', 1, 'n', 'admin', '2020-06-03 22:15:17', 'admin', '2020-06-03 22:15:17');

-- ----------------------------
-- Table structure for admin_right_url
-- ----------------------------
DROP TABLE IF EXISTS `admin_right_url`;
CREATE TABLE `admin_right_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `right_id` int(11) NOT NULL COMMENT 'right主键',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `para_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `para_value` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_admin_right_url`(`right_id`) USING BTREE,
  INDEX `index_right_id`(`right_id`) USING BTREE,
  CONSTRAINT `FK_admin_right_url` FOREIGN KEY (`right_id`) REFERENCES `admin_right` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单的url表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_right_url
-- ----------------------------
INSERT INTO `admin_right_url` VALUES (16, 4, 'admin-role/index', 'admin-role', 'index', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (17, 4, 'admin-role/view', 'admin-role', 'view', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (18, 4, 'admin-role/create', 'admin-role', 'create', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (19, 4, 'admin-role/update', 'admin-role', 'update', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (20, 4, 'admin-role/delete', 'admin-role', 'delete', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (21, 4, 'admin-role/get-all-rights', 'admin-role', 'get-all-rights', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (22, 4, 'admin-role/save-rights', 'admin-role', 'save-rights', 'admin', '2016-08-13 17:04:40', 'admin', '2016-08-13 17:04:40');
INSERT INTO `admin_right_url` VALUES (30, 6, 'admin-role/index', 'admin-role', 'index', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (31, 6, 'admin-role/view', 'admin-role', 'view', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (32, 6, 'admin-role/create', 'admin-role', 'create', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (33, 6, 'admin-role/update', 'admin-role', 'update', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (34, 6, 'admin-role/delete', 'admin-role', 'delete', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (35, 6, 'admin-role/get-all-rights', 'admin-role', 'get-all-rights', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (36, 6, 'admin-role/save-rights', 'admin-role', 'save-rights', 'admin', '2016-08-13 17:05:24', 'admin', '2016-08-13 17:05:24');
INSERT INTO `admin_right_url` VALUES (37, 7, 'admin-user/index', 'admin-user', 'index', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `admin_right_url` VALUES (38, 7, 'admin-user/view', 'admin-user', 'view', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `admin_right_url` VALUES (39, 7, 'admin-user/create', 'admin-user', 'create', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `admin_right_url` VALUES (40, 7, 'admin-user/update', 'admin-user', 'update', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `admin_right_url` VALUES (41, 7, 'admin-user/delete', 'admin-user', 'delete', 'admin', '2016-08-13 17:05:57', 'admin', '2016-08-13 17:05:57');
INSERT INTO `admin_right_url` VALUES (42, 8, 'admin-log/index', 'admin-log', 'index', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `admin_right_url` VALUES (43, 8, 'admin-log/view', 'admin-log', 'view', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `admin_right_url` VALUES (44, 8, 'admin-log/create', 'admin-log', 'create', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `admin_right_url` VALUES (45, 8, 'admin-log/update', 'admin-log', 'update', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `admin_right_url` VALUES (46, 8, 'admin-log/delete', 'admin-log', 'delete', 'test', '2016-08-14 06:54:38', 'test', '2016-08-14 06:54:38');
INSERT INTO `admin_right_url` VALUES (81, 5, 'admin-user-role/index', 'admin-user-role', 'index', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `admin_right_url` VALUES (82, 5, 'admin-user-role/view', 'admin-user-role', 'view', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `admin_right_url` VALUES (83, 5, 'admin-user-role/create', 'admin-user-role', 'create', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `admin_right_url` VALUES (84, 5, 'admin-user-role/update', 'admin-user-role', 'update', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `admin_right_url` VALUES (85, 5, 'admin-user-role/delete', 'admin-user-role', 'delete', 'test', '2016-08-14 08:22:13', 'test', '2016-08-14 08:22:13');
INSERT INTO `admin_right_url` VALUES (112, 13, 'admin-module/index', 'admin-module', 'index', 'test', '2016-08-16 15:52:45', 'test', '2016-08-16 15:52:45');
INSERT INTO `admin_right_url` VALUES (113, 13, 'admin-module/view', 'admin-module', 'view', 'test', '2016-08-16 15:52:45', 'test', '2016-08-16 15:52:45');
INSERT INTO `admin_right_url` VALUES (115, 15, 'admin-module/delete', 'admin-module', 'delete', 'test', '2016-08-16 15:53:44', 'test', '2016-08-16 15:53:44');
INSERT INTO `admin_right_url` VALUES (118, 16, 'admin-menu/index', 'admin-menu', 'index', 'test', '2016-08-16 15:55:02', 'test', '2016-08-16 15:55:02');
INSERT INTO `admin_right_url` VALUES (119, 16, 'admin-menu/view', 'admin-menu', 'view', 'test', '2016-08-16 15:55:02', 'test', '2016-08-16 15:55:02');
INSERT INTO `admin_right_url` VALUES (122, 18, 'admin-menu/delete', 'admin-menu', 'delete', 'test', '2016-08-16 15:55:58', 'test', '2016-08-16 15:55:58');
INSERT INTO `admin_right_url` VALUES (125, 19, 'admin-right/index', 'admin-right', 'index', 'test', '2016-08-16 15:57:14', 'test', '2016-08-16 15:57:14');
INSERT INTO `admin_right_url` VALUES (126, 19, 'admin-right/view', 'admin-right', 'view', 'test', '2016-08-16 15:57:14', 'test', '2016-08-16 15:57:14');
INSERT INTO `admin_right_url` VALUES (127, 19, 'admin-right/right-action', 'admin-right', 'right-action', 'test', '2016-08-16 15:57:14', 'test', '2016-08-16 15:57:14');
INSERT INTO `admin_right_url` VALUES (128, 20, 'admin-right/create', 'admin-right', 'create', 'test', '2016-08-16 15:57:46', 'test', '2016-08-16 15:57:46');
INSERT INTO `admin_right_url` VALUES (129, 20, 'admin-right/update', 'admin-right', 'update', 'test', '2016-08-16 15:57:46', 'test', '2016-08-16 15:57:46');
INSERT INTO `admin_right_url` VALUES (130, 21, 'admin-right/delete', 'admin-right', 'delete', 'test', '2016-08-16 15:58:05', 'test', '2016-08-16 15:58:05');
INSERT INTO `admin_right_url` VALUES (131, 14, 'admin-module/create', 'admin-module', 'create', 'test', '2016-08-16 15:58:30', 'test', '2016-08-16 15:58:30');
INSERT INTO `admin_right_url` VALUES (132, 14, 'admin-module/update', 'admin-module', 'update', 'test', '2016-08-16 15:58:30', 'test', '2016-08-16 15:58:30');
INSERT INTO `admin_right_url` VALUES (133, 17, 'admin-menu/create', 'admin-menu', 'create', 'test', '2016-08-16 15:58:51', 'test', '2016-08-16 15:58:51');
INSERT INTO `admin_right_url` VALUES (134, 17, 'admin-menu/update', 'admin-menu', 'update', 'test', '2016-08-16 15:58:51', 'test', '2016-08-16 15:58:51');
INSERT INTO `admin_right_url` VALUES (137, 22, 'activity/index', 'activity', 'index', 'admin', '2020-06-03 13:50:11', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_right_url` VALUES (138, 22, 'activity/view', 'activity', 'view', 'admin', '2020-06-03 13:50:11', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_right_url` VALUES (139, 22, 'activity/create', 'activity', 'create', 'admin', '2020-06-03 13:50:11', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_right_url` VALUES (140, 22, 'activity/update', 'activity', 'update', 'admin', '2020-06-03 13:50:11', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_right_url` VALUES (141, 22, 'activity/delete', 'activity', 'delete', 'admin', '2020-06-03 13:50:11', 'admin', '2020-06-03 13:50:11');
INSERT INTO `admin_right_url` VALUES (142, 23, 'wechat-config/index', 'wechat-config', 'index', 'admin', '2020-06-03 14:05:00', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_right_url` VALUES (143, 23, 'wechat-config/view', 'wechat-config', 'view', 'admin', '2020-06-03 14:05:00', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_right_url` VALUES (144, 23, 'wechat-config/create', 'wechat-config', 'create', 'admin', '2020-06-03 14:05:00', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_right_url` VALUES (145, 23, 'wechat-config/update', 'wechat-config', 'update', 'admin', '2020-06-03 14:05:00', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_right_url` VALUES (146, 23, 'wechat-config/delete', 'wechat-config', 'delete', 'admin', '2020-06-03 14:05:00', 'admin', '2020-06-03 14:05:00');
INSERT INTO `admin_right_url` VALUES (147, 24, 'activity-user/index', 'activity-user', 'index', 'admin', '2020-06-03 14:23:38', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_right_url` VALUES (148, 24, 'activity-user/view', 'activity-user', 'view', 'admin', '2020-06-03 14:23:38', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_right_url` VALUES (149, 24, 'activity-user/create', 'activity-user', 'create', 'admin', '2020-06-03 14:23:38', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_right_url` VALUES (150, 24, 'activity-user/update', 'activity-user', 'update', 'admin', '2020-06-03 14:23:38', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_right_url` VALUES (151, 24, 'activity-user/delete', 'activity-user', 'delete', 'admin', '2020-06-03 14:23:38', 'admin', '2020-06-03 14:23:38');
INSERT INTO `admin_right_url` VALUES (152, 25, 'order/index', 'order', 'index', 'admin', '2020-06-03 22:15:17', 'admin', '2020-06-03 22:15:17');
INSERT INTO `admin_right_url` VALUES (153, 25, 'order/view', 'order', 'view', 'admin', '2020-06-03 22:15:17', 'admin', '2020-06-03 22:15:17');
INSERT INTO `admin_right_url` VALUES (154, 25, 'order/create', 'order', 'create', 'admin', '2020-06-03 22:15:17', 'admin', '2020-06-03 22:15:17');
INSERT INTO `admin_right_url` VALUES (155, 25, 'order/update', 'order', 'update', 'admin', '2020-06-03 22:15:17', 'admin', '2020-06-03 22:15:17');
INSERT INTO `admin_right_url` VALUES (156, 25, 'order/delete', 'order', 'delete', 'admin', '2020-06-03 22:15:17', 'admin', '2020-06-03 22:15:17');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `des` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 'superadmin', '超级管理员', '拥有所有权限', 'test', '2016-08-12 15:33:01', 'test', '2016-08-12 15:33:01');
INSERT INTO `admin_role` VALUES (2, 'testuser', '测试人员', '测试人员', 'test', '2016-08-12 15:33:45', 'test', '2016-08-12 15:33:45');

-- ----------------------------
-- Table structure for admin_role_right
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_right`;
CREATE TABLE `admin_role_right`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `right_id` int(11) NOT NULL COMMENT '权限主键',
  `full_path` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全路径',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_role_id`(`role_id`) USING BTREE,
  INDEX `index_right_id`(`right_id`) USING BTREE,
  CONSTRAINT `admin_role_right_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `admin_right` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 327 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限导航栏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role_right
-- ----------------------------
INSERT INTO `admin_role_right` VALUES (112, 2, 13, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (113, 2, 14, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (114, 2, 15, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (115, 2, 16, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (116, 2, 17, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (117, 2, 18, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (118, 2, 19, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (119, 2, 20, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (120, 2, 21, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (121, 2, 4, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (122, 2, 5, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (123, 2, 6, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (124, 2, 7, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (125, 2, 8, NULL, 'test', '2016-08-16 16:02:57', 'test', '2016-08-16 16:02:57');
INSERT INTO `admin_role_right` VALUES (309, 1, 13, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (310, 1, 14, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (311, 1, 15, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (312, 1, 16, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (313, 1, 17, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (314, 1, 18, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (315, 1, 19, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (316, 1, 20, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (317, 1, 21, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (318, 1, 4, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (319, 1, 5, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (320, 1, 6, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (321, 1, 7, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (322, 1, 8, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (323, 1, 22, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (324, 1, 24, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (325, 1, 23, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');
INSERT INTO `admin_role_right` VALUES (326, 1, 25, NULL, 'admin', '2020-06-03 22:15:29', 'admin', '2020-06-03 22:15:29');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `auth_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动登录key',
  `last_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近一次登录ip',
  `is_online` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'n' COMMENT '是否在线',
  `domain_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域账号',
  `status` smallint(6) NOT NULL DEFAULT 10 COMMENT '状态',
  `create_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user` varchar(101) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `update_date` datetime(0) NOT NULL COMMENT '更新时间',
  `type` smallint(1) NOT NULL DEFAULT 0 COMMENT '1 为超级管理员 0 为普通用户 ',
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆凭证',
  `wechat_platform_open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信公众号openid',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar_url` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信头像',
  `bind_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绑定手机',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (156, 'admin', '$2y$13$9O6bKJieocg//oSax9fZOOuljAKarBXknqD8.RyYg60FfNjS7SoqK', NULL, '192.168.205.1', 'n', NULL, 10, 'admin', '2014-07-07 00:05:47', 'admin', '2014-09-03 12:19:12', 0, '', '', '', '', '');
INSERT INTO `admin_user` VALUES (158, 'test', '$2y$13$9O6bKJieocg//oSax9fZOOuljAKarBXknqD8.RyYg60FfNjS7SoqK', NULL, '', 'n', NULL, 10, 'admin', '2014-09-03 12:19:52', 'admin', '2014-11-21 19:19:22', 0, '', '', '', '', '');

-- ----------------------------
-- Table structure for admin_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_detail`;
CREATE TABLE `admin_user_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'user表的id',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `birthday` timestamp(0) NULL DEFAULT NULL COMMENT '生日',
  `occupation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '职业',
  `income` int(10) NULL DEFAULT NULL COMMENT '月收入',
  `cars_and_houses` tinyint(1) NULL DEFAULT NULL COMMENT '有无车房',
  `marital_status` tinyint(1) NULL DEFAULT NULL COMMENT '婚姻状况 1未婚 2已婚',
  `education` tinyint(2) NULL DEFAULT NULL COMMENT '学历',
  `native_place` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `character` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性格',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `mate_require` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '择偶要求',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `height` int(3) NULL DEFAULT NULL COMMENT '身高',
  `mobile` int(11) NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user_detail
-- ----------------------------

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `admin_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `admin_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (1, 156, 1, 'admin', '2016-08-12 17:03:13', 'admin', '2016-08-12 17:03:13');
INSERT INTO `admin_user_role` VALUES (2, 158, 2, 'test', '2016-08-13 16:34:20', 'test', '2016-08-13 16:34:20');

-- ----------------------------
-- Table structure for admin_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `admin_wechat_config`;
CREATE TABLE `admin_wechat_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信appid',
  `app_secret` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信appsecret',
  `mch_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Api密钥',
  `cert_pem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'apiclient_cert.pem',
  `key_pem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'apiclient_key.pem',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_wechat_config
-- ----------------------------
INSERT INTO `admin_wechat_config` VALUES (1, 'wx863b4d3612d39765', 'e694ef8b4076f059d745af18cf467bb9', '123', '123', '123123', '123123');

SET FOREIGN_KEY_CHECKS = 1;
