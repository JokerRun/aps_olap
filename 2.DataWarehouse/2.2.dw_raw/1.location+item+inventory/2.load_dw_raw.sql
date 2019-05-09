set @loaddate = '2019-05-03';


-- load location_hub
INSERT INTO dw_raw.hub_location (h_location_hk, load_date, record_source, location_nr)
SELECT DISTINCT h_location_hk, load_date, record_source, location_nr
FROM stage_area.stage_erp_location
where location_nr not in (SELECT location_nr from dw_raw.hub_location)
  and load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d')
;

INSERT INTO dw_raw.h_sat_location
SELECT DISTINCT stg.h_location_hk,
                stg.load_date,
                null as load_end_date,
                stg.record_source,
                stg.location_hash_diff,
                stg.location_nr,
                stg.storage_location,
                stg.region,
                stg.organisation,
                stg.business_unit,
                stg.id,
                stg.lft,
                stg.rght,
                stg.lvl,
                stg.nr,
                stg.name,
                stg.area,
                stg.source,
                stg.available_id,
                stg.available,
                stg.owner_id,
                stg.category,
                stg.subcategory,
                stg.description,
                stg.lastmodified,
                stg.created_at,
                stg.updated_at,
                stg.company,
                stg.type
FROM stage_area.stage_erp_location stg
         LEFT JOIN dw_raw.h_sat_location tgt on (stg.h_location_hk = tgt.h_location_hk and tgt.load_end_date is null)
where (tgt.location_hash_diff is null or stg.location_hash_diff != tgt.location_hash_diff)
  and stg.load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d');
;


-- load hub_item
INSERT dw_raw.hub_item (h_item_hk, load_date, record_source, item_nr)
SELECT DISTINCT h_item_hk, load_date, record_source, item_nr
FROM stage_area.stage_erp_item
where item_nr not in (SELECT item_nr from dw_raw.hub_item)
  and load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d')
;



INSERT INTO dw_raw.h_sat_item
SELECT DISTINCT  stg.h_item_hk
              , stg.load_date
              , null as load_end_date
              , stg.record_source
              , stg.item_hash_diff
              , stg.item_nr
              , stg.product_group
              , stg.product_category
              , stg.product_type
              , stg.product_usage
              , stg.supplier
              , stg.supplier_type
              , stg.packaging_type
              , stg.packaging_qty
              , stg.unit
              , stg.unit_price
              , stg.inner_pkg
              , stg.outter_package
              , stg.strategy
              , stg.nr
              , stg.name
              , stg.barcode
              , stg.type
              , stg.status
              , stg.plan_strategy
              , stg.lock_type
              , stg.lock_expire_at
              , stg.price_abc
              , stg.qty_abc
              , stg.COST
              , stg.SOURCE
              , stg.owner_id
              , stg.gross_weight
              , stg.net_weight
              , stg.physical_unit
              , stg.project_nr
              , stg.mpq
              , stg.outer_package_num
              , stg.pallet_num
              , stg.outer_package_gross_weight
              , stg.pallet_gross_weight
              , stg.outer_package_volume
              , stg.pallet_volume
              , stg.plan_list_date
              , stg.plan_delist_date
              , stg.category
              , stg.subcategory
              , stg.description
              , stg.lastmodified
              , stg.created_at
              , stg.updated_at
              , stg.lym
FROM stage_area.stage_erp_item stg
         LEFT JOIN dw_raw.h_sat_item tgt on (stg.h_item_hk = tgt.h_item_hk and tgt.load_end_date is null)
where (tgt.item_hash_diff is null or stg.item_hash_diff != tgt.item_hash_diff)
  and stg.load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d');


-- load link_inventory
INSERT dw_raw.link_inventory (l_inventory_hk, load_date, record_source, h_location_hk, h_item_hk, storage_location,
                              batch_nr)
SELECT DISTINCT l_inventory_hk, load_date, record_source, h_location_hk, h_item_hk, storage_location, batch_nr
FROM stage_area.stage_erp_inventory stg
where not EXISTS(select 1
                 from dw_raw.link_inventory tgt
                 where  stg.h_item_hk = tgt.h_item_hk and stg.h_location_hk = tgt.h_location_hk )
  and load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d')
;



INSERT INTO dw_raw.l_sat_inventory
SELECT DISTINCT stg.l_inventory_hk
              , stg.load_date
              , null as load_end_date
              , stg.record_source
              , stg.h_item_hk
              , stg.h_location_hk
              , stg.inventory_hash_diff
              , stg.item_nr
              , stg.location_nr
              , stg.storage_location
              , stg.batch_nr
              , stg.receipt_doc
              , stg.receipt_seq
              , stg.receipt_unit
              , stg.receipt_qty
              , stg.dull_date
              , stg.source
              , stg.lastmodified
              , stg.type
              , stg.onhand
              , stg.available
              , stg.mrp_available
              , stg.category
              , stg.subcategory
              , stg.description
              , stg.created_at
              , stg.updated_at
FROM stage_area.stage_erp_inventory stg
         LEFT JOIN dw_raw.l_sat_inventory tgt on (stg.l_inventory_hk = tgt.l_inventory_hk and tgt.load_end_date is null)
where (tgt.inventory_hash_diff is null or stg.inventory_hash_diff != tgt.inventory_hash_diff)
  and stg.load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d');


# count dw_raw
SELECT COUNT(1)FROM dw_raw.h_sat_item;
SELECT COUNT(1)FROM dw_raw.hub_item;
SELECT COUNT(1)FROM dw_raw.hub_location;
SELECT COUNT(1)FROM dw_raw.h_sat_location;
SELECT COUNT(1)FROM dw_raw.link_inventory;
SELECT COUNT(1)FROM dw_raw.l_sat_inventory;
