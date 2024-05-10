/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : gcs_db

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 13/07/2023 21:21:41
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gcs_admin
-- ----------------------------
DROP TABLE IF EXISTS `gcs_admin`;
CREATE TABLE `gcs_admin`
(
    `admin_id`               int(0) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
    `admin_account`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `admin_password`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `admin_name`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `admin_profile`          varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `admin_create_datetime`  datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `admin_status`           tinyint(0) NOT NULL DEFAULT 1,
    `admin_delete_timestamp` datetime(0) NULL DEFAULT NULL,
    `字段 9`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 10`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 11`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_admin
-- ----------------------------
INSERT INTO `gcs_admin`
VALUES (1, 'root', 'root', 'root', NULL, '2023-07-13 21:07:23', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_admin`
VALUES (2, 'admin', 'll123456', NULL, NULL, '2023-07-07 09:23:07', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_admin_authority
-- ----------------------------
DROP TABLE IF EXISTS `gcs_admin_authority`;
CREATE TABLE `gcs_admin_authority`
(
    `admin_authority_id` int(0) NOT NULL AUTO_INCREMENT,
    `admin_id`           int(0) NOT NULL,
    `authority_id`       int(0) NOT NULL,
    `字段 4`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 5`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 6`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`admin_authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_admin_authority
-- ----------------------------
INSERT INTO `gcs_admin_authority`
VALUES (1, 1, 1, NULL, NULL, NULL);
INSERT INTO `gcs_admin_authority`
VALUES (2, 1, 2, NULL, NULL, NULL);
INSERT INTO `gcs_admin_authority`
VALUES (3, 1, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_ans_record
-- ----------------------------
DROP TABLE IF EXISTS `gcs_ans_record`;
CREATE TABLE `gcs_ans_record`
(
    `answer_id`   int(0) NOT NULL AUTO_INCREMENT,
    `user_id`     int(0) NOT NULL,
    `answer_time` int(0) NOT NULL,
    `answer_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `accuracy`    int(0) NOT NULL,
    `字段 6`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 7`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 8`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`answer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_ans_record
-- ----------------------------
INSERT INTO `gcs_ans_record`
VALUES (2, 1, 300, '2023-07-09 14:41:50', 10, NULL, NULL, NULL);
INSERT INTO `gcs_ans_record`
VALUES (3, 1, 300, '2023-07-09 14:43:29', 10, NULL, NULL, NULL);
INSERT INTO `gcs_ans_record`
VALUES (4, 1, 300, '2023-07-09 14:43:58', 10, NULL, NULL, NULL);
INSERT INTO `gcs_ans_record`
VALUES (5, 2, 0, '2023-07-11 22:15:40', 3, NULL, NULL, NULL);
INSERT INTO `gcs_ans_record`
VALUES (6, 2, 0, '2023-07-11 22:17:25', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_authority
-- ----------------------------
DROP TABLE IF EXISTS `gcs_authority`;
CREATE TABLE `gcs_authority`
(
    `authority_id`   int(0) NOT NULL AUTO_INCREMENT,
    `authority_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `authority_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
    `字段 4`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 5`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 6`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_authority
-- ----------------------------
INSERT INTO `gcs_authority`
VALUES (1, 'all', '所有权限', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (2, 'garbage', '对垃圾类别进行操作', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (3, 'news', '对资讯进行操作', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (4, 'goods', '对商品进行操作', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (5, 'users', '对用户数据进行操作', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (6, 'quiz', '对答题数据进行操作', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (7, 'admin', '对管理员信息和权限进行管理', NULL, NULL, NULL);
INSERT INTO `gcs_authority`
VALUES (8, 'authority', '对权限进行管理', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_exchange_record
-- ----------------------------
DROP TABLE IF EXISTS `gcs_exchange_record`;
CREATE TABLE `gcs_exchange_record`
(
    `exchange_record_id`  int(0) NOT NULL AUTO_INCREMENT,
    `goods_id`            int(0) NOT NULL,
    `user_id`             int(0) NOT NULL,
    `exchange_timestamp`  datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `receive_location`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `receive_phonenumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `receive_name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `字段 8`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 9`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 10`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`exchange_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_exchange_record
-- ----------------------------
INSERT INTO `gcs_exchange_record`
VALUES (1, 1, 3, '2023-07-10 17:18:01', '3123123', '312312', '3123', NULL, NULL, NULL);
INSERT INTO `gcs_exchange_record`
VALUES (5, 1, 1, '2023-07-11 15:31:56', '重庆市沙坪坝区重庆大学虎溪校区', '13871875698', '小张', NULL, NULL, NULL);
INSERT INTO `gcs_exchange_record`
VALUES (6, 1, 2, '2023-07-12 09:50:24', '重庆大学虎溪校区', '18680852358', '邱盈钢', NULL, NULL, NULL);
INSERT INTO `gcs_exchange_record`
VALUES (7, 1, 2, '2023-07-12 10:00:16', '重庆市九龙坡区石桥铺', '15612347892', '李潇', NULL, NULL, NULL);
INSERT INTO `gcs_exchange_record`
VALUES (8, 2, 2, '2023-07-12 10:00:58', '重庆市九龙坡区石桥铺', '18680852358', '邱盈钢', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_garbage
-- ----------------------------
DROP TABLE IF EXISTS `gcs_garbage`;
CREATE TABLE `gcs_garbage`
(
    `garbage_id`             int(0) NOT NULL AUTO_INCREMENT,
    `garbage_name`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `garbage_classification` enum('可回收垃圾','其他垃圾','有害垃圾','厨余垃圾') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `字段 4`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 5`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 6`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`garbage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 838 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_garbage
-- ----------------------------
INSERT INTO `gcs_garbage`
VALUES (568, '八宝粥', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (569, '冰激凌', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (570, '冰糖葫芦', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (571, '饼干', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (572, '菠萝', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (573, '菠萝蜜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (574, '菜根菜叶', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (575, '残渣剩饭', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (576, '草莓', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (577, '茶叶', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (578, '肠', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (579, '橙子', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (580, '蛋', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (581, '蛋糕', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (582, '蛋挞', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (583, '地瓜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (584, '豆', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (585, '豆腐', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (586, '番茄', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (587, '粉条', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (588, '甘蔗', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (589, '骨头', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (590, '瓜子', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (591, '果冻', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (592, '果壳', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (593, '果皮', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (594, '哈密瓜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (595, '核桃', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (596, '火龙果', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (597, '火腿', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (598, '鸡翅', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (599, '坚果', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (600, '秸秆杯', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (601, '秸秆碗', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (602, '咖啡', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (603, '烤鸡', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (604, '辣椒', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (605, '梨', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (606, '萝卜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (607, '面包', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (608, '蘑菇', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (609, '泡菜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (610, '苹果', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (611, '巧克力', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (612, '肉类', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (613, '圣女果', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (614, '蔬菜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (615, '薯片', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (616, '薯条', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (617, '水果', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (618, '蒜', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (619, '鱼骨', '厨余垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (620, '包', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (621, '保温杯', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (622, '保鲜膜内芯', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (623, '玻璃壶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (624, '玻璃瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (625, '玻璃器皿', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (626, '玻璃球', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (627, '玻璃制品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (628, '不锈钢制品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (629, '布制品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (630, '餐垫', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (631, '餐具', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (632, '插头电线', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (633, '插线板', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (634, '尺子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (635, '充电宝', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (636, '充电头', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (637, '充电线', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (638, '充电牙刷', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (639, '吹风机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (640, '磁铁', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (641, '搓衣板', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (642, '打包绳', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (643, '打气筒', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (644, '打印机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (645, '单车', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (646, '档案袋', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (647, '刀', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (648, '地球仪', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (649, '地铁票', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (650, '灯罩', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (651, '登机牌', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (652, '凳子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (653, '电磁炉', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (654, '电动卷发棒', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (655, '电动剃须刀', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (656, '电饭煲', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (657, '电风扇', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (658, '电话', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (659, '电路板', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (660, '显示器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (661, '电视机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (662, '电熨斗', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (663, '电子秤', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (664, '垫子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (665, '吊牌', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (666, '调料瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (667, '钉子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (668, '订书机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (669, '豆浆机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (670, '耳机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (671, '耳套', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (672, '放大镜', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (673, '盖子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (674, '购物纸袋', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (675, '锅', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (676, '锅盖', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (677, '果冻杯', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (678, '过滤网', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (679, '盒子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (680, '呼啦圈', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (681, '护肤品瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (682, '话筒', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (683, '计算器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (684, '键盘', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (685, '金属罐', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (686, '金属制品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (687, '酒瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (688, '卡片', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (689, '空气加湿器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (690, '空气净化器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (691, '裤子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (692, '快递纸袋', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (693, '拉杆箱', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (694, '量杯', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (695, '笼子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (696, '路由器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (697, '铝制用品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (698, '轮胎', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (699, '帽子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (700, '灭火器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (701, '模具', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (702, '木雕', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (703, '木棍', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (704, '木桶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (705, '木制切菜板', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (706, '木质锅铲', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (707, '木质梳子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (708, '奶粉罐', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (709, '闹铃', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (710, '尼龙绳', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (711, '镊子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (712, '暖宝宝', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (713, '盘子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (714, '泡沫板', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (715, '乒乓球拍', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (716, '棋子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (717, '铅球', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (718, '裙子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (719, '燃气瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (720, '燃气灶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (721, '热水瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (722, '日历', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (723, '扫地机器人', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (724, '沙发', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (725, '食用油桶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (726, '饰品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (727, '收音机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (728, '手表', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (729, '手电筒', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (730, '手机', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (731, '手链', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (732, '书', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (733, '鼠标', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (734, '水杯', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (735, '水壶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (736, '塑料碗盆', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (737, '塑料制品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (738, '台灯', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (739, '太阳能热水器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (740, '毯子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (741, '体重秤', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (742, '铁丝球', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (743, '拖鞋', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (744, '袜子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (745, '玩具', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (746, '碗', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (747, '网卡', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (748, '望远镜', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (749, '洗发水瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (750, '箱子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (751, '鞋', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (752, '鞋子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (753, '信封', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (754, '烟灰缸', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (755, '遥控器', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (756, '钥匙', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (757, '衣服', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (758, '衣架', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (759, '音响', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (760, '饮料瓶', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (761, '鱼缸', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (762, '瑜伽球', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (763, '雨伞', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (764, '枕头', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (765, '纸牌', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (766, '纸箱', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (767, '纸制品', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (768, '桌子', '可回收垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (769, '百洁布', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (770, '笔', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (771, '便利贴', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (772, '彩票', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (773, '餐盒', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (774, '餐巾纸', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (775, '苍蝇拍', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (776, '草帽', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (777, '茶壶碎片', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (778, '唱片', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (779, '车票', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (780, '除湿袋', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (781, '厨房抹布', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (782, '厨房手套', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (783, '串串竹签', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (784, '创可贴', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (785, '搓澡巾', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (786, '打火机', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (787, '起泡网', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (788, '大龙虾头', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (789, '电蚊香', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (790, '电影票', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (791, '防霉防蛀片', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (792, '干燥剂', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (794, '鸡毛掸', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (795, '胶带', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (796, '胶水包装', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (797, '酒精棉', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (798, '空调滤芯', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (799, '口罩', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (800, '毛巾', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (801, '奶茶杯', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (802, '破碎陶瓷', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (803, '湿纸巾', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (804, '塑料袋', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (805, '图钉', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (806, '涂改带', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (807, '卫生纸', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (808, '牙签', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (809, '牙刷', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (810, '烟蒂', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (811, '眼镜', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (812, '眼镜布', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (813, '验孕棒', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (814, '一次性杯子', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (815, '一次性棉签', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (816, '竹筷', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (817, 'U型回形针', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (818, '陶瓷', '其他垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (819, '灯', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (820, '电池', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (821, '电池板', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (822, '胶水', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (823, '纽扣电池', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (824, '杀虫剂', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (825, '温度计', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (826, '蓄电池', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (827, '血压计', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (828, '药膏', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (829, '药片', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (830, '药品包装', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (831, '药瓶', '有害垃圾', NULL, NULL, NULL);
INSERT INTO `gcs_garbage`
VALUES (832, '指甲', '有害垃圾', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_goods
-- ----------------------------
DROP TABLE IF EXISTS `gcs_goods`;
CREATE TABLE `gcs_goods`
(
    `goods_id`              int(0) NOT NULL AUTO_INCREMENT,
    `goods_point`           int(0) NOT NULL,
    `goods_name`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `goods_desc`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
    `goods_num`             int(0) NOT NULL,
    `goods_create_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `goods_status`          int(0) NOT NULL DEFAULT 1,
    `goods_delete_datetime` int(0) NULL DEFAULT NULL,
    `goods_picture`         varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 10`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 11`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_goods
-- ----------------------------
INSERT INTO `gcs_goods`
VALUES (1, 50000, '维达抽纸', '120抽超厚纸巾', 37, '2023-07-07 09:56:37', 1, NULL, 'static/image/goods/weida.png', NULL,
        NULL);
INSERT INTO `gcs_goods`
VALUES (2, 60000, '湿纸巾', '环保湿纸巾，亲肤不刺激', 56, '2023-07-10 10:14:35', 1, NULL,
        'static/image/goods/shizhijin.jpg', NULL, NULL);
INSERT INTO `gcs_goods`
VALUES (4, 550000, '玻璃杯', '时尚玻璃杯', 66, '2023-07-13 14:28:54', 1, NULL, 'static/image/goods/bolibei.jpg', NULL,
        NULL);
INSERT INTO `gcs_goods`
VALUES (11, 999999, '无敌', '无敌就是无敌', 10000, '2023-07-13 21:16:12', 1, NULL,
        'static\\image\\goods\\73105f41-ed90-4f3b-bb9e-ff46b6020021.png', NULL, NULL);

-- ----------------------------
-- Table structure for gcs_news
-- ----------------------------
DROP TABLE IF EXISTS `gcs_news`;
CREATE TABLE `gcs_news`
(
    `news_id`              int(0) NOT NULL AUTO_INCREMENT,
    `news_admin_id`        int(0) NOT NULL,
    `news_title`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL,
    `news_content`         varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `news_like_num`        int(0) NOT NULL DEFAULT 0,
    `news_comment_num`     int(0) NOT NULL DEFAULT 0,
    `news_create_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `news_statues`         tinyint(0) NOT NULL DEFAULT 1,
    `news_delete_datetime` tinyint(0) NULL DEFAULT NULL,
    `news_picture`         varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `news_heat`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 12`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_news
-- ----------------------------
INSERT INTO `gcs_news`
VALUES (1, 1, '如何绿色发展',
        '绿色发展是一种系统性发展。绿色发展、循环发展、低碳发展是现代生态文明的系统性整体发展。\r\n绿色发展、循环发展、低碳发展否定了传统的线性经济生产方式，共同致力于可持续性发展目标。循环发展、低碳发展是绿色发展的具体化，绿色发展是通过循环发展、低碳发展等形态表现出来的。\r\n新时代绿色发展的价值意蕴体现在以下几个方面：\r\n\r\n其一，绿色发展是马克思主义生态观的集中体现和凝练升华。马克思主义生态观是关于人类社会发展过程中人与自然、人与社会关系问题的思想理念。马克思在其经典著作中并没有明确地提出“生态文明”“生态建设”等概念，但在论述人的存在、人的本质、人的异化等问题时，都把自然中介作为动态要素，肯定了唯物主义人化自然、人与自然物质互换的自然观，批判了资本主义对自然“断裂式”的掠夺和剥削，这些都揭示了自然在实现人的全面发展和社会全面进步中的重大意义。\r\n\r\n其二，绿色发展是转变发展方式和转换发展动能的必然选择。党的十八大以来，党中央综合分析世界经济长周期和我国发展阶段性特征及其相互作用，作出了“我国经济发展进入新常态”的重大战略判断，提出转变发展方式、优化经济结构、转换增长动力，推动我国经济在实现高质量发展上不断取得新进展。从历史上看，我国传统的发展模式是一种依赖资源投入和低成本劳动力为主的粗放型发展模式。虽然我国经济总量已跃居世界第二，某些领域生产能力走在世界前列，但整体性经济社会发展不平衡、动能转换乏力仍然制约着我国创新发展的动力和后劲。随着我国资源约束的趋紧和国际竞争更趋激烈，传统的发展模式难以为继。党的十九大报告指出，“推动经济发展质量变革、效率变革、动力变革”，这将为我国未来经济社会发展注入新活力新动力。\r\n\r\n其三，绿色发展是建设美丽中国的内在要求。党的十九大报告对建设美丽中国作出重要部署，体现了我们党加快生态文明体制改革、建设美丽中国的决心和意志。我们要建设的现代化是人与自然和谐共生的现代化，既要创造丰富的物质产品和精神产品，还要提供丰富的生态产品，为人们生活构筑高质量的优美生态环境。在过去的经济高速增长阶段，高投入、高耗能的发展模式造成了我国生态环境的严重破坏，甚至损害人民的生命健康，制约着更好满足人们过上美好生活的新需要新期待。习近平总书记指出，“必须树立和践行绿水青山就是金山银山的理念，坚持节约资源和保护环境的基本国策，像对待生命一样对待生态环境，统筹山水林田湖草系统治理，实行最严格的生态环境保护制度”。可以说，坚持绿色发展、建设美丽中国既是对我国以往经济建设惨痛教训的总结，又是解决我国面临的突出环境问题的现实需要。只有坚持绿色发展理念，构建绿色技术创新体系，坚定地走生活富裕、生产发展、生态良好的文明发展道路，才能实现好、维护好、发展好人民群众的根本利益。\r\n\r\n其四，绿色发展是推动构建人类命运共同体的重要战略抉择。我们党倡导并坚持推动构建人类命运共同体，旨在推动世界各国实现和平发展、共同发展。构建人类命运共同体立足于我国经济发展现实需要和经济全球化深入发展的实践基础，既顺应了世界各国合作共赢的美好愿望，又着眼于解决人类面临的共同问题。当前，世界正处于大发展大变革大调整时期，一方面，迅速崛起的新兴市场国家和发展中国家要求提升国际地位；另一方面，以西方国家主导、维护西方国家利益的旧的国际秩序和全球治理体系难以应对日益复杂的国际局势和发展要求。从本质上说，西方的资本逻辑的扩张和贪婪，必然会抢夺世界市场和资源。我国呼吁积极推动全球治理体系变革，要求我们从自身做起，推动绿色发展，致力于打造清洁美丽的世界。这既是提高我们自身绿色发展能力的必然要求，也是在为世界经济发展做出贡献。',
        1000, 0, '2023-07-07 09:25:52', 1, NULL, 'static/image/news/news1.jpg', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (2, 1, '垃圾回收：解决当代社会的环境挑战',
        '垃圾回收是一项关键的环境管理策略，旨在减少垃圾对我们社会和自然环境造成的负面影响。随着人口的增长和消', 9999, 0,
        '2023-07-08 11:01:21', 1, NULL, 'static/image/news/news2.jpg', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (3, 1, '垃圾回收与循环经济：构建可持续的未来',
        '随着全球经济的快速增长和资源消耗的加剧，垃圾回收和循环经济成为了构建可持续未来的关键策略。传统的线性', 52, 0,
        '2023-07-08 11:02:06', 1, NULL, 'static/image/news/news3.jpg', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (4, 1, '垃圾回收：为环境保护做出贡献',
        '垃圾回收是每个人为环境保护做出贡献的简单而有效的方式。通过正确分类和回收废弃物，我们可以减少资源的消', 20, 0,
        '2023-07-08 11:02:47', 1, NULL, 'static/image/news/news6.jpg', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (5, 1, '垃圾回收：从个人到社会的责任',
        '垃圾回收是一项涉及个人和社会责任的重要任务。个人应该养成垃圾分类和回收的良好习惯，将废弃物放入相应的', 0, 0,
        '2023-07-08 11:03:14', 1, NULL, 'static/image/news/news4.jpg', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (6, 1, '垃圾回收：解决城市化带来的挑战',
        '随着城市化进程的加快，垃圾处理成为城市管理中的重要议题。垃圾回收在城市环境管理中起到至关重要的作用。', 0, 0,
        '2023-07-08 11:04:14', 1, NULL, 'static/image/news/news5.jpg', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (7, 1, '垃圾回收：实现绿色发展的关键步骤',
        '垃圾回收在实现绿色发展过程中扮演着重要的角色。绿色发展是一种可持续的经济模式，旨在平衡经济增长与环境', 0, 0,
        '2023-07-08 11:04:27', 1, NULL, 'static/image/news/news8.png', NULL, NULL);
INSERT INTO `gcs_news`
VALUES (8, 1, '环境保护：我们的责任与使命\"',
        '保护环境是我们每个人的责任，也是一项迫切的使命。全球气候变化、生物多样性丧失和资源枯竭等环境问题日益', 0, 0,
        '2023-07-08 11:05:16', 1, NULL, 'static/image/news/news7.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for gcs_news_comment
-- ----------------------------
DROP TABLE IF EXISTS `gcs_news_comment`;
CREATE TABLE `gcs_news_comment`
(
    `comment_id`              int(0) NOT NULL AUTO_INCREMENT,
    `news_id`                 int(0) NOT NULL,
    `user_id`                 int(0) NOT NULL,
    `comment_content`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `comment_like_num`        int(0) NOT NULL DEFAULT 0,
    `comment_datetime`        datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `comment_status`          tinyint(0) NOT NULL DEFAULT 1,
    `comment_delete_datetime` datetime(0) NULL DEFAULT NULL,
    `字段 9`                  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 10`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 11`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_news_comment
-- ----------------------------

-- ----------------------------
-- Table structure for gcs_quiz
-- ----------------------------
DROP TABLE IF EXISTS `gcs_quiz`;
CREATE TABLE `gcs_quiz`
(
    `quiz_id`              int(0) NOT NULL AUTO_INCREMENT,
    `quiz_desc`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `quiz_ans`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `quiz_opt`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `quiz_datetime`        datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `quiz_status`          tinyint(0) NOT NULL DEFAULT 1,
    `quiz_delete_datetime` datetime(0) NULL DEFAULT NULL,
    `字段 8`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 9`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 10`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`quiz_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_quiz
-- ----------------------------
INSERT INTO `gcs_quiz`
VALUES (1, '垃圾分类的目的是什么', 'D. 减少对环境的污染',
        'A. 方便回收\r\nB. 增加垃圾产生\r\nC. 增加垃圾处理成本\r\nD. 减少对环境的污染', '2023-07-13 10:46:10', 1, NULL,
        NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (2, '以下哪种垃圾属于可回收垃圾？', 'D. 废纸', 'A. 塑料袋\nB. 餐巾纸\nC. 电池\nD. 废纸', '2023-07-06 17:43:43', 1,
        NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (3, '以下哪种垃圾属于有害垃圾？', 'D. 废灯管', 'A. 塑料瓶\nB. 厨余垃圾\nC. 纸盒\nD. 废灯管',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (4, '回收可回收垃圾的目的是什么？', 'A. 资源再利用',
        'A. 资源再利用\nB. 增加垃圾产生\nC. 减少垃圾处理成本\nD. 增加对环境的污染', '2023-07-06 17:43:43', 1, NULL,
        NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (5, '以下哪种垃圾属于厨余垃圾？', 'C. 剩饭剩菜', 'A. 玻璃瓶\nB. 塑料袋\nC. 剩饭剩菜\nD. 纸盒',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (6, '以下哪种垃圾属于其他垃圾？', 'B. 破碎陶瓷', 'A. 食品包装袋\nB. 破碎陶瓷\nC. 金属罐\nD. 纸张',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (7, '以下哪种垃圾属于可回收垃圾？', 'B. 废塑料瓶', 'A. 旧衣服\nB. 废塑料瓶\nC. 废电池\nD. 废纸板',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (8, '以下哪种垃圾属于可回收垃圾？', 'A. 旧报纸', 'A. 旧报纸\nB. 餐巾纸\nC. 电池\nD. 塑料袋',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (9, '以下哪种垃圾属于厨余垃圾？', 'C. 剩菜剩饭', 'A. 玻璃瓶\nB. 塑料袋\nC. 剩菜剩饭\nD. 纸张',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (10, '以下哪种垃圾属于其他垃圾？', 'B. 旧衣服', 'A. 破碎陶瓷\nB. 旧衣服\nC. 金属罐\nD. 纸张',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (11, '以下哪种垃圾属于有害垃圾？', 'C. 废灯泡', 'A. 塑料瓶\nB. 厨余垃圾\nC. 废灯泡\nD. 纸盒',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (12, '回收可回收垃圾的目的是什么？', 'B. 资源再利用',
        'A. 减少垃圾产生\nB. 资源再利用\nC. 增加垃圾处理成本\nD. 增加对环境的污染', '2023-07-06 17:43:43', 1, NULL,
        NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (13, '以下哪种垃圾属于厨余垃圾？', 'D. 植物枝干', 'A. 玻璃瓶\nB. 塑料袋\nC. 剩饭剩菜\nD. 植物枝干',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (14, '哪类垃圾属于可回收垃圾？', 'A. 纸张和纸板', 'A. 纸张和纸板\nB. 厨余垃圾\nC. 电池\nD. 破碎陶瓷',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (15, '以下哪种垃圾属于有害垃圾？', 'C. 废电池', 'A. 塑料瓶\nB. 纸盒\nC. 废电池\nD. 旧衣服', '2023-07-06 17:43:43',
        1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (16, '以下哪种垃圾属于厨余垃圾？', 'B. 剩饭剩菜', 'A. 塑料袋\nB. 剩饭剩菜\nC. 金属罐\nD. 废灯泡',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (17, '以下哪种垃圾属于其他垃圾？', 'D. 破碎玻璃', 'A. 旧报纸\nB. 塑料袋\nC. 废电池\nD. 破碎玻璃',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (18, '回收可回收垃圾的目的是什么？', 'B. 资源再利用',
        'A. 减少垃圾产生\nB. 资源再利用\nC. 增加垃圾处理成本\nD. 增加对环境的污染', '2023-07-06 17:43:43', 1, NULL,
        NULL, NULL, NULL);
INSERT INTO `gcs_quiz`
VALUES (19, '以下哪种垃圾属于可回收垃圾？', 'C. 金属罐', 'A. 塑料瓶\nB. 纸张\nC. 金属罐\nD. 废电池',
        '2023-07-06 17:43:43', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for gcs_user
-- ----------------------------
DROP TABLE IF EXISTS `gcs_user`;
CREATE TABLE `gcs_user`
(
    `user_id`                int(0) NOT NULL AUTO_INCREMENT,
    `user_name`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `user_profile`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `user_point`             int(0) NOT NULL DEFAULT 0,
    `user_answer_count`      int(0) NOT NULL DEFAULT 0,
    `user_comment_num`       int(0) NOT NULL DEFAULT 0,
    `user_like_num`          int(0) NOT NULL DEFAULT 0,
    `user_register_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `user_account`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 10`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 11`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_user
-- ----------------------------
INSERT INTO `gcs_user`
VALUES (1, 'jcl', 'd:sb', 999950009, 0, 0, 0, '2023-07-07 22:22:54', '12345', NULL, NULL);
INSERT INTO `gcs_user`
VALUES (2, NULL, NULL, 9679999, 0, 0, 0, '2023-07-09 19:54:54', 'oB0U15Gxzj9tCcJO4SFd-TquCzZ8', NULL, NULL);
INSERT INTO `gcs_user`
VALUES (3, NULL, NULL, 9899999, 0, 0, 0, '2023-07-10 16:17:13', 'oB0U15JwlZJd0DKJLWJXdm9ann4A', NULL, NULL);

-- ----------------------------
-- Table structure for gcs_user_search
-- ----------------------------
DROP TABLE IF EXISTS `gcs_user_search`;
CREATE TABLE `gcs_user_search`
(
    `search_id`            int(0) NOT NULL AUTO_INCREMENT,
    `search_type`          tinyint(0) NOT NULL COMMENT '0: img; 1: text',
    `search_content`       varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `user_id`              int(0) NOT NULL,
    `garbage_id`           int(0) NULL DEFAULT NULL,
    `user_search_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0),
    `字段 7`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 8`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `字段 9`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    PRIMARY KEY (`search_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gcs_user_search
-- ----------------------------
INSERT INTO `gcs_user_search`
VALUES (6, 0, 'static\\image\\search_image\\93582bf1-347b-412f-925b-ca3128fd047b.png', 2, NULL, '2023-07-11 09:34:22',
        NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (7, 0, 'static\\image\\search_image\\6f461e71-a9d5-4cb3-8148-48b5f5292660.jpg', 2, NULL, '2023-07-11 09:53:49',
        NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (8, 1, '香蕉是什么垃圾', 2, NULL, '2023-07-12 10:43:43', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (9, 1, '香蕉', 2, NULL, '2023-07-12 10:44:19', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (10, 1, '电池', 2, NULL, '2023-07-12 10:44:36', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (11, 1, '电池', 2, NULL, '2023-07-12 10:44:41', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (12, 1, '电池', 2, NULL, '2023-07-12 10:44:42', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (13, 1, '电池', 2, NULL, '2023-07-12 10:44:59', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (14, 1, '香蕉', 2, NULL, '2023-07-12 10:45:51', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (15, 1, '电池', 2, NULL, '2023-07-12 10:46:01', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (16, 1, '电池', 2, NULL, '2023-07-12 10:47:22', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (17, 1, '电池', 2, NULL, '2023-07-12 10:48:22', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (18, 1, '香蕉', 2, NULL, '2023-07-12 10:48:39', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (19, 1, '电池', 2, NULL, '2023-07-12 10:48:51', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (20, 1, '香蕉皮', 2, NULL, '2023-07-12 10:49:06', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (21, 1, '卫生纸', 2, NULL, '2023-07-12 10:49:20', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (22, 0, 'static\\image\\search\\7067e5c3-8812-452a-b3c6-e9863c582136.jpg', 2, NULL, '2023-07-12 11:07:50', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (23, 1, 'ffff', 2, NULL, '2023-07-12 22:41:30', NULL, NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (24, 0, 'static\\image\\search\\4b75522d-eed0-472a-b1a5-c31ec3cbdc80.jpg', 2, NULL, '2023-07-12 23:31:55', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (25, 0, 'static\\image\\search\\e7f6eb92-db2a-4cb7-84fe-fd487cb74229.jpeg', 2, NULL, '2023-07-13 11:00:24', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (26, 0, 'static\\image\\search\\96fdc2d8-ac4f-4c2e-851e-55c6c5dfd07c.jpeg', 2, NULL, '2023-07-13 11:00:42', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (27, 0, 'static\\image\\search\\bcbc0553-a07f-42ad-a63f-8e60515a9781.jpg', 2, NULL, '2023-07-13 11:00:58', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (28, 0, 'static\\image\\search\\3041a963-d60f-4719-9939-9ee9ad3cf675.png', 2, NULL, '2023-07-13 11:03:50', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (29, 0, 'static\\image\\search\\e9a5145e-4206-486a-ab89-ae877689e9f0.png', 2, NULL, '2023-07-13 11:05:34', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (30, 0, 'static\\image\\search\\8830faf7-313b-4f23-b8a8-f957c4756348.jpeg', 2, NULL, '2023-07-13 11:27:50', NULL,
        NULL, NULL);
INSERT INTO `gcs_user_search`
VALUES (31, 0, 'static\\image\\search\\71d8cc35-805f-425f-bcc8-0924c5e950d7.jpg', 2, NULL, '2023-07-13 12:23:12', NULL,
        NULL, NULL);

SET
FOREIGN_KEY_CHECKS = 1;
