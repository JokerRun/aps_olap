
-- delete  from test_nifi.basic_item;
-- delete from test_nifi.basic_location;
-- delete from test_nifi.inventory_inventory;

select COUNT(1) from test_nifi.basic_item;
select COUNT(1) from test_nifi.inventory_inventory;
select COUNT(1) from test_nifi.basic_location;


-- delete  from stage_area.stage_erp_inventory;
-- delete from stage_area.stage_erp_location;
-- delete from stage_area.stage_erp_item;

select COUNT(1)   from stage_area.stage_erp_inventory;
select COUNT(1)  from stage_area.stage_erp_location;
select COUNT(1)  from stage_area.stage_erp_item;
