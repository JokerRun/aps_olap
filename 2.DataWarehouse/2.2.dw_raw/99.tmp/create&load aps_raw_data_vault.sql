DROP TABLE IF EXISTS dw_raw.hub_location;
CREATE TABLE dw_raw.`hub_location` (
  `h_location_hk` varchar(255) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL,
  `location_nr` varchar(255) NOT NULL,
  PRIMARY KEY (`h_location_hk`),
  UNIQUE KEY `hub_location_unique` (`location_nr`) USING BTREE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dw_raw.hub_item;
CREATE TABLE dw_raw.`hub_item` (
  `h_item_hk` varchar(255) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL,
  `item_nr` varchar(255) NOT NULL,
  PRIMARY KEY (`h_item_hk`),
  UNIQUE KEY `hub_item_unique` (`item_nr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS dw_raw.link_inventory;
CREATE TABLE dw_raw.`link_inventory` (
  `l_inventory_hk` varchar(255) NOT NULL,
  `load_date` datetime NOT NULL,
  `record_source` varchar(255) NOT NULL,
  `h_location_hk` varchar(255) NOT NULL,
  `h_item_hk` varchar(255) NOT NULL,
  PRIMARY KEY (`l_inventory_hk`),
  UNIQUE KEY `link_inventory_unique` (`h_location_hk`,h_item_hk) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





DROP TABLE IF EXISTS dw_raw.h_sat_location;
CREATE TABLE dw_raw.h_sat_location (
  `h_location_hk` varchar(255) NOT NULL,
  `load_date` datetime NOT NULL,
  `load_end_date` datetime DEFAULT NULL,
  `record_source` varchar(255) NOT NULL,
  `location_hash_diff` varchar(255) NOT NULL,

  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `lastmodified` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `available_id` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`h_location_hk`,`load_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS dw_raw.h_sat_item;
CREATE TABLE dw_raw.h_sat_item (
  `h_item_hk` varchar(255) NOT NULL,
  `load_date` datetime NOT NULL,
  `load_end_date` datetime DEFAULT NULL,
  `record_source` varchar(255) NOT NULL,
  `item_hash_diff` varchar(255) NOT NULL,
  
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `lastmodified` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `plan_strategy` varchar(20) DEFAULT NULL,
  `lock_type` varchar(20) DEFAULT NULL,
  `lock_expire_at` date DEFAULT NULL,
  `price_abc` varchar(20) DEFAULT NULL,
  `qty_abc` varchar(20) DEFAULT NULL,
  `cost` decimal(20,8) DEFAULT NULL,
  `gross_weight` decimal(20,8) DEFAULT NULL,
  `net_weight` decimal(20,8) DEFAULT NULL,
  `physical_unit` varchar(20) DEFAULT NULL,
  `project_nr` varchar(255) DEFAULT NULL,
  `mpq` decimal(20,8) DEFAULT NULL,
  `outer_package_num` int(11) DEFAULT NULL,
  `pallet_num` int(11) DEFAULT NULL,
  `outer_package_gross_weight` decimal(20,8) DEFAULT NULL,
  `pallet_gross_weight` decimal(20,8) DEFAULT NULL,
  `outer_package_volume` decimal(20,8) DEFAULT NULL,
  `pallet_volume` decimal(20,8) DEFAULT NULL,
  `plan_list_date` date DEFAULT NULL,
  `plan_delist_date` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`h_item_hk`,`load_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS dw_raw.h_sat_inventory;
CREATE TABLE dw_raw.h_sat_inventory (
  `l_inventory_hk` varchar(255) NOT NULL,
  `load_date` datetime NOT NULL,
  `load_end_date` datetime DEFAULT NULL,
  `record_source` varchar(255) NOT NULL,
  `h_item_hk` varchar(255) NOT NULL,
  `h_location_hk` varchar(255) NOT NULL,
  `inventory_hash_diff` varchar(255) NOT NULL,
 
  `source` varchar(255) DEFAULT NULL,
  `lastmodified` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `onhand` decimal(20,8) DEFAULT NULL,
  `available` varchar(5) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`l_inventory_hk`,`load_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- load location_hub
INSERT dw_raw.hub_location (h_location_hk, load_date, record_source, location_nr)
SELECT DISTINCT h_location_hk, load_date, record_source, location_nr 
FROM stage_area.stage_erp_location
where location_nr not in (SELECT location_nr from dw_raw.hub_location) 
and load_date = '2019-04-04 15:56:00'
;

INSERT INTO dw_raw.h_sat_location (h_location_hk, load_date, load_end_date, record_source, location_hash_diff, lft, rght, lvl, source, lastmodified, created_at, updated_at, name, area, category, subcategory, description, available_id, owner_id, company, type)
SELECT DISTINCT stg.h_location_hk,
stg.load_date,
null as load_end_date,
stg.record_source,
stg.location_hash_diff,
stg.lft,
stg.rght,
stg.lvl,
stg.source,
stg.lastmodified,
stg.created_at,
stg.updated_at,
stg.name,
stg.area,
stg.category,
stg.subcategory,
stg.description,
stg.available_id,
stg.owner_id,
stg.company,
stg.type
FROM stage_area.stage_erp_location stg 
LEFT JOIN dw_raw.h_sat_location tgt on (stg.h_location_hk=tgt.h_location_hk and tgt.load_end_date is null)
where (tgt.location_hash_diff is null or stg.location_hash_diff != tgt.location_hash_diff)
;
-- and stg.load_date = '2019-04-08 03:05:00';





-- load hub_item
INSERT dw_raw.hub_item (h_item_hk, load_date, record_source, item_nr)
SELECT DISTINCT h_item_hk, load_date, record_source, item_nr 
FROM stage_area.stage_erp_item
where item_nr not in (SELECT item_nr from dw_raw.hub_item) 
and load_date = '2019-04-04 15:56:57.0'
;



INSERT INTO dw_raw.h_sat_item (h_item_hk,load_date,load_end_date,record_source,item_hash_diff,lft,rght,lvl,source,lastmodified,created_at,updated_at,name,barcode,type,status,plan_strategy,lock_type,lock_expire_at,price_abc,qty_abc,cost,gross_weight,net_weight,physical_unit,project_nr,mpq,outer_package_num,pallet_num,outer_package_gross_weight,pallet_gross_weight,outer_package_volume,pallet_volume,plan_list_date,plan_delist_date,category,subcategory,description,owner_id)
SELECT DISTINCT 
stg.h_item_hk
,stg.load_date
,null as load_end_date
,stg.record_source
,stg.item_hash_diff
,stg.lft
,stg.rght
,stg.lvl
,stg.source
,stg.lastmodified
,stg.created_at
,stg.updated_at
,stg.name
,stg.barcode
,stg.type
,stg.status
,stg.plan_strategy
,stg.lock_type
,stg.lock_expire_at
,stg.price_abc
,stg.qty_abc
,stg.cost
,stg.gross_weight
,stg.net_weight
,stg.physical_unit
,stg.project_nr
,stg.mpq
,stg.outer_package_num
,stg.pallet_num
,stg.outer_package_gross_weight
,stg.pallet_gross_weight
,stg.outer_package_volume
,stg.pallet_volume
,stg.plan_list_date
,stg.plan_delist_date
,stg.category
,stg.subcategory
,stg.description
,stg.owner_id
FROM stage_area.stage_erp_item stg 
LEFT JOIN dw_raw.h_sat_item tgt on (stg.h_item_hk=tgt.h_item_hk and tgt.load_end_date is null)
where (tgt.item_hash_diff is null or stg.item_hash_diff != tgt.item_hash_diff)
and stg.load_date = '2019-04-08 06:27:18.0';




-- load link_inventory
INSERT dw_raw.link_inventory (l_inventory_hk, load_date, record_source, h_location_hk,h_item_hk)
SELECT DISTINCT l_inventory_hk, load_date, record_source, h_location_hk,h_item_hk
FROM stage_area.stage_erp_inventory stg
where not EXISTS (select 1 from dw_raw.link_inventory tgt where stg.h_location_hk = tgt.h_location_hk and stg.h_item_hk = tgt.h_item_hk )
and load_date = '2019-04-07 10:12:48.0'
;




INSERT INTO dw_raw.l_sat_inventory (l_inventory_hk,load_date,load_end_date,record_source,h_item_hk,h_location_hk,inventory_hash_diff,source,lastmodified,created_at,updated_at,type,onhand,available,category,subcategory,description)
SELECT DISTINCT 
stg.l_inventory_hk
,stg.load_date
,null as load_end_date
,stg.record_source
,stg.h_item_hk
,stg.h_location_hk
,stg.inventory_hash_diff
,stg.source
,stg.lastmodified
,stg.created_at
,stg.updated_at
,stg.type
,stg.onhand
,stg.available
,stg.category
,stg.subcategory
,stg.description
FROM stage_area.stage_erp_inventory stg 
LEFT JOIN dw_raw.l_sat_inventory tgt on (stg.l_inventory_hk=tgt.l_inventory_hk and tgt.load_end_date is null)
where (tgt.inventory_hash_diff is null or stg.inventory_hash_diff != tgt.inventory_hash_diff)
and stg.load_date = '2019-04-08 10:03:26.0';





