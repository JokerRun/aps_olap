create or replace view dm_aps.fact_inventory_movement_view as
select
       link.l_inventory_movement_hk,
       link.h_item_hk,
       link.h_location_hk,
       link.h_inventory_doc_hk,
       date_format(sat.movement_date,'%Y%m%d') as move_date_key,
       date_format(sat.inventory_doc_date,'%Y%m%d') as inventory_doc_date_key,
       sat.movement_time,
       sat.describsion,
       sat.movement_department,
       sat.reason_code,
       sat.movement_org,
       sat.movement_unit,
       item.unit_price,
       sat.operate_type,
       sat.movement_amount  as move_count,
       case sat.operate_type when 'inbound' then sat.movement_amount when 'outbound' then (-sat.movement_amount) end as inventory_affected_count,
       item.unit_price * case sat.operate_type when 'inbound' then sat.movement_amount when 'outbound' then (-sat.movement_amount) end  as inventory_affected_amount
from dw_raw.link_inventory_movement link,
     dw_raw.l_sat_inventory_movement sat,
     dw_raw.h_sat_item item
where link.l_inventory_movement_hk = sat.l_inventory_movement_hk
  and (sat.load_end_date = '9999-12-31' or sat.load_end_date is null)
  and link.h_item_hk=item.h_item_hk
  and (item.load_end_date = '9999-12-31' or item.load_end_date is null)
;
drop table if exists dm_aps.fact_inventory_movement;

create table dm_aps.fact_inventory_movement as
    select * from dm_aps.fact_inventory_movement_view;
create index fact_inventory_movement_index
	on fact_inventory_movement (h_item_hk, h_location_hk, h_inventory_doc_hk, move_date_key, inventory_doc_date_key);


