drop view if exists dm_aps.dim_item_view;
create view dm_aps.dim_item_view as
select hub.h_item_hk,
       hub.load_date,
       hub.record_source,
       item_nr,
#                                            sat.h_item_hk,
#                                            sat.load_date,
       load_end_date,
#                                            sat.record_source,
       item_hash_diff,
       lft,
       rght,
       lvl,
       source,
       lastmodified,
       created_at,
       updated_at,
       name,
       barcode,
       type,
       status,
       plan_strategy,
       lock_type,
       lock_expire_at,
       price_abc,
       qty_abc,
       cost,
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
       owner_id
from dw_raw.hub_item hub
         left join dw_raw.h_sat_item sat
                   on hub.h_item_hk = sat.h_item_hk and sat.load_end_date is null;

drop table if exists dm_aps.dim_item;
create table dm_aps.dim_item as
select *
from dm_aps.dim_item_view;