--����ItemView��ͼ
--SELECT * FROM ItemView;
CREATE OR REPLACE VIEW ItemView AS
SELECT ''     ID,
       ''     lft,
       ''     rght,
       ''     lvl,
       ima01  nr,
       ima02  NAME,
       ''     barcode,
       ima06  TYPE,
       ''     status,
       ''     plan_strategy,
       ''     lock_type,
       ''     lock_expire_at,
       ima07  price_abc,
       ''     qty_abc,
       ''     COST,
       ''     SOURCE,
       ''     owner_id,
       ''     gross_weight,
       ima18  net_weight,
       ima25  physical_unit,
       ima021 project_nr,
       ima45  mpq,
       ''     outer_package_num,
       ''     pallet_num,
       ''     outer_package_gross_weight,
       ''     pallet_gross_weight,
       ''     outer_package_volume,
       ''     pallet_volume,
       ''     plan_list_date,
       ''     plan_delist_date,
       ''     category,
       ''     subcategory,
       ''     description,
       ''     lastmodified,
       ''     created_at,
       ''     updated_at,
       ima08  lym
FROM ima_file;

--����ȡ�����ϵ��ͼ(����ȡ�����ͼȱʧBOM�������)
--SELECT * FROM ItemSuccessorView;
CREATE OR REPLACE VIEW ItemSuccessorView AS
SELECT ''      ID,
       bmd01   item_id,
       bmd04   item_successor_id,
       bmd08   bom_item_id,
       bmd02   relation_type,
       bmd03   priority,
       ''      ratio,
       bmdud03 used_qty,
       bmdud02 change_qty,
       bmd05   effective_start,
       bmd06   effective_end,
       ''      created_at,
       ''      updated_at
FROM bmd_file;;
--���ϵص��ϵ��ͼ��ÿ����ͬ�ĵص���Ҫ���ݲ�ͬ�Ĺ����������֣�
SELECT *
FROM ItemLocationView;
CREATE OR REPLACE VIEW ItemLocationView AS
SELECT ''            id,
       ima01         item_id,
       'WCTZ'        location_id,
       ima109        type,
       imaacti       status,
       ''            plan_strategy,
       ''            lock_type,
       ''            lock_expire_at,
       ''            inventory_qty,
       ''            available_inventory,
       ''            inventory_cost,
       ima07         price_abc,
       ''            qty_abc,
       ''            cost,
       ''            gross_weight,
       ''            net_weight,
       ima25         physical_unit,
       ima021        project_nr,
       ima46         moq,
       ima45         order_unit_qty,
       ''            order_max_qty,
       ima59 + ima61 product_time,
       ima48         load_time,
       ima49         transit_time,
       ima491        receive_time,
       ima45         mpq,
       ''            earliest_order_date,
       ''            plan_supplier_date,
       ''            plan_load_date,
       ''            plan_receive_date,
       ''            outer_package_num,
       ''            pallet_num,
       ''            outer_package_gross_weight,
       ''            pallet_gross_weight,
       ''            outer_package_volume,
       ''            pallet_volume,
       ''            plan_list_date,
       ''            plan_delist_date,
       ima109        category,
       ''            subcategory,
       ima02         DESCRIPTION
FROM ima_file;;

--��Ӧ����ͼ
--SELECT * FROM SupplierView;
CREATE OR REPLACE VIEW SupplierView AS
SELECT ''     ID,
       ''     lft,
       ''     rght,
       ''     lvl,
       pmc01  nr,
       pmc03  NAME,
       pmc908 area,
       pmc091 address,
       ''     ship_address,
       pmc07  country,
       ''     city,
       ''     phone,
       ''     telephone,
       ''     contact,
       ''     email,
       ''     available_id,
       ''     owner_id,
       ''     category,
       ''     subcategory,
       ''     description,
       ''     lastmodified,
       ''     created_at,
       ''     updated_at
FROM pmc_file;;
--���Ϲ�Ӧ�̹�ϵ��ͼ
--SELECT * FROM ItemSupplierView;
CREATE OR REPLACE VIEW ItemSupplierView AS
SELECT ''      id,
       ima01   item_id,
       pmc01   supplier_id,
       'WCTZ'  location_id,
       ''      supplier_item_nr,
       imaacti status,
       ''      cost,
       ''      monetary_unit,
       ''      cost_unit,
       ''      priority,
       ''      ratio,
       ima46   moq,
       ima45   order_unit_qty,
       ''      order_max_qty,
       ''      product_time,
       ima48   load_time,
       ima49   transit_time,
       ima491  receive_time,
       ima45   mpq,
       ''      earliest_order_date,
       ''      plan_supplier_date,
       ''      plan_load_date,
       ''      plan_receive_date,
       ''      outer_package_num,
       ''      pallet_num,
       ''      outer_package_gross_weight,
       ''      pallet_gross_weight,
       ''      outer_package_volume,
       ''      pallet_volume,
       ''      plan_list_date,
       ''      plan_delist_date,
       ''      origin_country,
       ''      effective_start,
       ''      effective_end,
       ''      description,
       ''      lastmodified,
       ''      created_at,
       ''      updated_at
FROM ima_file
         LEFT JOIN pmc_file ON pmc01 = ima54;
--�ͻ���ͼ
--SELECT * FROM CustomerView;
CREATE OR REPLACE VIEW CustomerView AS
SELECT ''    ID,
       ''    lft,
       ''    rght,
       ''    lvl,
       occ01 nr,
       occ02 NAME,
       ''    area,
       ''    address,
       ''    ship_address,
       ''    SOURCE,
       ''    available_id,
       ''    owner_id,
       ''    category,
       ''    subcategory,
       ''    description,
       ''    lastmodified,
       ''    created_at,
       ''    updated_at
FROM occ_file;;
--�ͻ���Ʒ��ϵ��ͼ
--SELECT * FROM ItemCustomerView;
CREATE OR REPLACE VIEW ItemCustomerView AS
SELECT ''     ID,
       obk01  sale_item_id,
       obk01  product_item_id,
       obk02  customer_id,
       'WCTZ' location_id,
       obk03  customer_item_nr,
       ''     status,
       ''     lock_type,
       ''     lock_expire_at,
       ''     plan_list_date,
       ''     plan_delist_date,
       ''     effective_start,
       ''     effective_end,
       ''     created_at,
       ''     updated_at
FROM obk_file;;
--BOM��ͼ(ȱ����������)
--SELECT * FROM ItemBomView;
CREATE OR REPLACE VIEW ItemBomView AS
SELECT ''     ID,
       ''     nr,
       bmb03  item_id,
       'WCTZ' itemlocation_id,
       bmb01  owner_id,
       bmb06  qty,
       bmb10  unit,
       bmb04  effective_start,
       bmb05  effective_end,
       ''     created_at,
       ''     updated_at
FROM bmb_file;
--�ص���ͼ
--SELECT * FROM LocationView;
CREATE OR REPLACE VIEW LocationView AS
SELECT ''    ID,
       ''    lft,
       ''    rght,
       ''    lvl,
       imd01 nr,
       ''    NAME,
       ''    area,
       ''    SOURCE,
       ''    available_id,
       imd11 available,
       ''    owner_id,
       ''    category,
       ''    subcategory,
       ''    description,
       ''    lastmodified,
       ''    created_at,
       ''    updated_at
FROM imd_file;
--������ͼ
--SELECT * FROM CalenderView;
CREATE OR REPLACE VIEW CalenderView AS
SELECT '' NAME,
       '' source,
       '' defaultvalue,
       '' category,
       '' subcategory,
       '' description,
       '' lastmodified,
       '' created_at,
       '' updated_at
FROM dual;;
--�����ֱ���ͼ
--SELECT * FROM CalendarBucketView;
CREATE OR REPLACE VIEW CalendarBucketView AS
SELECT ''         ID,
       ''         calendar,
       MIN(sme01) startdate,
       MAX(sme01) enddate,
       ''         value,
       ''         priority,
       'Y'        monday,
       'Y'        tuesday,
       'Y'        wednesday,
       'Y'        thursday,
       'Y'        friday,
       'Y'        saturday,
       'N'        sunday,
       ''         starttime,
       ''         endtime,
       ''         source,
       ''         lastmodified,
       ''         created_at,
       ''         updated_at
FROM sme_file;

--�����ͼ�Ϳ�������ͼ������
--�����ͼ
--SELECT * FROM InventoryView
CREATE OR REPLACE VIEW InventoryView AS
SELECT ''    "id",
       img01 "item_id",
       img02 "location_id",
       ''    "type",
       img10 "onhand",
       ''    "available",
       ''    "category",
       ''    "subcategory",
       ''    "description",
       ''    "created_at",
       ''    "updated_at"
FROM img_file;
--��������ͼ
--SELECT * FROM InventoryParameterView
CREATE OR REPLACE VIEW InventoryParameterView AS
SELECT ''    "id",
       img01 "item_id",
       img02 "location_id",
       ''    "rop_cover_period",
       ''    "rop",
       ''    "rop_by_system",
       ''    "safetystock_cover_period",
       ''    "safetystock_min_qty",
       ''    "safetystock_max_qty",
       ''    "safetystock_qty_by_system",
       ''    "has_rop",
       ''    "has_safetystock",
       ''    "service_level",
       ''    "created_at",
       ''    "updated_at"
FROM img_file;
--��������¼(�ֶ���Ҫ�������һ�£����ϵĿ�������¼��һ����Ǵӵ������ֿ���ߴӲֿ������ݻ��ߴӲֿ⵽�ֿ�)
--SELECT * FROM InventoryMovementView
CREATE OR REPLACE VIEW InventoryMovementView AS
SELECT ''     "id",
       tlf10  "qty",
       tlf026 "source_location_nr",
       tlf036 "destination_location_nr",
       ''     "location",
       tlf01  "item_nr",
       tlf02  "operate_type",
       tlf026 "operate_doc_nr",
       ''     "operate_doc_line_nr",
       tlf02  "operate_doc_type",
       tlf02  "origin_doc_type",
       tlf026 "operate_doc_entity_nr",
       tlf07  "operated_at"
FROM tlf_file;
--��������
--SELECT * FROM WorkOrderView
CREATE OR REPLACE VIEW WorkOrderView AS
SELECT ''    "id",
       sfb01 "nr",
       ''    "location_id",
       sfb05 "item_id",
       sfb08 "qty",
       sfb09 "finished_qty",
       sfb04 "status",
       sfb81 "order_at",
       sfb13 "schedule_start_at",
       sfb25 "actual_start_at",
       ''    "schedule_end_at",
       ''    "actual_end_at",
       ''    "delay",
       ''    "created_at",
       ''    "updated_at"
FROM sfb_file;
--����������(����������Ϣ���治������Ʒ�Ŀ������깤������������ڹ�����ͼ��)
--SELECT * FROM WorkOrderItem
CREATE OR REPLACE VIEW WorkOrderItem AS
SELECT ''            "id",
       sfa01         "workorder_id",
       sfa03         "item_id",
       sfa05         "total_qty",
       sfa06         "delivered_qty",
       sfa05 - sfa06 "notdelivered_qty",
       ''            "status",
       ''            "order_at",
       ''            "schedule_start_at",
       ''            "actual_start_at",
       ''            "schedule_end_at",
       ''            "actual_end_at",
       ''            "delay",
       ''            "created_at",
       ''            "updated_at"
FROM sfa_file;
--�ɹ�����(�ɹ������ϵ�Ԥ�Ƶ���,��ʼ���˵ȹ������ϻ�����Ϣ��������ڲɹ�������ϸ��)
--SELECT * FROM PurchaseOrderView
CREATE OR REPLACE VIEW PurchaseOrderView AS
SELECT ''    "id",
       pmm01 "nr",
       ''    "location_id",
       pmm09 "supplier_id",
       pmm25 "status",
       pmm04 "order_at",
       ''    "schedule_arrive_at",
       ''    "start_ship_at",
       ''    "actual_arrive_at",
       ''    "delay",
       ''    "created_at",
       ''    "updated_at"
FROM pmm_file;
--�ɹ�������ϸ
--SELECT * FROM PurchaseOrderItemView
CREATE OR REPLACE VIEW PurchaseOrderItemView AS
SELECT ''                            "id",
       pmn02                         "line_no",
       pmn04                         "item_id",
       pmn01                         "purchase_order_id",
       ''                            "order_at",
       pmn20                         "qty",
       ''                            "open_qty",
       pmn20 - pmn50 + pmn55 + pmn58 "git_qty",
       pmn51                         "check_qty",
       pmn53                         "instock_qty",
       pmn16                         "status",
       pmn33                         "due",
       ''                            "schedule_arrive_at",
       ''                            "start_ship_at",
       ''                            "actual_arrive_at",
       ''                            "delay",
       ''                            "warning_delay",
       ''                            "created_at",
       ''                            "updated_at"
FROM pmn_file;
--�˵���ͼ
--SELECT * FROM DeliveryOrder(��ӦԤ��汾�Ǹ�����������ģ�����������˵���ϸ)
CREATE OR REPLACE VIEW DeliveryOrder AS
SELECT ''      "id",
       imm01   "nr",
       ''      "source_location_id",
       immud02 "destination_location_id",
       ''      "type",
       immud02 "deliver_id",
       ''      "deliver_source_id",
       imm03   "status",
       ''      "schedule_arrive_at",
       ''      "start_ship_at",
       ''      "actual_arrive_at",
       ''      "delay",
       ''      "created_at",
       ''      "updated_at"
FROM imm_file;
--�˵�����ͼ(���齫Ԥ��汾���ڴ���ͼ.���������˵�ֻ���漰��������û������ʱ�����Ϣ)
--SELECT * FROM DeliveryOrderItem
CREATE OR REPLACE VIEW DeliveryOrderItem AS
SELECT ''      "id",
       imn02   "line_no",
       imn03   "item_id",
       imn01   "delivery_order_id",
       imnud03 "deliver_source_id",
       imn10   "deliver_qty",
       imn10   "actual_deliver_qty",
       ''      "not_deliver_qty",
       ''      "git_qty",
       ''      "check_qty",
       ''      "instock_qty",
       ''      "status",
       ''      "start_ship_at",
       ''      "actual_arrive_at",
       ''      "delay",
       ''      "created_at",
       ''      "updated_at"
FROM imn_file;
--���۶�������ʱ�����ڳ����ó���⣬���漰���۶�����
--SELECT * FROM DemandOrderView
CREATE OR REPLACE VIEW DemandOrderView AS
SELECT ''      "id",
       oea01   "nr",
       ''      "location_id",
       oea03   "destination_location_id",
       oea03   "customer_id",
       oeaconf "status",
       ''      "max_lateness",
       ''      "min_shipment",
       ''      "category",
       ''      "subcategory",
       ''      "description",
       ''      "created_at",
       ''      "updated_at"
FROM oea_file;
--���۶�����
--SELECT * FROM DemandOrderItem
CREATE OR REPLACE VIEW DemandOrderItem AS
SELECT ''    "id",
       oeb03 "line_no",
       oeb01 "demand_order_id",
       oeb04 "item_id",
       oeb12 "qty",
       oeb12 "schedule_qty",
       ''    "deliver_qty",
       ''    "order_at",
       oeb16 "due",
       ''    "priority",
       ''    "status",
       ''    "max_lateness",
       ''    "min_shipment",
       ''    "delay",
       ''    "closed_at",
       ''    "created_at",
       ''    "updated_at"
FROM oeb_file;
--���Ԥ��
--SELECT * FROM ForecastYearView
CREATE OR REPLACE VIEW ForecastYearView AS
SELECT '' "id",
       '' "item_id",
       '' "location_id",
       '' "customer_id",
       '' "date",
       '' "date_type",
       '' "ratio",
       '' "normal_qty",
       '' "new_product_plan_qty",
       '' "promotion_qty",
       '' "parsed_date",
       '' "created_at",
       '' "updated_at"
FROM dual;
--Ԥ��汾
--SELECT * FROM ForecastVersionView
CREATE OR REPLACE VIEW ForecastVersionView AS
SELECT '' "id", ta_opc01 "nr", ta_opc07 "status", ta_opc05 "create_user_id", ta_opc02 "created_at", '' "updated_at"
FROM ta_opc_file;
--Ԥ��(priority �����ظ�������ǰһ����ȥ����һ��)
--SELECT * FROM ForecastView 
CREATE OR REPLACE VIEW ForecastView AS
SELECT ''       "id",
       ta_opd03 "item_id",
       ''       "location_id",
       ''       "customer_id",
       ta_opd04 "date",
       ''       "date_type",
       ''       "priority",
       ''       "ratio",
       ta_opd06 "normal_qty",
       ''       "new_product_plan_qty",
       ''       "promotion_qty",
       ''       "status",
       ''       "create_user_id",
       ta_opd01 "version_id",
       ''       "parsed_date",
       ''       "created_at",
       ''       "updated_at"
FROM ta_opd_file;




















