-- location_hub
set @loaddate = '2019-05-03';
drop table if exists dw_raw.h_sat_location;
create table dw_raw.h_sat_location as
SELECT DISTINCT stg.h_location_hk,
                stg.load_date,
                '9999-12-31' as load_end_date,
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
;
alter table dw_raw.h_sat_location
	add constraint h_sat_location_pk
		primary key (h_location_hk, load_date);




-- item_hub
set @loaddate = '2019-05-03';
drop table if exists dw_raw.h_sat_item;
create table dw_raw.h_sat_item as
SELECT DISTINCT stg.h_item_hk
              , stg.load_date
              , '9999-12-31' as load_end_date
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
;
alter table dw_raw.h_sat_item
	add constraint h_sat_item
		primary key(h_item_hk, load_date);




-- inventory_link
set @loaddate = '2019-05-03';
drop table if exists dw_raw.l_sat_inventory;
create table dw_raw.l_sat_inventory as
SELECT DISTINCT stg.l_inventory_hk
              , stg.load_date
              , '9999-12-31' as load_end_date
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
;
alter table dw_raw.l_sat_inventory
	add constraint l_sat_inventory_pk
		primary key (l_inventory_hk, load_date);


truncate dw_raw.h_sat_item;
truncate dw_raw.h_sat_location;
truncate dw_raw.l_sat_inventory;
# count dw_raw
SELECT COUNT(1)
FROM dw_raw.h_sat_item;
SELECT COUNT(1)
FROM dw_raw.hub_item;
SELECT COUNT(1)
FROM dw_raw.hub_location;
SELECT COUNT(1)
FROM dw_raw.h_sat_location;
SELECT COUNT(1)
FROM dw_raw.link_inventory;
SELECT COUNT(1)
FROM dw_raw.l_sat_inventory;
