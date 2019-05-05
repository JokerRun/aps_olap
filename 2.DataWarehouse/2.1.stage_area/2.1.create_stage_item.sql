SET @loaddate = '2019-05-03';
drop table if exists stage_area.stage_erp_item;
-- create
create table stage_area.stage_erp_item as
select md5(item_nr)                                                                as h_item_hk,
       DATE_FORMAT(@loaddate, '%Y-%m-%d')                                     as load_date,
       'erp.wctz.itemview'                                                    as record_source,
       -- 	conca
       md5(CONCAT_WS(',', item_nr, product_group, product_category, product_type, product_usage, supplier,
                     supplier_type, packaging_type, packaging_qty, unit, unit_price, inner_pkg, outter_package,
                     strategy, nr, name, barcode, type, status, plan_strategy, lock_type, lock_expire_at, price_abc,
                     qty_abc, COST, SOURCE, owner_id, gross_weight, net_weight, physical_unit, project_nr, mpq,
                     outer_package_num, pallet_num, outer_package_gross_weight, pallet_gross_weight,
                     outer_package_volume, pallet_volume, plan_list_date, plan_delist_date, category, subcategory,
                     description, lastmodified, created_at, updated_at, lym)) as item_hash_diff,
       item_nr,
       product_group,
       product_category,
       product_type,
       product_usage,
       supplier,
       supplier_type,
       packaging_type,
       packaging_qty,
       unit,
       unit_price,
       inner_pkg,
       outter_package,
       strategy,
       nr,
       name,
       barcode,
       type,
       status,
       plan_strategy,
       lock_type,
       lock_expire_at,
       price_abc,
       qty_abc,
       COST,
       SOURCE,
       owner_id,
       gross_weight,
       net_weight,
       physical_unit,
       project_nr,
       mpq,
       outer_package_num,
       pallet_num,
       outer_package_gross_weight,
       pallet_gross_weight,
       outer_package_volume,
       pallet_volume,
       plan_list_date,
       plan_delist_date,
       category,
       subcategory,
       description,
       lastmodified,
       created_at,
       updated_at,
       lym
from ods_erp.ITEMVIEW
;
create unique index stage_erp_item_uindex
	on stage_erp_item (item_nr, load_date);

alter table stage_erp_item
	add constraint stage_erp_item_pk
		primary key (h_item_hk);