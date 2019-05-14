-- link_inventory_movement
set @loaddate = '2019-05-03';
insert into dw_raw.link_inventory_movement
SELECT DISTINCT stg.l_inventory_movement_hk,
                stg.load_date,
                stg.record_source,
                stg.h_item_hk,
                stg.h_location_hk,
                stg.h_inventory_doc_hk,
                stg.storage_location,
                stg.batch_nr,
                stg.inventory_doc_date
FROM stage_area.stage_inventory_movement stg
where stg.load_date = @loaddate
  and not EXISTS(select 1
                 from dw_raw.link_inventory_movement tgt
                 where stg.h_item_hk = tgt.h_item_hk
                   and stg.h_location_hk = tgt.h_location_hk
                   and stg.h_inventory_doc_hk = tgt.h_inventory_doc_hk);
-- l_sat_inventory_movement
set @loaddate = '2019-05-03';
insert into dw_raw.l_sat_inventory_movement
SELECT DISTINCT stg.l_inventory_movement_hk,
                stg.load_date,
                STR_TO_DATE('9999-12-31', '%Y-%m-%d') as load_end_date,
                stg.record_source,
                stg.inventory_movement_hash_diff,
                stg.item_nr,
                stg.operate_type,
                stg.location_nr,
                stg.storage_location,
                stg.batch_nr,
                stg.inventory_doc_nr,
                stg.inventory_doc_line,
                stg.inventory_doc_date,
                stg.movement_date,
                stg.movement_time,
                stg.inventory_doc_operator,
                stg.movement_amount,
                stg.movement_unit,
                stg.describsion,
                stg.movement_department,
                stg.movement_code,
                stg.reason_code,
                stg.movement_org
FROM stage_area.stage_inventory_movement stg
         LEFT JOIN dw_raw.l_sat_inventory_movement tgt on (stg.load_date = DATE_FORMAT(@loaddate, '%Y-%m-%d') and
                                                           stg.l_inventory_movement_hk = tgt.l_inventory_movement_hk and
                                                           tgt.load_end_date = '9999-12-31')
where (tgt.inventory_movement_hash_diff is null or
       stg.inventory_movement_hash_diff != tgt.inventory_movement_hash_diff);


# count dw_raw
SELECT COUNT(1)
FROM dw_raw.link_inventory_movement;
SELECT COUNT(1)
FROM dw_raw.l_sat_inventory_movement;