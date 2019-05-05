set @loaddate = '2019-05-03';
-- 库存视图（拉链表形式储存库存，预先将自然键添加到本试图。）
CREATE OR REPLACE VIEW dm_aps.fact_inventory_daily_snapshot_view as
SELECT invl.l_inventory_hk                   as inventory_key,
       date_format(invl.load_date, '%Y%m%d') as date_key,
       #        invl.record_source,
       invl.h_location_hk                    as location_key,
       invl.h_item_hk                        as item_key,
       invl.storage_location,
       invl.batch_nr,
       -- invs
       date_format(invs.dull_date, '%Y%m%d') as dull_date_key,
       invs.receipt_doc,
       invs.receipt_seq,
       invs.receipt_unit,
       invs.receipt_qty,
       invs.dull_date,
       invs.source,
       invs.type,
       invs.onhand,
       invs.available,
       invs.mrp_available,
       invs.category,
       invs.subcategory,
       invs.description,
       -- itms
       unit,
       unit_price,
       onhand * unit_price as onhand_value
from dw_raw.link_inventory invl
         INNER JOIN dw_raw.l_sat_inventory invs ON invl.l_inventory_hk = invs.l_inventory_hk
         inner join dw_raw.hub_location loch on invl.h_location_hk = loch.h_location_hk
         inner join dw_raw.hub_item itmh on invl.h_item_hk = itmh.h_item_hk
         left join dw_raw.h_sat_item itms on invl.h_item_hk=itms.h_item_hk and itms.load_end_date is null;
# where invl.load_date=@loaddate
;

-- 库存快照表设计（快照日期及库存数据）
drop table if exists dm_aps.fact_inventory_daily_snapshot;
create table dm_aps.fact_inventory_daily_snapshot as select
*
from dm_aps.fact_inventory_daily_snapshot_view

;


-- 加载库存快照表。 @snapshot_date 变量以ETL过程中的load_date值为准。
# SET @snapshot_date = now();
# insert into dm_aps.aps_inventory_snapshot
# SELECT DATE_FORMAT(@snapshot_date, '%Y-%m-%d') as snapshot_date,
#        invv.item_id,
#        invv.location_id,
#        invv.type,
#        invv.onhand,
#        invv.available,
#        invv.category,
#        invv.subcategory,
#        invv.description,
#        invv.created_at,
#        invv.updated_at
# from dm_aps.aps_inventory_view invv
# where (invv.load_date <= @snapshot_date and (invv.load_end_date > @snapshot_date or invv.load_end_date is null));