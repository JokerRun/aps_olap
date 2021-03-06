set @loaddate = '2019-05-03';

drop table if exists stage_area.stage_erp_inventory;
create table stage_area.stage_erp_inventory as
select md5(CONCAT(item_nr, location_nr, storage_location, batch_nr))    as l_inventory_hk,
       date_format(@loaddate, '%Y-%m-%d')                               as load_date,
       'erp.wctz.inventoryview'                                         as record_source,
       md5(item_nr)                                                     as h_item_hk,
       md5(location_nr)                                                 as h_location_hk,
       md5(CONCAT_WS(',', item_nr, location_nr, storage_location, batch_nr, receipt_doc, receipt_seq, receipt_unit,
                     receipt_qty, dull_date, source, lastmodified, type, onhand, available, mrp_available, category,
                     subcategory, description, created_at, updated_at)) as inventory_hash_diff,
       item_nr                                                          as item_nr,
       location_nr                                                      as location_nr,
       storage_location                                                 as storage_location,
       batch_nr                                                         as batch_nr,
       receipt_doc,
       receipt_seq,
       receipt_unit,
       receipt_qty,
       dull_date,
       source,
       lastmodified,
       type,
       onhand,
       available,
       mrp_available,
       category,
       subcategory,
       description,
       created_at,
       updated_at
from ods_erp.INVENTORYVIEW;

