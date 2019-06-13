SET @init_date_key = '20190503';
SET @end_date_key = '20190503';
SET @move_start_date_month = '201905';
SET @move_start_date = '20160101';
SET @endt_end_date = '20170101';
# create or replace view fact_inventory_ito_view as
create table  fact_inventory_ito as
select '2016' as year,
       init_stock.item_key,
       init_stock.location_key,
       init_stock.total as init_value,
       end_stock.total  as end_value,
       movement.move_value as move_value,
       2*movement.move_value/(init_stock.total+end_stock.total) as ito

from (
         select ss.location_key, ss.item_key, sum(ss.onhand_value) total
         from fact_inventory_daily_snapshot ss
         where ss.date_key = @init_date_key
         group by ss.location_key, ss.item_key
         having total > 0
     ) as init_stock,
     (
         select ss.location_key, ss.item_key, sum(ss.onhand_value) total
         from fact_inventory_daily_snapshot ss
         where ss.date_key = @end_date_key
         group by ss.location_key, ss.item_key
         having total > 0
     ) as end_stock,

     (
         select @move_start_date_month, mv.h_item_hk, mv.h_location_hk, -sum(mv.inventory_affected_amount) as move_value
         from fact_inventory_movement mv
         where mv.move_date_key between @move_start_date and @endt_end_date
           and mv.operate_type = 'outbound'
         group by mv.h_item_hk, mv.h_location_hk
     ) as movement
where init_stock.item_key = end_stock.item_key
    and init_stock.location_key = end_stock.location_key
    and init_stock.item_key=movement.h_item_hk
    and init_stock.location_key=movement.h_location_hk

;
