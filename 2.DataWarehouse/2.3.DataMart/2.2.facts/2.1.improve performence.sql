create table if not exists dm_aps.fact_inventory_movement
(
	l_inventory_movement_hk varchar(32) charset utf8mb4 not null,
	h_item_hk varchar(32) charset utf8mb4 null,
	h_location_hk varchar(32) charset utf8mb4 null,
	h_inventory_doc_hk varchar(32) charset utf8mb4 null,
	move_date_key varchar(8) charset utf8mb4 null,
	inventory_doc_date_key varchar(8) charset utf8mb4 null,
	movement_time varchar(8) null,
	describsion varchar(255) null,
	movement_department varchar(10) null,
	reason_code varchar(10) null,
	movement_org varchar(10) default '' not null,
	movement_unit varchar(4) null,
	unit_price decimal(20,6) null,
	operate_type varchar(8)  null,
	move_count decimal(15,3) null,
	inventory_affected_count decimal(15,3) null,
	inventory_affected_amount decimal(35,9) null
);
alter table fact_inventory_movement
	add constraint fact_inventory_movement_pk
		primary key (l_inventory_movement_hk);

create index fact_inventory_movement_h_inventory_doc_hk_index
	on fact_inventory_movement (h_inventory_doc_hk);

create index fact_inventory_movement_h_item_hk_index
	on fact_inventory_movement (h_item_hk);

create index fact_inventory_movement_h_location_hk_index
	on fact_inventory_movement (h_location_hk);

create index fact_inventory_movement_move_date_key_index
	on fact_inventory_movement (move_date_key);

create index fact_inventory_movement_operate_type_index
	on fact_inventory_movement (operate_type);

insert into dm_aps.fact_inventory_movement   select * from dm_aps.fact_inventory_movement_view;