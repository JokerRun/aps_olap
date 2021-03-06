set @loaddate = '2019-05-03';
drop table if exists stage_area.stage_erp_location;
create table stage_area.stage_erp_location as
select md5(nr)                                            as h_location_hk,
       date_format(@loaddate, '%Y-%m-%d')                 as load_date,
       'erp.wctz.locationview'                            as record_source,
       md5(CONCAT_WS(',', storage_location, region, organisation, business_unit, id, lft, rght, lvl, nr, name, area,
                     source, available_id, available, owner_id, category, subcategory, description, lastmodified,
                     created_at, updated_at, null, null)) as location_hash_diff,
       nr                                                 as location_nr,
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
       null                                               as company,
       null                                               as type
from ods_erp.LOCATIONVIEW ;
alter table stage_area.stage_erp_location
	add constraint stage_erp_location_pk
		primary key (h_location_hk, load_date);
