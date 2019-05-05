create schema if not exists dw_raw collate utf8_general_ci;


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



DROP TABLE IF EXISTS dw_raw.l_sat_inventory;
CREATE TABLE dw_raw.l_sat_inventory (
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

