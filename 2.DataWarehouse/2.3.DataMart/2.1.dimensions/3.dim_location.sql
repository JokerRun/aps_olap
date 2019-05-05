drop view if exists dim_location_view;
create view dim_location_view as
select hub.h_location_hk,
       hub.load_date,
       hub.record_source,
       hub.location_nr,
#        sat.h_location_hk,
#        sat.load_date,
       load_end_date,
#        sat.record_source,
       location_hash_diff,
#        sat.location_nr,
       storage_location,
       region,
       organisation,
       business_unit,
       id,
       lft,
       rght,
       lvl,
       nr,
       name,
       area,
       source,
       available_id,
       available,
       owner_id,
       category,
       subcategory,
       description,
       lastmodified,
       created_at,
       updated_at,
       company,
       type
from dw_raw.hub_location hub
         left join dw_raw.h_sat_location sat
                   on hub.h_location_hk = sat.h_location_hk and sat.load_end_date is null;

drop table if exists dm_aps.dim_location;
create table dm_aps.dim_location as select * from dm_aps.dim_location_view;