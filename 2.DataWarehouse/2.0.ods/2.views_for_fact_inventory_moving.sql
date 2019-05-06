CREATE OR REPLACE VIEW ods_erp.location_view AS
SELECT IMD01,
       IMD02,
       IMD03,
       IMD04,
       IMD05,
       IMD06,
       IMD07,
       IMD08,
       IMD09,
       IMD10,
       IMD11,
       IMD12,
       IMD13,
       IMD14,
       IMD15,
       IMDACTI,
       IMDUSER,
       IMDGRUP,
       IMDMODU,
       IMDDATE,
       IMD16,
       IMD081,
       IMD17,
       IMD18,
       IMD19,
       IMD20,
       IMD21,
       IMD211,
       IMDPOS,
       IMDORIU,
       IMDORIG,
       IMD22,
       IMD23,
       TA_IMD210
FROM ods_erp.IMD_FILE;


CREATE OR REPLACE VIEW ods_erp.item_view AS
SELECT
    #  for dm
    ima01                                                                   item_nr,
    ima06                                                                   product_group,    -- 物料组别/分群码
    ima09                                                                   product_category, -- 物料分类/其他分群码
    ima08                                                                   product_type,     -- 物料类型/来源吗
    ima07                                                                   product_usage,    -- 物料用途/ABC码
    ima54                                                                   supplier,         -- 供应源/主要供应厂商
    ima54                                                                   supplier_type,    --  供应商类型
    ima134                                                                  packaging_type,   --  包装类型/主要包装方式编号
    null                                                                    packaging_qty,    -- 包装数量
    ima25                                                                   unit,             -- 物料单位/库存单位
    case when IMA53 is null then 1.0 when IMA53 = 0.0 then 1 else ima53 end unit_price,       --  单价/最近采购单价
    null                                                                    inner_pkg,        -- 内箱
    null                                                                    outter_package,   -- 外箱
    ima37                                                                   strategy,         -- 策略/补货策略码
    #   for aps
    ima01                                                                   nr,
    ima02                                                                   name,
    null                                                                    barcode,
    ima06                                                                   type,
    null                                                                    status,
    null                                                                    plan_strategy,
    null                                                                    lock_type,
    null                                                                    lock_expire_at,
    ima07                                                                   price_abc,
    null                                                                    qty_abc,
    null                                                                    COST,
    null                                                                    SOURCE,
    null                                                                    owner_id,
    null                                                                    gross_weight,
    ima18                                                                   net_weight,
    ima25                                                                   physical_unit,
    ima021                                                                  project_nr,
    ima45                                                                   mpq,
    null                                                                    outer_package_num,
    null                                                                    pallet_num,
    null                                                                    outer_package_gross_weight,
    null                                                                    pallet_gross_weight,
    null                                                                    outer_package_volume,
    null                                                                    pallet_volume,
    null                                                                    plan_list_date,
    null                                                                    plan_delist_date,
    null                                                                    category,
    null                                                                    subcategory,
    null                                                                    description,
    null                                                                    lastmodified,
    null                                                                    created_at,
    null                                                                    updated_at,
    ima08                                                                   lym
FROM ods_erp.IMA_FILE;



CREATE OR REPLACE VIEW ods_erp.inventory_movement_view AS
SELECT
    #        for dm
    TLF01    as TLF01,    -- 異動料件編號
    TLF02    as TLF02,    -- 來源狀況,儲存發生異動的來源狀況
    TLF020   as TLF020,   -- 異動來源營運中心編號
    TLF021   as TLF021,   -- 儲存發生異動的來源倉庫別
    TLF022   as TLF022,   -- 儲存發生異動的來源儲位
    TLF023   as TLF023,   -- 批號 （庫存批號）
    TLF024   as TLF024,   -- 異動後庫存數量
    TLF025   as TLF025,   -- 異動後庫存數量單位
    TLF026   as TLF026,   -- 單據編號，儲存發生異動的來源異動單據編號
    TLF027   as TLF027,   -- 單據項次
    TLF03    as TLF03,    --  異動料件編號
    TLF030   as TLF030,   --  目的狀況,儲存發生異動的目的狀況
    TLF031   as TLF031,   -- 異動目的營運中心編號
    TLF032   as TLF032,   -- 儲存發生異動的目的倉庫別
    TLF033   as TLF033,   -- 儲存發生異動的目的儲位
    TLF034   as TLF034,   -- 批號 （庫存批號）
    TLF035   as TLF035,   -- 異動後庫存數量
    TLF036   as TLF036,   -- 異動後庫存數量單位
    TLF037   as TLF037,   -- 單據編號，儲存發生異動的目的異動單據編號
    TLF04    as TLF04,    -- 工作站
    TLF05    as TLF05,    -- 作業編號
    TLF06    as TLF06,    -- 單據扣帳日期
    TLF07    as TLF07,    --  執行扣帳日期
    TLF08    as tlf08,    -- *異動資料產生時間
    TLF09    as tlf09,    -- *異動資料發出者
    TLF10    as tlf10,    -- *異動數量
    TLF11    as tlf11,    -- *異動數量單位
    TLF12    as tlf12,    -- *異動數量單位與異動目的數量
    TLF13    as tlf13,    -- *異動命令代號
    TLF14    as tlf14,    -- *異動原因
    TLF15    as tlf15,    -- *借方會計科目
    TLF16    as tlf16,    -- *貸方會計科目
    TLF17    as tlf17,    -- *備註
    TLF18    as tlf18,    -- *異動後總庫存量
    TLF19    as tlf19,    -- *異動廠商, -- 客戶編號, -- 部門編號
    TLF20    as tlf20,    -- *專案號碼
    TLF21    as tlf21,    -- *成會異動成本
    TLF211   as tlf211,   -- *成會計算日期
    TLF212   as tlf212,   -- *成會計算時間
    #     TLF2131  as tlf2131,  -- *No Use
    #     TLF2132  as tlf2132,  -- *No Use
    #     TLF214   as tlf214,   -- *No Use
    #     TLF215   as tlf215,   -- *No Use
    #     TLF2151  as tlf2151,  -- *No Use
    #     TLF216   as tlf216,   -- *No Use
    #     TLF2171  as tlf2171,  -- *No Use
    #     TLF2172  as tlf2172,  -- *No Use
    TLF219   as tlf219,   -- *1.第二單位   2.第一單位
    TLF218   as tlf218,   -- *第二單位的rowid內容
    TLF220   as tlf220,   -- *單位  雙單位的單位
    TLF221   as tlf221,   -- *材料成本
    TLF222   as tlf222,   -- *人工成本
    TLF2231  as tlf2231,  -- *製費成本
    TLF2232  as tlf2232,  -- *加工成本
    TLF224   as tlf224,   -- *其他成本
    TLF60    as tlf60,    -- *異動單據單位對庫存單位之換
    TLF61    as tlf61,    -- *單別
    TLF62    as tlf62,    -- *工單單號
    TLF64    as tlf64,    -- *手冊編號
    TLF65    as tlf65,    -- *傳票編號
    TLF66    as tlf66,    -- *多倉出貨 Flag
    TLF901   as tlf901,   -- *成本庫別
    TLF902   as tlf902,   -- *倉庫
    TLF903   as tlf903,   -- *儲位
    TLF904   as tlf904,   -- *批號
    TLF905   as tlf905,   -- *單號
    TLF906   as tlf906,   -- *項次
    TLF907   as tlf907,   -- *入出庫碼
    TLF908   as tlf908,   -- *保稅確認否
    TLF909   as tlf909,   -- *保稅擷取否
    TLF910   as tlf910,   -- *合同擷取否
    TLF99    as tlf99,    -- *多角序號
    TLF930   as tlf930,   -- *成本中心
    TLF931   as tlf931,   -- *內部成本
    TLF151   as tlf151,   -- *借方會計科目二
    TLF161   as tlf161,   -- *貸方會計科目二
    TLF2241  as tlf2241,  -- *製費三成本
    TLF2242  as tlf2242,  -- *製費四成本
    TLF2243  as tlf2243,  -- *製費五成本
    TLFCOST  as tlfcost,  -- *類別代號(批次號,/專案號,/利潤)
    TLF41    as tlf41,    -- *WBS編碼
    TLF42    as tlf42,    -- *活動代號
    TLF43    as tlf43,    -- *理由碼
    TLF211X  as tlf211x,  -- *成會計算日期
    TLF212X  as tlf212x,  -- *成會計算時間
    TLF21X   as tlf21x,   -- *成會異動成本
    TLF221X  as tlf221x,  -- *材料成本
    TLF222X  as tlf222x,  -- *人工成本
    TLF2231X as tlf2231x, -- *製費一成本
    TLF2232X as tlf2232x, -- *加工成本
    TLF2241X as tlf2241x, -- *製費三成本
    TLF2242X as tlf2242x, -- *製費四成本
    TLF2243X as tlf2243x, -- *製費五成本
    TLF224X  as tlf224x,  -- *製費二成本
    TLF65X   as tlf65x,   -- *傳票編號
    TLFPLANT as tlfplant, -- *所屬營運中心
    TLFLEGAL as tlflegal, -- *所屬法人
    TLF27    as tlf27,    -- *被替代料號
    TLF28    as tlf28,    -- *成會分類
    TLF012   as tlf012,   -- *製程段號
    TLF013   as tlf013,   -- *製程序
    TLF920   as tlf920    -- *需立賬否
FROM ods_erp.TLF_FILE;

--  生产工单
CREATE OR REPLACE VIEW ods_erp.work_order_view AS
SELECT '' "id",
       sfb01 "nr",
       '' "location_id",
       sfb05 "item_id",
       sfb08 "qty",
       sfb09 "finished_qty",
       sfb04 "status",
       sfb81 "order_at",
       sfb13 "schedule_start_at",
       sfb25 "actual_start_at",
       '' "schedule_end_at",
       '' "actual_end_at",
       '' "delay",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.SFB_FILE;



-- 生产工单项(工单备料信息里面不包含成品的开工及完工数量，建议放在工单视图里)
-- SELECT * FROM ods_erp.WorkOrderItem
CREATE OR REPLACE VIEW ods_erp.work_order_item_view AS
SELECT '' "id",
       sfa01         "workorder_id",
       sfa03         "item_id",
       sfa05         "total_qty",
       sfa06         "delivered_qty",
       sfa05 - sfa06 "notdelivered_qty",
       '' "status",
       '' "order_at",
       '' "schedule_start_at",
       '' "actual_start_at",
       '' "schedule_end_at",
       '' "actual_end_at",
       '' "delay",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.SFA_FILE;



-- 采购订单(采购订单上的预计到达,开始发运等关于物料货运信息建议放置在采购订单明细里)
-- SELECT * FROM ods_erp.PurchaseOrderView
CREATE OR REPLACE VIEW ods_erp.purchase_order_view AS
SELECT '' "id",
       pmm01 "nr",
       '' "location_id",
       pmm09 "supplier_id",
       pmm25 "status",
       pmm04 "order_at",
       '' "schedule_arrive_at",
       '' "start_ship_at",
       '' "actual_arrive_at",
       '' "delay",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.PMM_FILE;



-- 采购订单明细
-- SELECT * FROM ods_erp.PurchaseOrderItemView
CREATE OR REPLACE VIEW ods_erp.purchase_order_item_view AS
SELECT '' "id",
       pmn02                         "line_no",
       pmn04                         "item_id",
       pmn01                         "purchase_order_id",
       '' "order_at",
       pmn20                         "qty",
       '' "open_qty",
       pmn20 - pmn50 + pmn55 + pmn58 "git_qty",
       pmn51                         "check_qty",
       pmn53                         "instock_qty",
       pmn16                         "status",
       pmn33                         "due",
       '' "schedule_arrive_at",
       '' "start_ship_at",
       '' "actual_arrive_at",
       '' "delay",
       '' "warning_delay",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.PMN_FILE;



-- 运单视图
-- SELECT * FROM ods_erp.DeliveryOrder(对应预测版本是跟物料相关联的，建议放置与运单明细)
CREATE OR REPLACE VIEW ods_erp.delivery_order_view AS
SELECT '' "id",
       imm01   "nr",
       '' "source_location_id",
       immud02 "destination_location_id",
       '' "type",
       immud02 "deliver_id",
       '' "deliver_source_id",
       imm03   "status",
       '' "schedule_arrive_at",
       '' "start_ship_at",
       '' "actual_arrive_at",
       '' "delay",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.IMM_FILE;



-- 运单项视图(建议将预测版本置于此视图.另外销售运单只是涉及调拨单，没有运输时间等信息)
-- SELECT * FROM ods_erp.DeliveryOrderItem
CREATE OR REPLACE VIEW ods_erp.delivery_order_item_view AS
SELECT '' "id",
       imn02   "line_no",
       imn03   "item_id",
       imn01   "delivery_order_id",
       imnud03 "deliver_source_id",
       imn10   "deliver_qty",
       imn10   "actual_deliver_qty",
       '' "not_deliver_qty",
       '' "git_qty",
       '' "check_qty",
       '' "instock_qty",
       '' "status",
       '' "start_ship_at",
       '' "actual_arrive_at",
       '' "delay",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.IMN_FILE;



-- 销售订单（暂时工厂内除多角贸易外，不涉及销售订单）
-- SELECT * FROM ods_erp.DemandOrderView
CREATE OR REPLACE VIEW ods_erp.demand_order_view AS
SELECT '' "id",
       oea01   "nr",
       '' "location_id",
       oea03   "destination_location_id",
       oea03   "customer_id",
       oeaconf "status",
       '' "max_lateness",
       '' "min_shipment",
       '' "category",
       '' "subcategory",
       '' "description",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.OEA_FILE;



-- 销售订单项
-- SELECT * FROM ods_erp.DemandOrderItem
CREATE OR REPLACE VIEW ods_erp.demand_order_item_view AS
SELECT '' "id",
       oeb03 "line_no",
       oeb01 "demand_order_id",
       oeb04 "item_id",
       oeb12 "qty",
       oeb12 "schedule_qty",
       '' "deliver_qty",
       '' "order_at",
       oeb16 "due",
       '' "priority",
       '' "status",
       '' "max_lateness",
       '' "min_shipment",
       '' "delay",
       '' "closed_at",
       '' "created_at",
       '' "updated_at"
FROM ods_erp.OEB_FILE;



