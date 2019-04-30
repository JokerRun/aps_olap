-- 新建数据库
CREATE DATABASE IF NOT EXISTS dm_aps default charset utf8 COLLATE utf8_general_ci; 

-- 库存视图（拉链表形式储存库存，预先将自然键添加到本试图。）
CREATE OR REPLACE VIEW dm_aps.aps_inventory_view as
SELECT
itmh.item_nr as item_id,
loch.location_nr as location_id,
invs.type as type,
invs.onhand as onhand,
IFNULL(invs.available,'true') as available,
invs.category as category,
invs.subcategory as subcategory,
invs.description as description,
invs.created_at as created_at,
invs.updated_at as updated_at,
invs.load_date as load_date,
invs.load_end_date as load_end_date
from raw_data_vault.link_inventory invl
INNER JOIN raw_data_vault.l_sat_inventory invs ON invl.l_inventory_hk = invs.l_inventory_hk
inner join raw_data_vault.hub_location loch on invl.h_location_hk=loch.h_location_hk
inner join raw_data_vault.hub_item itmh on invl.h_item_hk=itmh.h_item_hk
;

-- 库存快照表设计（快照日期及库存数据）
drop table if exists dm_aps.aps_inventory_snapshot;
create table dm_aps.aps_inventory_snapshot( 
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
;


-- 加载库存快照表。 @snapshot_date 变量以ETL过程中的load_date值为准。
SET @snapshot_date = now();
insert into dm_aps.aps_inventory_snapshot
SELECT
	DATE_FORMAT(@snapshot_date,'%Y-%m-%d' )as snapshot_date,
	invv.item_id,invv.location_id,invv.type,invv.onhand,invv.available,invv.category,invv.subcategory,invv.description,invv.created_at,invv.updated_at  
from
	dm_aps.aps_inventory_view invv
where 
(invv.load_date <= @snapshot_date and (invv.load_end_date > @snapshot_date or invv.load_end_date is null));