/*
 Navicat Premium Data Transfer

 Source Server         : mysql data
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : igeekshop

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 28/03/2022 20:40:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `user_id` int(0) NOT NULL,
  `province` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `area` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `address_id` int(0) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '夏威夷', '比基尼海滩', '蟹黄堡', 5, '蟹黄堡办公室', '蟹老板', '18371066032');
INSERT INTO `address` VALUES (1, '湖北', '襄阳', '樊城', 6, '华中药业', 'cc', '13797598650');
INSERT INTO `address` VALUES (10, '湖北', '武汉', '江夏', 8, '武工大', 'cc', '18371066621');
INSERT INTO `address` VALUES (11, '湖北', '武汉', '江夏', 9, '武工大123', 'qq123', '18371066032');
INSERT INTO `address` VALUES (11, '湖北', '武汉', '江夏', 11, '武工大123123', 'qq', '18371066032');
INSERT INTO `address` VALUES (15, '湖北', '襄阳', '江夏', 13, '武工大123', '123', '18371066032');
INSERT INTO `address` VALUES (17, '湖北', '武汉', '江夏', 14, '武汉工程大学123123', 'cc', '18371066032');
INSERT INTO `address` VALUES (17, '湖北', '武汉', '江夏132', 16, '武汉工程大学4234', 'cc123', '18371066032');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_detail_id` int(0) NOT NULL AUTO_INCREMENT,
  `product_id` int(0) NOT NULL,
  `product_num` int(0) NOT NULL,
  `product_price` decimal(10, 2) NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`order_detail_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (13, 402, 4, 12.00, '4a09c9bfc07e43c8b6529f6ad39a54c4');
INSERT INTO `order_detail` VALUES (14, 482, 1, 14.00, '4a09c9bfc07e43c8b6529f6ad39a54c4');
INSERT INTO `order_detail` VALUES (15, 569, 3, 8.00, '4a09c9bfc07e43c8b6529f6ad39a54c4');
INSERT INTO `order_detail` VALUES (16, 322, 1, 10.00, 'deec09f1ef7743dabdb768669bac596c');
INSERT INTO `order_detail` VALUES (17, 403, 1, 18.00, 'deec09f1ef7743dabdb768669bac596c');
INSERT INTO `order_detail` VALUES (18, 21, 2, 21.00, '820ba8d4586f4c0a98a260f84109d12a');
INSERT INTO `order_detail` VALUES (19, 21, 4, 21.00, 'e29e947d64744a2a9d8292910aa13fb0');
INSERT INTO `order_detail` VALUES (20, 481, 2, 7.00, '4c492dd8135843cd9dab2904c8d115f9');
INSERT INTO `order_detail` VALUES (21, 70, 2, 70.00, 'f301ebe438ee4bd48afb2c23454bf0fa');
INSERT INTO `order_detail` VALUES (22, 482, 1, 14.00, '55a2a0279406450ba28b60323f971be9');
INSERT INTO `order_detail` VALUES (23, 82, 1, 4.00, 'e4a219409e8040bf9a4d76e949b09a08');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('4a09c9bfc07e43c8b6529f6ad39a54c4', 1, 86.00, '夏威夷省比基尼海滩市蟹黄堡区蟹黄堡办公室（蟹老板收）电话：18371066032');
INSERT INTO `orders` VALUES ('4c492dd8135843cd9dab2904c8d115f9', 1, 14.00, '夏威夷省比基尼海滩市蟹黄堡区蟹黄堡办公室（蟹老板收）电话：18371066032');
INSERT INTO `orders` VALUES ('55a2a0279406450ba28b60323f971be9', 1, 14.00, '夏威夷省比基尼海滩市蟹黄堡区蟹黄堡办公室（蟹老板收）电话：18371066032');
INSERT INTO `orders` VALUES ('820ba8d4586f4c0a98a260f84109d12a', 11, 42.00, '湖北省武汉市江夏区武工大123（qq123收）电话：18371066032');
INSERT INTO `orders` VALUES ('deec09f1ef7743dabdb768669bac596c', 10, 28.00, '湖北省武汉市江夏区武工大（cc收）电话：18371066621');
INSERT INTO `orders` VALUES ('e29e947d64744a2a9d8292910aa13fb0', 15, 84.00, '湖北省襄阳市江夏区武工大123（123收）电话：18371066032');
INSERT INTO `orders` VALUES ('e4a219409e8040bf9a4d76e949b09a08', 1, 4.00, '夏威夷省比基尼海滩市蟹黄堡区蟹黄堡办公室（蟹老板收）电话：18371066032');
INSERT INTO `orders` VALUES ('f301ebe438ee4bd48afb2c23454bf0fa', 17, 140.00, '湖北省武汉市江夏区武汉工程大学123123（cc收）电话：18371066032');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `store_id` int(0) NOT NULL,
  `surplus` int(0) NOT NULL COMMENT '剩余量',
  `category_id` int(0) NOT NULL COMMENT '类别id',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default.jpg' COMMENT '图片地址',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 573 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (21, '商品121', '描述121', 21.00, 1, 15, 1, 'default.jpg');
INSERT INTO `product` VALUES (22, '商品122', '描述122', 22.00, 1, 22, 1, NULL);
INSERT INTO `product` VALUES (23, '商品123', '描述123', 23.00, 1, 23, 1, NULL);
INSERT INTO `product` VALUES (24, '商品124', '描述124', 24.00, 1, 24, 1, NULL);
INSERT INTO `product` VALUES (25, '商品125', '描述125', 25.00, 1, 25, 1, NULL);
INSERT INTO `product` VALUES (26, '商品126', '描述126', 26.00, 1, 26, 1, NULL);
INSERT INTO `product` VALUES (27, '商品127', '描述127', 27.00, 1, 27, 1, NULL);
INSERT INTO `product` VALUES (28, '商品128', '描述128', 28.00, 1, 28, 1, NULL);
INSERT INTO `product` VALUES (29, '商品129', '描述129', 29.00, 1, 29, 1, NULL);
INSERT INTO `product` VALUES (30, '商品130', '描述130', 30.00, 1, 30, 1, NULL);
INSERT INTO `product` VALUES (31, '商品131', '描述131', 31.00, 1, 31, 1, NULL);
INSERT INTO `product` VALUES (32, '商品132', '描述132', 32.00, 1, 32, 1, NULL);
INSERT INTO `product` VALUES (33, '商品133', '描述133', 33.00, 1, 33, 1, NULL);
INSERT INTO `product` VALUES (34, '商品134', '描述134', 34.00, 1, 34, 1, NULL);
INSERT INTO `product` VALUES (35, '商品135', '描述135', 35.00, 1, 35, 1, NULL);
INSERT INTO `product` VALUES (36, '商品136', '描述136', 36.00, 1, 36, 1, NULL);
INSERT INTO `product` VALUES (37, '商品137', '描述137', 37.00, 1, 37, 1, NULL);
INSERT INTO `product` VALUES (38, '商品138', '描述138', 38.00, 1, 38, 1, NULL);
INSERT INTO `product` VALUES (39, '商品139', '描述139', 39.00, 1, 39, 1, NULL);
INSERT INTO `product` VALUES (40, '商品140', '描述140', 40.00, 1, 40, 1, NULL);
INSERT INTO `product` VALUES (41, '商品141', '描述141', 41.00, 1, 41, 1, NULL);
INSERT INTO `product` VALUES (42, '商品142', '描述142', 42.00, 1, 42, 1, NULL);
INSERT INTO `product` VALUES (43, '商品143', '描述143', 43.00, 1, 43, 1, NULL);
INSERT INTO `product` VALUES (44, '商品144', '描述144', 44.00, 1, 44, 1, NULL);
INSERT INTO `product` VALUES (45, '商品145', '描述145', 45.00, 1, 45, 1, NULL);
INSERT INTO `product` VALUES (46, '商品146', '描述146', 46.00, 1, 46, 1, NULL);
INSERT INTO `product` VALUES (47, '商品147', '描述147', 47.00, 1, 47, 1, NULL);
INSERT INTO `product` VALUES (48, '商品148', '描述148', 48.00, 1, 48, 1, NULL);
INSERT INTO `product` VALUES (49, '商品149', '描述149', 49.00, 1, 49, 1, NULL);
INSERT INTO `product` VALUES (50, '商品150', '描述150', 50.00, 1, 50, 1, NULL);
INSERT INTO `product` VALUES (51, '商品151', '描述151', 51.00, 1, 51, 1, NULL);
INSERT INTO `product` VALUES (52, '商品152', '描述152', 52.00, 1, 52, 1, NULL);
INSERT INTO `product` VALUES (53, '商品153', '描述153', 53.00, 1, 53, 1, NULL);
INSERT INTO `product` VALUES (54, '商品154', '描述154', 54.00, 1, 54, 1, NULL);
INSERT INTO `product` VALUES (55, '商品155', '描述155', 55.00, 1, 55, 1, NULL);
INSERT INTO `product` VALUES (56, '商品156', '描述156', 56.00, 1, 56, 1, NULL);
INSERT INTO `product` VALUES (57, '商品157', '描述157', 57.00, 1, 57, 1, NULL);
INSERT INTO `product` VALUES (58, '商品158', '描述158', 58.00, 1, 58, 1, NULL);
INSERT INTO `product` VALUES (59, '商品159', '描述159', 59.00, 1, 59, 1, NULL);
INSERT INTO `product` VALUES (60, '商品160', '描述160', 60.00, 1, 60, 1, NULL);
INSERT INTO `product` VALUES (61, '商品161', '描述161', 61.00, 1, 61, 1, NULL);
INSERT INTO `product` VALUES (62, '商品162', '描述162', 62.00, 1, 62, 1, NULL);
INSERT INTO `product` VALUES (63, '商品163', '描述163', 63.00, 1, 63, 1, NULL);
INSERT INTO `product` VALUES (64, '商品164', '描述164', 64.00, 1, 64, 1, NULL);
INSERT INTO `product` VALUES (65, '商品165', '描述165', 65.00, 1, 65, 1, NULL);
INSERT INTO `product` VALUES (66, '商品166', '描述166', 66.00, 1, 66, 1, NULL);
INSERT INTO `product` VALUES (67, '商品167', '描述167', 67.00, 1, 67, 1, NULL);
INSERT INTO `product` VALUES (68, '商品168', '描述168', 68.00, 1, 68, 1, NULL);
INSERT INTO `product` VALUES (69, '商品169', '描述169', 69.00, 1, 69, 1, NULL);
INSERT INTO `product` VALUES (70, '商品170', '描述170', 70.00, 1, 68, 1, 'default.jpg');
INSERT INTO `product` VALUES (71, '商品171', '描述171', 71.00, 1, 71, 1, NULL);
INSERT INTO `product` VALUES (72, '商品172', '描述172', 72.00, 1, 72, 1, NULL);
INSERT INTO `product` VALUES (73, '商品173', '描述173', 73.00, 1, 73, 1, NULL);
INSERT INTO `product` VALUES (74, '商品174', '描述174', 74.00, 1, 74, 1, NULL);
INSERT INTO `product` VALUES (75, '商品175', '描述175', 75.00, 1, 75, 1, NULL);
INSERT INTO `product` VALUES (76, '商品176', '描述176', 76.00, 1, 76, 1, NULL);
INSERT INTO `product` VALUES (77, '商品177', '描述177', 77.00, 1, 77, 1, NULL);
INSERT INTO `product` VALUES (78, '商品178', '描述178', 78.00, 1, 78, 1, NULL);
INSERT INTO `product` VALUES (79, '商品179', '描述179', 79.00, 1, 79, 1, NULL);
INSERT INTO `product` VALUES (80, '商品180', '描述180', 80.00, 1, 80, 1, NULL);
INSERT INTO `product` VALUES (81, '商品21', '描述21', 2.00, 1, 2, 2, NULL);
INSERT INTO `product` VALUES (82, '商品22', '描述22', 4.00, 1, 3, 2, 'default.jpg');
INSERT INTO `product` VALUES (83, '商品23', '描述23', 6.00, 1, 6, 2, NULL);
INSERT INTO `product` VALUES (84, '商品24', '描述24', 8.00, 1, 8, 2, NULL);
INSERT INTO `product` VALUES (85, '商品25', '描述25', 10.00, 1, 10, 2, NULL);
INSERT INTO `product` VALUES (86, '商品26', '描述26', 12.00, 1, 12, 2, NULL);
INSERT INTO `product` VALUES (87, '商品27', '描述27', 14.00, 1, 14, 2, NULL);
INSERT INTO `product` VALUES (88, '商品28', '描述28', 16.00, 1, 16, 2, NULL);
INSERT INTO `product` VALUES (89, '商品29', '描述29', 18.00, 1, 18, 2, NULL);
INSERT INTO `product` VALUES (90, '商品210', '描述210', 20.00, 1, 20, 2, NULL);
INSERT INTO `product` VALUES (91, '商品211', '描述211', 22.00, 1, 22, 2, NULL);
INSERT INTO `product` VALUES (92, '商品212', '描述212', 24.00, 1, 24, 2, NULL);
INSERT INTO `product` VALUES (93, '商品213', '描述213', 26.00, 1, 26, 2, NULL);
INSERT INTO `product` VALUES (94, '商品214', '描述214', 28.00, 1, 28, 2, NULL);
INSERT INTO `product` VALUES (95, '商品215', '描述215', 30.00, 1, 30, 2, NULL);
INSERT INTO `product` VALUES (96, '商品216', '描述216', 32.00, 1, 32, 2, NULL);
INSERT INTO `product` VALUES (97, '商品217', '描述217', 34.00, 1, 34, 2, NULL);
INSERT INTO `product` VALUES (98, '商品218', '描述218', 36.00, 1, 36, 2, NULL);
INSERT INTO `product` VALUES (99, '商品219', '描述219', 38.00, 1, 38, 2, NULL);
INSERT INTO `product` VALUES (100, '商品220', '描述220', 40.00, 1, 40, 2, NULL);
INSERT INTO `product` VALUES (101, '商品221', '描述221', 42.00, 1, 42, 2, NULL);
INSERT INTO `product` VALUES (102, '商品222', '描述222', 44.00, 1, 44, 2, NULL);
INSERT INTO `product` VALUES (103, '商品223', '描述223', 46.00, 1, 46, 2, NULL);
INSERT INTO `product` VALUES (104, '商品224', '描述224', 48.00, 1, 48, 2, NULL);
INSERT INTO `product` VALUES (105, '商品225', '描述225', 50.00, 1, 50, 2, NULL);
INSERT INTO `product` VALUES (106, '商品226', '描述226', 52.00, 1, 52, 2, NULL);
INSERT INTO `product` VALUES (107, '商品227', '描述227', 54.00, 1, 54, 2, NULL);
INSERT INTO `product` VALUES (108, '商品228', '描述228', 56.00, 1, 56, 2, NULL);
INSERT INTO `product` VALUES (109, '商品229', '描述229', 58.00, 1, 58, 2, NULL);
INSERT INTO `product` VALUES (110, '商品230', '描述230', 60.00, 1, 60, 2, NULL);
INSERT INTO `product` VALUES (111, '商品231', '描述231', 62.00, 1, 62, 2, NULL);
INSERT INTO `product` VALUES (112, '商品232', '描述232', 64.00, 1, 64, 2, NULL);
INSERT INTO `product` VALUES (113, '商品233', '描述233', 66.00, 1, 66, 2, NULL);
INSERT INTO `product` VALUES (114, '商品234', '描述234', 68.00, 1, 68, 2, NULL);
INSERT INTO `product` VALUES (115, '商品235', '描述235', 70.00, 1, 70, 2, NULL);
INSERT INTO `product` VALUES (116, '商品236', '描述236', 72.00, 1, 72, 2, NULL);
INSERT INTO `product` VALUES (117, '商品237', '描述237', 74.00, 1, 74, 2, NULL);
INSERT INTO `product` VALUES (118, '商品238', '描述238', 76.00, 1, 76, 2, NULL);
INSERT INTO `product` VALUES (119, '商品239', '描述239', 78.00, 1, 78, 2, NULL);
INSERT INTO `product` VALUES (120, '商品240', '描述240', 80.00, 1, 80, 2, NULL);
INSERT INTO `product` VALUES (121, '商品241', '描述241', 82.00, 1, 82, 2, NULL);
INSERT INTO `product` VALUES (122, '商品242', '描述242', 84.00, 1, 84, 2, NULL);
INSERT INTO `product` VALUES (123, '商品243', '描述243', 86.00, 1, 86, 2, NULL);
INSERT INTO `product` VALUES (124, '商品244', '描述244', 88.00, 1, 88, 2, NULL);
INSERT INTO `product` VALUES (125, '商品245', '描述245', 90.00, 1, 90, 2, NULL);
INSERT INTO `product` VALUES (126, '商品246', '描述246', 92.00, 1, 92, 2, NULL);
INSERT INTO `product` VALUES (127, '商品247', '描述247', 94.00, 1, 94, 2, NULL);
INSERT INTO `product` VALUES (128, '商品248', '描述248', 96.00, 1, 96, 2, NULL);
INSERT INTO `product` VALUES (129, '商品249', '描述249', 98.00, 1, 98, 2, NULL);
INSERT INTO `product` VALUES (130, '商品250', '描述250', 100.00, 1, 100, 2, NULL);
INSERT INTO `product` VALUES (131, '商品251', '描述251', 102.00, 1, 102, 2, NULL);
INSERT INTO `product` VALUES (132, '商品252', '描述252', 104.00, 1, 104, 2, NULL);
INSERT INTO `product` VALUES (133, '商品253', '描述253', 106.00, 1, 106, 2, NULL);
INSERT INTO `product` VALUES (134, '商品254', '描述254', 108.00, 1, 108, 2, NULL);
INSERT INTO `product` VALUES (135, '商品255', '描述255', 110.00, 1, 110, 2, NULL);
INSERT INTO `product` VALUES (136, '商品256', '描述256', 112.00, 1, 112, 2, NULL);
INSERT INTO `product` VALUES (137, '商品257', '描述257', 114.00, 1, 114, 2, NULL);
INSERT INTO `product` VALUES (138, '商品258', '描述258', 116.00, 1, 116, 2, NULL);
INSERT INTO `product` VALUES (139, '商品259', '描述259', 118.00, 1, 118, 2, NULL);
INSERT INTO `product` VALUES (140, '商品260', '描述260', 120.00, 1, 120, 2, NULL);
INSERT INTO `product` VALUES (141, '商品261', '描述261', 122.00, 1, 122, 2, NULL);
INSERT INTO `product` VALUES (142, '商品262', '描述262', 124.00, 1, 124, 2, NULL);
INSERT INTO `product` VALUES (143, '商品263', '描述263', 126.00, 1, 126, 2, NULL);
INSERT INTO `product` VALUES (144, '商品264', '描述264', 128.00, 1, 128, 2, NULL);
INSERT INTO `product` VALUES (145, '商品265', '描述265', 130.00, 1, 130, 2, NULL);
INSERT INTO `product` VALUES (146, '商品266', '描述266', 132.00, 1, 132, 2, NULL);
INSERT INTO `product` VALUES (147, '商品267', '描述267', 134.00, 1, 134, 2, NULL);
INSERT INTO `product` VALUES (148, '商品268', '描述268', 136.00, 1, 136, 2, NULL);
INSERT INTO `product` VALUES (149, '商品269', '描述269', 138.00, 1, 138, 2, NULL);
INSERT INTO `product` VALUES (150, '商品270', '描述270', 140.00, 1, 140, 2, NULL);
INSERT INTO `product` VALUES (151, '商品271', '描述271', 142.00, 1, 142, 2, NULL);
INSERT INTO `product` VALUES (152, '商品272', '描述272', 144.00, 1, 144, 2, NULL);
INSERT INTO `product` VALUES (153, '商品273', '描述273', 146.00, 1, 146, 2, NULL);
INSERT INTO `product` VALUES (154, '商品274', '描述274', 148.00, 1, 148, 2, NULL);
INSERT INTO `product` VALUES (155, '商品275', '描述275', 150.00, 1, 150, 2, NULL);
INSERT INTO `product` VALUES (156, '商品276', '描述276', 152.00, 1, 152, 2, NULL);
INSERT INTO `product` VALUES (157, '商品277', '描述277', 154.00, 1, 154, 2, NULL);
INSERT INTO `product` VALUES (158, '商品278', '描述278', 156.00, 1, 156, 2, NULL);
INSERT INTO `product` VALUES (159, '商品279', '描述279', 158.00, 1, 158, 2, NULL);
INSERT INTO `product` VALUES (160, '商品280', '描述280', 160.00, 1, 160, 2, NULL);
INSERT INTO `product` VALUES (161, '商品31', '描述31', 3.00, 1, 3, 3, NULL);
INSERT INTO `product` VALUES (162, '商品32', '描述32', 6.00, 1, 6, 3, NULL);
INSERT INTO `product` VALUES (163, '商品33', '描述33', 9.00, 1, 9, 3, NULL);
INSERT INTO `product` VALUES (164, '商品34', '描述34', 12.00, 1, 12, 3, NULL);
INSERT INTO `product` VALUES (165, '商品35', '描述35', 15.00, 1, 15, 3, NULL);
INSERT INTO `product` VALUES (166, '商品36', '描述36', 18.00, 1, 18, 3, NULL);
INSERT INTO `product` VALUES (167, '商品37', '描述37', 21.00, 1, 21, 3, NULL);
INSERT INTO `product` VALUES (168, '商品38', '描述38', 24.00, 1, 24, 3, NULL);
INSERT INTO `product` VALUES (169, '商品39', '描述39', 27.00, 1, 27, 3, NULL);
INSERT INTO `product` VALUES (170, '商品310', '描述310', 30.00, 1, 30, 3, NULL);
INSERT INTO `product` VALUES (171, '商品311', '描述311', 33.00, 1, 33, 3, NULL);
INSERT INTO `product` VALUES (172, '商品312', '描述312', 36.00, 1, 36, 3, NULL);
INSERT INTO `product` VALUES (173, '商品313', '描述313', 39.00, 1, 39, 3, NULL);
INSERT INTO `product` VALUES (174, '商品314', '描述314', 42.00, 1, 42, 3, NULL);
INSERT INTO `product` VALUES (175, '商品315', '描述315', 45.00, 1, 45, 3, NULL);
INSERT INTO `product` VALUES (176, '商品316', '描述316', 48.00, 1, 48, 3, NULL);
INSERT INTO `product` VALUES (177, '商品317', '描述317', 51.00, 1, 51, 3, NULL);
INSERT INTO `product` VALUES (178, '商品318', '描述318', 54.00, 1, 54, 3, NULL);
INSERT INTO `product` VALUES (179, '商品319', '描述319', 57.00, 1, 57, 3, NULL);
INSERT INTO `product` VALUES (180, '商品320', '描述320', 60.00, 1, 60, 3, NULL);
INSERT INTO `product` VALUES (181, '商品321', '描述321', 63.00, 1, 63, 3, NULL);
INSERT INTO `product` VALUES (182, '商品322', '描述322', 66.00, 1, 66, 3, NULL);
INSERT INTO `product` VALUES (183, '商品323', '描述323', 69.00, 1, 69, 3, NULL);
INSERT INTO `product` VALUES (184, '商品324', '描述324', 72.00, 1, 72, 3, NULL);
INSERT INTO `product` VALUES (185, '商品325', '描述325', 75.00, 1, 75, 3, NULL);
INSERT INTO `product` VALUES (186, '商品326', '描述326', 78.00, 1, 78, 3, NULL);
INSERT INTO `product` VALUES (187, '商品327', '描述327', 81.00, 1, 81, 3, NULL);
INSERT INTO `product` VALUES (188, '商品328', '描述328', 84.00, 1, 84, 3, NULL);
INSERT INTO `product` VALUES (189, '商品329', '描述329', 87.00, 1, 87, 3, NULL);
INSERT INTO `product` VALUES (190, '商品330', '描述330', 90.00, 1, 90, 3, NULL);
INSERT INTO `product` VALUES (191, '商品331', '描述331', 93.00, 1, 93, 3, NULL);
INSERT INTO `product` VALUES (192, '商品332', '描述332', 96.00, 1, 96, 3, NULL);
INSERT INTO `product` VALUES (193, '商品333', '描述333', 99.00, 1, 99, 3, NULL);
INSERT INTO `product` VALUES (194, '商品334', '描述334', 102.00, 1, 102, 3, NULL);
INSERT INTO `product` VALUES (195, '商品335', '描述335', 105.00, 1, 105, 3, NULL);
INSERT INTO `product` VALUES (196, '商品336', '描述336', 108.00, 1, 108, 3, NULL);
INSERT INTO `product` VALUES (197, '商品337', '描述337', 111.00, 1, 111, 3, NULL);
INSERT INTO `product` VALUES (198, '商品338', '描述338', 114.00, 1, 114, 3, NULL);
INSERT INTO `product` VALUES (199, '商品339', '描述339', 117.00, 1, 117, 3, NULL);
INSERT INTO `product` VALUES (200, '商品340', '描述340', 120.00, 1, 120, 3, NULL);
INSERT INTO `product` VALUES (201, '商品341', '描述341', 123.00, 1, 123, 3, NULL);
INSERT INTO `product` VALUES (202, '商品342', '描述342', 126.00, 1, 126, 3, NULL);
INSERT INTO `product` VALUES (203, '商品343', '描述343', 129.00, 1, 129, 3, NULL);
INSERT INTO `product` VALUES (204, '商品344', '描述344', 132.00, 1, 132, 3, NULL);
INSERT INTO `product` VALUES (205, '商品345', '描述345', 135.00, 1, 135, 3, NULL);
INSERT INTO `product` VALUES (206, '商品346', '描述346', 138.00, 1, 138, 3, NULL);
INSERT INTO `product` VALUES (207, '商品347', '描述347', 141.00, 1, 141, 3, NULL);
INSERT INTO `product` VALUES (208, '商品348', '描述348', 144.00, 1, 144, 3, NULL);
INSERT INTO `product` VALUES (209, '商品349', '描述349', 147.00, 1, 147, 3, NULL);
INSERT INTO `product` VALUES (210, '商品350', '描述350', 150.00, 1, 150, 3, NULL);
INSERT INTO `product` VALUES (211, '商品351', '描述351', 153.00, 1, 153, 3, NULL);
INSERT INTO `product` VALUES (212, '商品352', '描述352', 156.00, 1, 156, 3, NULL);
INSERT INTO `product` VALUES (213, '商品353', '描述353', 159.00, 1, 159, 3, NULL);
INSERT INTO `product` VALUES (214, '商品354', '描述354', 162.00, 1, 162, 3, NULL);
INSERT INTO `product` VALUES (215, '商品355', '描述355', 165.00, 1, 165, 3, NULL);
INSERT INTO `product` VALUES (216, '商品356', '描述356', 168.00, 1, 168, 3, NULL);
INSERT INTO `product` VALUES (217, '商品357', '描述357', 171.00, 1, 171, 3, NULL);
INSERT INTO `product` VALUES (218, '商品358', '描述358', 174.00, 1, 174, 3, NULL);
INSERT INTO `product` VALUES (219, '商品359', '描述359', 177.00, 1, 177, 3, NULL);
INSERT INTO `product` VALUES (220, '商品360', '描述360', 180.00, 1, 180, 3, NULL);
INSERT INTO `product` VALUES (221, '商品361', '描述361', 183.00, 1, 183, 3, NULL);
INSERT INTO `product` VALUES (222, '商品362', '描述362', 186.00, 1, 186, 3, NULL);
INSERT INTO `product` VALUES (223, '商品363', '描述363', 189.00, 1, 189, 3, NULL);
INSERT INTO `product` VALUES (224, '商品364', '描述364', 192.00, 1, 192, 3, NULL);
INSERT INTO `product` VALUES (225, '商品365', '描述365', 195.00, 1, 195, 3, NULL);
INSERT INTO `product` VALUES (226, '商品366', '描述366', 198.00, 1, 198, 3, NULL);
INSERT INTO `product` VALUES (227, '商品367', '描述367', 201.00, 1, 201, 3, NULL);
INSERT INTO `product` VALUES (228, '商品368', '描述368', 204.00, 1, 204, 3, NULL);
INSERT INTO `product` VALUES (229, '商品369', '描述369', 207.00, 1, 207, 3, NULL);
INSERT INTO `product` VALUES (230, '商品370', '描述370', 210.00, 1, 210, 3, NULL);
INSERT INTO `product` VALUES (231, '商品371', '描述371', 213.00, 1, 213, 3, NULL);
INSERT INTO `product` VALUES (232, '商品372', '描述372', 216.00, 1, 216, 3, NULL);
INSERT INTO `product` VALUES (233, '商品373', '描述373', 219.00, 1, 219, 3, NULL);
INSERT INTO `product` VALUES (234, '商品374', '描述374', 222.00, 1, 222, 3, NULL);
INSERT INTO `product` VALUES (235, '商品375', '描述375', 225.00, 1, 225, 3, NULL);
INSERT INTO `product` VALUES (236, '商品376', '描述376', 228.00, 1, 228, 3, NULL);
INSERT INTO `product` VALUES (237, '商品377', '描述377', 231.00, 1, 231, 3, NULL);
INSERT INTO `product` VALUES (238, '商品378', '描述378', 234.00, 1, 234, 3, NULL);
INSERT INTO `product` VALUES (239, '商品379', '描述379', 237.00, 1, 237, 3, NULL);
INSERT INTO `product` VALUES (240, '商品380', '描述380', 240.00, 1, 240, 3, NULL);
INSERT INTO `product` VALUES (241, '商品41', '描述41', 4.00, 1, 4, 4, NULL);
INSERT INTO `product` VALUES (242, '商品42', '描述42', 8.00, 1, 8, 4, NULL);
INSERT INTO `product` VALUES (243, '商品43', '描述43', 12.00, 1, 12, 4, NULL);
INSERT INTO `product` VALUES (244, '商品44', '描述44', 16.00, 1, 16, 4, NULL);
INSERT INTO `product` VALUES (245, '商品45', '描述45', 20.00, 1, 20, 4, NULL);
INSERT INTO `product` VALUES (246, '商品46', '描述46', 24.00, 1, 24, 4, NULL);
INSERT INTO `product` VALUES (247, '商品47', '描述47', 28.00, 1, 28, 4, NULL);
INSERT INTO `product` VALUES (248, '商品48', '描述48', 32.00, 1, 32, 4, NULL);
INSERT INTO `product` VALUES (249, '商品49', '描述49', 36.00, 1, 36, 4, NULL);
INSERT INTO `product` VALUES (250, '商品410', '描述410', 40.00, 1, 40, 4, NULL);
INSERT INTO `product` VALUES (251, '商品411', '描述411', 44.00, 1, 44, 4, NULL);
INSERT INTO `product` VALUES (252, '商品412', '描述412', 48.00, 1, 48, 4, NULL);
INSERT INTO `product` VALUES (253, '商品413', '描述413', 52.00, 1, 52, 4, NULL);
INSERT INTO `product` VALUES (254, '商品414', '描述414', 56.00, 1, 56, 4, NULL);
INSERT INTO `product` VALUES (255, '商品415', '描述415', 60.00, 1, 60, 4, NULL);
INSERT INTO `product` VALUES (256, '商品416', '描述416', 64.00, 1, 64, 4, NULL);
INSERT INTO `product` VALUES (257, '商品417', '描述417', 68.00, 1, 68, 4, NULL);
INSERT INTO `product` VALUES (258, '商品418', '描述418', 72.00, 1, 72, 4, NULL);
INSERT INTO `product` VALUES (259, '商品419', '描述419', 76.00, 1, 76, 4, NULL);
INSERT INTO `product` VALUES (260, '商品420', '描述420', 80.00, 1, 80, 4, NULL);
INSERT INTO `product` VALUES (261, '商品421', '描述421', 84.00, 1, 84, 4, NULL);
INSERT INTO `product` VALUES (262, '商品422', '描述422', 88.00, 1, 88, 4, NULL);
INSERT INTO `product` VALUES (263, '商品423', '描述423', 92.00, 1, 92, 4, NULL);
INSERT INTO `product` VALUES (264, '商品424', '描述424', 96.00, 1, 96, 4, NULL);
INSERT INTO `product` VALUES (265, '商品425', '描述425', 100.00, 1, 100, 4, NULL);
INSERT INTO `product` VALUES (266, '商品426', '描述426', 104.00, 1, 104, 4, NULL);
INSERT INTO `product` VALUES (267, '商品427', '描述427', 108.00, 1, 108, 4, NULL);
INSERT INTO `product` VALUES (268, '商品428', '描述428', 112.00, 1, 112, 4, NULL);
INSERT INTO `product` VALUES (269, '商品429', '描述429', 116.00, 1, 116, 4, NULL);
INSERT INTO `product` VALUES (270, '商品430', '描述430', 120.00, 1, 120, 4, NULL);
INSERT INTO `product` VALUES (271, '商品431', '描述431', 124.00, 1, 124, 4, NULL);
INSERT INTO `product` VALUES (272, '商品432', '描述432', 128.00, 1, 128, 4, NULL);
INSERT INTO `product` VALUES (273, '商品433', '描述433', 132.00, 1, 132, 4, NULL);
INSERT INTO `product` VALUES (274, '商品434', '描述434', 136.00, 1, 136, 4, NULL);
INSERT INTO `product` VALUES (275, '商品435', '描述435', 140.00, 1, 140, 4, NULL);
INSERT INTO `product` VALUES (276, '商品436', '描述436', 144.00, 1, 144, 4, NULL);
INSERT INTO `product` VALUES (277, '商品437', '描述437', 148.00, 1, 148, 4, NULL);
INSERT INTO `product` VALUES (278, '商品438', '描述438', 152.00, 1, 152, 4, NULL);
INSERT INTO `product` VALUES (279, '商品439', '描述439', 156.00, 1, 156, 4, NULL);
INSERT INTO `product` VALUES (280, '商品440', '描述440', 160.00, 1, 160, 4, NULL);
INSERT INTO `product` VALUES (281, '商品441', '描述441', 164.00, 1, 164, 4, NULL);
INSERT INTO `product` VALUES (282, '商品442', '描述442', 168.00, 1, 168, 4, NULL);
INSERT INTO `product` VALUES (283, '商品443', '描述443', 172.00, 1, 172, 4, NULL);
INSERT INTO `product` VALUES (284, '商品444', '描述444', 176.00, 1, 176, 4, NULL);
INSERT INTO `product` VALUES (285, '商品445', '描述445', 180.00, 1, 180, 4, NULL);
INSERT INTO `product` VALUES (286, '商品446', '描述446', 184.00, 1, 184, 4, NULL);
INSERT INTO `product` VALUES (287, '商品447', '描述447', 188.00, 1, 188, 4, NULL);
INSERT INTO `product` VALUES (288, '商品448', '描述448', 192.00, 1, 192, 4, NULL);
INSERT INTO `product` VALUES (289, '商品449', '描述449', 196.00, 1, 196, 4, NULL);
INSERT INTO `product` VALUES (290, '商品450', '描述450', 200.00, 1, 200, 4, NULL);
INSERT INTO `product` VALUES (291, '商品451', '描述451', 204.00, 1, 204, 4, NULL);
INSERT INTO `product` VALUES (292, '商品452', '描述452', 208.00, 1, 208, 4, NULL);
INSERT INTO `product` VALUES (293, '商品453', '描述453', 212.00, 1, 212, 4, NULL);
INSERT INTO `product` VALUES (294, '商品454', '描述454', 216.00, 1, 216, 4, NULL);
INSERT INTO `product` VALUES (295, '商品455', '描述455', 220.00, 1, 220, 4, NULL);
INSERT INTO `product` VALUES (296, '商品456', '描述456', 224.00, 1, 224, 4, NULL);
INSERT INTO `product` VALUES (297, '商品457', '描述457', 228.00, 1, 228, 4, NULL);
INSERT INTO `product` VALUES (298, '商品458', '描述458', 232.00, 1, 232, 4, NULL);
INSERT INTO `product` VALUES (299, '商品459', '描述459', 236.00, 1, 236, 4, NULL);
INSERT INTO `product` VALUES (300, '商品460', '描述460', 240.00, 1, 240, 4, NULL);
INSERT INTO `product` VALUES (301, '商品461', '描述461', 244.00, 1, 244, 4, NULL);
INSERT INTO `product` VALUES (302, '商品462', '描述462', 248.00, 1, 248, 4, NULL);
INSERT INTO `product` VALUES (303, '商品463', '描述463', 252.00, 1, 252, 4, NULL);
INSERT INTO `product` VALUES (304, '商品464', '描述464', 256.00, 1, 256, 4, NULL);
INSERT INTO `product` VALUES (305, '商品465', '描述465', 260.00, 1, 260, 4, NULL);
INSERT INTO `product` VALUES (306, '商品466', '描述466', 264.00, 1, 264, 4, NULL);
INSERT INTO `product` VALUES (307, '商品467', '描述467', 268.00, 1, 268, 4, NULL);
INSERT INTO `product` VALUES (308, '商品468', '描述468', 272.00, 1, 272, 4, NULL);
INSERT INTO `product` VALUES (309, '商品469', '描述469', 276.00, 1, 276, 4, NULL);
INSERT INTO `product` VALUES (310, '商品470', '描述470', 280.00, 1, 280, 4, NULL);
INSERT INTO `product` VALUES (311, '商品471', '描述471', 284.00, 1, 284, 4, NULL);
INSERT INTO `product` VALUES (312, '商品472', '描述472', 288.00, 1, 288, 4, NULL);
INSERT INTO `product` VALUES (313, '商品473', '描述473', 292.00, 1, 292, 4, NULL);
INSERT INTO `product` VALUES (314, '商品474', '描述474', 296.00, 1, 296, 4, NULL);
INSERT INTO `product` VALUES (315, '商品475', '描述475', 300.00, 1, 300, 4, NULL);
INSERT INTO `product` VALUES (316, '商品476', '描述476', 304.00, 1, 304, 4, NULL);
INSERT INTO `product` VALUES (317, '商品477', '描述477', 308.00, 1, 308, 4, NULL);
INSERT INTO `product` VALUES (318, '商品478', '描述478', 312.00, 1, 312, 4, NULL);
INSERT INTO `product` VALUES (319, '商品479', '描述479', 316.00, 1, 316, 4, NULL);
INSERT INTO `product` VALUES (320, '商品480', '描述480', 320.00, 1, 320, 4, NULL);
INSERT INTO `product` VALUES (321, '商品51', '描述51', 5.00, 1, 5, 5, NULL);
INSERT INTO `product` VALUES (322, '商品52', '描述52', 10.00, 1, 9, 5, 'default.jpg');
INSERT INTO `product` VALUES (323, '商品53', '描述53', 15.00, 1, 15, 5, NULL);
INSERT INTO `product` VALUES (324, '商品54', '描述54', 20.00, 1, 20, 5, NULL);
INSERT INTO `product` VALUES (325, '商品55', '描述55', 25.00, 1, 25, 5, NULL);
INSERT INTO `product` VALUES (326, '商品56', '描述56', 30.00, 1, 30, 5, NULL);
INSERT INTO `product` VALUES (327, '商品57', '描述57', 35.00, 1, 35, 5, NULL);
INSERT INTO `product` VALUES (328, '商品58', '描述58', 40.00, 1, 40, 5, NULL);
INSERT INTO `product` VALUES (329, '商品59', '描述59', 45.00, 1, 45, 5, NULL);
INSERT INTO `product` VALUES (330, '商品510', '描述510', 50.00, 1, 50, 5, NULL);
INSERT INTO `product` VALUES (331, '商品511', '描述511', 55.00, 1, 55, 5, NULL);
INSERT INTO `product` VALUES (332, '商品512', '描述512', 60.00, 1, 60, 5, NULL);
INSERT INTO `product` VALUES (333, '商品513', '描述513', 65.00, 1, 65, 5, NULL);
INSERT INTO `product` VALUES (334, '商品514', '描述514', 70.00, 1, 70, 5, NULL);
INSERT INTO `product` VALUES (335, '商品515', '描述515', 75.00, 1, 75, 5, NULL);
INSERT INTO `product` VALUES (336, '商品516', '描述516', 80.00, 1, 80, 5, NULL);
INSERT INTO `product` VALUES (337, '商品517', '描述517', 85.00, 1, 85, 5, NULL);
INSERT INTO `product` VALUES (338, '商品518', '描述518', 90.00, 1, 90, 5, NULL);
INSERT INTO `product` VALUES (339, '商品519', '描述519', 95.00, 1, 95, 5, NULL);
INSERT INTO `product` VALUES (340, '商品520', '描述520', 100.00, 1, 100, 5, NULL);
INSERT INTO `product` VALUES (341, '商品521', '描述521', 105.00, 1, 105, 5, NULL);
INSERT INTO `product` VALUES (342, '商品522', '描述522', 110.00, 1, 110, 5, NULL);
INSERT INTO `product` VALUES (343, '商品523', '描述523', 115.00, 1, 115, 5, NULL);
INSERT INTO `product` VALUES (344, '商品524', '描述524', 120.00, 1, 120, 5, NULL);
INSERT INTO `product` VALUES (345, '商品525', '描述525', 125.00, 1, 125, 5, NULL);
INSERT INTO `product` VALUES (346, '商品526', '描述526', 130.00, 1, 130, 5, NULL);
INSERT INTO `product` VALUES (347, '商品527', '描述527', 135.00, 1, 135, 5, NULL);
INSERT INTO `product` VALUES (348, '商品528', '描述528', 140.00, 1, 140, 5, NULL);
INSERT INTO `product` VALUES (349, '商品529', '描述529', 145.00, 1, 145, 5, NULL);
INSERT INTO `product` VALUES (350, '商品530', '描述530', 150.00, 1, 150, 5, NULL);
INSERT INTO `product` VALUES (351, '商品531', '描述531', 155.00, 1, 155, 5, NULL);
INSERT INTO `product` VALUES (352, '商品532', '描述532', 160.00, 1, 160, 5, NULL);
INSERT INTO `product` VALUES (353, '商品533', '描述533', 165.00, 1, 165, 5, NULL);
INSERT INTO `product` VALUES (354, '商品534', '描述534', 170.00, 1, 170, 5, NULL);
INSERT INTO `product` VALUES (355, '商品535', '描述535', 175.00, 1, 175, 5, NULL);
INSERT INTO `product` VALUES (356, '商品536', '描述536', 180.00, 1, 180, 5, NULL);
INSERT INTO `product` VALUES (357, '商品537', '描述537', 185.00, 1, 185, 5, NULL);
INSERT INTO `product` VALUES (358, '商品538', '描述538', 190.00, 1, 190, 5, NULL);
INSERT INTO `product` VALUES (359, '商品539', '描述539', 195.00, 1, 195, 5, NULL);
INSERT INTO `product` VALUES (360, '商品540', '描述540', 200.00, 1, 200, 5, NULL);
INSERT INTO `product` VALUES (361, '商品541', '描述541', 205.00, 1, 205, 5, NULL);
INSERT INTO `product` VALUES (362, '商品542', '描述542', 210.00, 1, 210, 5, NULL);
INSERT INTO `product` VALUES (363, '商品543', '描述543', 215.00, 1, 215, 5, NULL);
INSERT INTO `product` VALUES (364, '商品544', '描述544', 220.00, 1, 220, 5, NULL);
INSERT INTO `product` VALUES (365, '商品545', '描述545', 225.00, 1, 225, 5, NULL);
INSERT INTO `product` VALUES (366, '商品546', '描述546', 230.00, 1, 230, 5, NULL);
INSERT INTO `product` VALUES (367, '商品547', '描述547', 235.00, 1, 235, 5, NULL);
INSERT INTO `product` VALUES (368, '商品548', '描述548', 240.00, 1, 240, 5, NULL);
INSERT INTO `product` VALUES (369, '商品549', '描述549', 245.00, 1, 245, 5, NULL);
INSERT INTO `product` VALUES (370, '商品550', '描述550', 250.00, 1, 250, 5, NULL);
INSERT INTO `product` VALUES (371, '商品551', '描述551', 255.00, 1, 255, 5, NULL);
INSERT INTO `product` VALUES (372, '商品552', '描述552', 260.00, 1, 260, 5, NULL);
INSERT INTO `product` VALUES (373, '商品553', '描述553', 265.00, 1, 265, 5, NULL);
INSERT INTO `product` VALUES (374, '商品554', '描述554', 270.00, 1, 270, 5, NULL);
INSERT INTO `product` VALUES (375, '商品555', '描述555', 275.00, 1, 275, 5, NULL);
INSERT INTO `product` VALUES (376, '商品556', '描述556', 280.00, 1, 280, 5, NULL);
INSERT INTO `product` VALUES (377, '商品557', '描述557', 285.00, 1, 285, 5, NULL);
INSERT INTO `product` VALUES (378, '商品558', '描述558', 290.00, 1, 290, 5, NULL);
INSERT INTO `product` VALUES (379, '商品559', '描述559', 295.00, 1, 295, 5, NULL);
INSERT INTO `product` VALUES (380, '商品560', '描述560', 300.00, 1, 300, 5, NULL);
INSERT INTO `product` VALUES (381, '商品561', '描述561', 305.00, 1, 305, 5, NULL);
INSERT INTO `product` VALUES (382, '商品562', '描述562', 310.00, 1, 310, 5, NULL);
INSERT INTO `product` VALUES (383, '商品563', '描述563', 315.00, 1, 315, 5, NULL);
INSERT INTO `product` VALUES (384, '商品564', '描述564', 320.00, 1, 320, 5, NULL);
INSERT INTO `product` VALUES (385, '商品565', '描述565', 325.00, 1, 325, 5, NULL);
INSERT INTO `product` VALUES (386, '商品566', '描述566', 330.00, 1, 330, 5, NULL);
INSERT INTO `product` VALUES (387, '商品567', '描述567', 335.00, 1, 335, 5, NULL);
INSERT INTO `product` VALUES (388, '商品568', '描述568', 340.00, 1, 340, 5, NULL);
INSERT INTO `product` VALUES (389, '商品569', '描述569', 345.00, 1, 345, 5, NULL);
INSERT INTO `product` VALUES (390, '商品570', '描述570', 350.00, 1, 350, 5, NULL);
INSERT INTO `product` VALUES (391, '商品571', '描述571', 355.00, 1, 355, 5, NULL);
INSERT INTO `product` VALUES (392, '商品572', '描述572', 360.00, 1, 360, 5, NULL);
INSERT INTO `product` VALUES (393, '商品573', '描述573', 365.00, 1, 365, 5, NULL);
INSERT INTO `product` VALUES (394, '商品574', '描述574', 370.00, 1, 370, 5, NULL);
INSERT INTO `product` VALUES (395, '商品575', '描述575', 375.00, 1, 375, 5, NULL);
INSERT INTO `product` VALUES (396, '商品576', '描述576', 380.00, 1, 380, 5, NULL);
INSERT INTO `product` VALUES (397, '商品577', '描述577', 385.00, 1, 385, 5, NULL);
INSERT INTO `product` VALUES (398, '商品578', '描述578', 390.00, 1, 390, 5, NULL);
INSERT INTO `product` VALUES (399, '商品579', '描述579', 395.00, 1, 395, 5, NULL);
INSERT INTO `product` VALUES (400, '商品580', '描述580', 400.00, 1, 400, 5, NULL);
INSERT INTO `product` VALUES (401, '商品61', '描述61', 6.00, 1, 6, 6, NULL);
INSERT INTO `product` VALUES (402, '商品62', '描述62', 12.00, 1, 8, 6, 'default.jpg');
INSERT INTO `product` VALUES (403, '商品63', '描述63', 18.00, 1, 17, 6, 'default.jpg');
INSERT INTO `product` VALUES (404, '商品64', '描述64', 24.00, 1, 24, 6, NULL);
INSERT INTO `product` VALUES (405, '商品65', '描述65', 30.00, 1, 30, 6, NULL);
INSERT INTO `product` VALUES (406, '商品66', '描述66', 36.00, 1, 36, 6, NULL);
INSERT INTO `product` VALUES (407, '商品67', '描述67', 42.00, 1, 42, 6, NULL);
INSERT INTO `product` VALUES (408, '商品68', '描述68', 48.00, 1, 48, 6, NULL);
INSERT INTO `product` VALUES (409, '商品69', '描述69', 54.00, 1, 54, 6, NULL);
INSERT INTO `product` VALUES (410, '商品610', '描述610', 60.00, 1, 60, 6, NULL);
INSERT INTO `product` VALUES (411, '商品611', '描述611', 66.00, 1, 66, 6, NULL);
INSERT INTO `product` VALUES (412, '商品612', '描述612', 72.00, 1, 72, 6, NULL);
INSERT INTO `product` VALUES (413, '商品613', '描述613', 78.00, 1, 78, 6, NULL);
INSERT INTO `product` VALUES (414, '商品614', '描述614', 84.00, 1, 84, 6, NULL);
INSERT INTO `product` VALUES (415, '商品615', '描述615', 90.00, 1, 90, 6, NULL);
INSERT INTO `product` VALUES (416, '商品616', '描述616', 96.00, 1, 96, 6, NULL);
INSERT INTO `product` VALUES (417, '商品617', '描述617', 102.00, 1, 102, 6, NULL);
INSERT INTO `product` VALUES (418, '商品618', '描述618', 108.00, 1, 108, 6, NULL);
INSERT INTO `product` VALUES (419, '商品619', '描述619', 114.00, 1, 114, 6, NULL);
INSERT INTO `product` VALUES (420, '商品620', '描述620', 120.00, 1, 120, 6, NULL);
INSERT INTO `product` VALUES (421, '商品621', '描述621', 126.00, 1, 126, 6, NULL);
INSERT INTO `product` VALUES (422, '商品622', '描述622', 132.00, 1, 132, 6, NULL);
INSERT INTO `product` VALUES (423, '商品623', '描述623', 138.00, 1, 138, 6, NULL);
INSERT INTO `product` VALUES (424, '商品624', '描述624', 144.00, 1, 144, 6, NULL);
INSERT INTO `product` VALUES (425, '商品625', '描述625', 150.00, 1, 150, 6, NULL);
INSERT INTO `product` VALUES (426, '商品626', '描述626', 156.00, 1, 156, 6, NULL);
INSERT INTO `product` VALUES (427, '商品627', '描述627', 162.00, 1, 162, 6, NULL);
INSERT INTO `product` VALUES (428, '商品628', '描述628', 168.00, 1, 168, 6, NULL);
INSERT INTO `product` VALUES (429, '商品629', '描述629', 174.00, 1, 174, 6, NULL);
INSERT INTO `product` VALUES (430, '商品630', '描述630', 180.00, 1, 180, 6, NULL);
INSERT INTO `product` VALUES (431, '商品631', '描述631', 186.00, 1, 186, 6, NULL);
INSERT INTO `product` VALUES (432, '商品632', '描述632', 192.00, 1, 192, 6, NULL);
INSERT INTO `product` VALUES (433, '商品633', '描述633', 198.00, 1, 198, 6, NULL);
INSERT INTO `product` VALUES (434, '商品634', '描述634', 204.00, 1, 204, 6, NULL);
INSERT INTO `product` VALUES (435, '商品635', '描述635', 210.00, 1, 210, 6, NULL);
INSERT INTO `product` VALUES (436, '商品636', '描述636', 216.00, 1, 216, 6, NULL);
INSERT INTO `product` VALUES (437, '商品637', '描述637', 222.00, 1, 222, 6, NULL);
INSERT INTO `product` VALUES (438, '商品638', '描述638', 228.00, 1, 228, 6, NULL);
INSERT INTO `product` VALUES (439, '商品639', '描述639', 234.00, 1, 234, 6, NULL);
INSERT INTO `product` VALUES (440, '商品640', '描述640', 240.00, 1, 240, 6, NULL);
INSERT INTO `product` VALUES (441, '商品641', '描述641', 246.00, 1, 246, 6, NULL);
INSERT INTO `product` VALUES (442, '商品642', '描述642', 252.00, 1, 252, 6, NULL);
INSERT INTO `product` VALUES (443, '商品643', '描述643', 258.00, 1, 258, 6, NULL);
INSERT INTO `product` VALUES (444, '商品644', '描述644', 264.00, 1, 264, 6, NULL);
INSERT INTO `product` VALUES (445, '商品645', '描述645', 270.00, 1, 270, 6, NULL);
INSERT INTO `product` VALUES (446, '商品646', '描述646', 276.00, 1, 276, 6, NULL);
INSERT INTO `product` VALUES (447, '商品647', '描述647', 282.00, 1, 282, 6, NULL);
INSERT INTO `product` VALUES (448, '商品648', '描述648', 288.00, 1, 288, 6, NULL);
INSERT INTO `product` VALUES (449, '商品649', '描述649', 294.00, 1, 294, 6, NULL);
INSERT INTO `product` VALUES (450, '商品650', '描述650', 300.00, 1, 300, 6, NULL);
INSERT INTO `product` VALUES (451, '商品651', '描述651', 306.00, 1, 306, 6, NULL);
INSERT INTO `product` VALUES (452, '商品652', '描述652', 312.00, 1, 312, 6, NULL);
INSERT INTO `product` VALUES (453, '商品653', '描述653', 318.00, 1, 318, 6, NULL);
INSERT INTO `product` VALUES (454, '商品654', '描述654', 324.00, 1, 324, 6, NULL);
INSERT INTO `product` VALUES (455, '商品655', '描述655', 330.00, 1, 330, 6, NULL);
INSERT INTO `product` VALUES (456, '商品656', '描述656', 336.00, 1, 336, 6, NULL);
INSERT INTO `product` VALUES (457, '商品657', '描述657', 342.00, 1, 342, 6, NULL);
INSERT INTO `product` VALUES (458, '商品658', '描述658', 348.00, 1, 348, 6, NULL);
INSERT INTO `product` VALUES (459, '商品659', '描述659', 354.00, 1, 354, 6, NULL);
INSERT INTO `product` VALUES (460, '商品660', '描述660', 360.00, 1, 360, 6, NULL);
INSERT INTO `product` VALUES (461, '商品661', '描述661', 366.00, 1, 366, 6, NULL);
INSERT INTO `product` VALUES (462, '商品662', '描述662', 372.00, 1, 372, 6, NULL);
INSERT INTO `product` VALUES (463, '商品663', '描述663', 378.00, 1, 378, 6, NULL);
INSERT INTO `product` VALUES (464, '商品664', '描述664', 384.00, 1, 384, 6, NULL);
INSERT INTO `product` VALUES (465, '商品665', '描述665', 390.00, 1, 390, 6, NULL);
INSERT INTO `product` VALUES (466, '商品666', '描述666', 396.00, 1, 396, 6, NULL);
INSERT INTO `product` VALUES (467, '商品667', '描述667', 402.00, 1, 402, 6, NULL);
INSERT INTO `product` VALUES (468, '商品668', '描述668', 408.00, 1, 408, 6, NULL);
INSERT INTO `product` VALUES (469, '商品669', '描述669', 414.00, 1, 414, 6, NULL);
INSERT INTO `product` VALUES (470, '商品670', '描述670', 420.00, 1, 420, 6, NULL);
INSERT INTO `product` VALUES (471, '商品671', '描述671', 426.00, 1, 426, 6, NULL);
INSERT INTO `product` VALUES (472, '商品672', '描述672', 432.00, 1, 432, 6, NULL);
INSERT INTO `product` VALUES (473, '商品673', '描述673', 438.00, 1, 438, 6, NULL);
INSERT INTO `product` VALUES (474, '商品674', '描述674', 444.00, 1, 444, 6, NULL);
INSERT INTO `product` VALUES (475, '商品675', '描述675', 450.00, 1, 450, 6, NULL);
INSERT INTO `product` VALUES (476, '商品676', '描述676', 456.00, 1, 456, 6, NULL);
INSERT INTO `product` VALUES (477, '商品677', '描述677', 462.00, 1, 462, 6, NULL);
INSERT INTO `product` VALUES (478, '商品678', '描述678', 468.00, 1, 468, 6, NULL);
INSERT INTO `product` VALUES (479, '商品679', '描述679', 474.00, 1, 474, 6, NULL);
INSERT INTO `product` VALUES (480, '商品680', '描述680', 480.00, 1, 480, 6, NULL);
INSERT INTO `product` VALUES (481, '商品71', '描述71', 7.00, 1, 5, 7, 'default.jpg');
INSERT INTO `product` VALUES (482, '商品72', '描述72', 14.00, 1, 5, 7, 'default.jpg');
INSERT INTO `product` VALUES (483, '商品73', '描述73', 21.00, 1, 21, 7, NULL);
INSERT INTO `product` VALUES (484, '商品74', '描述74', 28.00, 1, 28, 7, NULL);
INSERT INTO `product` VALUES (485, '商品75', '描述75', 35.00, 1, 35, 7, NULL);
INSERT INTO `product` VALUES (486, '商品76', '描述76', 42.00, 1, 42, 7, NULL);
INSERT INTO `product` VALUES (487, '商品77', '描述77', 49.00, 1, 49, 7, NULL);
INSERT INTO `product` VALUES (488, '商品78', '描述78', 56.00, 1, 56, 7, NULL);
INSERT INTO `product` VALUES (489, '商品79', '描述79', 63.00, 1, 63, 7, NULL);
INSERT INTO `product` VALUES (490, '商品710', '描述710', 70.00, 1, 70, 7, NULL);
INSERT INTO `product` VALUES (491, '商品711', '描述711', 77.00, 1, 77, 7, NULL);
INSERT INTO `product` VALUES (492, '商品712', '描述712', 84.00, 1, 84, 7, NULL);
INSERT INTO `product` VALUES (493, '商品713', '描述713', 91.00, 1, 91, 7, NULL);
INSERT INTO `product` VALUES (494, '商品714', '描述714', 98.00, 1, 98, 7, NULL);
INSERT INTO `product` VALUES (495, '商品715', '描述715', 105.00, 1, 105, 7, NULL);
INSERT INTO `product` VALUES (496, '商品716', '描述716', 112.00, 1, 112, 7, NULL);
INSERT INTO `product` VALUES (497, '商品717', '描述717', 119.00, 1, 119, 7, NULL);
INSERT INTO `product` VALUES (498, '商品718', '描述718', 126.00, 1, 126, 7, NULL);
INSERT INTO `product` VALUES (499, '商品719', '描述719', 133.00, 1, 133, 7, NULL);
INSERT INTO `product` VALUES (500, '商品720', '描述720', 140.00, 1, 140, 7, NULL);
INSERT INTO `product` VALUES (501, '商品721', '描述721', 147.00, 1, 147, 7, NULL);
INSERT INTO `product` VALUES (502, '商品722', '描述722', 154.00, 1, 154, 7, NULL);
INSERT INTO `product` VALUES (503, '商品723', '描述723', 161.00, 1, 161, 7, NULL);
INSERT INTO `product` VALUES (504, '商品724', '描述724', 168.00, 1, 168, 7, NULL);
INSERT INTO `product` VALUES (505, '商品725', '描述725', 175.00, 1, 175, 7, NULL);
INSERT INTO `product` VALUES (506, '商品726', '描述726', 182.00, 1, 182, 7, NULL);
INSERT INTO `product` VALUES (507, '商品727', '描述727', 189.00, 1, 189, 7, NULL);
INSERT INTO `product` VALUES (508, '商品728', '描述728', 196.00, 1, 196, 7, NULL);
INSERT INTO `product` VALUES (509, '商品729', '描述729', 203.00, 1, 203, 7, NULL);
INSERT INTO `product` VALUES (510, '商品730', '描述730', 210.00, 1, 210, 7, NULL);
INSERT INTO `product` VALUES (511, '商品731', '描述731', 217.00, 1, 217, 7, NULL);
INSERT INTO `product` VALUES (512, '商品732', '描述732', 224.00, 1, 224, 7, NULL);
INSERT INTO `product` VALUES (513, '商品733', '描述733', 231.00, 1, 231, 7, NULL);
INSERT INTO `product` VALUES (514, '商品734', '描述734', 238.00, 1, 238, 7, NULL);
INSERT INTO `product` VALUES (515, '商品735', '描述735', 245.00, 1, 245, 7, NULL);
INSERT INTO `product` VALUES (516, '商品736', '描述736', 252.00, 1, 252, 7, NULL);
INSERT INTO `product` VALUES (517, '商品737', '描述737', 259.00, 1, 259, 7, NULL);
INSERT INTO `product` VALUES (518, '商品738', '描述738', 266.00, 1, 266, 7, NULL);
INSERT INTO `product` VALUES (519, '商品739', '描述739', 273.00, 1, 273, 7, NULL);
INSERT INTO `product` VALUES (520, '商品740', '描述740', 280.00, 1, 280, 7, NULL);
INSERT INTO `product` VALUES (521, '商品741', '描述741', 287.00, 1, 287, 7, NULL);
INSERT INTO `product` VALUES (522, '商品742', '描述742', 294.00, 1, 294, 7, NULL);
INSERT INTO `product` VALUES (523, '商品743', '描述743', 301.00, 1, 301, 7, NULL);
INSERT INTO `product` VALUES (524, '商品744', '描述744', 308.00, 1, 308, 7, NULL);
INSERT INTO `product` VALUES (525, '商品745', '描述745', 315.00, 1, 315, 7, NULL);
INSERT INTO `product` VALUES (526, '商品746', '描述746', 322.00, 1, 322, 7, NULL);
INSERT INTO `product` VALUES (527, '商品747', '描述747', 329.00, 1, 329, 7, NULL);
INSERT INTO `product` VALUES (528, '商品748', '描述748', 336.00, 1, 336, 7, NULL);
INSERT INTO `product` VALUES (529, '商品749', '描述749', 343.00, 1, 343, 7, NULL);
INSERT INTO `product` VALUES (530, '商品750', '描述750', 350.00, 1, 350, 7, NULL);
INSERT INTO `product` VALUES (531, '商品751', '描述751', 357.00, 1, 357, 7, NULL);
INSERT INTO `product` VALUES (532, '商品752', '描述752', 364.00, 1, 364, 7, NULL);
INSERT INTO `product` VALUES (533, '商品753', '描述753', 371.00, 1, 371, 7, NULL);
INSERT INTO `product` VALUES (534, '商品754', '描述754', 378.00, 1, 378, 7, NULL);
INSERT INTO `product` VALUES (535, '商品755', '描述755', 385.00, 1, 385, 7, NULL);
INSERT INTO `product` VALUES (536, '商品756', '描述756', 392.00, 1, 392, 7, NULL);
INSERT INTO `product` VALUES (537, '商品757', '描述757', 399.00, 1, 399, 7, NULL);
INSERT INTO `product` VALUES (538, '商品758', '描述758', 406.00, 1, 406, 7, NULL);
INSERT INTO `product` VALUES (539, '商品759', '描述759', 413.00, 1, 413, 7, NULL);
INSERT INTO `product` VALUES (540, '商品760', '描述760', 420.00, 1, 420, 7, NULL);
INSERT INTO `product` VALUES (541, '商品761', '描述761', 427.00, 1, 427, 7, NULL);
INSERT INTO `product` VALUES (542, '商品762', '描述762', 434.00, 1, 434, 7, NULL);
INSERT INTO `product` VALUES (543, '商品763', '描述763', 441.00, 1, 441, 7, NULL);
INSERT INTO `product` VALUES (544, '商品764', '描述764', 448.00, 1, 448, 7, NULL);
INSERT INTO `product` VALUES (545, '商品765', '描述765', 455.00, 1, 455, 7, NULL);
INSERT INTO `product` VALUES (546, '商品766', '描述766', 462.00, 1, 462, 7, NULL);
INSERT INTO `product` VALUES (547, '商品767', '描述767', 469.00, 1, 469, 7, NULL);
INSERT INTO `product` VALUES (548, '商品768', '描述768', 476.00, 1, 476, 7, NULL);
INSERT INTO `product` VALUES (549, '商品769', '描述769', 483.00, 1, 483, 7, NULL);
INSERT INTO `product` VALUES (550, '商品770', '描述770', 490.00, 1, 490, 7, NULL);
INSERT INTO `product` VALUES (551, '商品771', '描述771', 497.00, 1, 497, 7, NULL);
INSERT INTO `product` VALUES (552, '商品772', '描述772', 504.00, 1, 504, 7, NULL);
INSERT INTO `product` VALUES (553, '商品773', '描述773', 511.00, 1, 511, 7, NULL);
INSERT INTO `product` VALUES (554, '商品774', '描述774', 518.00, 1, 518, 7, NULL);
INSERT INTO `product` VALUES (555, '商品775', '描述775', 525.00, 1, 525, 7, NULL);
INSERT INTO `product` VALUES (556, '商品776', '描述776', 532.00, 1, 532, 7, NULL);
INSERT INTO `product` VALUES (557, '商品777', '描述777', 539.00, 1, 539, 7, NULL);
INSERT INTO `product` VALUES (558, '商品778', '描述778', 546.00, 1, 546, 7, NULL);
INSERT INTO `product` VALUES (559, '商品779', '描述779', 553.00, 1, 553, 7, NULL);
INSERT INTO `product` VALUES (560, '商品780', '描述780', 560.00, 1, 560, 7, NULL);
INSERT INTO `product` VALUES (569, '一件商品', '商品介绍', 8.00, 1, 5, 1, 'default.jpg');
INSERT INTO `product` VALUES (570, 'a product', '商品介绍', 1.00, 1, 2, 1, '570.jpg');
INSERT INTO `product` VALUES (572, '这是商品2', '商品介绍', 456.00, 16, 123, 1, '572.jpg');
INSERT INTO `product` VALUES (573, '我的一件商品22222222', '商品介绍', 12.00, 18, 12, 5, '573.jpg');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `product_category_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`product_category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, '服装');
INSERT INTO `product_category` VALUES (2, '家居');
INSERT INTO `product_category` VALUES (3, '玩具');
INSERT INTO `product_category` VALUES (4, '数码');
INSERT INTO `product_category` VALUES (5, '零食');
INSERT INTO `product_category` VALUES (6, '图书');
INSERT INTO `product_category` VALUES (7, '美妆');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `shopping_cart_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  `count` int(0) NOT NULL,
  PRIMARY KEY (`shopping_cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (1, 3, 146, 2);
INSERT INTO `shopping_cart` VALUES (2, 3, 147, 1);
INSERT INTO `shopping_cart` VALUES (3, 4, 66, 2);
INSERT INTO `shopping_cart` VALUES (4, 5, 242, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `profile_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL,
  `update_time` timestamp(0) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhendacc', '3FD6EBE43DAB8B6CE6D033A5DA6E6AC5', NULL, 'shop', '2022-01-24 00:15:03', '2022-01-24 00:15:03');
INSERT INTO `user` VALUES (15, 'test', '3FD6EBE43DAB8B6CE6D033A5DA6E6AC5', NULL, 'user', '2022-02-14 00:09:34', '2022-02-14 00:09:34');
INSERT INTO `user` VALUES (16, '一个人的商店', '3FD6EBE43DAB8B6CE6D033A5DA6E6AC5', NULL, 'shop', '2022-02-14 00:12:38', '2022-02-14 00:12:38');
INSERT INTO `user` VALUES (17, 'uusser', '900FB82AC20A2B1AB071E7FDC7A46F54', NULL, 'user', '2022-02-21 14:18:59', '2022-02-21 14:18:59');
INSERT INTO `user` VALUES (18, 'qqq123123', '3FD6EBE43DAB8B6CE6D033A5DA6E6AC5', NULL, 'shop', '2022-02-21 14:23:26', '2022-02-21 14:23:26');

SET FOREIGN_KEY_CHECKS = 1;
