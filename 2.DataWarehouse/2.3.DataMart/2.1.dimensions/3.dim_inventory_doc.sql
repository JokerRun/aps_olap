create or replace view dm_aps.dim_inventory_doc_view as
select distinct link.h_inventory_doc_hk,
                sat.inventory_doc_nr,
                sat.inventory_doc_line,
                sat.operate_type,
                sat.movement_code,
                sat.inventory_doc_operator
from dw_raw.link_inventory_movement link,
     dw_raw.l_sat_inventory_movement sat
where link.l_inventory_movement_hk = sat.l_inventory_movement_hk
  and (sat.load_end_date = '9999-12-31' or sat.load_end_date is null);

drop table if exists dm_aps.dim_inventory_doc;
create table dm_aps.dim_inventory_doc as
select *
from dm_aps.dim_inventory_doc_view;
alter table dim_inventory_doc
    add constraint dim_inventory_doc_pk primary key (h_inventory_doc_hk);

