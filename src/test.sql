/*
 Navicat Premium Data Transfer

 Source Server         : bojner
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 20/05/2023 09:32:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
                                `id` int(11) NOT NULL,
                                `user_id` int(11) NULL DEFAULT NULL,
                                `amount` decimal(10, 2) NULL DEFAULT NULL,
                                `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `user_id`(`user_id`) USING BTREE,
                                CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (1, 1, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (2, 2, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (3, 3, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (4, 4, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (5, 5, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (6, 6, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (7, 7, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (8, 8, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (9, 9, 100.00, 'Purchase', '2023-05-20 08:34:29');
INSERT INTO `transaction` VALUES (10, 10, 100.00, 'Purchase', '2023-05-20 08:34:29');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` int(11) NOT NULL,
                         `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                         `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                         `bank_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'User 1', 'user1@example.com', 'Bank Account 1');
INSERT INTO `user` VALUES (2, 'User 2', 'user2@example.com', 'Bank Account 2');
INSERT INTO `user` VALUES (3, 'User 3', 'user3@example.com', 'Bank Account 3');
INSERT INTO `user` VALUES (4, 'User 4', 'user4@example.com', 'Bank Account 4');
INSERT INTO `user` VALUES (5, 'User 5', 'user5@example.com', 'Bank Account 5');
INSERT INTO `user` VALUES (6, 'User 6', 'user6@example.com', 'Bank Account 6');
INSERT INTO `user` VALUES (7, 'User 7', 'user7@example.com', 'Bank Account 7');
INSERT INTO `user` VALUES (8, 'User 8', 'user8@example.com', 'Bank Account 8');
INSERT INTO `user` VALUES (9, 'User 9', 'user9@example.com', 'Bank Account 9');
INSERT INTO `user` VALUES (10, 'User 10', 'user10@example.com', 'Bank Account 10');

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet`  (
                           `id` int(11) NOT NULL,
                           `user_id` int(11) NULL DEFAULT NULL,
                           `balance` decimal(10, 2) NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE,
                           INDEX `user_id`(`user_id`) USING BTREE,
                           CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallet
-- ----------------------------
INSERT INTO `wallet` VALUES (1, 1, 1000.00);
INSERT INTO `wallet` VALUES (2, 2, 1000.00);
INSERT INTO `wallet` VALUES (3, 3, 1000.00);
INSERT INTO `wallet` VALUES (4, 4, 1000.00);
INSERT INTO `wallet` VALUES (5, 5, 1000.00);
INSERT INTO `wallet` VALUES (6, 6, 1000.00);
INSERT INTO `wallet` VALUES (7, 7, 1000.00);
INSERT INTO `wallet` VALUES (8, 8, 1000.00);
INSERT INTO `wallet` VALUES (9, 9, 1000.00);
INSERT INTO `wallet` VALUES (10, 10, 1000.00);

SET FOREIGN_KEY_CHECKS = 1;
