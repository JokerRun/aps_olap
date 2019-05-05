CREATE OR REPLACE VIEW ods_erp.CALENDARBUCKETVIEW AS
SELECT null calendar,
       MIN(sme01) startdate,
       MAX(sme01) enddate,
       null value,
       null priority,
       'Y' monday,
       'Y' tuesday,
       'Y' wednesday,
       'Y' thursday,
       'Y' friday,
       'Y' saturday,
       'N' sunday,
       null starttime,
       null endtime,
       null source,
       null lastmodified,
       null created_at,
       null updated_at
FROM ods_erp.SME_FILE
;

CREATE OR REPLACE VIEW ods_erp.LOCATIONVIEW AS
SELECT null id,
       null lft,
       null rght,
       null lvl,
       imd01 nr,
       IMD02 name,
       null area,
       null source,
       null available_id,
       imd11 available,
       null owner_id,
       null category,
       null subcategory,
       null description,
       null lastmodified,
       null created_at,
       null updated_at
FROM ods_erp.IMD_FILE
;
CREATE OR REPLACE VIEW ods_erp.SUPPLIERVIEW AS
SELECT null lft,
       null rght,
       null lvl,
       pmc01  nr,
       pmc03  name,
       pmc908 area,
       pmc091 address,
       null ship_address,
       pmc07  country,
       null city,
       null phone,
       null telephone,
       null contact,
       null email,
       null available_id,
       null owner_id,
       null category,
       null subcategory,
       null description,
       null lastmodified,
       null created_at,
       null updated_at
FROM ods_erp.PMC_FILE
;

CREATE OR REPLACE VIEW ods_erp.CUSTOMERVIEW AS
SELECT null lft,
       null rght,
       null lvl,
       occ01 nr,
       occ02 name,
       null area,
       null address,
       null ship_address,
       null source,
       null available_id,
       null owner_id,
       null category,
       null subcategory,
       null description,
       null lastmodified,
       null created_at,
       null updated_at
FROM ods_erp.OCC_FILE
;
CREATE OR REPLACE VIEW ods_erp.ITEMVIEW
AS
SELECT null ID,
       null lft,
       null rght,
       null lvl,
       ima01  nr,
       ima02  name,
       null barcode,
       ima06  type,
       null status,
       null plan_strategy,
       null lock_type,
       null lock_expire_at,
       ima07  price_abc,
       null qty_abc,
       null COST,
       null SOURCE,
       null owner_id,
       null gross_weight,
       ima18  net_weight,
       ima25  physical_unit,
       ima021 project_nr,
       ima45  mpq,
       null outer_package_num,
       null pallet_num,
       null outer_package_gross_weight,
       null pallet_gross_weight,
       null outer_package_volume,
       null pallet_volume,
       null plan_list_date,
       null plan_delist_date,
       null category,
       null subcategory,
       null description,
       null lastmodified,
       null created_at,
       null updated_at,
       ima08  lym
FROM ods_erp.IMA_FILE
;


CREATE OR REPLACE VIEW ods_erp.ITEMBOMVIEW AS
SELECT
-- TODO: aps中nr字段要求不为空，此处nr如何处理？ 可否直接拼接 itemid+owner id 作为nr??
-- TODO：aps接口要求传item、parent,而非id，该接口是否需要改造？
bmb01 || bmb03 nr,
bmb03          item_id,
'WCTZ' itemlocation_id,
bmb01          owner_id,
bmb06          qty,
bmb10          unit,
bmb04          effective_start,
bmb05          effective_end,
null created_at,
null updated_at
FROM ods_erp.BMB_FILE
;
CREATE
    OR REPLACE
    VIEW ods_erp.ITEMSUCCESSORVIEW AS
SELECT null      ID,
       bmd01   item_id,
       bmd04   item_successor_id,
       bmd08   bom_item_id,
       bmd02   relation_type,
       bmd03   priority,
       null ratio,
       bmdud03 used_qty,
       bmdud02 change_qty,
       bmd05   effective_start,
       bmd06   effective_end,
       null created_at,
       null updated_at
FROM ods_erp.BMD_FILE
;


-- 物料地点关系视图（每个不同的地点需要根据不同的工厂进行区分）
-- SELECT * FROM ods_erp.ItemLocationView;
CREATE OR REPLACE VIEW ods_erp.ITEMLOCATIONVIEW AS
SELECT ima01         item_id,
       'WCTZ' location_id,
-- TODO： 待讨论：ima09 改为 ima 06是否合理？
       ima09         type,
-- TODO： 在Item中，status字段默认给的是空值，此处用的是 imaacti 字段，需要怎么处理该字段与APS的映射关系？？？
       imaacti       status,
       null plan_strategy,
       null lock_type,
       null lock_expire_at,
       null inventory_qty,
       null available_inventory,
       null inventory_cost,
       ima07         price_abc,
       null qty_abc,
       null cost,
       null gross_weight,
       null net_weight,
       ima25         physical_unit,
       ima021        project_nr,
       ima46         moq,
       ima45         order_unit_qty,
       null order_max_qty,
       ima59 + ima61 product_time,
       ima48         load_time,
       ima49         transit_time,
       ima491        receive_time,
       ima45         mpq,
       null earliest_order_date,
       null plan_supplier_date,
       null plan_load_date,
       null plan_receive_date,
       null outer_package_num,
       null pallet_num,
       null outer_package_gross_weight,
       null pallet_gross_weight,
       null outer_package_volume,
       null pallet_volume,
       null plan_list_date,
       null plan_delist_date,
       ima109        category,
       null subcategory,
       ima02         description
FROM ods_erp.IMA_FILE
;

-- 物料供应商关系视图

CREATE OR REPLACE VIEW ods_erp.ITEMSUPPLIERVIEW AS
SELECT ima01   item_id,
       pmc01   supplier_id,
       'WCTZ' location_id,
       null supplier_item_nr,
       imaacti status,
       null cost,
       null monetary_unit,
       null cost_unit,
       null priority,
       null ratio,
       ima46   moq,
       ima45   order_unit_qty,
       null order_max_qty,
       null product_time,
       ima48   load_time,
       ima49   transit_time,
       ima491  receive_time,
       ima45   mpq,
       null earliest_order_date,
       null plan_supplier_date,
       null plan_load_date,
       null plan_receive_date,
       null outer_package_num,
       null pallet_num,
       null outer_package_gross_weight,
       null pallet_gross_weight,
       null outer_package_volume,
       null pallet_volume,
       null plan_list_date,
       null plan_delist_date,
       null origin_country,
       null effective_start,
       null effective_end,
       null description,
       null lastmodified,
       null created_at,
       null updated_at
FROM ods_erp.IMA_FILE
         LEFT JOIN ods_erp.PMC_FILE ON pmc01 = ima54
;

CREATE OR REPLACE VIEW ods_erp.ITEMCUSTOMERVIEW AS
SELECT obk01 sale_item_id,
       obk01 product_item_id,
       obk02 customer_id,
       'WCTZ' location_id,
       obk03 customer_item_nr,
       null status,
       null lock_type,
       null lock_expire_at,
       null plan_list_date,
       null plan_delist_date,
       null effective_start,
       null effective_end,
       null created_at,
       null updated_at
FROM ods_erp.OBK_FILE
;
CREATE OR REPLACE VIEW ods_erp.INVENTORYVIEW AS

SELECT
       img01 item_nr,
       img02 location_nr,
       img03 storage_location,
       img04 batch_nr,
       null as source,
       null as lastmodified,
       null type,
       img10 onhand,
       null available,
       null category,
       null subcategory,
       null description,
       null created_at,
       null updated_at
FROM ods_erp.IMG_FILE
;

CREATE
    OR REPLACE
    VIEW ods_erp.INVENTORYMOVEMENTVIEW AS
SELECT null id,
       tlf10  qty,
       tlf026 source_location_nr,
       tlf036 destination_location_nr,
       null location,
       tlf01  item_nr,
       tlf02  operate_type,
       tlf026 operate_doc_nr,
       null operate_doc_line_nr,
       tlf02  operate_doc_type,
       tlf02  origin_doc_type,
       tlf026 operate_doc_entity_nr,
       tlf07  operated_at
FROM ods_erp.TLF_FILE
;
CREATE
    OR REPLACE
    VIEW ods_erp.FORECASTVERSIONVIEW AS
SELECT null id,
       ta_opc01 nr,
       ta_opc07 status,
       ta_opc05 create_user_id,
       ta_opc02 created_at,
       null updated_at
FROM ods_erp.TA_OPC_FILE
;
CREATE
    OR REPLACE
    VIEW ods_erp.FORECASTVIEW AS
SELECT null id,
       ta_opd03 item_id,
       null location_id,
       null customer_id,
       ta_opd04 date,
       null date_type,
       null priority,
       null ratio,
       ta_opd06 normal_qty,
       null new_product_plan_qty,
       null promotion_qty,
       null status,
       null create_user_id,
       ta_opd01 version_id,
       null parsed_date,
       null created_at,
       null updated_at
FROM ods_erp.TA_OPD_FILE








