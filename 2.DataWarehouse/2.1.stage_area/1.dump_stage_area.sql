/*
 Navicat Premium Data Transfer

 Source Server         : mysql@gateway001
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 47.96.97.244:3306
 Source Schema         : stage_area

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/04/2019 11:48:47
*/
create schema if not exists stage_area collate utf8_general_ci;
USE stage_area;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stage_erp_inventory
-- ----------------------------
DROP TABLE IF EXISTS `stage_erp_inventory`;
CREATE TABLE `stage_erp_inventory`  (
  `l_inventory_hk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `record_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_item_hk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h_location_hk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inventory_hash_diff` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_nr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location_nr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime(6) NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `onhand` decimal(20, 8) NULL DEFAULT NULL,
  `available` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subcategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage_erp_item
-- ----------------------------
DROP TABLE IF EXISTS `stage_erp_item`;
CREATE TABLE `stage_erp_item`  (
  `h_item_hk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `record_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_hash_diff` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_nr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lft` int(11) NULL DEFAULT NULL,
  `rght` int(11) NULL DEFAULT NULL,
  `lvl` int(11) NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime(6) NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_strategy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lock_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lock_expire_at` date NULL DEFAULT NULL,
  `price_abc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qty_abc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost` decimal(20, 8) NULL DEFAULT NULL,
  `gross_weight` decimal(20, 8) NULL DEFAULT NULL,
  `net_weight` decimal(20, 8) NULL DEFAULT NULL,
  `physical_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_nr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mpq` decimal(20, 8) NULL DEFAULT NULL,
  `outer_package_num` int(11) NULL DEFAULT NULL,
  `pallet_num` int(11) NULL DEFAULT NULL,
  `outer_package_gross_weight` decimal(20, 8) NULL DEFAULT NULL,
  `pallet_gross_weight` decimal(20, 8) NULL DEFAULT NULL,
  `outer_package_volume` decimal(20, 8) NULL DEFAULT NULL,
  `pallet_volume` decimal(20, 8) NULL DEFAULT NULL,
  `plan_list_date` date NULL DEFAULT NULL,
  `plan_delist_date` date NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subcategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage_erp_location
-- ----------------------------
DROP TABLE IF EXISTS `stage_erp_location`;
CREATE TABLE `stage_erp_location`  (
  `h_location_hk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `load_date` datetime(0) NULL,
  `record_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location_hash_diff` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location_nr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lft` int(11) NULL DEFAULT NULL,
  `rght` int(11) NULL DEFAULT NULL,
  `lvl` int(11) NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastmodified` datetime(6) NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subcategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner_id` int(11) NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
