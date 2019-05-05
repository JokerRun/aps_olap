/*
 Navicat Premium Data Transfer

 Source Server         : mysql@gateway001
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 47.96.97.244:3306
 Source Schema         : dm_aps

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/04/2019 11:49:13
*/

create schema if not exists dm_aps collate utf8_general_ci;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
use dm_aps;
-- ----------------------------
-- Table structure for aps_inventory_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `aps_inventory_snapshot`;
CREATE TABLE `aps_inventory_snapshot`  (
  `snapshot_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `onhand` decimal(20, 8) NULL DEFAULT NULL,
  `available` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subcategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  `updated_at` datetime(6) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for aps_inventory_view
-- ----------------------------
DROP VIEW IF EXISTS `aps_inventory_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `aps_inventory_view` AS select `itmh`.`item_nr` AS `item_id`,`loch`.`location_nr` AS `location_id`,`invs`.`type` AS `type`,`invs`.`onhand` AS `onhand`,ifnull(`invs`.`available`,'true') AS `available`,`invs`.`category` AS `category`,`invs`.`subcategory` AS `subcategory`,`invs`.`description` AS `description`,`invs`.`created_at` AS `created_at`,`invs`.`updated_at` AS `updated_at`,`invs`.`load_date` AS `load_date`,`invs`.`load_end_date` AS `load_end_date` from (((`raw_data_vault`.`link_inventory` `invl` join `raw_data_vault`.`l_sat_inventory` `invs` on((`invl`.`l_inventory_hk` = `invs`.`l_inventory_hk`))) join `raw_data_vault`.`hub_location` `loch` on((`invl`.`h_location_hk` = `loch`.`h_location_hk`))) join `raw_data_vault`.`hub_item` `itmh` on((`invl`.`h_item_hk` = `itmh`.`h_item_hk`)));

SET FOREIGN_KEY_CHECKS = 1;
