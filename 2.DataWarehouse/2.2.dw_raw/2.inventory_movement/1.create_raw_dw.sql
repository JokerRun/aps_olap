-- link_inventory_movement
# set @loaddate = '2019-05-03';
drop table if exists dw_raw.link_inventory_movement;
create table dw_raw.link_inventory_movement as
SELECT DISTINCT l_inventory_movement_hk,
                load_date,
                record_source,
                h_item_hk,
                h_location_hk,
                h_inventory_doc_hk,
                storage_location,
                batch_nr,
                inventory_doc_date
FROM stage_area.stage_inventory_movement stg
limit 1000;
create unique index link_inventory_movement_uindex on link_inventory_movement (h_item_hk, h_location_hk,
                                                                               h_inventory_doc_hk,
                                                                               storage_location,
                                                                               batch_nr);
alter table link_inventory_movement
    add constraint link_inventory_movement_pk primary key (l_inventory_movement_hk);


-- l_sat_inventory_movement
# set @loaddate = '2019-05-03';
drop table if exists dw_raw.l_sat_inventory_movement;
create table dw_raw.l_sat_inventory_movement as
SELECT DISTINCT l_inventory_movement_hk,
                load_date,
                STR_TO_DATE('9999-12-31', '%Y-%m-%d') as load_end_date,
                record_source,
                inventory_movement_hash_diff,
                item_nr,
                operate_type,
                location_nr,
                storage_location,
                batch_nr,
                inventory_doc_nr,
                inventory_doc_line,
                inventory_doc_date,
                movement_date,
                movement_time,
                inventory_doc_operator,
                movement_amount,
                movement_unit,
                describsion,
                movement_department,
                movement_code,
                reason_code,
                movement_org
FROM stage_area.stage_inventory_movement stg
limit 1000;
alter table l_sat_inventory_movement
    add constraint l_sat_inventory_movement_pk primary key (l_inventory_movement_hk, load_date);


# count dw_raw
SELECT COUNT(1)
FROM dw_raw.link_inventory_movement;
SELECT COUNT(1)
FROM dw_raw.l_sat_inventory_movement;
truncate dw_raw.link_inventory_movement;
truncate dw_raw.l_sat_inventory_movement;
