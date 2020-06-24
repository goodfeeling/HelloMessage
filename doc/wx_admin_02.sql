/*
 Navicat Premium Data Transfer

 Source Server         : mamp
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:8889
 Source Schema         : wx_admin

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/06/2020 18:33:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_activity
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity`;
CREATE TABLE `admin_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '活动名称',
  `addtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '报名时间',
  `endtime` datetime NOT NULL COMMENT '截止时间',
  `money` varchar(10) DEFAULT NULL COMMENT '需要金额',
  `describe` text COMMENT '描述',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `join_number` int(10) DEFAULT NULL COMMENT '参加人数',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `author_id` int(11) DEFAULT NULL COMMENT '作者id',
  `pic_url_id` tinyint(1) DEFAULT NULL COMMENT '大图id',
  `views` int(10) DEFAULT '0' COMMENT '浏览量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='活动表';

-- ----------------------------
-- Records of admin_activity
-- ----------------------------
BEGIN;
INSERT INTO `admin_activity` VALUES (2, 'test', '2020-06-05 14:43:00', '2020-06-05 11:45:00', '100|10', '<blockquote><blockquote><p></p><p></p><p></p><p></p><h1><b>联谊活动计划书</b></h1><p></p><p></p><p></p><p></p></blockquote></blockquote><p></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<u></u> &nbsp;<i></i><small>2020年5月30</small><i></i></p><p></p><ul><li><b></b>一. 前言</li></ul><p></p><p></p><ol><li>当下社会，每一个人的工作生活压力越来越大，许多单身男女因为忙于事业、或者宅等各种原因耽误了个人的幸福和爱情，没有时间与异性接触，展现个人魅力，以及和异性的交往能力。为此，我们提供一个轻松、快乐的交友圈及寻找人生伴侣的平台，为其创造条件和机会，通过游戏、交流和配合的环节，让嘉宾在轻松、浪漫、温馨中结交异性，为自己的幸福爱情迈出勇敢的一步。</li><li>二.活动筹备</li><li>1. 建立单身联谊的APP，每一位进入APP的单身人士，需要填写自己的真实信息提交，以便后期安排联谊时间。（APP制作内容再议）</li><li>2. 费用：报名费（男士100元/人，女士20元/人），免费提供（精致水果、各式瓜子、甜品、奶茶等）。</li><li>3.地点：boss酒吧</li><li>4.时间：每周五晚8点-11点</li><li>5.主题：（各期各定）</li><li>6.人数：男15名；女15名</li><li>7.主持人：（各期各定）</li><li>三.活动流程</li><li>1. 候场</li><li>每位入场嘉宾入口处领取号码牌（男女分开），贴在外衣上；报才艺展示内容（脱口秀、魔术、唱歌、跳舞等），以便安排表演；男女按照指示分开入座。</li><li>2. 暖场</li><li>主持人开场，说明本期活动主题，介绍接下来的活动流程。</li><li>3. 活动（每期活动准备三至五个，再议）</li><li>4. 红娘出动</li><li>在每一个活动结束后男女嘉宾把心仪的号码写在记事贴上，以便接下来的活动优先安排男女配对一致的号码，其他不一致的由红娘即时配对参加活动。每个活动都有礼品奖励，最后选出最佳情侣获得大奖。</li><li>5. 主持人准备结束词，散场。</li><li>四.场内外置及物资准备</li><li>1.场内外布置：（再议）</li><li>2.物资：（游戏道具、记事贴、笔等）</li><li>3.纪念品、礼品</li></ol><p></p><br><p></p>', '12', 1, 1, '联谊', 2, 1, 18);
COMMIT;

-- ----------------------------
-- Table structure for admin_activity_comments
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity_comments`;
CREATE TABLE `admin_activity_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '活动id',
  `content` varchar(1000) NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `status` tinyint(1) NOT NULL COMMENT '审核状态',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';

-- ----------------------------
-- Table structure for admin_activity_likes_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity_likes_user`;
CREATE TABLE `admin_activity_likes_user` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `aid` int(11) NOT NULL COMMENT '活动id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户点赞';

-- ----------------------------
-- Table structure for admin_activity_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity_user`;
CREATE TABLE `admin_activity_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '活动列表id',
  `uid` int(11) NOT NULL COMMENT '用户列表id',
  `is_join` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `join_time` datetime DEFAULT NULL COMMENT '参加时间',
  `create_time` datetime DEFAULT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='活动人员表';

-- ----------------------------
-- Table structure for admin_code
-- ----------------------------
DROP TABLE IF EXISTS `admin_code`;
CREATE TABLE `admin_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '值',
  `label` varchar(100) DEFAULT NULL COMMENT '描述',
  `p_code_id` int(11) NOT NULL COMMENT '父id',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新用户',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码表';

-- ----------------------------
-- Table structure for admin_feedback
-- ----------------------------
DROP TABLE IF EXISTS `admin_feedback`;
CREATE TABLE `admin_feedback` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '提交时间',
  `type` tinyint(1) DEFAULT '0' COMMENT '反馈类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='意见反馈表';

-- ----------------------------
-- Table structure for admin_images
-- ----------------------------
DROP TABLE IF EXISTS `admin_images`;
CREATE TABLE `admin_images` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片表';

-- ----------------------------
-- Records of admin_images
-- ----------------------------
BEGIN;
INSERT INTO `admin_images` VALUES (0, '/resource/uploads/80248718158519126317016.jpg', '2020-06-09 09:37:08', 1);
COMMIT;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `controller_id` varchar(20) DEFAULT NULL COMMENT '控制器ID',
  `action_id` varchar(20) DEFAULT NULL COMMENT '方法ID',
  `url` varchar(200) DEFAULT NULL COMMENT '访问地址',
  `module_name` varchar(50) DEFAULT NULL COMMENT '模块',
  `func_name` varchar(50) DEFAULT NULL COMMENT '功能',
  `right_name` varchar(50) DEFAULT NULL COMMENT '方法',
  `client_ip` varchar(15) DEFAULT NULL COMMENT '客户端IP',
  `create_user` varchar(50) DEFAULT NULL COMMENT '用户',
  `create_date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_create_date` (`create_date`) USING BTREE,
  KEY `index_create_index` (`create_user`) USING BTREE,
  KEY `index_url` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2112 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志表';

-- ----------------------------
-- Records of admin_log
-- ----------------------------
BEGIN;
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
INSERT INTO `admin_log` VALUES (456, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 09:34:27');
INSERT INTO `admin_log` VALUES (457, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 09:34:38');
INSERT INTO `admin_log` VALUES (458, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 09:34:40');
INSERT INTO `admin_log` VALUES (459, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 09:34:42');
INSERT INTO `admin_log` VALUES (460, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 09:34:47');
INSERT INTO `admin_log` VALUES (461, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 09:34:48');
INSERT INTO `admin_log` VALUES (462, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 09:34:51');
INSERT INTO `admin_log` VALUES (463, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-05 09:35:37');
INSERT INTO `admin_log` VALUES (464, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 09:35:39');
INSERT INTO `admin_log` VALUES (465, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 09:35:39');
INSERT INTO `admin_log` VALUES (466, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 09:35:40');
INSERT INTO `admin_log` VALUES (467, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 09:35:41');
INSERT INTO `admin_log` VALUES (468, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 09:35:43');
INSERT INTO `admin_log` VALUES (469, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 09:57:28');
INSERT INTO `admin_log` VALUES (470, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 09:57:49');
INSERT INTO `admin_log` VALUES (471, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:00:13');
INSERT INTO `admin_log` VALUES (472, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:00:38');
INSERT INTO `admin_log` VALUES (473, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:00:41');
INSERT INTO `admin_log` VALUES (474, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:01:49');
INSERT INTO `admin_log` VALUES (475, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:02:21');
INSERT INTO `admin_log` VALUES (476, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:02:37');
INSERT INTO `admin_log` VALUES (477, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:04:32');
INSERT INTO `admin_log` VALUES (478, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:07:00');
INSERT INTO `admin_log` VALUES (479, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:07:38');
INSERT INTO `admin_log` VALUES (480, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:08:00');
INSERT INTO `admin_log` VALUES (481, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:08:12');
INSERT INTO `admin_log` VALUES (482, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:08:32');
INSERT INTO `admin_log` VALUES (483, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:09:16');
INSERT INTO `admin_log` VALUES (484, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:18:21');
INSERT INTO `admin_log` VALUES (485, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:21:47');
INSERT INTO `admin_log` VALUES (486, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:23:39');
INSERT INTO `admin_log` VALUES (487, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:24:56');
INSERT INTO `admin_log` VALUES (488, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:25:59');
INSERT INTO `admin_log` VALUES (489, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:27:26');
INSERT INTO `admin_log` VALUES (490, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:34:51');
INSERT INTO `admin_log` VALUES (491, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:35:36');
INSERT INTO `admin_log` VALUES (492, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:35:45');
INSERT INTO `admin_log` VALUES (493, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:35:50');
INSERT INTO `admin_log` VALUES (494, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:35:59');
INSERT INTO `admin_log` VALUES (495, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:38:21');
INSERT INTO `admin_log` VALUES (496, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:38:52');
INSERT INTO `admin_log` VALUES (497, 'activity', 'create', 'activity/create', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:39:21');
INSERT INTO `admin_log` VALUES (498, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 10:39:28');
INSERT INTO `admin_log` VALUES (499, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:39:29');
INSERT INTO `admin_log` VALUES (500, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 10:39:32');
INSERT INTO `admin_log` VALUES (501, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:39:40');
INSERT INTO `admin_log` VALUES (502, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 10:39:41');
INSERT INTO `admin_log` VALUES (503, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 10:40:07');
INSERT INTO `admin_log` VALUES (504, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 10:40:10');
INSERT INTO `admin_log` VALUES (505, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 10:43:09');
INSERT INTO `admin_log` VALUES (506, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 10:43:15');
INSERT INTO `admin_log` VALUES (507, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:43:19');
INSERT INTO `admin_log` VALUES (508, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 10:43:20');
INSERT INTO `admin_log` VALUES (509, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:43:21');
INSERT INTO `admin_log` VALUES (510, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:43:24');
INSERT INTO `admin_log` VALUES (511, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:43:31');
INSERT INTO `admin_log` VALUES (512, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:44:26');
INSERT INTO `admin_log` VALUES (513, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:44:31');
INSERT INTO `admin_log` VALUES (514, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:44:33');
INSERT INTO `admin_log` VALUES (515, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:44:37');
INSERT INTO `admin_log` VALUES (516, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:45:23');
INSERT INTO `admin_log` VALUES (517, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:45:28');
INSERT INTO `admin_log` VALUES (518, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:48:18');
INSERT INTO `admin_log` VALUES (519, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:49:45');
INSERT INTO `admin_log` VALUES (520, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:49:49');
INSERT INTO `admin_log` VALUES (521, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:49:58');
INSERT INTO `admin_log` VALUES (522, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:49:58');
INSERT INTO `admin_log` VALUES (523, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:00');
INSERT INTO `admin_log` VALUES (524, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:04');
INSERT INTO `admin_log` VALUES (525, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:11');
INSERT INTO `admin_log` VALUES (526, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:18');
INSERT INTO `admin_log` VALUES (527, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:23');
INSERT INTO `admin_log` VALUES (528, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:25');
INSERT INTO `admin_log` VALUES (529, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:50:26');
INSERT INTO `admin_log` VALUES (530, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:51:24');
INSERT INTO `admin_log` VALUES (531, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:51:27');
INSERT INTO `admin_log` VALUES (532, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:51:32');
INSERT INTO `admin_log` VALUES (533, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:53:41');
INSERT INTO `admin_log` VALUES (534, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:53:47');
INSERT INTO `admin_log` VALUES (535, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 10:58:47');
INSERT INTO `admin_log` VALUES (536, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:05:09');
INSERT INTO `admin_log` VALUES (537, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:05:48');
INSERT INTO `admin_log` VALUES (538, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:06:18');
INSERT INTO `admin_log` VALUES (539, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:07:11');
INSERT INTO `admin_log` VALUES (540, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:07:35');
INSERT INTO `admin_log` VALUES (541, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:08:48');
INSERT INTO `admin_log` VALUES (542, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:09:17');
INSERT INTO `admin_log` VALUES (543, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:10:57');
INSERT INTO `admin_log` VALUES (544, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:12:41');
INSERT INTO `admin_log` VALUES (545, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:16:38');
INSERT INTO `admin_log` VALUES (546, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:16:43');
INSERT INTO `admin_log` VALUES (547, 'activity-user', 'create', 'activity-user/create', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:16:51');
INSERT INTO `admin_log` VALUES (548, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:16:51');
INSERT INTO `admin_log` VALUES (549, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:17:00');
INSERT INTO `admin_log` VALUES (550, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:17:17');
INSERT INTO `admin_log` VALUES (551, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:17:26');
INSERT INTO `admin_log` VALUES (552, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:20:15');
INSERT INTO `admin_log` VALUES (553, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:20:29');
INSERT INTO `admin_log` VALUES (554, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:20:32');
INSERT INTO `admin_log` VALUES (555, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:24:40');
INSERT INTO `admin_log` VALUES (556, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:24:41');
INSERT INTO `admin_log` VALUES (557, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:24:42');
INSERT INTO `admin_log` VALUES (558, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:25:02');
INSERT INTO `admin_log` VALUES (559, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:25:03');
INSERT INTO `admin_log` VALUES (560, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:25:20');
INSERT INTO `admin_log` VALUES (561, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:25:35');
INSERT INTO `admin_log` VALUES (562, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:25:54');
INSERT INTO `admin_log` VALUES (563, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:25:55');
INSERT INTO `admin_log` VALUES (564, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:25:56');
INSERT INTO `admin_log` VALUES (565, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:25:57');
INSERT INTO `admin_log` VALUES (566, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:26:00');
INSERT INTO `admin_log` VALUES (567, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:00');
INSERT INTO `admin_log` VALUES (568, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:26:01');
INSERT INTO `admin_log` VALUES (569, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:03');
INSERT INTO `admin_log` VALUES (570, 'activity-user', 'create', 'activity-user/create', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:12');
INSERT INTO `admin_log` VALUES (571, 'activity-user', 'create', 'activity-user/create', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:16');
INSERT INTO `admin_log` VALUES (572, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:16');
INSERT INTO `admin_log` VALUES (573, 'activity-user', 'view', 'activity-user/view', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:24');
INSERT INTO `admin_log` VALUES (574, 'activity-user', 'update', 'activity-user/update', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:28');
INSERT INTO `admin_log` VALUES (575, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:26:28');
INSERT INTO `admin_log` VALUES (576, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:28:08');
INSERT INTO `admin_log` VALUES (577, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-05 11:28:24');
INSERT INTO `admin_log` VALUES (578, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-05 11:28:32');
INSERT INTO `admin_log` VALUES (579, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:28:34');
INSERT INTO `admin_log` VALUES (580, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:28:39');
INSERT INTO `admin_log` VALUES (581, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:29:06');
INSERT INTO `admin_log` VALUES (582, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:29:11');
INSERT INTO `admin_log` VALUES (583, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:29:13');
INSERT INTO `admin_log` VALUES (584, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 11:29:16');
INSERT INTO `admin_log` VALUES (585, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 11:29:18');
INSERT INTO `admin_log` VALUES (586, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 11:29:19');
INSERT INTO `admin_log` VALUES (587, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-05 11:29:19');
INSERT INTO `admin_log` VALUES (588, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-05 11:29:21');
INSERT INTO `admin_log` VALUES (589, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 11:29:39');
INSERT INTO `admin_log` VALUES (590, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 11:29:44');
INSERT INTO `admin_log` VALUES (591, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:29:46');
INSERT INTO `admin_log` VALUES (592, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:29:48');
INSERT INTO `admin_log` VALUES (593, 'activity-user', 'view', 'activity-user/view', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:29:50');
INSERT INTO `admin_log` VALUES (594, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:30:14');
INSERT INTO `admin_log` VALUES (595, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:30:32');
INSERT INTO `admin_log` VALUES (596, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:30:44');
INSERT INTO `admin_log` VALUES (597, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:30:55');
INSERT INTO `admin_log` VALUES (598, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:30:55');
INSERT INTO `admin_log` VALUES (599, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:02');
INSERT INTO `admin_log` VALUES (600, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:05');
INSERT INTO `admin_log` VALUES (601, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:12');
INSERT INTO `admin_log` VALUES (602, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:16');
INSERT INTO `admin_log` VALUES (603, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:17');
INSERT INTO `admin_log` VALUES (604, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:20');
INSERT INTO `admin_log` VALUES (605, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:21');
INSERT INTO `admin_log` VALUES (606, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:31:24');
INSERT INTO `admin_log` VALUES (607, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:32:03');
INSERT INTO `admin_log` VALUES (608, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:32:36');
INSERT INTO `admin_log` VALUES (609, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:32:37');
INSERT INTO `admin_log` VALUES (610, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:32:37');
INSERT INTO `admin_log` VALUES (611, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:32:39');
INSERT INTO `admin_log` VALUES (612, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 11:32:41');
INSERT INTO `admin_log` VALUES (613, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:32:42');
INSERT INTO `admin_log` VALUES (614, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:32:46');
INSERT INTO `admin_log` VALUES (615, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:35:10');
INSERT INTO `admin_log` VALUES (616, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:35:17');
INSERT INTO `admin_log` VALUES (617, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:35:54');
INSERT INTO `admin_log` VALUES (618, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:35:56');
INSERT INTO `admin_log` VALUES (619, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:36:00');
INSERT INTO `admin_log` VALUES (620, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:37:48');
INSERT INTO `admin_log` VALUES (621, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:37:54');
INSERT INTO `admin_log` VALUES (622, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:39:01');
INSERT INTO `admin_log` VALUES (623, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:39:03');
INSERT INTO `admin_log` VALUES (624, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:39:26');
INSERT INTO `admin_log` VALUES (625, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:39:27');
INSERT INTO `admin_log` VALUES (626, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:40:44');
INSERT INTO `admin_log` VALUES (627, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:40:45');
INSERT INTO `admin_log` VALUES (628, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:05');
INSERT INTO `admin_log` VALUES (629, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:09');
INSERT INTO `admin_log` VALUES (630, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:10');
INSERT INTO `admin_log` VALUES (631, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:26');
INSERT INTO `admin_log` VALUES (632, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:28');
INSERT INTO `admin_log` VALUES (633, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:40');
INSERT INTO `admin_log` VALUES (634, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:41:43');
INSERT INTO `admin_log` VALUES (635, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:00');
INSERT INTO `admin_log` VALUES (636, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:21');
INSERT INTO `admin_log` VALUES (637, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:23');
INSERT INTO `admin_log` VALUES (638, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:27');
INSERT INTO `admin_log` VALUES (639, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:34');
INSERT INTO `admin_log` VALUES (640, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:38');
INSERT INTO `admin_log` VALUES (641, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:38');
INSERT INTO `admin_log` VALUES (642, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:40');
INSERT INTO `admin_log` VALUES (643, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:43:43');
INSERT INTO `admin_log` VALUES (644, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:44:32');
INSERT INTO `admin_log` VALUES (645, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:44:33');
INSERT INTO `admin_log` VALUES (646, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:44:53');
INSERT INTO `admin_log` VALUES (647, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:44:54');
INSERT INTO `admin_log` VALUES (648, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:49:45');
INSERT INTO `admin_log` VALUES (649, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:50:11');
INSERT INTO `admin_log` VALUES (650, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:50:21');
INSERT INTO `admin_log` VALUES (651, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:50:31');
INSERT INTO `admin_log` VALUES (652, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:52:21');
INSERT INTO `admin_log` VALUES (653, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:52:22');
INSERT INTO `admin_log` VALUES (654, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:52:37');
INSERT INTO `admin_log` VALUES (655, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:52:39');
INSERT INTO `admin_log` VALUES (656, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:54:21');
INSERT INTO `admin_log` VALUES (657, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:54:29');
INSERT INTO `admin_log` VALUES (658, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:58:17');
INSERT INTO `admin_log` VALUES (659, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:58:44');
INSERT INTO `admin_log` VALUES (660, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:58:50');
INSERT INTO `admin_log` VALUES (661, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:59:31');
INSERT INTO `admin_log` VALUES (662, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 11:59:32');
INSERT INTO `admin_log` VALUES (663, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:00:09');
INSERT INTO `admin_log` VALUES (664, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:02:00');
INSERT INTO `admin_log` VALUES (665, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:02:28');
INSERT INTO `admin_log` VALUES (666, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:02:37');
INSERT INTO `admin_log` VALUES (667, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:02:46');
INSERT INTO `admin_log` VALUES (668, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:02:53');
INSERT INTO `admin_log` VALUES (669, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:03:00');
INSERT INTO `admin_log` VALUES (670, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:03:06');
INSERT INTO `admin_log` VALUES (671, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:04:01');
INSERT INTO `admin_log` VALUES (672, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:04:48');
INSERT INTO `admin_log` VALUES (673, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:04:49');
INSERT INTO `admin_log` VALUES (674, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:05:37');
INSERT INTO `admin_log` VALUES (675, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:05:38');
INSERT INTO `admin_log` VALUES (676, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:06:02');
INSERT INTO `admin_log` VALUES (677, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:06:17');
INSERT INTO `admin_log` VALUES (678, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:06:20');
INSERT INTO `admin_log` VALUES (679, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:06:31');
INSERT INTO `admin_log` VALUES (680, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:06:33');
INSERT INTO `admin_log` VALUES (681, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:07:02');
INSERT INTO `admin_log` VALUES (682, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:07:16');
INSERT INTO `admin_log` VALUES (683, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:17:28');
INSERT INTO `admin_log` VALUES (684, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:17:29');
INSERT INTO `admin_log` VALUES (685, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:17:37');
INSERT INTO `admin_log` VALUES (686, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:19:57');
INSERT INTO `admin_log` VALUES (687, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:19:58');
INSERT INTO `admin_log` VALUES (688, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:20:43');
INSERT INTO `admin_log` VALUES (689, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:20:44');
INSERT INTO `admin_log` VALUES (690, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:22:40');
INSERT INTO `admin_log` VALUES (691, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:22:41');
INSERT INTO `admin_log` VALUES (692, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:25:32');
INSERT INTO `admin_log` VALUES (693, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:25:33');
INSERT INTO `admin_log` VALUES (694, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:25:53');
INSERT INTO `admin_log` VALUES (695, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:25:54');
INSERT INTO `admin_log` VALUES (696, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:27:53');
INSERT INTO `admin_log` VALUES (697, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:27:54');
INSERT INTO `admin_log` VALUES (698, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:28:44');
INSERT INTO `admin_log` VALUES (699, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:28:45');
INSERT INTO `admin_log` VALUES (700, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:29:05');
INSERT INTO `admin_log` VALUES (701, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:29:06');
INSERT INTO `admin_log` VALUES (702, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:30:15');
INSERT INTO `admin_log` VALUES (703, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:30:16');
INSERT INTO `admin_log` VALUES (704, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:30:24');
INSERT INTO `admin_log` VALUES (705, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:30:25');
INSERT INTO `admin_log` VALUES (706, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:05');
INSERT INTO `admin_log` VALUES (707, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:06');
INSERT INTO `admin_log` VALUES (708, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:22');
INSERT INTO `admin_log` VALUES (709, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:23');
INSERT INTO `admin_log` VALUES (710, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:24');
INSERT INTO `admin_log` VALUES (711, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:44');
INSERT INTO `admin_log` VALUES (712, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:48');
INSERT INTO `admin_log` VALUES (713, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:55');
INSERT INTO `admin_log` VALUES (714, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:31:56');
INSERT INTO `admin_log` VALUES (715, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:32:00');
INSERT INTO `admin_log` VALUES (716, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:32:45');
INSERT INTO `admin_log` VALUES (717, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:32:47');
INSERT INTO `admin_log` VALUES (718, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:53:37');
INSERT INTO `admin_log` VALUES (719, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:53:56');
INSERT INTO `admin_log` VALUES (720, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:53:57');
INSERT INTO `admin_log` VALUES (721, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:54:08');
INSERT INTO `admin_log` VALUES (722, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:54:09');
INSERT INTO `admin_log` VALUES (723, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:55:48');
INSERT INTO `admin_log` VALUES (724, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:55:50');
INSERT INTO `admin_log` VALUES (725, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:58:15');
INSERT INTO `admin_log` VALUES (726, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:58:17');
INSERT INTO `admin_log` VALUES (727, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:58:22');
INSERT INTO `admin_log` VALUES (728, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:58:36');
INSERT INTO `admin_log` VALUES (729, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:58:42');
INSERT INTO `admin_log` VALUES (730, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:59:10');
INSERT INTO `admin_log` VALUES (731, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 12:59:14');
INSERT INTO `admin_log` VALUES (732, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:00:55');
INSERT INTO `admin_log` VALUES (733, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:00:58');
INSERT INTO `admin_log` VALUES (734, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:02:03');
INSERT INTO `admin_log` VALUES (735, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:02:07');
INSERT INTO `admin_log` VALUES (736, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:05:11');
INSERT INTO `admin_log` VALUES (737, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:05:15');
INSERT INTO `admin_log` VALUES (738, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:05:52');
INSERT INTO `admin_log` VALUES (739, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:05:54');
INSERT INTO `admin_log` VALUES (740, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:06:08');
INSERT INTO `admin_log` VALUES (741, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:06:11');
INSERT INTO `admin_log` VALUES (742, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:06:38');
INSERT INTO `admin_log` VALUES (743, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:06:39');
INSERT INTO `admin_log` VALUES (744, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:07:11');
INSERT INTO `admin_log` VALUES (745, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:07:14');
INSERT INTO `admin_log` VALUES (746, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:07:34');
INSERT INTO `admin_log` VALUES (747, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:08:36');
INSERT INTO `admin_log` VALUES (748, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:08:39');
INSERT INTO `admin_log` VALUES (749, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:34:28');
INSERT INTO `admin_log` VALUES (750, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:34:59');
INSERT INTO `admin_log` VALUES (751, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:35:01');
INSERT INTO `admin_log` VALUES (752, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:35:19');
INSERT INTO `admin_log` VALUES (753, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:37:17');
INSERT INTO `admin_log` VALUES (754, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:37:27');
INSERT INTO `admin_log` VALUES (755, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:37:42');
INSERT INTO `admin_log` VALUES (756, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:38:00');
INSERT INTO `admin_log` VALUES (757, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:40:48');
INSERT INTO `admin_log` VALUES (758, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:41:00');
INSERT INTO `admin_log` VALUES (759, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:41:03');
INSERT INTO `admin_log` VALUES (760, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:41:11');
INSERT INTO `admin_log` VALUES (761, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:45:13');
INSERT INTO `admin_log` VALUES (762, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:45:15');
INSERT INTO `admin_log` VALUES (763, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:45:19');
INSERT INTO `admin_log` VALUES (764, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:45:21');
INSERT INTO `admin_log` VALUES (765, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:55:02');
INSERT INTO `admin_log` VALUES (766, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:56:04');
INSERT INTO `admin_log` VALUES (767, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:56:23');
INSERT INTO `admin_log` VALUES (768, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:56:35');
INSERT INTO `admin_log` VALUES (769, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:56:43');
INSERT INTO `admin_log` VALUES (770, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:58:11');
INSERT INTO `admin_log` VALUES (771, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:59:40');
INSERT INTO `admin_log` VALUES (772, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 13:59:43');
INSERT INTO `admin_log` VALUES (773, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:02:38');
INSERT INTO `admin_log` VALUES (774, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:02:43');
INSERT INTO `admin_log` VALUES (775, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:03:44');
INSERT INTO `admin_log` VALUES (776, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:04:15');
INSERT INTO `admin_log` VALUES (777, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:04:35');
INSERT INTO `admin_log` VALUES (778, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:07:15');
INSERT INTO `admin_log` VALUES (779, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:08:43');
INSERT INTO `admin_log` VALUES (780, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:13:12');
INSERT INTO `admin_log` VALUES (781, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:15:24');
INSERT INTO `admin_log` VALUES (782, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:15:26');
INSERT INTO `admin_log` VALUES (783, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:15:53');
INSERT INTO `admin_log` VALUES (784, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:15:54');
INSERT INTO `admin_log` VALUES (785, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:15:56');
INSERT INTO `admin_log` VALUES (786, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:16:07');
INSERT INTO `admin_log` VALUES (787, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:16:09');
INSERT INTO `admin_log` VALUES (788, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:16:48');
INSERT INTO `admin_log` VALUES (789, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:16:50');
INSERT INTO `admin_log` VALUES (790, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:16:54');
INSERT INTO `admin_log` VALUES (791, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:05');
INSERT INTO `admin_log` VALUES (792, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:08');
INSERT INTO `admin_log` VALUES (793, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:10');
INSERT INTO `admin_log` VALUES (794, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:24');
INSERT INTO `admin_log` VALUES (795, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:27');
INSERT INTO `admin_log` VALUES (796, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:51');
INSERT INTO `admin_log` VALUES (797, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:55');
INSERT INTO `admin_log` VALUES (798, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:19:58');
INSERT INTO `admin_log` VALUES (799, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:20:39');
INSERT INTO `admin_log` VALUES (800, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:20:40');
INSERT INTO `admin_log` VALUES (801, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:03');
INSERT INTO `admin_log` VALUES (802, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:04');
INSERT INTO `admin_log` VALUES (803, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:32');
INSERT INTO `admin_log` VALUES (804, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:33');
INSERT INTO `admin_log` VALUES (805, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:42');
INSERT INTO `admin_log` VALUES (806, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:44');
INSERT INTO `admin_log` VALUES (807, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:21:58');
INSERT INTO `admin_log` VALUES (808, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:22:00');
INSERT INTO `admin_log` VALUES (809, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:24:15');
INSERT INTO `admin_log` VALUES (810, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:25:19');
INSERT INTO `admin_log` VALUES (811, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:25:20');
INSERT INTO `admin_log` VALUES (812, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:25:21');
INSERT INTO `admin_log` VALUES (813, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:26:08');
INSERT INTO `admin_log` VALUES (814, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:26:49');
INSERT INTO `admin_log` VALUES (815, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:26:56');
INSERT INTO `admin_log` VALUES (816, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:26:59');
INSERT INTO `admin_log` VALUES (817, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:27:53');
INSERT INTO `admin_log` VALUES (818, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:27:56');
INSERT INTO `admin_log` VALUES (819, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:28:16');
INSERT INTO `admin_log` VALUES (820, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:28:17');
INSERT INTO `admin_log` VALUES (821, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:29:04');
INSERT INTO `admin_log` VALUES (822, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:29:06');
INSERT INTO `admin_log` VALUES (823, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:38:22');
INSERT INTO `admin_log` VALUES (824, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:38:23');
INSERT INTO `admin_log` VALUES (825, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:41:17');
INSERT INTO `admin_log` VALUES (826, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:52:03');
INSERT INTO `admin_log` VALUES (827, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:52:18');
INSERT INTO `admin_log` VALUES (828, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:52:44');
INSERT INTO `admin_log` VALUES (829, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:52:52');
INSERT INTO `admin_log` VALUES (830, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:52:56');
INSERT INTO `admin_log` VALUES (831, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 14:53:02');
INSERT INTO `admin_log` VALUES (832, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:03:44');
INSERT INTO `admin_log` VALUES (833, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:03:48');
INSERT INTO `admin_log` VALUES (834, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:03:53');
INSERT INTO `admin_log` VALUES (835, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:04:05');
INSERT INTO `admin_log` VALUES (836, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:04:07');
INSERT INTO `admin_log` VALUES (837, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:05:10');
INSERT INTO `admin_log` VALUES (838, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:07:30');
INSERT INTO `admin_log` VALUES (839, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:07:35');
INSERT INTO `admin_log` VALUES (840, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:07:37');
INSERT INTO `admin_log` VALUES (841, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:07:56');
INSERT INTO `admin_log` VALUES (842, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:08:00');
INSERT INTO `admin_log` VALUES (843, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:08:34');
INSERT INTO `admin_log` VALUES (844, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:09:23');
INSERT INTO `admin_log` VALUES (845, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:09:25');
INSERT INTO `admin_log` VALUES (846, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:09:41');
INSERT INTO `admin_log` VALUES (847, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:12:19');
INSERT INTO `admin_log` VALUES (848, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:12:20');
INSERT INTO `admin_log` VALUES (849, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:13:05');
INSERT INTO `admin_log` VALUES (850, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:13:06');
INSERT INTO `admin_log` VALUES (851, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:13:24');
INSERT INTO `admin_log` VALUES (852, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:13:26');
INSERT INTO `admin_log` VALUES (853, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:13:35');
INSERT INTO `admin_log` VALUES (854, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:13:36');
INSERT INTO `admin_log` VALUES (855, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:00');
INSERT INTO `admin_log` VALUES (856, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:01');
INSERT INTO `admin_log` VALUES (857, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:14');
INSERT INTO `admin_log` VALUES (858, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:16');
INSERT INTO `admin_log` VALUES (859, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:19');
INSERT INTO `admin_log` VALUES (860, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:19');
INSERT INTO `admin_log` VALUES (861, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:14:21');
INSERT INTO `admin_log` VALUES (862, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 15:14:27');
INSERT INTO `admin_log` VALUES (863, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 15:14:29');
INSERT INTO `admin_log` VALUES (864, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 15:15:10');
INSERT INTO `admin_log` VALUES (865, 'wechat-config', 'view', 'wechat-config/view', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-05 15:15:13');
INSERT INTO `admin_log` VALUES (866, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:15:20');
INSERT INTO `admin_log` VALUES (867, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:15:21');
INSERT INTO `admin_log` VALUES (868, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:19:22');
INSERT INTO `admin_log` VALUES (869, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:19:30');
INSERT INTO `admin_log` VALUES (870, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:19:31');
INSERT INTO `admin_log` VALUES (871, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:19:36');
INSERT INTO `admin_log` VALUES (872, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:23:03');
INSERT INTO `admin_log` VALUES (873, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:23:05');
INSERT INTO `admin_log` VALUES (874, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:23:37');
INSERT INTO `admin_log` VALUES (875, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:23:38');
INSERT INTO `admin_log` VALUES (876, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:24:01');
INSERT INTO `admin_log` VALUES (877, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:25:28');
INSERT INTO `admin_log` VALUES (878, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:25:39');
INSERT INTO `admin_log` VALUES (879, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:25:41');
INSERT INTO `admin_log` VALUES (880, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:25:48');
INSERT INTO `admin_log` VALUES (881, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:25:49');
INSERT INTO `admin_log` VALUES (882, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:26:06');
INSERT INTO `admin_log` VALUES (883, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:26:07');
INSERT INTO `admin_log` VALUES (884, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:26:53');
INSERT INTO `admin_log` VALUES (885, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:26:54');
INSERT INTO `admin_log` VALUES (886, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:28:36');
INSERT INTO `admin_log` VALUES (887, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:29:07');
INSERT INTO `admin_log` VALUES (888, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:29:08');
INSERT INTO `admin_log` VALUES (889, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:30:36');
INSERT INTO `admin_log` VALUES (890, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:30:38');
INSERT INTO `admin_log` VALUES (891, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:30:52');
INSERT INTO `admin_log` VALUES (892, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:31:32');
INSERT INTO `admin_log` VALUES (893, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:31:33');
INSERT INTO `admin_log` VALUES (894, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:31:42');
INSERT INTO `admin_log` VALUES (895, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:31:46');
INSERT INTO `admin_log` VALUES (896, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:32:50');
INSERT INTO `admin_log` VALUES (897, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:32:51');
INSERT INTO `admin_log` VALUES (898, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:32:55');
INSERT INTO `admin_log` VALUES (899, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:32:58');
INSERT INTO `admin_log` VALUES (900, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:33:56');
INSERT INTO `admin_log` VALUES (901, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 15:33:59');
INSERT INTO `admin_log` VALUES (902, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 15:37:07');
INSERT INTO `admin_log` VALUES (903, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 15:37:11');
INSERT INTO `admin_log` VALUES (904, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 15:37:12');
INSERT INTO `admin_log` VALUES (905, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-05 15:37:31');
INSERT INTO `admin_log` VALUES (906, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 15:37:32');
INSERT INTO `admin_log` VALUES (907, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-05 15:37:33');
INSERT INTO `admin_log` VALUES (908, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-05 15:38:23');
INSERT INTO `admin_log` VALUES (909, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-05 15:38:23');
INSERT INTO `admin_log` VALUES (910, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-05 15:38:24');
INSERT INTO `admin_log` VALUES (911, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-05 15:38:26');
INSERT INTO `admin_log` VALUES (912, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_log` VALUES (913, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_log` VALUES (914, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 15:38:43');
INSERT INTO `admin_log` VALUES (915, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 15:38:45');
INSERT INTO `admin_log` VALUES (916, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 15:38:48');
INSERT INTO `admin_log` VALUES (917, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:38:58');
INSERT INTO `admin_log` VALUES (918, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:51:05');
INSERT INTO `admin_log` VALUES (919, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:51:20');
INSERT INTO `admin_log` VALUES (920, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:51:27');
INSERT INTO `admin_log` VALUES (921, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:51:55');
INSERT INTO `admin_log` VALUES (922, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:52:59');
INSERT INTO `admin_log` VALUES (923, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:55:04');
INSERT INTO `admin_log` VALUES (924, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:58:47');
INSERT INTO `admin_log` VALUES (925, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 15:58:55');
INSERT INTO `admin_log` VALUES (926, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:00:54');
INSERT INTO `admin_log` VALUES (927, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:00:54');
INSERT INTO `admin_log` VALUES (928, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:03:09');
INSERT INTO `admin_log` VALUES (929, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:03:15');
INSERT INTO `admin_log` VALUES (930, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:03:15');
INSERT INTO `admin_log` VALUES (931, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:03:21');
INSERT INTO `admin_log` VALUES (932, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:03:23');
INSERT INTO `admin_log` VALUES (933, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:03:25');
INSERT INTO `admin_log` VALUES (934, 'images', 'delete', 'images/delete', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:04:28');
INSERT INTO `admin_log` VALUES (935, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:04:28');
INSERT INTO `admin_log` VALUES (936, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:04:34');
INSERT INTO `admin_log` VALUES (937, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:04:40');
INSERT INTO `admin_log` VALUES (938, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:09:44');
INSERT INTO `admin_log` VALUES (939, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:09:54');
INSERT INTO `admin_log` VALUES (940, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:10:11');
INSERT INTO `admin_log` VALUES (941, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:10:23');
INSERT INTO `admin_log` VALUES (942, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:10:43');
INSERT INTO `admin_log` VALUES (943, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:11:34');
INSERT INTO `admin_log` VALUES (944, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:11:42');
INSERT INTO `admin_log` VALUES (945, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:11:52');
INSERT INTO `admin_log` VALUES (946, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:12:10');
INSERT INTO `admin_log` VALUES (947, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:12:27');
INSERT INTO `admin_log` VALUES (948, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:12:45');
INSERT INTO `admin_log` VALUES (949, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:12:45');
INSERT INTO `admin_log` VALUES (950, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:13:57');
INSERT INTO `admin_log` VALUES (951, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:14:02');
INSERT INTO `admin_log` VALUES (952, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:14:02');
INSERT INTO `admin_log` VALUES (953, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:14:23');
INSERT INTO `admin_log` VALUES (954, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:14:59');
INSERT INTO `admin_log` VALUES (955, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:16:09');
INSERT INTO `admin_log` VALUES (956, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-05 16:19:26');
INSERT INTO `admin_log` VALUES (957, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-05 16:20:31');
INSERT INTO `admin_log` VALUES (958, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:20:41');
INSERT INTO `admin_log` VALUES (959, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:21:54');
INSERT INTO `admin_log` VALUES (960, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:21:59');
INSERT INTO `admin_log` VALUES (961, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:22:04');
INSERT INTO `admin_log` VALUES (962, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:22:33');
INSERT INTO `admin_log` VALUES (963, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:22:38');
INSERT INTO `admin_log` VALUES (964, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:29:05');
INSERT INTO `admin_log` VALUES (965, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:29:08');
INSERT INTO `admin_log` VALUES (966, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:29:12');
INSERT INTO `admin_log` VALUES (967, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:29:17');
INSERT INTO `admin_log` VALUES (968, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:29:54');
INSERT INTO `admin_log` VALUES (969, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:30:39');
INSERT INTO `admin_log` VALUES (970, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:30:55');
INSERT INTO `admin_log` VALUES (971, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:31:01');
INSERT INTO `admin_log` VALUES (972, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:31:19');
INSERT INTO `admin_log` VALUES (973, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:31:23');
INSERT INTO `admin_log` VALUES (974, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:32:37');
INSERT INTO `admin_log` VALUES (975, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:32:54');
INSERT INTO `admin_log` VALUES (976, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:32:57');
INSERT INTO `admin_log` VALUES (977, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:33:01');
INSERT INTO `admin_log` VALUES (978, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:33:03');
INSERT INTO `admin_log` VALUES (979, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:33:43');
INSERT INTO `admin_log` VALUES (980, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:34:19');
INSERT INTO `admin_log` VALUES (981, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:35:09');
INSERT INTO `admin_log` VALUES (982, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:35:09');
INSERT INTO `admin_log` VALUES (983, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:35:09');
INSERT INTO `admin_log` VALUES (984, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:35:14');
INSERT INTO `admin_log` VALUES (985, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:35:19');
INSERT INTO `admin_log` VALUES (986, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:36:21');
INSERT INTO `admin_log` VALUES (987, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:36:28');
INSERT INTO `admin_log` VALUES (988, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:08');
INSERT INTO `admin_log` VALUES (989, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:09');
INSERT INTO `admin_log` VALUES (990, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:09');
INSERT INTO `admin_log` VALUES (991, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:09');
INSERT INTO `admin_log` VALUES (992, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:09');
INSERT INTO `admin_log` VALUES (993, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:33');
INSERT INTO `admin_log` VALUES (994, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:36');
INSERT INTO `admin_log` VALUES (995, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:37:39');
INSERT INTO `admin_log` VALUES (996, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:40:47');
INSERT INTO `admin_log` VALUES (997, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:40:58');
INSERT INTO `admin_log` VALUES (998, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:41:04');
INSERT INTO `admin_log` VALUES (999, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:41:04');
INSERT INTO `admin_log` VALUES (1000, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:43:46');
INSERT INTO `admin_log` VALUES (1001, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:44:04');
INSERT INTO `admin_log` VALUES (1002, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:44:05');
INSERT INTO `admin_log` VALUES (1003, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:46:07');
INSERT INTO `admin_log` VALUES (1004, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:47:52');
INSERT INTO `admin_log` VALUES (1005, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:48:37');
INSERT INTO `admin_log` VALUES (1006, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:48:54');
INSERT INTO `admin_log` VALUES (1007, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:49:01');
INSERT INTO `admin_log` VALUES (1008, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:49:47');
INSERT INTO `admin_log` VALUES (1009, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:49:52');
INSERT INTO `admin_log` VALUES (1010, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:04');
INSERT INTO `admin_log` VALUES (1011, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:07');
INSERT INTO `admin_log` VALUES (1012, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:07');
INSERT INTO `admin_log` VALUES (1013, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:07');
INSERT INTO `admin_log` VALUES (1014, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:27');
INSERT INTO `admin_log` VALUES (1015, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:33');
INSERT INTO `admin_log` VALUES (1016, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:50:35');
INSERT INTO `admin_log` VALUES (1017, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:08');
INSERT INTO `admin_log` VALUES (1018, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:09');
INSERT INTO `admin_log` VALUES (1019, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:09');
INSERT INTO `admin_log` VALUES (1020, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:09');
INSERT INTO `admin_log` VALUES (1021, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:09');
INSERT INTO `admin_log` VALUES (1022, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:34');
INSERT INTO `admin_log` VALUES (1023, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:51:54');
INSERT INTO `admin_log` VALUES (1024, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:52:42');
INSERT INTO `admin_log` VALUES (1025, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:52:57');
INSERT INTO `admin_log` VALUES (1026, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:53:13');
INSERT INTO `admin_log` VALUES (1027, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:53:13');
INSERT INTO `admin_log` VALUES (1028, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:53:14');
INSERT INTO `admin_log` VALUES (1029, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:53:14');
INSERT INTO `admin_log` VALUES (1030, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 16:53:21');
INSERT INTO `admin_log` VALUES (1031, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:02:32');
INSERT INTO `admin_log` VALUES (1032, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:02:51');
INSERT INTO `admin_log` VALUES (1033, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:03:19');
INSERT INTO `admin_log` VALUES (1034, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:03:26');
INSERT INTO `admin_log` VALUES (1035, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:04:01');
INSERT INTO `admin_log` VALUES (1036, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:04:23');
INSERT INTO `admin_log` VALUES (1037, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:04:31');
INSERT INTO `admin_log` VALUES (1038, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:04:31');
INSERT INTO `admin_log` VALUES (1039, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:05:30');
INSERT INTO `admin_log` VALUES (1040, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:05:57');
INSERT INTO `admin_log` VALUES (1041, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:06:17');
INSERT INTO `admin_log` VALUES (1042, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:06:34');
INSERT INTO `admin_log` VALUES (1043, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:08:17');
INSERT INTO `admin_log` VALUES (1044, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:08:22');
INSERT INTO `admin_log` VALUES (1045, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:08:35');
INSERT INTO `admin_log` VALUES (1046, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:08:35');
INSERT INTO `admin_log` VALUES (1047, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:08:35');
INSERT INTO `admin_log` VALUES (1048, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:09:11');
INSERT INTO `admin_log` VALUES (1049, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:10:15');
INSERT INTO `admin_log` VALUES (1050, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:10:29');
INSERT INTO `admin_log` VALUES (1051, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:10:35');
INSERT INTO `admin_log` VALUES (1052, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:10:51');
INSERT INTO `admin_log` VALUES (1053, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:11:03');
INSERT INTO `admin_log` VALUES (1054, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:11:22');
INSERT INTO `admin_log` VALUES (1055, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:11:27');
INSERT INTO `admin_log` VALUES (1056, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:21');
INSERT INTO `admin_log` VALUES (1057, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:44');
INSERT INTO `admin_log` VALUES (1058, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:44');
INSERT INTO `admin_log` VALUES (1059, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:44');
INSERT INTO `admin_log` VALUES (1060, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:44');
INSERT INTO `admin_log` VALUES (1061, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:44');
INSERT INTO `admin_log` VALUES (1062, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:47');
INSERT INTO `admin_log` VALUES (1063, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:52');
INSERT INTO `admin_log` VALUES (1064, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 17:12:55');
INSERT INTO `admin_log` VALUES (1065, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:12:57');
INSERT INTO `admin_log` VALUES (1066, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:00');
INSERT INTO `admin_log` VALUES (1067, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:01');
INSERT INTO `admin_log` VALUES (1068, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:31');
INSERT INTO `admin_log` VALUES (1069, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:32');
INSERT INTO `admin_log` VALUES (1070, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:34');
INSERT INTO `admin_log` VALUES (1071, 'images', 'view', 'images/view', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:34');
INSERT INTO `admin_log` VALUES (1072, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:46');
INSERT INTO `admin_log` VALUES (1073, 'images', 'delete', 'images/delete', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:49');
INSERT INTO `admin_log` VALUES (1074, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:49');
INSERT INTO `admin_log` VALUES (1075, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:54');
INSERT INTO `admin_log` VALUES (1076, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:55');
INSERT INTO `admin_log` VALUES (1077, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:55');
INSERT INTO `admin_log` VALUES (1078, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:13:55');
INSERT INTO `admin_log` VALUES (1079, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:14:06');
INSERT INTO `admin_log` VALUES (1080, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:14:50');
INSERT INTO `admin_log` VALUES (1081, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:15:00');
INSERT INTO `admin_log` VALUES (1082, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:15:24');
INSERT INTO `admin_log` VALUES (1083, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:15:32');
INSERT INTO `admin_log` VALUES (1084, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:15:38');
INSERT INTO `admin_log` VALUES (1085, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:27:20');
INSERT INTO `admin_log` VALUES (1086, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:40:57');
INSERT INTO `admin_log` VALUES (1087, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:41:06');
INSERT INTO `admin_log` VALUES (1088, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:41:26');
INSERT INTO `admin_log` VALUES (1089, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:42:25');
INSERT INTO `admin_log` VALUES (1090, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:42:33');
INSERT INTO `admin_log` VALUES (1091, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:44:29');
INSERT INTO `admin_log` VALUES (1092, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:44:30');
INSERT INTO `admin_log` VALUES (1093, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:44:30');
INSERT INTO `admin_log` VALUES (1094, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:44:36');
INSERT INTO `admin_log` VALUES (1095, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:44:58');
INSERT INTO `admin_log` VALUES (1096, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:45:11');
INSERT INTO `admin_log` VALUES (1097, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:45:13');
INSERT INTO `admin_log` VALUES (1098, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:45:13');
INSERT INTO `admin_log` VALUES (1099, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:45:13');
INSERT INTO `admin_log` VALUES (1100, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:45:13');
INSERT INTO `admin_log` VALUES (1101, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:45:13');
INSERT INTO `admin_log` VALUES (1102, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:46:11');
INSERT INTO `admin_log` VALUES (1103, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:47:21');
INSERT INTO `admin_log` VALUES (1104, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:48:03');
INSERT INTO `admin_log` VALUES (1105, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:48:20');
INSERT INTO `admin_log` VALUES (1106, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:48:30');
INSERT INTO `admin_log` VALUES (1107, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:48:34');
INSERT INTO `admin_log` VALUES (1108, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:48:49');
INSERT INTO `admin_log` VALUES (1109, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:51:19');
INSERT INTO `admin_log` VALUES (1110, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 17:51:28');
INSERT INTO `admin_log` VALUES (1111, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 17:51:29');
INSERT INTO `admin_log` VALUES (1112, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 17:51:30');
INSERT INTO `admin_log` VALUES (1113, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 17:51:37');
INSERT INTO `admin_log` VALUES (1114, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 17:51:39');
INSERT INTO `admin_log` VALUES (1115, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:52:13');
INSERT INTO `admin_log` VALUES (1116, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 17:52:18');
INSERT INTO `admin_log` VALUES (1117, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 17:52:20');
INSERT INTO `admin_log` VALUES (1118, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 17:55:36');
INSERT INTO `admin_log` VALUES (1119, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-05 17:59:47');
INSERT INTO `admin_log` VALUES (1120, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 17:59:52');
INSERT INTO `admin_log` VALUES (1121, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 17:59:54');
INSERT INTO `admin_log` VALUES (1122, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-05 18:00:05');
INSERT INTO `admin_log` VALUES (1123, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 18:00:08');
INSERT INTO `admin_log` VALUES (1124, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-05 18:00:09');
INSERT INTO `admin_log` VALUES (1125, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 18:00:10');
INSERT INTO `admin_log` VALUES (1126, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-05 18:00:12');
INSERT INTO `admin_log` VALUES (1127, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 18:00:43');
INSERT INTO `admin_log` VALUES (1128, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 18:00:45');
INSERT INTO `admin_log` VALUES (1129, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 18:04:05');
INSERT INTO `admin_log` VALUES (1130, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 18:04:10');
INSERT INTO `admin_log` VALUES (1131, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 18:04:13');
INSERT INTO `admin_log` VALUES (1132, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 18:04:14');
INSERT INTO `admin_log` VALUES (1133, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 18:04:15');
INSERT INTO `admin_log` VALUES (1134, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 18:04:16');
INSERT INTO `admin_log` VALUES (1135, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 18:04:18');
INSERT INTO `admin_log` VALUES (1136, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 18:04:19');
INSERT INTO `admin_log` VALUES (1137, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 18:04:20');
INSERT INTO `admin_log` VALUES (1138, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 18:04:21');
INSERT INTO `admin_log` VALUES (1139, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 18:04:22');
INSERT INTO `admin_log` VALUES (1140, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-05 18:04:22');
INSERT INTO `admin_log` VALUES (1141, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-05 18:04:26');
INSERT INTO `admin_log` VALUES (1142, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-05 18:04:32');
INSERT INTO `admin_log` VALUES (1143, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-05 18:06:04');
INSERT INTO `admin_log` VALUES (1144, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 18:06:05');
INSERT INTO `admin_log` VALUES (1145, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 18:07:15');
INSERT INTO `admin_log` VALUES (1146, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:12:56');
INSERT INTO `admin_log` VALUES (1147, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:14:08');
INSERT INTO `admin_log` VALUES (1148, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:14:35');
INSERT INTO `admin_log` VALUES (1149, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:26:16');
INSERT INTO `admin_log` VALUES (1150, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:31:11');
INSERT INTO `admin_log` VALUES (1151, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:31:23');
INSERT INTO `admin_log` VALUES (1152, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:31:30');
INSERT INTO `admin_log` VALUES (1153, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 18:31:38');
INSERT INTO `admin_log` VALUES (1154, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 22:47:32');
INSERT INTO `admin_log` VALUES (1155, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-05 22:47:37');
INSERT INTO `admin_log` VALUES (1156, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 22:47:44');
INSERT INTO `admin_log` VALUES (1157, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-05 22:47:46');
INSERT INTO `admin_log` VALUES (1158, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 22:47:48');
INSERT INTO `admin_log` VALUES (1159, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 22:47:51');
INSERT INTO `admin_log` VALUES (1160, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-05 22:54:32');
INSERT INTO `admin_log` VALUES (1161, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 22:54:37');
INSERT INTO `admin_log` VALUES (1162, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-05 22:54:40');
INSERT INTO `admin_log` VALUES (1163, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-06 12:57:59');
INSERT INTO `admin_log` VALUES (1164, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-06 12:58:00');
INSERT INTO `admin_log` VALUES (1165, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-06 12:58:01');
INSERT INTO `admin_log` VALUES (1166, 'admin-role', 'view', 'admin-role/view', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-06 12:58:06');
INSERT INTO `admin_log` VALUES (1167, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 12:58:11');
INSERT INTO `admin_log` VALUES (1168, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-06 12:58:16');
INSERT INTO `admin_log` VALUES (1169, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:19');
INSERT INTO `admin_log` VALUES (1170, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-06 13:09:22');
INSERT INTO `admin_log` VALUES (1171, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:23');
INSERT INTO `admin_log` VALUES (1172, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:49');
INSERT INTO `admin_log` VALUES (1173, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:52');
INSERT INTO `admin_log` VALUES (1174, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:55');
INSERT INTO `admin_log` VALUES (1175, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:58');
INSERT INTO `admin_log` VALUES (1176, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:09:59');
INSERT INTO `admin_log` VALUES (1177, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-06 13:10:03');
INSERT INTO `admin_log` VALUES (1178, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:10:04');
INSERT INTO `admin_log` VALUES (1179, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:10:05');
INSERT INTO `admin_log` VALUES (1180, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-06 13:10:12');
INSERT INTO `admin_log` VALUES (1181, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 13:10:15');
INSERT INTO `admin_log` VALUES (1182, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 13:10:16');
INSERT INTO `admin_log` VALUES (1183, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:10:23');
INSERT INTO `admin_log` VALUES (1184, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:11:42');
INSERT INTO `admin_log` VALUES (1185, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-06 13:11:43');
INSERT INTO `admin_log` VALUES (1186, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:11:44');
INSERT INTO `admin_log` VALUES (1187, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-06 13:11:45');
INSERT INTO `admin_log` VALUES (1188, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:11:46');
INSERT INTO `admin_log` VALUES (1189, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:11:48');
INSERT INTO `admin_log` VALUES (1190, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:13:32');
INSERT INTO `admin_log` VALUES (1191, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:13:34');
INSERT INTO `admin_log` VALUES (1192, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-06 13:16:06');
INSERT INTO `admin_log` VALUES (1193, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-06 13:16:09');
INSERT INTO `admin_log` VALUES (1194, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-06 13:16:48');
INSERT INTO `admin_log` VALUES (1195, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:16:48');
INSERT INTO `admin_log` VALUES (1196, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-06 13:17:47');
INSERT INTO `admin_log` VALUES (1197, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-06 17:13:14');
INSERT INTO `admin_log` VALUES (1198, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-06 17:13:15');
INSERT INTO `admin_log` VALUES (1199, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-06 17:13:16');
INSERT INTO `admin_log` VALUES (1200, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-06 17:13:29');
INSERT INTO `admin_log` VALUES (1201, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-06 17:13:31');
INSERT INTO `admin_log` VALUES (1202, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-06 17:13:32');
INSERT INTO `admin_log` VALUES (1203, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 17:24:19');
INSERT INTO `admin_log` VALUES (1204, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:24:22');
INSERT INTO `admin_log` VALUES (1205, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-06 17:24:24');
INSERT INTO `admin_log` VALUES (1206, 'wechat-config', 'view', 'wechat-config/view', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-06 17:24:28');
INSERT INTO `admin_log` VALUES (1207, 'wechat-config', 'view', 'wechat-config/view', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-06 17:24:32');
INSERT INTO `admin_log` VALUES (1208, 'wechat-config', 'update', 'wechat-config/update', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-06 17:24:41');
INSERT INTO `admin_log` VALUES (1209, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-06 17:24:41');
INSERT INTO `admin_log` VALUES (1210, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:24:44');
INSERT INTO `admin_log` VALUES (1211, 'order', 'create', 'order/create', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:25:04');
INSERT INTO `admin_log` VALUES (1212, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:51:53');
INSERT INTO `admin_log` VALUES (1213, 'order', 'create', 'order/create', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:52:05');
INSERT INTO `admin_log` VALUES (1214, 'order', 'create', 'order/create', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:52:11');
INSERT INTO `admin_log` VALUES (1215, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-06 17:52:12');
INSERT INTO `admin_log` VALUES (1216, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 17:52:28');
INSERT INTO `admin_log` VALUES (1217, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 17:55:46');
INSERT INTO `admin_log` VALUES (1218, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 17:57:24');
INSERT INTO `admin_log` VALUES (1219, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 17:58:04');
INSERT INTO `admin_log` VALUES (1220, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:07:36');
INSERT INTO `admin_log` VALUES (1221, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:07:48');
INSERT INTO `admin_log` VALUES (1222, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:08:18');
INSERT INTO `admin_log` VALUES (1223, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:08:18');
INSERT INTO `admin_log` VALUES (1224, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:08:18');
INSERT INTO `admin_log` VALUES (1225, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:08:40');
INSERT INTO `admin_log` VALUES (1226, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:08:47');
INSERT INTO `admin_log` VALUES (1227, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:10:11');
INSERT INTO `admin_log` VALUES (1228, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:16:07');
INSERT INTO `admin_log` VALUES (1229, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:16:25');
INSERT INTO `admin_log` VALUES (1230, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-06 18:16:25');
INSERT INTO `admin_log` VALUES (1231, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-07 09:58:35');
INSERT INTO `admin_log` VALUES (1232, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-07 09:58:35');
INSERT INTO `admin_log` VALUES (1233, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-07 09:58:36');
INSERT INTO `admin_log` VALUES (1234, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-07 09:59:00');
INSERT INTO `admin_log` VALUES (1235, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-07 15:44:17');
INSERT INTO `admin_log` VALUES (1236, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-07 15:47:01');
INSERT INTO `admin_log` VALUES (1237, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-07 15:47:37');
INSERT INTO `admin_log` VALUES (1238, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-07 15:48:10');
INSERT INTO `admin_log` VALUES (1239, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-07 15:48:44');
INSERT INTO `admin_log` VALUES (1240, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-07 15:51:14');
INSERT INTO `admin_log` VALUES (1241, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-07 22:06:47');
INSERT INTO `admin_log` VALUES (1242, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-07 22:06:49');
INSERT INTO `admin_log` VALUES (1243, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-07 22:06:50');
INSERT INTO `admin_log` VALUES (1244, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-07 22:08:01');
INSERT INTO `admin_log` VALUES (1245, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-07 22:09:54');
INSERT INTO `admin_log` VALUES (1246, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-07 22:09:56');
INSERT INTO `admin_log` VALUES (1247, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-07 22:10:04');
INSERT INTO `admin_log` VALUES (1248, 'order', 'view', 'order/view', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-07 22:10:14');
INSERT INTO `admin_log` VALUES (1249, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-07 22:12:45');
INSERT INTO `admin_log` VALUES (1250, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-07 22:13:05');
INSERT INTO `admin_log` VALUES (1251, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-09 09:37:02');
INSERT INTO `admin_log` VALUES (1252, 'images', 'create', 'images/create', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-09 09:37:08');
INSERT INTO `admin_log` VALUES (1253, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-09 09:37:08');
INSERT INTO `admin_log` VALUES (1254, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-09 09:37:11');
INSERT INTO `admin_log` VALUES (1255, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-09 09:37:13');
INSERT INTO `admin_log` VALUES (1256, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 09:37:15');
INSERT INTO `admin_log` VALUES (1257, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-09 09:37:16');
INSERT INTO `admin_log` VALUES (1258, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-09 09:37:22');
INSERT INTO `admin_log` VALUES (1259, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-09 09:37:23');
INSERT INTO `admin_log` VALUES (1260, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-09 09:37:24');
INSERT INTO `admin_log` VALUES (1261, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-09 09:37:25');
INSERT INTO `admin_log` VALUES (1262, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-09 10:52:35');
INSERT INTO `admin_log` VALUES (1263, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-09 10:52:40');
INSERT INTO `admin_log` VALUES (1264, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:52:41');
INSERT INTO `admin_log` VALUES (1265, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-09 10:52:45');
INSERT INTO `admin_log` VALUES (1266, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:52:46');
INSERT INTO `admin_log` VALUES (1267, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-09 10:52:47');
INSERT INTO `admin_log` VALUES (1268, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:52:48');
INSERT INTO `admin_log` VALUES (1269, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-09 10:52:50');
INSERT INTO `admin_log` VALUES (1270, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:53:31');
INSERT INTO `admin_log` VALUES (1271, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-09 10:53:52');
INSERT INTO `admin_log` VALUES (1272, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-09 10:53:54');
INSERT INTO `admin_log` VALUES (1273, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-09 10:53:59');
INSERT INTO `admin_log` VALUES (1274, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-09 10:54:00');
INSERT INTO `admin_log` VALUES (1275, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:54:05');
INSERT INTO `admin_log` VALUES (1276, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:54:09');
INSERT INTO `admin_log` VALUES (1277, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:56:45');
INSERT INTO `admin_log` VALUES (1278, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:56:48');
INSERT INTO `admin_log` VALUES (1279, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:56:51');
INSERT INTO `admin_log` VALUES (1280, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:56:52');
INSERT INTO `admin_log` VALUES (1281, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:56:55');
INSERT INTO `admin_log` VALUES (1282, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:57:45');
INSERT INTO `admin_log` VALUES (1283, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:57:48');
INSERT INTO `admin_log` VALUES (1284, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:57:49');
INSERT INTO `admin_log` VALUES (1285, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:58:01');
INSERT INTO `admin_log` VALUES (1286, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:58:02');
INSERT INTO `admin_log` VALUES (1287, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:58:23');
INSERT INTO `admin_log` VALUES (1288, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 10:58:24');
INSERT INTO `admin_log` VALUES (1289, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:00:58');
INSERT INTO `admin_log` VALUES (1290, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:00:59');
INSERT INTO `admin_log` VALUES (1291, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:01:29');
INSERT INTO `admin_log` VALUES (1292, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:01:33');
INSERT INTO `admin_log` VALUES (1293, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:01:49');
INSERT INTO `admin_log` VALUES (1294, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:01:52');
INSERT INTO `admin_log` VALUES (1295, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:10:14');
INSERT INTO `admin_log` VALUES (1296, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:10:19');
INSERT INTO `admin_log` VALUES (1297, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:10:28');
INSERT INTO `admin_log` VALUES (1298, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:10:30');
INSERT INTO `admin_log` VALUES (1299, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:10:34');
INSERT INTO `admin_log` VALUES (1300, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:10:35');
INSERT INTO `admin_log` VALUES (1301, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:27:51');
INSERT INTO `admin_log` VALUES (1302, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:27:52');
INSERT INTO `admin_log` VALUES (1303, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:31:14');
INSERT INTO `admin_log` VALUES (1304, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:32:54');
INSERT INTO `admin_log` VALUES (1305, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:33:15');
INSERT INTO `admin_log` VALUES (1306, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:33:20');
INSERT INTO `admin_log` VALUES (1307, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:33:41');
INSERT INTO `admin_log` VALUES (1308, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:33:50');
INSERT INTO `admin_log` VALUES (1309, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:35:08');
INSERT INTO `admin_log` VALUES (1310, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:46:18');
INSERT INTO `admin_log` VALUES (1311, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:47:52');
INSERT INTO `admin_log` VALUES (1312, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:47:55');
INSERT INTO `admin_log` VALUES (1313, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:48:23');
INSERT INTO `admin_log` VALUES (1314, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:48:29');
INSERT INTO `admin_log` VALUES (1315, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:48:31');
INSERT INTO `admin_log` VALUES (1316, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:48:32');
INSERT INTO `admin_log` VALUES (1317, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:48:35');
INSERT INTO `admin_log` VALUES (1318, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:48:37');
INSERT INTO `admin_log` VALUES (1319, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:49:32');
INSERT INTO `admin_log` VALUES (1320, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:49:33');
INSERT INTO `admin_log` VALUES (1321, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:49:36');
INSERT INTO `admin_log` VALUES (1322, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:49:38');
INSERT INTO `admin_log` VALUES (1323, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:49:40');
INSERT INTO `admin_log` VALUES (1324, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:08');
INSERT INTO `admin_log` VALUES (1325, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:09');
INSERT INTO `admin_log` VALUES (1326, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:14');
INSERT INTO `admin_log` VALUES (1327, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:15');
INSERT INTO `admin_log` VALUES (1328, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:15');
INSERT INTO `admin_log` VALUES (1329, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:18');
INSERT INTO `admin_log` VALUES (1330, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:49');
INSERT INTO `admin_log` VALUES (1331, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:50');
INSERT INTO `admin_log` VALUES (1332, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:52');
INSERT INTO `admin_log` VALUES (1333, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:50:56');
INSERT INTO `admin_log` VALUES (1334, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:51:21');
INSERT INTO `admin_log` VALUES (1335, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:51:22');
INSERT INTO `admin_log` VALUES (1336, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:51:24');
INSERT INTO `admin_log` VALUES (1337, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:51:27');
INSERT INTO `admin_log` VALUES (1338, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:51:32');
INSERT INTO `admin_log` VALUES (1339, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:52:20');
INSERT INTO `admin_log` VALUES (1340, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:52:21');
INSERT INTO `admin_log` VALUES (1341, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:52:23');
INSERT INTO `admin_log` VALUES (1342, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:52:48');
INSERT INTO `admin_log` VALUES (1343, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:52:51');
INSERT INTO `admin_log` VALUES (1344, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:52:59');
INSERT INTO `admin_log` VALUES (1345, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:54:23');
INSERT INTO `admin_log` VALUES (1346, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:54:51');
INSERT INTO `admin_log` VALUES (1347, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:54:57');
INSERT INTO `admin_log` VALUES (1348, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:55:00');
INSERT INTO `admin_log` VALUES (1349, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:55:24');
INSERT INTO `admin_log` VALUES (1350, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:55:31');
INSERT INTO `admin_log` VALUES (1351, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:55:34');
INSERT INTO `admin_log` VALUES (1352, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:55:36');
INSERT INTO `admin_log` VALUES (1353, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:56:24');
INSERT INTO `admin_log` VALUES (1354, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:56:26');
INSERT INTO `admin_log` VALUES (1355, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:01');
INSERT INTO `admin_log` VALUES (1356, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:05');
INSERT INTO `admin_log` VALUES (1357, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:07');
INSERT INTO `admin_log` VALUES (1358, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:10');
INSERT INTO `admin_log` VALUES (1359, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:11');
INSERT INTO `admin_log` VALUES (1360, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:38');
INSERT INTO `admin_log` VALUES (1361, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:57:41');
INSERT INTO `admin_log` VALUES (1362, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:59:48');
INSERT INTO `admin_log` VALUES (1363, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 11:59:53');
INSERT INTO `admin_log` VALUES (1364, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:06:12');
INSERT INTO `admin_log` VALUES (1365, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:07:54');
INSERT INTO `admin_log` VALUES (1366, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:08:02');
INSERT INTO `admin_log` VALUES (1367, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:08:15');
INSERT INTO `admin_log` VALUES (1368, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:08:20');
INSERT INTO `admin_log` VALUES (1369, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:08:22');
INSERT INTO `admin_log` VALUES (1370, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:08:24');
INSERT INTO `admin_log` VALUES (1371, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:09:38');
INSERT INTO `admin_log` VALUES (1372, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:14:18');
INSERT INTO `admin_log` VALUES (1373, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:14:20');
INSERT INTO `admin_log` VALUES (1374, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:14:27');
INSERT INTO `admin_log` VALUES (1375, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:18:25');
INSERT INTO `admin_log` VALUES (1376, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 12:18:37');
INSERT INTO `admin_log` VALUES (1377, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:14:07');
INSERT INTO `admin_log` VALUES (1378, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:14:13');
INSERT INTO `admin_log` VALUES (1379, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:14:18');
INSERT INTO `admin_log` VALUES (1380, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:14:20');
INSERT INTO `admin_log` VALUES (1381, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:14:54');
INSERT INTO `admin_log` VALUES (1382, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:15:05');
INSERT INTO `admin_log` VALUES (1383, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:01');
INSERT INTO `admin_log` VALUES (1384, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:06');
INSERT INTO `admin_log` VALUES (1385, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:19');
INSERT INTO `admin_log` VALUES (1386, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:22');
INSERT INTO `admin_log` VALUES (1387, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:24');
INSERT INTO `admin_log` VALUES (1388, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:30');
INSERT INTO `admin_log` VALUES (1389, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:31');
INSERT INTO `admin_log` VALUES (1390, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:34');
INSERT INTO `admin_log` VALUES (1391, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:46');
INSERT INTO `admin_log` VALUES (1392, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:47');
INSERT INTO `admin_log` VALUES (1393, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:21:49');
INSERT INTO `admin_log` VALUES (1394, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:23:18');
INSERT INTO `admin_log` VALUES (1395, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:25:25');
INSERT INTO `admin_log` VALUES (1396, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:25:28');
INSERT INTO `admin_log` VALUES (1397, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:25:35');
INSERT INTO `admin_log` VALUES (1398, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:25:55');
INSERT INTO `admin_log` VALUES (1399, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-09 17:25:55');
INSERT INTO `admin_log` VALUES (1400, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:41:30');
INSERT INTO `admin_log` VALUES (1401, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:41:33');
INSERT INTO `admin_log` VALUES (1402, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:41:36');
INSERT INTO `admin_log` VALUES (1403, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:42:33');
INSERT INTO `admin_log` VALUES (1404, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:42:36');
INSERT INTO `admin_log` VALUES (1405, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-10 16:43:08');
INSERT INTO `admin_log` VALUES (1406, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:43:09');
INSERT INTO `admin_log` VALUES (1407, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:43:09');
INSERT INTO `admin_log` VALUES (1408, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:43:11');
INSERT INTO `admin_log` VALUES (1409, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:43:12');
INSERT INTO `admin_log` VALUES (1410, 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:43:18');
INSERT INTO `admin_log` VALUES (1411, 'admin-right', 'view', 'admin-right/view', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:43:22');
INSERT INTO `admin_log` VALUES (1412, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:43:28');
INSERT INTO `admin_log` VALUES (1413, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:43:29');
INSERT INTO `admin_log` VALUES (1414, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:43:33');
INSERT INTO `admin_log` VALUES (1415, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:43:35');
INSERT INTO `admin_log` VALUES (1416, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:43:46');
INSERT INTO `admin_log` VALUES (1417, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:43:48');
INSERT INTO `admin_log` VALUES (1418, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:43:49');
INSERT INTO `admin_log` VALUES (1419, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:43:53');
INSERT INTO `admin_log` VALUES (1420, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:43:56');
INSERT INTO `admin_log` VALUES (1421, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:43:59');
INSERT INTO `admin_log` VALUES (1422, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:44:02');
INSERT INTO `admin_log` VALUES (1423, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-10 16:44:11');
INSERT INTO `admin_log` VALUES (1424, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:44:11');
INSERT INTO `admin_log` VALUES (1425, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:44:13');
INSERT INTO `admin_log` VALUES (1426, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:44:15');
INSERT INTO `admin_log` VALUES (1427, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:44:16');
INSERT INTO `admin_log` VALUES (1428, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:44:19');
INSERT INTO `admin_log` VALUES (1429, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:44:28');
INSERT INTO `admin_log` VALUES (1430, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:44:29');
INSERT INTO `admin_log` VALUES (1431, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:45:13');
INSERT INTO `admin_log` VALUES (1432, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:45:20');
INSERT INTO `admin_log` VALUES (1433, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:45:21');
INSERT INTO `admin_log` VALUES (1434, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:45:26');
INSERT INTO `admin_log` VALUES (1435, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:45:29');
INSERT INTO `admin_log` VALUES (1436, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:45:31');
INSERT INTO `admin_log` VALUES (1437, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:45:45');
INSERT INTO `admin_log` VALUES (1438, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-10 16:47:27');
INSERT INTO `admin_log` VALUES (1439, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:47:27');
INSERT INTO `admin_log` VALUES (1440, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:50:49');
INSERT INTO `admin_log` VALUES (1441, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-10 16:51:37');
INSERT INTO `admin_log` VALUES (1442, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:51:37');
INSERT INTO `admin_log` VALUES (1443, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:51:39');
INSERT INTO `admin_log` VALUES (1444, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:51:40');
INSERT INTO `admin_log` VALUES (1445, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_log` VALUES (1446, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_log` VALUES (1447, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:51:49');
INSERT INTO `admin_log` VALUES (1448, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:51:50');
INSERT INTO `admin_log` VALUES (1449, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:51:52');
INSERT INTO `admin_log` VALUES (1450, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:51:56');
INSERT INTO `admin_log` VALUES (1451, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-10 16:52:08');
INSERT INTO `admin_log` VALUES (1452, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 16:52:22');
INSERT INTO `admin_log` VALUES (1453, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 16:52:24');
INSERT INTO `admin_log` VALUES (1454, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-10 16:52:26');
INSERT INTO `admin_log` VALUES (1455, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:52:27');
INSERT INTO `admin_log` VALUES (1456, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:52:30');
INSERT INTO `admin_log` VALUES (1457, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:52:31');
INSERT INTO `admin_log` VALUES (1458, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:52:38');
INSERT INTO `admin_log` VALUES (1459, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:52:52');
INSERT INTO `admin_log` VALUES (1460, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:52:52');
INSERT INTO `admin_log` VALUES (1461, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-10 16:53:07');
INSERT INTO `admin_log` VALUES (1462, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 16:53:09');
INSERT INTO `admin_log` VALUES (1463, 'order', 'delete', 'order/delete', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 16:53:23');
INSERT INTO `admin_log` VALUES (1464, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 16:53:23');
INSERT INTO `admin_log` VALUES (1465, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:53:26');
INSERT INTO `admin_log` VALUES (1466, 'activity-user', 'delete', 'activity-user/delete', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:53:29');
INSERT INTO `admin_log` VALUES (1467, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:53:29');
INSERT INTO `admin_log` VALUES (1468, 'activity-user', 'delete', 'activity-user/delete', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:53:30');
INSERT INTO `admin_log` VALUES (1469, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:53:31');
INSERT INTO `admin_log` VALUES (1470, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:55:16');
INSERT INTO `admin_log` VALUES (1471, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:55:28');
INSERT INTO `admin_log` VALUES (1472, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:55:30');
INSERT INTO `admin_log` VALUES (1473, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-10 16:55:40');
INSERT INTO `admin_log` VALUES (1474, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:55:46');
INSERT INTO `admin_log` VALUES (1475, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:55:47');
INSERT INTO `admin_log` VALUES (1476, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:55:51');
INSERT INTO `admin_log` VALUES (1477, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:55:51');
INSERT INTO `admin_log` VALUES (1478, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:55:52');
INSERT INTO `admin_log` VALUES (1479, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 16:56:43');
INSERT INTO `admin_log` VALUES (1480, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-10 16:56:45');
INSERT INTO `admin_log` VALUES (1481, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 16:56:47');
INSERT INTO `admin_log` VALUES (1482, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:56:49');
INSERT INTO `admin_log` VALUES (1483, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:56:50');
INSERT INTO `admin_log` VALUES (1484, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:56:50');
INSERT INTO `admin_log` VALUES (1485, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:56:54');
INSERT INTO `admin_log` VALUES (1486, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:56:58');
INSERT INTO `admin_log` VALUES (1487, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:57:03');
INSERT INTO `admin_log` VALUES (1488, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:57:04');
INSERT INTO `admin_log` VALUES (1489, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:57:05');
INSERT INTO `admin_log` VALUES (1490, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:57:06');
INSERT INTO `admin_log` VALUES (1491, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:57:06');
INSERT INTO `admin_log` VALUES (1492, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:57:07');
INSERT INTO `admin_log` VALUES (1493, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:57:17');
INSERT INTO `admin_log` VALUES (1494, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:57:20');
INSERT INTO `admin_log` VALUES (1495, 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-10 16:57:24');
INSERT INTO `admin_log` VALUES (1496, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:57:24');
INSERT INTO `admin_log` VALUES (1497, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:57:28');
INSERT INTO `admin_log` VALUES (1498, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-10 16:57:30');
INSERT INTO `admin_log` VALUES (1499, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:57:40');
INSERT INTO `admin_log` VALUES (1500, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:57:41');
INSERT INTO `admin_log` VALUES (1501, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:57:42');
INSERT INTO `admin_log` VALUES (1502, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:57:42');
INSERT INTO `admin_log` VALUES (1503, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 16:57:48');
INSERT INTO `admin_log` VALUES (1504, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-10 16:57:49');
INSERT INTO `admin_log` VALUES (1505, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 16:57:51');
INSERT INTO `admin_log` VALUES (1506, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-10 16:57:52');
INSERT INTO `admin_log` VALUES (1507, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:57:53');
INSERT INTO `admin_log` VALUES (1508, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-10 16:57:54');
INSERT INTO `admin_log` VALUES (1509, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-10 16:57:56');
INSERT INTO `admin_log` VALUES (1510, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-10 16:57:57');
INSERT INTO `admin_log` VALUES (1511, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-10 16:57:57');
INSERT INTO `admin_log` VALUES (1512, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-10 16:57:58');
INSERT INTO `admin_log` VALUES (1513, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-10 16:58:01');
INSERT INTO `admin_log` VALUES (1514, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 16:58:02');
INSERT INTO `admin_log` VALUES (1515, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 16:58:03');
INSERT INTO `admin_log` VALUES (1516, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:01:15');
INSERT INTO `admin_log` VALUES (1517, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:01:45');
INSERT INTO `admin_log` VALUES (1518, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:01:55');
INSERT INTO `admin_log` VALUES (1519, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:02:45');
INSERT INTO `admin_log` VALUES (1520, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:02:46');
INSERT INTO `admin_log` VALUES (1521, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:03:01');
INSERT INTO `admin_log` VALUES (1522, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:03:02');
INSERT INTO `admin_log` VALUES (1523, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:03:02');
INSERT INTO `admin_log` VALUES (1524, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:03:02');
INSERT INTO `admin_log` VALUES (1525, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:03:03');
INSERT INTO `admin_log` VALUES (1526, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:04:20');
INSERT INTO `admin_log` VALUES (1527, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:04:22');
INSERT INTO `admin_log` VALUES (1528, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:04:22');
INSERT INTO `admin_log` VALUES (1529, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:04:22');
INSERT INTO `admin_log` VALUES (1530, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:04:37');
INSERT INTO `admin_log` VALUES (1531, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:04:49');
INSERT INTO `admin_log` VALUES (1532, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:05:46');
INSERT INTO `admin_log` VALUES (1533, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:06:53');
INSERT INTO `admin_log` VALUES (1534, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 17:07:06');
INSERT INTO `admin_log` VALUES (1535, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 17:07:11');
INSERT INTO `admin_log` VALUES (1536, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 17:07:14');
INSERT INTO `admin_log` VALUES (1537, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 17:07:15');
INSERT INTO `admin_log` VALUES (1538, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-10 17:07:23');
INSERT INTO `admin_log` VALUES (1539, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-10 17:34:52');
INSERT INTO `admin_log` VALUES (1540, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:34:55');
INSERT INTO `admin_log` VALUES (1541, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:34:57');
INSERT INTO `admin_log` VALUES (1542, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:34:58');
INSERT INTO `admin_log` VALUES (1543, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:34:59');
INSERT INTO `admin_log` VALUES (1544, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:34:59');
INSERT INTO `admin_log` VALUES (1545, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-10 17:35:00');
INSERT INTO `admin_log` VALUES (1546, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-10 17:35:02');
INSERT INTO `admin_log` VALUES (1547, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 17:35:04');
INSERT INTO `admin_log` VALUES (1548, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 17:35:05');
INSERT INTO `admin_log` VALUES (1549, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-10 17:35:07');
INSERT INTO `admin_log` VALUES (1550, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-10 17:59:05');
INSERT INTO `admin_log` VALUES (1551, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-10 17:59:19');
INSERT INTO `admin_log` VALUES (1552, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-10 17:59:20');
INSERT INTO `admin_log` VALUES (1553, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '::1', 'admin', '2020-06-10 17:59:21');
INSERT INTO `admin_log` VALUES (1554, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:59:22');
INSERT INTO `admin_log` VALUES (1555, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:59:26');
INSERT INTO `admin_log` VALUES (1556, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:59:31');
INSERT INTO `admin_log` VALUES (1557, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:59:50');
INSERT INTO `admin_log` VALUES (1558, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:59:56');
INSERT INTO `admin_log` VALUES (1559, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 17:59:56');
INSERT INTO `admin_log` VALUES (1560, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:08');
INSERT INTO `admin_log` VALUES (1561, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:00:13');
INSERT INTO `admin_log` VALUES (1562, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:00:24');
INSERT INTO `admin_log` VALUES (1563, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:00:36');
INSERT INTO `admin_log` VALUES (1564, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:00:37');
INSERT INTO `admin_log` VALUES (1565, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:00:37');
INSERT INTO `admin_log` VALUES (1566, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:00:37');
INSERT INTO `admin_log` VALUES (1567, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:41');
INSERT INTO `admin_log` VALUES (1568, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:44');
INSERT INTO `admin_log` VALUES (1569, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:46');
INSERT INTO `admin_log` VALUES (1570, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:46');
INSERT INTO `admin_log` VALUES (1571, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:48');
INSERT INTO `admin_log` VALUES (1572, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:56');
INSERT INTO `admin_log` VALUES (1573, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:00:56');
INSERT INTO `admin_log` VALUES (1574, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:01:03');
INSERT INTO `admin_log` VALUES (1575, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:25');
INSERT INTO `admin_log` VALUES (1576, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:33');
INSERT INTO `admin_log` VALUES (1577, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:33');
INSERT INTO `admin_log` VALUES (1578, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:34');
INSERT INTO `admin_log` VALUES (1579, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:34');
INSERT INTO `admin_log` VALUES (1580, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:34');
INSERT INTO `admin_log` VALUES (1581, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:42');
INSERT INTO `admin_log` VALUES (1582, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:01:43');
INSERT INTO `admin_log` VALUES (1583, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:01:46');
INSERT INTO `admin_log` VALUES (1584, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:01:55');
INSERT INTO `admin_log` VALUES (1585, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:04');
INSERT INTO `admin_log` VALUES (1586, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-10 18:02:07');
INSERT INTO `admin_log` VALUES (1587, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:09');
INSERT INTO `admin_log` VALUES (1588, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:10');
INSERT INTO `admin_log` VALUES (1589, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:10');
INSERT INTO `admin_log` VALUES (1590, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:10');
INSERT INTO `admin_log` VALUES (1591, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:10');
INSERT INTO `admin_log` VALUES (1592, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:11');
INSERT INTO `admin_log` VALUES (1593, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:11');
INSERT INTO `admin_log` VALUES (1594, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:11');
INSERT INTO `admin_log` VALUES (1595, 'site', 'error', 'site/error', NULL, NULL, NULL, '::1', 'admin', '2020-06-10 18:02:11');
INSERT INTO `admin_log` VALUES (1596, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-10 19:50:56');
INSERT INTO `admin_log` VALUES (1597, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-10 19:51:01');
INSERT INTO `admin_log` VALUES (1598, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-10 19:51:04');
INSERT INTO `admin_log` VALUES (1599, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:00:27');
INSERT INTO `admin_log` VALUES (1600, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-10 22:01:01');
INSERT INTO `admin_log` VALUES (1601, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:01:05');
INSERT INTO `admin_log` VALUES (1602, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:01:36');
INSERT INTO `admin_log` VALUES (1603, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-10 22:01:49');
INSERT INTO `admin_log` VALUES (1604, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-10 22:02:01');
INSERT INTO `admin_log` VALUES (1605, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-10 22:02:33');
INSERT INTO `admin_log` VALUES (1606, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-10 22:06:34');
INSERT INTO `admin_log` VALUES (1607, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:07:31');
INSERT INTO `admin_log` VALUES (1608, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:08:04');
INSERT INTO `admin_log` VALUES (1609, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:08:08');
INSERT INTO `admin_log` VALUES (1610, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:08:34');
INSERT INTO `admin_log` VALUES (1611, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:08:36');
INSERT INTO `admin_log` VALUES (1612, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:08:49');
INSERT INTO `admin_log` VALUES (1613, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:08:53');
INSERT INTO `admin_log` VALUES (1614, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:09:03');
INSERT INTO `admin_log` VALUES (1615, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:09:05');
INSERT INTO `admin_log` VALUES (1616, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-10 22:11:03');
INSERT INTO `admin_log` VALUES (1617, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-10 22:11:06');
INSERT INTO `admin_log` VALUES (1618, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-10 22:11:09');
INSERT INTO `admin_log` VALUES (1619, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-10 22:11:12');
INSERT INTO `admin_log` VALUES (1620, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-10 22:11:14');
INSERT INTO `admin_log` VALUES (1621, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-10 22:11:21');
INSERT INTO `admin_log` VALUES (1622, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-10 22:11:25');
INSERT INTO `admin_log` VALUES (1623, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:11:31');
INSERT INTO `admin_log` VALUES (1624, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-10 22:11:34');
INSERT INTO `admin_log` VALUES (1625, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-10 22:11:39');
INSERT INTO `admin_log` VALUES (1626, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-11 22:44:33');
INSERT INTO `admin_log` VALUES (1627, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:44:57');
INSERT INTO `admin_log` VALUES (1628, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:45:01');
INSERT INTO `admin_log` VALUES (1629, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:45:08');
INSERT INTO `admin_log` VALUES (1630, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:45:09');
INSERT INTO `admin_log` VALUES (1631, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:45:15');
INSERT INTO `admin_log` VALUES (1632, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:46:36');
INSERT INTO `admin_log` VALUES (1633, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:46:48');
INSERT INTO `admin_log` VALUES (1634, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:46:48');
INSERT INTO `admin_log` VALUES (1635, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:46:48');
INSERT INTO `admin_log` VALUES (1636, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:46:49');
INSERT INTO `admin_log` VALUES (1637, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:46:49');
INSERT INTO `admin_log` VALUES (1638, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-11 22:46:52');
INSERT INTO `admin_log` VALUES (1639, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:47:14');
INSERT INTO `admin_log` VALUES (1640, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '192.168.205.1', 'admin', '2020-06-11 22:47:33');
INSERT INTO `admin_log` VALUES (1641, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:48:51');
INSERT INTO `admin_log` VALUES (1642, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:48:51');
INSERT INTO `admin_log` VALUES (1643, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:48:52');
INSERT INTO `admin_log` VALUES (1644, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-11 22:48:52');
INSERT INTO `admin_log` VALUES (1645, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 22:13:06');
INSERT INTO `admin_log` VALUES (1646, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 22:15:52');
INSERT INTO `admin_log` VALUES (1647, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 22:15:56');
INSERT INTO `admin_log` VALUES (1648, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-12 22:16:00');
INSERT INTO `admin_log` VALUES (1649, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '192.168.205.1', 'admin', '2020-06-12 22:16:29');
INSERT INTO `admin_log` VALUES (1650, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-12 22:16:29');
INSERT INTO `admin_log` VALUES (1651, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-12 22:16:31');
INSERT INTO `admin_log` VALUES (1652, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-12 22:16:34');
INSERT INTO `admin_log` VALUES (1653, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '192.168.205.1', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_log` VALUES (1654, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_log` VALUES (1655, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 22:16:45');
INSERT INTO `admin_log` VALUES (1656, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 22:16:47');
INSERT INTO `admin_log` VALUES (1657, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 22:16:52');
INSERT INTO `admin_log` VALUES (1658, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-12 22:17:05');
INSERT INTO `admin_log` VALUES (1659, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:17:10');
INSERT INTO `admin_log` VALUES (1660, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:17:11');
INSERT INTO `admin_log` VALUES (1661, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:17:13');
INSERT INTO `admin_log` VALUES (1662, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:17:13');
INSERT INTO `admin_log` VALUES (1663, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-12 22:17:14');
INSERT INTO `admin_log` VALUES (1664, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:17:17');
INSERT INTO `admin_log` VALUES (1665, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:17:21');
INSERT INTO `admin_log` VALUES (1666, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:17:22');
INSERT INTO `admin_log` VALUES (1667, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:18:49');
INSERT INTO `admin_log` VALUES (1668, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 22:20:17');
INSERT INTO `admin_log` VALUES (1669, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:20:21');
INSERT INTO `admin_log` VALUES (1670, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:20:28');
INSERT INTO `admin_log` VALUES (1671, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:26:54');
INSERT INTO `admin_log` VALUES (1672, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:27:23');
INSERT INTO `admin_log` VALUES (1673, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:02');
INSERT INTO `admin_log` VALUES (1674, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:08');
INSERT INTO `admin_log` VALUES (1675, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:10');
INSERT INTO `admin_log` VALUES (1676, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:28:34');
INSERT INTO `admin_log` VALUES (1677, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:35');
INSERT INTO `admin_log` VALUES (1678, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:43');
INSERT INTO `admin_log` VALUES (1679, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:45');
INSERT INTO `admin_log` VALUES (1680, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:28:50');
INSERT INTO `admin_log` VALUES (1681, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:32:45');
INSERT INTO `admin_log` VALUES (1682, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:32:53');
INSERT INTO `admin_log` VALUES (1683, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:32:57');
INSERT INTO `admin_log` VALUES (1684, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:33:02');
INSERT INTO `admin_log` VALUES (1685, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-12 22:33:23');
INSERT INTO `admin_log` VALUES (1686, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:33:28');
INSERT INTO `admin_log` VALUES (1687, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-12 22:33:34');
INSERT INTO `admin_log` VALUES (1688, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:33:38');
INSERT INTO `admin_log` VALUES (1689, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:33:41');
INSERT INTO `admin_log` VALUES (1690, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-12 22:33:42');
INSERT INTO `admin_log` VALUES (1691, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:33:43');
INSERT INTO `admin_log` VALUES (1692, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-12 22:33:46');
INSERT INTO `admin_log` VALUES (1693, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-12 22:54:57');
INSERT INTO `admin_log` VALUES (1694, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 22:57:44');
INSERT INTO `admin_log` VALUES (1695, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-12 22:57:47');
INSERT INTO `admin_log` VALUES (1696, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-12 22:58:00');
INSERT INTO `admin_log` VALUES (1697, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:02');
INSERT INTO `admin_log` VALUES (1698, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-12 22:58:03');
INSERT INTO `admin_log` VALUES (1699, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:05');
INSERT INTO `admin_log` VALUES (1700, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:08');
INSERT INTO `admin_log` VALUES (1701, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:22');
INSERT INTO `admin_log` VALUES (1702, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:23');
INSERT INTO `admin_log` VALUES (1703, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:26');
INSERT INTO `admin_log` VALUES (1704, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:29');
INSERT INTO `admin_log` VALUES (1705, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:34');
INSERT INTO `admin_log` VALUES (1706, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:34');
INSERT INTO `admin_log` VALUES (1707, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:35');
INSERT INTO `admin_log` VALUES (1708, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 22:58:38');
INSERT INTO `admin_log` VALUES (1709, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 23:00:42');
INSERT INTO `admin_log` VALUES (1710, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-12 23:00:45');
INSERT INTO `admin_log` VALUES (1711, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 23:03:13');
INSERT INTO `admin_log` VALUES (1712, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 23:03:14');
INSERT INTO `admin_log` VALUES (1713, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:03:15');
INSERT INTO `admin_log` VALUES (1714, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-12 23:03:16');
INSERT INTO `admin_log` VALUES (1715, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-12 23:03:17');
INSERT INTO `admin_log` VALUES (1716, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-12 23:03:18');
INSERT INTO `admin_log` VALUES (1717, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:03:19');
INSERT INTO `admin_log` VALUES (1718, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 23:03:25');
INSERT INTO `admin_log` VALUES (1719, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 23:03:50');
INSERT INTO `admin_log` VALUES (1720, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 23:03:51');
INSERT INTO `admin_log` VALUES (1721, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 23:03:53');
INSERT INTO `admin_log` VALUES (1722, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 23:03:57');
INSERT INTO `admin_log` VALUES (1723, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-12 23:04:03');
INSERT INTO `admin_log` VALUES (1724, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:04:05');
INSERT INTO `admin_log` VALUES (1725, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:04:07');
INSERT INTO `admin_log` VALUES (1726, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-12 23:04:11');
INSERT INTO `admin_log` VALUES (1727, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:04:12');
INSERT INTO `admin_log` VALUES (1728, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:04:32');
INSERT INTO `admin_log` VALUES (1729, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:04:35');
INSERT INTO `admin_log` VALUES (1730, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:06:30');
INSERT INTO `admin_log` VALUES (1731, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:06:33');
INSERT INTO `admin_log` VALUES (1732, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-12 23:06:36');
INSERT INTO `admin_log` VALUES (1733, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-15 16:04:44');
INSERT INTO `admin_log` VALUES (1734, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 16:04:48');
INSERT INTO `admin_log` VALUES (1735, 'user-detail', 'create', 'user-detail/create', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 16:04:54');
INSERT INTO `admin_log` VALUES (1736, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 16:04:55');
INSERT INTO `admin_log` VALUES (1737, 'user-detail', 'delete', 'user-detail/delete', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 16:04:59');
INSERT INTO `admin_log` VALUES (1738, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 16:05:00');
INSERT INTO `admin_log` VALUES (1739, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 16:05:39');
INSERT INTO `admin_log` VALUES (1740, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 16:05:42');
INSERT INTO `admin_log` VALUES (1741, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-15 16:05:43');
INSERT INTO `admin_log` VALUES (1742, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-15 16:05:48');
INSERT INTO `admin_log` VALUES (1743, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-15 16:05:57');
INSERT INTO `admin_log` VALUES (1744, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 16:06:02');
INSERT INTO `admin_log` VALUES (1745, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 16:06:03');
INSERT INTO `admin_log` VALUES (1746, 'wechat-config', 'index', 'wechat-config/index', '微信公众平台管理', '应用配置', '微信配置', '192.168.205.1', 'admin', '2020-06-15 16:06:30');
INSERT INTO `admin_log` VALUES (1747, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-15 16:06:35');
INSERT INTO `admin_log` VALUES (1748, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-15 16:06:39');
INSERT INTO `admin_log` VALUES (1749, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-15 16:06:40');
INSERT INTO `admin_log` VALUES (1750, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-15 16:06:43');
INSERT INTO `admin_log` VALUES (1751, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:00');
INSERT INTO `admin_log` VALUES (1752, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:04');
INSERT INTO `admin_log` VALUES (1753, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:06');
INSERT INTO `admin_log` VALUES (1754, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:09');
INSERT INTO `admin_log` VALUES (1755, 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '192.168.205.1', 'admin', '2020-06-15 17:15:23');
INSERT INTO `admin_log` VALUES (1756, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:23');
INSERT INTO `admin_log` VALUES (1757, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:26');
INSERT INTO `admin_log` VALUES (1758, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:29');
INSERT INTO `admin_log` VALUES (1759, 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '192.168.205.1', 'admin', '2020-06-15 17:15:39');
INSERT INTO `admin_log` VALUES (1760, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:15:40');
INSERT INTO `admin_log` VALUES (1761, 'site', 'error', 'site/error', NULL, NULL, NULL, '192.168.205.1', 'admin', '2020-06-15 17:15:50');
INSERT INTO `admin_log` VALUES (1762, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:52:36');
INSERT INTO `admin_log` VALUES (1763, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:52:40');
INSERT INTO `admin_log` VALUES (1764, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '192.168.205.1', 'admin', '2020-06-15 17:53:16');
INSERT INTO `admin_log` VALUES (1765, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:53:17');
INSERT INTO `admin_log` VALUES (1766, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-15 17:53:22');
INSERT INTO `admin_log` VALUES (1767, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-15 17:53:28');
INSERT INTO `admin_log` VALUES (1768, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '192.168.205.1', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_log` VALUES (1769, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '192.168.205.1', 'admin', '2020-06-15 17:53:38');
INSERT INTO `admin_log` VALUES (1770, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-15 17:53:55');
INSERT INTO `admin_log` VALUES (1771, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-15 17:53:57');
INSERT INTO `admin_log` VALUES (1772, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '192.168.205.1', 'admin', '2020-06-15 17:54:04');
INSERT INTO `admin_log` VALUES (1773, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 17:54:15');
INSERT INTO `admin_log` VALUES (1774, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 17:56:13');
INSERT INTO `admin_log` VALUES (1775, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 17:57:36');
INSERT INTO `admin_log` VALUES (1776, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:59:06');
INSERT INTO `admin_log` VALUES (1777, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '192.168.205.1', 'admin', '2020-06-15 17:59:10');
INSERT INTO `admin_log` VALUES (1778, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '192.168.205.1', 'admin', '2020-06-15 17:59:17');
INSERT INTO `admin_log` VALUES (1779, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '192.168.205.1', 'admin', '2020-06-15 18:03:35');
INSERT INTO `admin_log` VALUES (1780, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:03:36');
INSERT INTO `admin_log` VALUES (1781, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '192.168.205.1', 'admin', '2020-06-15 18:10:33');
INSERT INTO `admin_log` VALUES (1782, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:10:34');
INSERT INTO `admin_log` VALUES (1783, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:10:37');
INSERT INTO `admin_log` VALUES (1784, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:10:38');
INSERT INTO `admin_log` VALUES (1785, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:14:46');
INSERT INTO `admin_log` VALUES (1786, 'mail-setting', 'create', 'mail-setting/create', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:15:04');
INSERT INTO `admin_log` VALUES (1787, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:15:04');
INSERT INTO `admin_log` VALUES (1788, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:17:47');
INSERT INTO `admin_log` VALUES (1789, 'mail-setting', 'create', 'mail-setting/create', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:17:57');
INSERT INTO `admin_log` VALUES (1790, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:17:57');
INSERT INTO `admin_log` VALUES (1791, 'mail-setting', 'create', 'mail-setting/create', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:24');
INSERT INTO `admin_log` VALUES (1792, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:25');
INSERT INTO `admin_log` VALUES (1793, 'mail-setting', 'delete', 'mail-setting/delete', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:33');
INSERT INTO `admin_log` VALUES (1794, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:33');
INSERT INTO `admin_log` VALUES (1795, 'mail-setting', 'delete', 'mail-setting/delete', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:36');
INSERT INTO `admin_log` VALUES (1796, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:37');
INSERT INTO `admin_log` VALUES (1797, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-15 18:18:49');
INSERT INTO `admin_log` VALUES (1798, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 18:19:02');
INSERT INTO `admin_log` VALUES (1799, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 18:19:23');
INSERT INTO `admin_log` VALUES (1800, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 18:19:27');
INSERT INTO `admin_log` VALUES (1801, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-15 18:19:31');
INSERT INTO `admin_log` VALUES (1802, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-15 18:19:36');
INSERT INTO `admin_log` VALUES (1803, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 20:10:19');
INSERT INTO `admin_log` VALUES (1804, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 20:10:20');
INSERT INTO `admin_log` VALUES (1805, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-15 20:10:22');
INSERT INTO `admin_log` VALUES (1806, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 20:10:24');
INSERT INTO `admin_log` VALUES (1807, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '192.168.205.1', 'admin', '2020-06-15 20:10:25');
INSERT INTO `admin_log` VALUES (1808, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 20:10:28');
INSERT INTO `admin_log` VALUES (1809, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 20:13:50');
INSERT INTO `admin_log` VALUES (1810, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 20:14:00');
INSERT INTO `admin_log` VALUES (1811, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:02');
INSERT INTO `admin_log` VALUES (1812, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 20:14:03');
INSERT INTO `admin_log` VALUES (1813, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:05');
INSERT INTO `admin_log` VALUES (1814, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:07');
INSERT INTO `admin_log` VALUES (1815, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 20:14:09');
INSERT INTO `admin_log` VALUES (1816, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:10');
INSERT INTO `admin_log` VALUES (1817, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '192.168.205.1', 'admin', '2020-06-15 20:14:12');
INSERT INTO `admin_log` VALUES (1818, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:14');
INSERT INTO `admin_log` VALUES (1819, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:16');
INSERT INTO `admin_log` VALUES (1820, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '192.168.205.1', 'admin', '2020-06-15 20:14:17');
INSERT INTO `admin_log` VALUES (1821, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:19');
INSERT INTO `admin_log` VALUES (1822, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:27');
INSERT INTO `admin_log` VALUES (1823, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:29');
INSERT INTO `admin_log` VALUES (1824, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '192.168.205.1', 'admin', '2020-06-15 20:14:32');
INSERT INTO `admin_log` VALUES (1825, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '192.168.205.1', 'admin', '2020-06-15 20:14:34');
INSERT INTO `admin_log` VALUES (1826, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 11:58:27');
INSERT INTO `admin_log` VALUES (1827, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 11:58:28');
INSERT INTO `admin_log` VALUES (1828, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 11:58:28');
INSERT INTO `admin_log` VALUES (1829, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 11:58:39');
INSERT INTO `admin_log` VALUES (1830, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 12:01:17');
INSERT INTO `admin_log` VALUES (1831, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 12:01:25');
INSERT INTO `admin_log` VALUES (1832, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 12:04:09');
INSERT INTO `admin_log` VALUES (1833, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 12:04:10');
INSERT INTO `admin_log` VALUES (1834, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 12:04:11');
INSERT INTO `admin_log` VALUES (1835, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-16 12:04:13');
INSERT INTO `admin_log` VALUES (1836, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 12:04:14');
INSERT INTO `admin_log` VALUES (1837, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 12:04:15');
INSERT INTO `admin_log` VALUES (1838, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 12:04:15');
INSERT INTO `admin_log` VALUES (1839, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 12:04:16');
INSERT INTO `admin_log` VALUES (1840, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 12:04:17');
INSERT INTO `admin_log` VALUES (1841, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 12:04:18');
INSERT INTO `admin_log` VALUES (1842, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 12:04:19');
INSERT INTO `admin_log` VALUES (1843, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 12:04:20');
INSERT INTO `admin_log` VALUES (1844, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 12:04:24');
INSERT INTO `admin_log` VALUES (1845, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-16 12:04:26');
INSERT INTO `admin_log` VALUES (1846, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 12:08:43');
INSERT INTO `admin_log` VALUES (1847, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 12:08:44');
INSERT INTO `admin_log` VALUES (1848, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 12:08:45');
INSERT INTO `admin_log` VALUES (1849, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 12:08:46');
INSERT INTO `admin_log` VALUES (1850, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 12:08:50');
INSERT INTO `admin_log` VALUES (1851, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 12:08:51');
INSERT INTO `admin_log` VALUES (1852, 'mail-setting', 'index', 'mail-setting/index', '系统配置', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 12:08:51');
INSERT INTO `admin_log` VALUES (1853, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 12:08:52');
INSERT INTO `admin_log` VALUES (1854, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 12:08:56');
INSERT INTO `admin_log` VALUES (1855, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 12:08:56');
INSERT INTO `admin_log` VALUES (1856, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 12:08:58');
INSERT INTO `admin_log` VALUES (1857, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 12:08:59');
INSERT INTO `admin_log` VALUES (1858, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 12:09:00');
INSERT INTO `admin_log` VALUES (1859, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 12:09:02');
INSERT INTO `admin_log` VALUES (1860, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 12:09:04');
INSERT INTO `admin_log` VALUES (1861, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 12:09:06');
INSERT INTO `admin_log` VALUES (1862, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-16 12:09:11');
INSERT INTO `admin_log` VALUES (1863, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-16 12:09:13');
INSERT INTO `admin_log` VALUES (1864, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 13:33:46');
INSERT INTO `admin_log` VALUES (1865, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 13:43:57');
INSERT INTO `admin_log` VALUES (1866, 'wechat-config', 'view', 'wechat-config/view', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 13:43:58');
INSERT INTO `admin_log` VALUES (1867, 'wechat-config', 'update', 'wechat-config/update', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 13:44:09');
INSERT INTO `admin_log` VALUES (1868, 'wechat-config', 'index', 'wechat-config/index', '系统配置', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 13:44:09');
INSERT INTO `admin_log` VALUES (1869, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 13:49:07');
INSERT INTO `admin_log` VALUES (1870, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 13:49:08');
INSERT INTO `admin_log` VALUES (1871, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 13:49:09');
INSERT INTO `admin_log` VALUES (1872, 'user-detail', 'index', 'user-detail/index', '菜单用户权限', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 13:49:09');
INSERT INTO `admin_log` VALUES (1873, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 13:49:10');
INSERT INTO `admin_log` VALUES (1874, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 13:49:13');
INSERT INTO `admin_log` VALUES (1875, 'admin-user', 'view', 'admin-user/view', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 13:49:17');
INSERT INTO `admin_log` VALUES (1876, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:48:31');
INSERT INTO `admin_log` VALUES (1877, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:48:36');
INSERT INTO `admin_log` VALUES (1878, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 17:49:22');
INSERT INTO `admin_log` VALUES (1879, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:49:22');
INSERT INTO `admin_log` VALUES (1880, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:49:30');
INSERT INTO `admin_log` VALUES (1881, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:49:33');
INSERT INTO `admin_log` VALUES (1882, 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-16 17:49:43');
INSERT INTO `admin_log` VALUES (1883, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:49:43');
INSERT INTO `admin_log` VALUES (1884, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:49:56');
INSERT INTO `admin_log` VALUES (1885, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 17:49:58');
INSERT INTO `admin_log` VALUES (1886, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 17:49:59');
INSERT INTO `admin_log` VALUES (1887, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_log` VALUES (1888, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_log` VALUES (1889, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 17:50:10');
INSERT INTO `admin_log` VALUES (1890, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 17:50:12');
INSERT INTO `admin_log` VALUES (1891, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 17:50:16');
INSERT INTO `admin_log` VALUES (1892, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 17:50:29');
INSERT INTO `admin_log` VALUES (1893, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 17:53:54');
INSERT INTO `admin_log` VALUES (1894, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 17:57:14');
INSERT INTO `admin_log` VALUES (1895, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 17:57:21');
INSERT INTO `admin_log` VALUES (1896, 'wechat-config', 'index', 'wechat-config/index', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 17:57:22');
INSERT INTO `admin_log` VALUES (1897, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-16 17:57:25');
INSERT INTO `admin_log` VALUES (1898, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 17:57:26');
INSERT INTO `admin_log` VALUES (1899, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 17:57:27');
INSERT INTO `admin_log` VALUES (1900, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 17:57:28');
INSERT INTO `admin_log` VALUES (1901, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 17:57:28');
INSERT INTO `admin_log` VALUES (1902, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 17:57:29');
INSERT INTO `admin_log` VALUES (1903, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 17:57:30');
INSERT INTO `admin_log` VALUES (1904, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 17:57:36');
INSERT INTO `admin_log` VALUES (1905, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 17:57:43');
INSERT INTO `admin_log` VALUES (1906, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:58:01');
INSERT INTO `admin_log` VALUES (1907, 'admin-module', 'create', 'admin-module/create', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-16 17:58:40');
INSERT INTO `admin_log` VALUES (1908, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:58:40');
INSERT INTO `admin_log` VALUES (1909, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:58:44');
INSERT INTO `admin_log` VALUES (1910, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:58:47');
INSERT INTO `admin_log` VALUES (1911, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:59:05');
INSERT INTO `admin_log` VALUES (1912, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:59:07');
INSERT INTO `admin_log` VALUES (1913, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 17:59:35');
INSERT INTO `admin_log` VALUES (1914, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 17:59:42');
INSERT INTO `admin_log` VALUES (1915, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 17:59:42');
INSERT INTO `admin_log` VALUES (1916, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 17:59:48');
INSERT INTO `admin_log` VALUES (1917, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 17:59:55');
INSERT INTO `admin_log` VALUES (1918, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 17:59:58');
INSERT INTO `admin_log` VALUES (1919, 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '::1', 'admin', '2020-06-16 18:00:00');
INSERT INTO `admin_log` VALUES (1920, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:00:01');
INSERT INTO `admin_log` VALUES (1921, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:00:04');
INSERT INTO `admin_log` VALUES (1922, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:00:07');
INSERT INTO `admin_log` VALUES (1923, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 18:00:24');
INSERT INTO `admin_log` VALUES (1924, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:00:24');
INSERT INTO `admin_log` VALUES (1925, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:00:26');
INSERT INTO `admin_log` VALUES (1926, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:00:27');
INSERT INTO `admin_log` VALUES (1927, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-16 18:00:35');
INSERT INTO `admin_log` VALUES (1928, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:00:35');
INSERT INTO `admin_log` VALUES (1929, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:00:51');
INSERT INTO `admin_log` VALUES (1930, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:00:52');
INSERT INTO `admin_log` VALUES (1931, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:01:00');
INSERT INTO `admin_log` VALUES (1932, 'activity-user', 'index', 'activity-user/index', '用户管理', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 18:01:12');
INSERT INTO `admin_log` VALUES (1933, 'activity-user', 'index', 'activity-user/index', '用户管理', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 18:05:09');
INSERT INTO `admin_log` VALUES (1934, 'activity-user', 'index', 'activity-user/index', '用户管理', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 18:05:58');
INSERT INTO `admin_log` VALUES (1935, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:06:02');
INSERT INTO `admin_log` VALUES (1936, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:06:08');
INSERT INTO `admin_log` VALUES (1937, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 18:06:47');
INSERT INTO `admin_log` VALUES (1938, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:06:48');
INSERT INTO `admin_log` VALUES (1939, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:06:54');
INSERT INTO `admin_log` VALUES (1940, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:06:56');
INSERT INTO `admin_log` VALUES (1941, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_log` VALUES (1942, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_log` VALUES (1943, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:07:06');
INSERT INTO `admin_log` VALUES (1944, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:07:08');
INSERT INTO `admin_log` VALUES (1945, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:07:11');
INSERT INTO `admin_log` VALUES (1946, 'activity-user', 'index', 'activity-user/index', '用户管理', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 18:07:25');
INSERT INTO `admin_log` VALUES (1947, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '用户头像管理', '查看', '::1', 'admin', '2020-06-16 18:07:27');
INSERT INTO `admin_log` VALUES (1948, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '用户头像管理', '查看', '::1', 'admin', '2020-06-16 18:07:27');
INSERT INTO `admin_log` VALUES (1949, 'activity-user', 'index', 'activity-user/index', '用户管理', '用户详细信息', '查看', '::1', 'admin', '2020-06-16 18:07:28');
INSERT INTO `admin_log` VALUES (1950, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:07:53');
INSERT INTO `admin_log` VALUES (1951, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:07:58');
INSERT INTO `admin_log` VALUES (1952, 'admin-menu', 'delete', 'admin-menu/delete', '菜单用户权限', '菜单管理', '二级菜单删除', '::1', 'admin', '2020-06-16 18:08:01');
INSERT INTO `admin_log` VALUES (1953, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:01');
INSERT INTO `admin_log` VALUES (1954, 'admin-menu', 'create', 'admin-menu/create', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 18:08:25');
INSERT INTO `admin_log` VALUES (1955, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:25');
INSERT INTO `admin_log` VALUES (1956, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:29');
INSERT INTO `admin_log` VALUES (1957, 'admin-menu', 'update', 'admin-menu/update', '菜单用户权限', '菜单管理', '二级菜单添加', '::1', 'admin', '2020-06-16 18:08:33');
INSERT INTO `admin_log` VALUES (1958, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:34');
INSERT INTO `admin_log` VALUES (1959, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:37');
INSERT INTO `admin_log` VALUES (1960, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:08:45');
INSERT INTO `admin_log` VALUES (1961, 'admin-right', 'right-action', 'admin-right/right-action', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:08:46');
INSERT INTO `admin_log` VALUES (1962, 'admin-right', 'create', 'admin-right/create', '菜单用户权限', '菜单管理', '路由添加', '::1', 'admin', '2020-06-16 18:08:53');
INSERT INTO `admin_log` VALUES (1963, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:08:54');
INSERT INTO `admin_log` VALUES (1964, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:08:56');
INSERT INTO `admin_log` VALUES (1965, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:57');
INSERT INTO `admin_log` VALUES (1966, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:08:59');
INSERT INTO `admin_log` VALUES (1967, 'admin-right', 'index', 'admin-right/index', '菜单用户权限', '菜单管理', '路由查看', '::1', 'admin', '2020-06-16 18:09:02');
INSERT INTO `admin_log` VALUES (1968, 'admin-menu', 'index', 'admin-menu/index', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:09:03');
INSERT INTO `admin_log` VALUES (1969, 'admin-menu', 'view', 'admin-menu/view', '菜单用户权限', '菜单管理', '二级菜单查看', '::1', 'admin', '2020-06-16 18:09:04');
INSERT INTO `admin_log` VALUES (1970, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:09:08');
INSERT INTO `admin_log` VALUES (1971, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:09:09');
INSERT INTO `admin_log` VALUES (1972, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_log` VALUES (1973, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:09:23');
INSERT INTO `admin_log` VALUES (1974, 'user-detail', 'index', 'user-detail/index', '用户管理', '详细信息', '查看', '::1', 'admin', '2020-06-16 18:09:25');
INSERT INTO `admin_log` VALUES (1975, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:09:26');
INSERT INTO `admin_log` VALUES (1976, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 18:09:33');
INSERT INTO `admin_log` VALUES (1977, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-16 18:09:34');
INSERT INTO `admin_log` VALUES (1978, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-16 18:09:36');
INSERT INTO `admin_log` VALUES (1979, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-16 18:09:38');
INSERT INTO `admin_log` VALUES (1980, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 18:09:39');
INSERT INTO `admin_log` VALUES (1981, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:09:40');
INSERT INTO `admin_log` VALUES (1982, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 18:10:58');
INSERT INTO `admin_log` VALUES (1983, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-16 18:11:02');
INSERT INTO `admin_log` VALUES (1984, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:16');
INSERT INTO `admin_log` VALUES (1985, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:16');
INSERT INTO `admin_log` VALUES (1986, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:17');
INSERT INTO `admin_log` VALUES (1987, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:18');
INSERT INTO `admin_log` VALUES (1988, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:20');
INSERT INTO `admin_log` VALUES (1989, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:23');
INSERT INTO `admin_log` VALUES (1990, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:24');
INSERT INTO `admin_log` VALUES (1991, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:24');
INSERT INTO `admin_log` VALUES (1992, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:25');
INSERT INTO `admin_log` VALUES (1993, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:25');
INSERT INTO `admin_log` VALUES (1994, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:26');
INSERT INTO `admin_log` VALUES (1995, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:27');
INSERT INTO `admin_log` VALUES (1996, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:27');
INSERT INTO `admin_log` VALUES (1997, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:28');
INSERT INTO `admin_log` VALUES (1998, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:28');
INSERT INTO `admin_log` VALUES (1999, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:29');
INSERT INTO `admin_log` VALUES (2000, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:29');
INSERT INTO `admin_log` VALUES (2001, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:29');
INSERT INTO `admin_log` VALUES (2002, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:30');
INSERT INTO `admin_log` VALUES (2003, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:30');
INSERT INTO `admin_log` VALUES (2004, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:31');
INSERT INTO `admin_log` VALUES (2005, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:31');
INSERT INTO `admin_log` VALUES (2006, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:32');
INSERT INTO `admin_log` VALUES (2007, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:33');
INSERT INTO `admin_log` VALUES (2008, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:34');
INSERT INTO `admin_log` VALUES (2009, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:34');
INSERT INTO `admin_log` VALUES (2010, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:35');
INSERT INTO `admin_log` VALUES (2011, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:11:36');
INSERT INTO `admin_log` VALUES (2012, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:11:36');
INSERT INTO `admin_log` VALUES (2013, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:37');
INSERT INTO `admin_log` VALUES (2014, 'admin-role', 'get-all-rights', 'admin-role/get-all-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:40');
INSERT INTO `admin_log` VALUES (2015, 'admin-role', 'save-rights', 'admin-role/save-rights', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_log` VALUES (2016, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:12:00');
INSERT INTO `admin_log` VALUES (2017, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:12:05');
INSERT INTO `admin_log` VALUES (2018, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-16 18:12:07');
INSERT INTO `admin_log` VALUES (2019, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:12:18');
INSERT INTO `admin_log` VALUES (2020, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:12:18');
INSERT INTO `admin_log` VALUES (2021, 'wechat-config', 'index', 'wechat-config/index', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:12:19');
INSERT INTO `admin_log` VALUES (2022, 'wechat-config', 'view', 'wechat-config/view', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:12:23');
INSERT INTO `admin_log` VALUES (2023, 'wechat-config', 'view', 'wechat-config/view', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:12:32');
INSERT INTO `admin_log` VALUES (2024, 'wechat-config', 'view', 'wechat-config/view', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:12:32');
INSERT INTO `admin_log` VALUES (2025, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:12:55');
INSERT INTO `admin_log` VALUES (2026, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:12:56');
INSERT INTO `admin_log` VALUES (2027, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:12:57');
INSERT INTO `admin_log` VALUES (2028, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:12:59');
INSERT INTO `admin_log` VALUES (2029, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:12:59');
INSERT INTO `admin_log` VALUES (2030, 'wechat-config', 'index', 'wechat-config/index', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:13:03');
INSERT INTO `admin_log` VALUES (2031, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:13:03');
INSERT INTO `admin_log` VALUES (2032, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:13:05');
INSERT INTO `admin_log` VALUES (2033, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:13:12');
INSERT INTO `admin_log` VALUES (2034, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:13:17');
INSERT INTO `admin_log` VALUES (2035, 'admin-module', 'update', 'admin-module/update', '菜单用户权限', '菜单管理', '一级菜单添加', '::1', 'admin', '2020-06-16 18:13:20');
INSERT INTO `admin_log` VALUES (2036, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:13:20');
INSERT INTO `admin_log` VALUES (2037, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:15:24');
INSERT INTO `admin_log` VALUES (2038, 'admin-module', 'view', 'admin-module/view', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:15:32');
INSERT INTO `admin_log` VALUES (2039, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:26:01');
INSERT INTO `admin_log` VALUES (2040, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:26:05');
INSERT INTO `admin_log` VALUES (2041, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:26:09');
INSERT INTO `admin_log` VALUES (2042, 'activity', 'update', 'activity/update', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:26:15');
INSERT INTO `admin_log` VALUES (2043, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:26:15');
INSERT INTO `admin_log` VALUES (2044, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:27:07');
INSERT INTO `admin_log` VALUES (2045, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 18:27:09');
INSERT INTO `admin_log` VALUES (2046, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 18:27:10');
INSERT INTO `admin_log` VALUES (2047, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:27:11');
INSERT INTO `admin_log` VALUES (2048, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:13');
INSERT INTO `admin_log` VALUES (2049, 'user-detail', 'index', 'user-detail/index', '用户管理', '详细信息', '查看', '::1', 'admin', '2020-06-16 18:27:14');
INSERT INTO `admin_log` VALUES (2050, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:14');
INSERT INTO `admin_log` VALUES (2051, 'user-detail', 'index', 'user-detail/index', '用户管理', '详细信息', '查看', '::1', 'admin', '2020-06-16 18:27:17');
INSERT INTO `admin_log` VALUES (2052, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:22');
INSERT INTO `admin_log` VALUES (2053, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:24');
INSERT INTO `admin_log` VALUES (2054, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:25');
INSERT INTO `admin_log` VALUES (2055, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:26');
INSERT INTO `admin_log` VALUES (2056, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:27');
INSERT INTO `admin_log` VALUES (2057, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:28');
INSERT INTO `admin_log` VALUES (2058, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:27:34');
INSERT INTO `admin_log` VALUES (2059, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:27:35');
INSERT INTO `admin_log` VALUES (2060, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:27:36');
INSERT INTO `admin_log` VALUES (2061, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:27:37');
INSERT INTO `admin_log` VALUES (2062, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:27:38');
INSERT INTO `admin_log` VALUES (2063, 'wechat-config', 'index', 'wechat-config/index', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:27:39');
INSERT INTO `admin_log` VALUES (2064, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:27:42');
INSERT INTO `admin_log` VALUES (2065, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 18:27:43');
INSERT INTO `admin_log` VALUES (2066, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 18:27:43');
INSERT INTO `admin_log` VALUES (2067, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:27:45');
INSERT INTO `admin_log` VALUES (2068, 'user-detail', 'index', 'user-detail/index', '用户管理', '详细信息', '查看', '::1', 'admin', '2020-06-16 18:27:46');
INSERT INTO `admin_log` VALUES (2069, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 18:27:47');
INSERT INTO `admin_log` VALUES (2070, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-16 18:27:48');
INSERT INTO `admin_log` VALUES (2071, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-16 18:27:50');
INSERT INTO `admin_log` VALUES (2072, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-16 18:27:51');
INSERT INTO `admin_log` VALUES (2073, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:27:53');
INSERT INTO `admin_log` VALUES (2074, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:27:54');
INSERT INTO `admin_log` VALUES (2075, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:27:54');
INSERT INTO `admin_log` VALUES (2076, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:27:55');
INSERT INTO `admin_log` VALUES (2077, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:27:55');
INSERT INTO `admin_log` VALUES (2078, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:27:57');
INSERT INTO `admin_log` VALUES (2079, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:27:57');
INSERT INTO `admin_log` VALUES (2080, 'wechat-config', 'index', 'wechat-config/index', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:27:58');
INSERT INTO `admin_log` VALUES (2081, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:27:59');
INSERT INTO `admin_log` VALUES (2082, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:27:59');
INSERT INTO `admin_log` VALUES (2083, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:29:01');
INSERT INTO `admin_log` VALUES (2084, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:29:01');
INSERT INTO `admin_log` VALUES (2085, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:29:02');
INSERT INTO `admin_log` VALUES (2086, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:29:56');
INSERT INTO `admin_log` VALUES (2087, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:30:07');
INSERT INTO `admin_log` VALUES (2088, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:30:14');
INSERT INTO `admin_log` VALUES (2089, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 18:30:20');
INSERT INTO `admin_log` VALUES (2090, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 18:30:24');
INSERT INTO `admin_log` VALUES (2091, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:30:26');
INSERT INTO `admin_log` VALUES (2092, 'user-detail', 'index', 'user-detail/index', '用户管理', '详细信息', '查看', '::1', 'admin', '2020-06-16 18:30:28');
INSERT INTO `admin_log` VALUES (2093, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:30:28');
INSERT INTO `admin_log` VALUES (2094, 'admin-module', 'index', 'admin-module/index', '菜单用户权限', '菜单管理', '一级菜单查看', '::1', 'admin', '2020-06-16 18:30:42');
INSERT INTO `admin_log` VALUES (2095, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:30:42');
INSERT INTO `admin_log` VALUES (2096, 'admin-role', 'index', 'admin-role/index', '菜单用户权限', '角色管理', '分配权限', '::1', 'admin', '2020-06-16 18:30:43');
INSERT INTO `admin_log` VALUES (2097, 'admin-user', 'index', 'admin-user/index', '菜单用户权限', '用户管理', '用户操作', '::1', 'admin', '2020-06-16 18:30:45');
INSERT INTO `admin_log` VALUES (2098, 'system', 'index', 'system/index', '系统管理', '系统配置', '查看', '::1', 'admin', '2020-06-16 18:30:46');
INSERT INTO `admin_log` VALUES (2099, 'wechat-config', 'index', 'wechat-config/index', '系统管理', '微信配置', '微信配置', '::1', 'admin', '2020-06-16 18:30:47');
INSERT INTO `admin_log` VALUES (2100, 'mail-setting', 'index', 'mail-setting/index', '系统管理', '邮箱设置', '查看', '::1', 'admin', '2020-06-16 18:30:48');
INSERT INTO `admin_log` VALUES (2101, 'admin-log', 'index', 'admin-log/index', '日志管理', '操作日志', '操作', '::1', 'admin', '2020-06-16 18:30:55');
INSERT INTO `admin_log` VALUES (2102, 'feedback', 'index', 'feedback/index', '反馈管理', '公众号反馈', '查看', '::1', 'admin', '2020-06-16 18:30:56');
INSERT INTO `admin_log` VALUES (2103, 'images', 'index', 'images/index', '资源管理', '图片列表', '查看', '::1', 'admin', '2020-06-16 18:30:57');
INSERT INTO `admin_log` VALUES (2104, 'order', 'index', 'order/index', '订单管理', '订单列表', '查看', '::1', 'admin', '2020-06-16 18:30:58');
INSERT INTO `admin_log` VALUES (2105, 'user-avatar', 'index', 'user-avatar/index', '用户管理', '头像管理', '查看', '::1', 'admin', '2020-06-16 18:30:59');
INSERT INTO `admin_log` VALUES (2106, 'user-detail', 'index', 'user-detail/index', '用户管理', '详细信息', '查看', '::1', 'admin', '2020-06-16 18:31:00');
INSERT INTO `admin_log` VALUES (2107, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:31:02');
INSERT INTO `admin_log` VALUES (2108, 'activity-user', 'index', 'activity-user/index', '活动管理', '活动用户列表', '用户列表', '::1', 'admin', '2020-06-16 18:31:02');
INSERT INTO `admin_log` VALUES (2109, 'activity-comment', 'index', 'activity-comment/index', '活动管理', '文章评论', '查看', '::1', 'admin', '2020-06-16 18:31:03');
INSERT INTO `admin_log` VALUES (2110, 'activity', 'index', 'activity/index', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:31:04');
INSERT INTO `admin_log` VALUES (2111, 'activity', 'view', 'activity/view', '活动管理', '活动列表', '查看', '::1', 'admin', '2020-06-16 18:31:07');
COMMIT;

-- ----------------------------
-- Table structure for admin_mail_setting
-- ----------------------------
DROP TABLE IF EXISTS `admin_mail_setting`;
CREATE TABLE `admin_mail_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_mail` longtext NOT NULL COMMENT '发件人邮箱',
  `send_pwd` varchar(255) NOT NULL COMMENT '授权码',
  `send_name` varchar(255) NOT NULL COMMENT '发件平台名称',
  `receive_mail` longtext NOT NULL COMMENT '收件人邮箱',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `addtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邮件设置';

-- ----------------------------
-- Records of admin_mail_setting
-- ----------------------------
BEGIN;
INSERT INTO `admin_mail_setting` VALUES (3, '929089994@qq.com', '33', '312', '123', 2, '2020-06-15 06:18:25');
COMMIT;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT 'code',
  `menu_name` varchar(200) NOT NULL COMMENT '名称',
  `module_id` int(11) NOT NULL COMMENT '模块id',
  `display_label` varchar(200) DEFAULT NULL COMMENT '显示名',
  `des` varchar(400) DEFAULT NULL COMMENT '描述',
  `display_order` int(5) DEFAULT NULL COMMENT '显示顺序',
  `entry_right_name` varchar(50) DEFAULT NULL COMMENT '入口地址名称',
  `entry_url` varchar(200) NOT NULL COMMENT '入口地址',
  `action` varchar(50) NOT NULL COMMENT '操作ID',
  `controller` varchar(100) NOT NULL COMMENT '控制器ID',
  `has_lef` varchar(1) NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_code` (`code`) USING BTREE,
  KEY `fk_module_id` (`module_id`) USING BTREE,
  CONSTRAINT `fk_module_id` FOREIGN KEY (`module_id`) REFERENCES `admin_module` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 'menu_manger', '菜单管理', 1, '菜单管理', '菜单管理', 1, '菜单管理', 'admin-module/index', 'index', 'backend\\controllers\\AdminMenuController', 'n', 'admin', '2016-08-11 16:44:11', 'admin', '2016-08-11 16:44:11');
INSERT INTO `admin_menu` VALUES (2, 'menu_role', '角色管理', 1, '角色管理', '角色管理', 2, '角色管理', 'admin-role/index', 'index', 'backend\\controllers\\AdminRoleController', 'n', 'admin', '2016-08-11 16:51:56', 'admin', '2016-08-11 16:51:56');
INSERT INTO `admin_menu` VALUES (3, 'menu_user', '用户管理', 1, '用户管理', '用户管理', 3, '用户管理', 'admin-user/index', 'index', 'backend\\controllers\\AdminUserController', 'n', 'admin', '2016-08-11 16:58:43', 'admin', '2016-08-11 16:58:43');
INSERT INTO `admin_menu` VALUES (4, 'coazaorizhi', '操作日志', 2, '操作日志', '操作日志', 1, '', 'admin-log/index', 'index', 'backend\\controllers\\AdminLogController', 'n', 'test', '2016-08-14 06:54:17', 'test', '2016-08-14 06:54:17');
INSERT INTO `admin_menu` VALUES (6, 'activityList', '活动列表', 5, '活动列表', '活动列表', 1, '活动列表', 'activity/index', 'index', 'backend\\controllers\\ActivityController', 'n', 'admin', '2020-06-03 13:20:28', 'admin', '2020-06-03 13:20:28');
INSERT INTO `admin_menu` VALUES (7, 'wechatConfig', '微信配置', 6, '微信配置', '微信配置', 5, '微信配置', 'wechat-config/index', 'index', 'backend\\controllers\\WechatConfigController', 'n', 'admin', '2020-06-03 14:04:16', 'admin', '2020-06-15 17:15:39');
INSERT INTO `admin_menu` VALUES (8, 'activityUserList', '活动用户列表', 5, '活动用户列表', '活动用户列表', 2, '活动用户列表', 'activity-user/index', 'index', 'backend\\controllers\\ActivityUserController', 'n', 'admin', '2020-06-03 14:23:12', 'admin', '2020-06-03 14:23:12');
INSERT INTO `admin_menu` VALUES (9, 'order', '订单列表', 7, '订单列表', '订单列表', 1, '订单列表', 'order/index', 'index', 'backend\\controllers\\OrderController', 'n', 'admin', '2020-06-03 22:14:37', 'admin', '2020-06-03 22:14:37');
INSERT INTO `admin_menu` VALUES (10, 'source', '图片列表', 8, '图片列表', '图片列表', 1, '图片列表', 'images/index', 'index', 'backend\\controllers\\ImagesController', 'n', 'admin', '2020-06-05 15:38:23', 'admin', '2020-06-05 15:38:23');
INSERT INTO `admin_menu` VALUES (12, 'feedback', '公众号反馈', 9, '公众号反馈', '公众号反馈', 1, '公众号反馈', 'feedback/index', 'index', 'backend\\controllers\\FeedbackController', 'n', 'admin', '2020-06-10 16:51:37', 'admin', '2020-06-10 16:51:37');
INSERT INTO `admin_menu` VALUES (13, 'comment', '文章评论', 5, '文章评论', '文章评论', 3, '文章评论', 'activity-comment/index', 'index', 'backend\\controllers\\ActivityCommentController', 'n', 'admin', '2020-06-12 22:16:29', 'admin', '2020-06-12 22:16:29');
INSERT INTO `admin_menu` VALUES (14, 'maillSetting', '邮箱设置', 6, '邮箱设置', '邮箱设置', 2, '邮箱设置', 'mail-setting/index', 'index', 'backend\\controllers\\MailSettingController', 'n', 'admin', '2020-06-15 17:53:16', 'admin', '2020-06-15 17:53:16');
INSERT INTO `admin_menu` VALUES (15, 'system_detail', '系统配置', 6, '系统配置', '系统配置', 1, '系统配置', 'system/index', 'index', 'backend\\controllers\\SystemController', 'n', 'admin', '2020-06-16 17:49:22', 'admin', '2020-06-16 17:49:22');
INSERT INTO `admin_menu` VALUES (20, 'avatar-list', '头像管理', 10, '头像管理', '头像管理', 1, '头像管理', 'user-avatar/index', 'index', 'backend\\controllers\\UserAvatarController', 'n', 'admin', '2020-06-16 18:06:47', 'admin', '2020-06-16 18:08:33');
INSERT INTO `admin_menu` VALUES (21, 'user-detail', '详细信息', 10, '详细信息', '详细信息', 1, '详细信息', 'user-detail/index', 'index', 'backend\\controllers\\UserDetailController', 'n', 'admin', '2020-06-16 18:08:25', 'admin', '2020-06-16 18:08:25');
COMMIT;

-- ----------------------------
-- Table structure for admin_message
-- ----------------------------
DROP TABLE IF EXISTS `admin_message`;
CREATE TABLE `admin_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(1000) DEFAULT NULL COMMENT '留言内容',
  `expiry_days` int(5) unsigned DEFAULT NULL COMMENT '有效天数',
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息表';

-- ----------------------------
-- Records of admin_message
-- ----------------------------
BEGIN;
INSERT INTO `admin_message` VALUES (1, '测试文本', 1, 'admin', '2014-11-21 18:47:20', 'admin', '2014-11-21 18:47:27');
COMMIT;

-- ----------------------------
-- Table structure for admin_module
-- ----------------------------
DROP TABLE IF EXISTS `admin_module`;
CREATE TABLE `admin_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT 'code',
  `display_label` varchar(200) NOT NULL COMMENT '显示名称',
  `has_lef` varchar(1) NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `des` varchar(400) DEFAULT NULL COMMENT '描述',
  `entry_url` varchar(100) DEFAULT NULL COMMENT '入口地址',
  `display_order` int(5) DEFAULT NULL COMMENT '顺序',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块表';

-- ----------------------------
-- Records of admin_module
-- ----------------------------
BEGIN;
INSERT INTO `admin_module` VALUES (1, 'menu_manage', '菜单用户权限', 'n', '菜单管理', '', 1, 'admin', '2016-08-11 15:26:21', 'admin', '2016-08-11 16:31:08');
INSERT INTO `admin_module` VALUES (2, 'rizhimaanage', '日志管理', 'n', '日志管理', '', 100, 'test', '2016-08-14 06:53:13', 'admin', '2020-06-16 18:13:20');
INSERT INTO `admin_module` VALUES (5, 'activity_manage', '活动管理', 'n', '相关活动', NULL, 3, 'admin', '2020-06-03 13:20:04', 'admin', '2020-06-03 13:56:25');
INSERT INTO `admin_module` VALUES (6, 'wechat_manage', '系统管理', 'n', '系统管理', NULL, 1, 'admin', '2020-06-03 13:58:14', 'admin', '2020-06-16 17:49:43');
INSERT INTO `admin_module` VALUES (7, 'order_manage', '订单管理', 'n', '订单管理', NULL, 6, 'admin', '2020-06-03 22:12:43', 'admin', '2020-06-03 22:12:43');
INSERT INTO `admin_module` VALUES (8, 'source_manage', '资源管理', 'n', '资源管理', NULL, 7, 'admin', '2020-06-05 15:37:31', 'admin', '2020-06-05 15:37:31');
INSERT INTO `admin_module` VALUES (9, 'feedback_manage', '反馈管理', 'n', '反馈管理', NULL, 8, 'admin', '2020-06-10 16:47:27', 'admin', '2020-06-10 16:47:27');
INSERT INTO `admin_module` VALUES (10, 'user_manage', '用户管理', 'n', '用户管理', NULL, 4, 'admin', '2020-06-16 17:58:40', 'admin', '2020-06-16 17:58:40');
COMMIT;

-- ----------------------------
-- Table structure for admin_order
-- ----------------------------
DROP TABLE IF EXISTS `admin_order`;
CREATE TABLE `admin_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(35) NOT NULL COMMENT '订单号',
  `aid` int(11) NOT NULL COMMENT '活动id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否支付',
  `money` tinyint(8) NOT NULL COMMENT '支付金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Table structure for admin_right
-- ----------------------------
DROP TABLE IF EXISTS `admin_right`;
CREATE TABLE `admin_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '功能主键',
  `right_name` varchar(200) NOT NULL COMMENT '名称',
  `display_label` varchar(200) DEFAULT NULL COMMENT '显示名',
  `des` varchar(200) DEFAULT NULL COMMENT '描述',
  `display_order` int(5) DEFAULT NULL COMMENT '显示顺序',
  `has_lef` varchar(1) NOT NULL DEFAULT 'n' COMMENT '是否有子',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_admin_right` (`menu_id`) USING BTREE,
  KEY `index_menu_id` (`menu_id`) USING BTREE,
  CONSTRAINT `FK_admin_right` FOREIGN KEY (`menu_id`) REFERENCES `admin_menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of admin_right
-- ----------------------------
BEGIN;
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
INSERT INTO `admin_right` VALUES (26, 10, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-05 15:38:35', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_right` VALUES (28, 12, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-10 16:51:48', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_right` VALUES (29, 13, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-12 22:16:43', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_right` VALUES (30, 14, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-15 17:53:37', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_right` VALUES (31, 15, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-16 17:50:08', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_right` VALUES (33, 20, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-16 18:07:04', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_right` VALUES (34, 21, '查看', '查看', '查看', 1, 'n', 'admin', '2020-06-16 18:08:53', 'admin', '2020-06-16 18:08:53');
COMMIT;

-- ----------------------------
-- Table structure for admin_right_url
-- ----------------------------
DROP TABLE IF EXISTS `admin_right_url`;
CREATE TABLE `admin_right_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `right_id` int(11) NOT NULL COMMENT 'right主键',
  `url` varchar(200) DEFAULT NULL COMMENT 'url',
  `para_name` varchar(40) DEFAULT NULL COMMENT '参数名',
  `para_value` varchar(40) DEFAULT NULL COMMENT '参数值',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_admin_right_url` (`right_id`) USING BTREE,
  KEY `index_right_id` (`right_id`) USING BTREE,
  CONSTRAINT `FK_admin_right_url` FOREIGN KEY (`right_id`) REFERENCES `admin_right` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单的url表';

-- ----------------------------
-- Records of admin_right_url
-- ----------------------------
BEGIN;
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
INSERT INTO `admin_right_url` VALUES (157, 26, 'images/index', 'images', 'index', 'admin', '2020-06-05 15:38:35', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_right_url` VALUES (158, 26, 'images/view', 'images', 'view', 'admin', '2020-06-05 15:38:35', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_right_url` VALUES (159, 26, 'images/create', 'images', 'create', 'admin', '2020-06-05 15:38:35', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_right_url` VALUES (160, 26, 'images/update', 'images', 'update', 'admin', '2020-06-05 15:38:35', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_right_url` VALUES (161, 26, 'images/delete', 'images', 'delete', 'admin', '2020-06-05 15:38:35', 'admin', '2020-06-05 15:38:35');
INSERT INTO `admin_right_url` VALUES (167, 28, 'feedback/index', 'feedback', 'index', 'admin', '2020-06-10 16:51:48', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_right_url` VALUES (168, 28, 'feedback/view', 'feedback', 'view', 'admin', '2020-06-10 16:51:48', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_right_url` VALUES (169, 28, 'feedback/create', 'feedback', 'create', 'admin', '2020-06-10 16:51:48', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_right_url` VALUES (170, 28, 'feedback/update', 'feedback', 'update', 'admin', '2020-06-10 16:51:48', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_right_url` VALUES (171, 28, 'feedback/delete', 'feedback', 'delete', 'admin', '2020-06-10 16:51:48', 'admin', '2020-06-10 16:51:48');
INSERT INTO `admin_right_url` VALUES (172, 29, 'activity-comment/index', 'activity-comment', 'index', 'admin', '2020-06-12 22:16:43', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_right_url` VALUES (173, 29, 'activity-comment/view', 'activity-comment', 'view', 'admin', '2020-06-12 22:16:43', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_right_url` VALUES (174, 29, 'activity-comment/create', 'activity-comment', 'create', 'admin', '2020-06-12 22:16:43', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_right_url` VALUES (175, 29, 'activity-comment/update', 'activity-comment', 'update', 'admin', '2020-06-12 22:16:43', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_right_url` VALUES (176, 29, 'activity-comment/delete', 'activity-comment', 'delete', 'admin', '2020-06-12 22:16:43', 'admin', '2020-06-12 22:16:43');
INSERT INTO `admin_right_url` VALUES (177, 30, 'mail-setting/index', 'mail-setting', 'index', 'admin', '2020-06-15 17:53:37', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_right_url` VALUES (178, 30, 'mail-setting/view', 'mail-setting', 'view', 'admin', '2020-06-15 17:53:37', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_right_url` VALUES (179, 30, 'mail-setting/create', 'mail-setting', 'create', 'admin', '2020-06-15 17:53:37', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_right_url` VALUES (180, 30, 'mail-setting/update', 'mail-setting', 'update', 'admin', '2020-06-15 17:53:37', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_right_url` VALUES (181, 30, 'mail-setting/delete', 'mail-setting', 'delete', 'admin', '2020-06-15 17:53:37', 'admin', '2020-06-15 17:53:37');
INSERT INTO `admin_right_url` VALUES (182, 31, 'system/index', 'system', 'index', 'admin', '2020-06-16 17:50:08', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_right_url` VALUES (183, 31, 'system/view', 'system', 'view', 'admin', '2020-06-16 17:50:08', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_right_url` VALUES (184, 31, 'system/create', 'system', 'create', 'admin', '2020-06-16 17:50:08', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_right_url` VALUES (185, 31, 'system/update', 'system', 'update', 'admin', '2020-06-16 17:50:08', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_right_url` VALUES (186, 31, 'system/delete', 'system', 'delete', 'admin', '2020-06-16 17:50:08', 'admin', '2020-06-16 17:50:08');
INSERT INTO `admin_right_url` VALUES (192, 33, 'user-avatar/index', 'user-avatar', 'index', 'admin', '2020-06-16 18:07:04', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_right_url` VALUES (193, 33, 'user-avatar/view', 'user-avatar', 'view', 'admin', '2020-06-16 18:07:04', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_right_url` VALUES (194, 33, 'user-avatar/create', 'user-avatar', 'create', 'admin', '2020-06-16 18:07:04', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_right_url` VALUES (195, 33, 'user-avatar/update', 'user-avatar', 'update', 'admin', '2020-06-16 18:07:04', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_right_url` VALUES (196, 33, 'user-avatar/delete', 'user-avatar', 'delete', 'admin', '2020-06-16 18:07:04', 'admin', '2020-06-16 18:07:04');
INSERT INTO `admin_right_url` VALUES (197, 34, 'user-detail/index', 'user-detail', 'index', 'admin', '2020-06-16 18:08:53', 'admin', '2020-06-16 18:08:53');
INSERT INTO `admin_right_url` VALUES (198, 34, 'user-detail/view', 'user-detail', 'view', 'admin', '2020-06-16 18:08:53', 'admin', '2020-06-16 18:08:53');
INSERT INTO `admin_right_url` VALUES (199, 34, 'user-detail/create', 'user-detail', 'create', 'admin', '2020-06-16 18:08:53', 'admin', '2020-06-16 18:08:53');
INSERT INTO `admin_right_url` VALUES (200, 34, 'user-detail/update', 'user-detail', 'update', 'admin', '2020-06-16 18:08:53', 'admin', '2020-06-16 18:08:53');
INSERT INTO `admin_right_url` VALUES (201, 34, 'user-detail/delete', 'user-detail', 'delete', 'admin', '2020-06-16 18:08:53', 'admin', '2020-06-16 18:08:53');
COMMIT;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(50) NOT NULL COMMENT '角色编号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `des` varchar(400) DEFAULT NULL COMMENT '角色描述',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES (1, 'superadmin', '超级管理员', '拥有所有权限', 'test', '2016-08-12 15:33:01', 'test', '2016-08-12 15:33:01');
INSERT INTO `admin_role` VALUES (2, 'testuser', '测试人员', '测试人员', 'test', '2016-08-12 15:33:45', 'test', '2016-08-12 15:33:45');
COMMIT;

-- ----------------------------
-- Table structure for admin_role_right
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_right`;
CREATE TABLE `admin_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  `right_id` int(11) NOT NULL COMMENT '权限主键',
  `full_path` varchar(250) DEFAULT NULL COMMENT '全路径',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_role_id` (`role_id`) USING BTREE,
  KEY `index_right_id` (`right_id`) USING BTREE,
  CONSTRAINT `admin_role_right_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `admin_right` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限导航栏表';

-- ----------------------------
-- Records of admin_role_right
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_right` VALUES (525, 1, 13, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (526, 1, 14, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (527, 1, 15, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (528, 1, 16, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (529, 1, 17, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (530, 1, 18, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (531, 1, 19, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (532, 1, 20, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (533, 1, 21, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (534, 1, 4, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (535, 1, 5, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (536, 1, 6, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (537, 1, 7, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (538, 1, 8, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (539, 1, 22, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (540, 1, 24, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (541, 1, 29, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (542, 1, 23, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (543, 1, 30, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (544, 1, 31, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (545, 1, 25, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (546, 1, 26, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (547, 1, 28, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (548, 1, 33, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (549, 1, 34, NULL, 'admin', '2020-06-16 18:09:12', 'admin', '2020-06-16 18:09:12');
INSERT INTO `admin_role_right` VALUES (550, 2, 13, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (551, 2, 14, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (552, 2, 15, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (553, 2, 16, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (554, 2, 17, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (555, 2, 18, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (556, 2, 19, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (557, 2, 20, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (558, 2, 21, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (559, 2, 4, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (560, 2, 5, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (561, 2, 6, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (562, 2, 7, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (563, 2, 8, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (564, 2, 22, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (565, 2, 24, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (566, 2, 29, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (567, 2, 23, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (568, 2, 30, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (569, 2, 31, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (570, 2, 25, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (571, 2, 26, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (572, 2, 28, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (573, 2, 33, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
INSERT INTO `admin_role_right` VALUES (574, 2, 34, NULL, 'admin', '2020-06-16 18:11:50', 'admin', '2020-06-16 18:11:50');
COMMIT;

-- ----------------------------
-- Table structure for admin_system
-- ----------------------------
DROP TABLE IF EXISTS `admin_system`;
CREATE TABLE `admin_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lng` double(10,6) DEFAULT NULL COMMENT '经度',
  `lat` double(10,6) DEFAULT NULL COMMENT '纬度',
  `aid` int(11) NOT NULL COMMENT '活动id',
  `title` varchar(10) DEFAULT NULL COMMENT '地图标题',
  `content` varchar(50) DEFAULT NULL COMMENT '地图内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `auth_key` varchar(50) DEFAULT NULL COMMENT '自动登录key',
  `last_ip` varchar(50) DEFAULT NULL COMMENT '最近一次登录ip',
  `is_online` char(1) DEFAULT 'n' COMMENT '是否在线',
  `domain_account` varchar(100) DEFAULT NULL COMMENT '域账号',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `create_user` varchar(100) NOT NULL COMMENT '创建人',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(101) NOT NULL COMMENT '更新人',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户类型',
  `access_token` varchar(255) NOT NULL COMMENT '登陆凭证',
  `wechat_platform_open_id` varchar(64) NOT NULL COMMENT '微信公众号openid',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `avatar_url` varchar(2048) NOT NULL COMMENT '微信头像',
  `bind_phone` varchar(11) NOT NULL COMMENT '绑定手机',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (156, 'admin', '$2y$13$9O6bKJieocg//oSax9fZOOuljAKarBXknqD8.RyYg60FfNjS7SoqK', NULL, 'Unknown', 'n', NULL, 10, 'admin', '2014-07-07 00:05:47', 'admin', '2014-09-03 12:19:12', 0, '', '', '', '', '');
INSERT INTO `admin_user` VALUES (158, 'test', '$2y$13$9O6bKJieocg//oSax9fZOOuljAKarBXknqD8.RyYg60FfNjS7SoqK', NULL, '', 'n', NULL, 10, 'admin', '2014-09-03 12:19:52', 'admin', '2014-11-21 19:19:22', 0, '', '', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_avatar
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_avatar`;
CREATE TABLE `admin_user_avatar` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `img_id` int(5) NOT NULL COMMENT '图片id',
  `state` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户头像设置';

-- ----------------------------
-- Table structure for admin_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_detail`;
CREATE TABLE `admin_user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'uid',
  `name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日',
  `occupation` varchar(50) DEFAULT '' COMMENT '职业',
  `income` int(10) DEFAULT NULL COMMENT '月收入',
  `cars_and_houses` tinyint(1) DEFAULT NULL COMMENT '有无车房',
  `marital_status` tinyint(1) DEFAULT NULL COMMENT '婚姻状况',
  `education` tinyint(2) DEFAULT NULL COMMENT '学历',
  `native_place` varchar(3) DEFAULT NULL COMMENT '籍贯',
  `character` varchar(10) DEFAULT NULL COMMENT '性格',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `mate_require` varchar(1000) DEFAULT NULL COMMENT '择偶要求',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `height` int(3) DEFAULT NULL COMMENT '身高',
  `mobile` int(11) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户详细信息表';

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_user_id` (`user_id`) USING BTREE,
  KEY `index_role_id` (`role_id`) USING BTREE,
  CONSTRAINT `admin_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限表';

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
BEGIN;
INSERT INTO `admin_user_role` VALUES (1, 156, 1, 'admin', '2016-08-12 17:03:13', 'admin', '2016-08-12 17:03:13');
INSERT INTO `admin_user_role` VALUES (2, 158, 2, 'test', '2016-08-13 16:34:20', 'test', '2016-08-13 16:34:20');
COMMIT;

-- ----------------------------
-- Table structure for admin_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `admin_wechat_config`;
CREATE TABLE `admin_wechat_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(100) NOT NULL COMMENT '微信appid',
  `app_secret` varchar(100) NOT NULL COMMENT '微信appsecret',
  `mch_id` varchar(30) NOT NULL COMMENT '商户号',
  `key` varchar(100) NOT NULL COMMENT 'Api密钥',
  `cert_pem` varchar(255) NOT NULL COMMENT 'apiclient_cert.pem',
  `key_pem` varchar(255) NOT NULL COMMENT 'apiclient_key.pem',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信配置表';

-- ----------------------------
-- Records of admin_wechat_config
-- ----------------------------
BEGIN;
INSERT INTO `admin_wechat_config` VALUES (1, 'wx863b4d3612d39765', 'e694ef8b4076f059d745af18cf467bb9', '123', '123123', '123123', '123123');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
