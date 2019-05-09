drop table if exists stage_area.stage_inventory_movement;
create table stage_area.stage_inventory_movement as
SELECT
    #        for dm
    TLF01     as item_nr,             -- 異動料件編號
    #     TLF02    as 來源,    -- 來源狀況,來源狀況
    'outbound' as operate_type,
    #     TLF020   as 異動來源營運中心編號,   -- 異動來源營運中心編號
    TLF021    as location_nr,         -- 來源倉庫別
    TLF022    as storage_location,    -- 來源儲位
    TLF023    as batchnr,             -- 批號 （庫存批號）
    #     TLF024   as 異動後來源庫存數量,   -- 異動後庫存數量
    #     TLF025   as 異動後來源庫存數量單位,   -- 異動後庫存數量單位
    TLF026    as operate_doc_nr,      -- 單據編號，來源異動單據編號
    TLF027    as operate_doc_line,    -- 單據項次
    #     TLF03    as 目的,    --  目的狀況,目的狀況
    #     TLF030   as 異動目的營運中心編號,   -- 異動目的營運中心編號
    #     TLF031   as 目的倉庫,   -- 目的倉庫別
    #     TLF032   as 目的儲位,   -- 目的儲位
    #     TLF033   as 目的批號,   -- 批號 （庫存批號）
    #     TLF034   as 異動後目的庫存數,   -- 異動後庫存數量
    #     TLF035   as 異動後目的庫存數量單位,   -- 異動後庫存數量單位
    #     TLF036   as 目的異動單據編號,   -- 單據編號，目的異動單據編號
    #     TLF037   as 目的異動單據項次,   -- 單據項次
    #     TLF04    as 工作站,    -- 工作站
    #     TLF05    as 作業編號,    -- 作業編號
    #     TLF06    as TLF06,    -- 單據扣帳日期
    #     TLF07    as TLF07,    -- 執行扣帳日期
    #     TLF08    as tlf08,    -- 異動資料產生時間
    #     TLF09    as tlf09,    -- 異動資料發出者
    TLF10     as movement_amount,     -- 異動數量
    TLF11     as movement_unit,       -- 異動數量單位
    #     TLF12    as 異動數量單位與異動目的數量,    -- 異動數量單位與異動目的數量
    #     TLF13    as 異動命令代號,    -- 異動命令代號
    #     TLF14    as 異動原因,    -- 異動原因
    #     TLF15    as tlf15,    -- 借方會計科目
    #     TLF16    as tlf16,    -- 貸方會計科目
    TLF17     as describsion,         -- 備註
    #     TLF18    as 異動後總庫存量,    -- 異動後總庫存量
    TLF19     as movement_department, -- 異動廠商, -- 客戶編號, -- 部門編號
    #     TLF20    as tlf20,    -- 專案號碼
    #     TLF21    as tlf21,    -- 成會異動成本
    #     TLF211   as tlf211,   -- 成會計算日期
    #     TLF212   as tlf212,   -- 成會計算時間
    #     TLF219   as tlf219,   -- 1.第二單位   2.第一單位
    #     TLF218   as tlf218,   -- 第二單位的rowid內容
    #     TLF220   as tlf220,   -- 單位  雙單位的單位
    #     TLF221   as tlf221,   -- 材料成本
    #     TLF222   as tlf222,   -- 人工成本
    #     TLF2231  as tlf2231,  -- 製費成本
    #     TLF2232  as tlf2232,  -- 加工成本
    #     TLF224   as tlf224,   -- 其他成本
    #     TLF60    as tlf60,    -- 異動單據單位對庫存單位之換
    #     TLF61    as tlf61,    -- *單別
    #     TLF62    as tlf62,    -- 工單單號
    #     TLF64    as tlf64,    -- 手冊編號
    #     TLF65    as tlf65,    -- 傳票編號
    #     TLF66    as tlf66,    -- 多倉出貨 Flag
    #     TLF901   as tlf901,   -- *成本庫別
    #     TLF902   as tlf902,   -- *倉庫
    #     TLF903   as tlf903,   -- *儲位
    #     TLF904   as tlf904,   -- *批號
    #     TLF905   as tlf905,   -- *單號
    #     TLF906   as tlf906,   -- *項次
    TLF907    as movement_code,       -- *入出庫碼
    TLF43     as reason_code,         -- 理由碼
    TLFPLANT  as movement_org         -- *所屬營運中心
    #     TLFLEGAL as 所屬法人, -- *所屬法人
    #     TLF013   as 製程序    -- 製程序
FROM ods_erp.TLF_FILE
where TLF02 = 50
union
(SELECT
     #        for dm
     TLF01     as item_nr,             -- 異動料件編號
     #     TLF02    as 來源,    -- 來源狀況,來源狀況
     'inbound' as operate_type,
     #     TLF020   as 異動來源營運中心編號,   -- 異動來源營運中心編號
     TLF031    as location_nr,         -- 來源倉庫別
     TLF032    as storage_location,    -- 來源儲位
     TLF033    as batchnr,             -- 批號 （庫存批號）
     #     TLF024   as 異動後來源庫存數量,   -- 異動後庫存數量
     #     TLF025   as 異動後來源庫存數量單位,   -- 異動後庫存數量單位
     TLF036    as operate_doc_nr,      -- 單據編號，來源異動單據編號
     TLF037    as operate_doc_line,    -- 單據項次
     #     TLF03    as 目的,    --  目的狀況,目的狀況
     #     TLF030   as 異動目的營運中心編號,   -- 異動目的營運中心編號
     #     TLF031   as 目的倉庫,   -- 目的倉庫別
     #     TLF032   as 目的儲位,   -- 目的儲位
     #     TLF033   as 目的批號,   -- 批號 （庫存批號）
     #     TLF034   as 異動後目的庫存數,   -- 異動後庫存數量
     #     TLF035   as 異動後目的庫存數量單位,   -- 異動後庫存數量單位
     #     TLF036   as 目的異動單據編號,   -- 單據編號，目的異動單據編號
     #     TLF037   as 目的異動單據項次,   -- 單據項次
     #     TLF04    as 工作站,    -- 工作站
     #     TLF05    as 作業編號,    -- 作業編號
     #     TLF06    as TLF06,    -- 單據扣帳日期
     #     TLF07    as TLF07,    -- 執行扣帳日期
     #     TLF08    as tlf08,    -- 異動資料產生時間
     #     TLF09    as tlf09,    -- 異動資料發出者
     TLF10     as movement_amount,     -- 異動數量
     TLF11     as movement_unit,       -- 異動數量單位
     #     TLF12    as 異動數量單位與異動目的數量,    -- 異動數量單位與異動目的數量
     #     TLF13    as 異動命令代號,    -- 異動命令代號
     #     TLF14    as 異動原因,    -- 異動原因
     #     TLF15    as tlf15,    -- 借方會計科目
     #     TLF16    as tlf16,    -- 貸方會計科目
     TLF17     as describsion,         -- 備註
     #     TLF18    as 異動後總庫存量,    -- 異動後總庫存量
     TLF19     as movement_department, -- 異動廠商, -- 客戶編號, -- 部門編號
     #     TLF20    as tlf20,    -- 專案號碼
     #     TLF21    as tlf21,    -- 成會異動成本
     #     TLF211   as tlf211,   -- 成會計算日期
     #     TLF212   as tlf212,   -- 成會計算時間
     #     TLF219   as tlf219,   -- 1.第二單位   2.第一單位
     #     TLF218   as tlf218,   -- 第二單位的rowid內容
     #     TLF220   as tlf220,   -- 單位  雙單位的單位
     #     TLF221   as tlf221,   -- 材料成本
     #     TLF222   as tlf222,   -- 人工成本
     #     TLF2231  as tlf2231,  -- 製費成本
     #     TLF2232  as tlf2232,  -- 加工成本
     #     TLF224   as tlf224,   -- 其他成本
     #     TLF60    as tlf60,    -- 異動單據單位對庫存單位之換
     #     TLF61    as tlf61,    -- *單別
     #     TLF62    as tlf62,    -- 工單單號
     #     TLF64    as tlf64,    -- 手冊編號
     #     TLF65    as tlf65,    -- 傳票編號
     #     TLF66    as tlf66,    -- 多倉出貨 Flag
     #     TLF901   as tlf901,   -- *成本庫別
     #     TLF902   as tlf902,   -- *倉庫
     #     TLF903   as tlf903,   -- *儲位
     #     TLF904   as tlf904,   -- *批號
     #     TLF905   as tlf905,   -- *單號
     #     TLF906   as tlf906,   -- *項次
     TLF907    as movement_code,       -- *入出庫碼
     TLF43     as reason_code,         -- 理由碼
     TLFPLANT  as movement_org         -- *所屬營運中心
     #     TLFLEGAL as 所屬法人, -- *所屬法人
     #     TLF013   as 製程序    -- 製程序
 FROM ods_erp.TLF_FILE
 where TLF03 = 50)
;

# and
#       tlf03 in(50)
;
# 采购类： 采购项全部到检验区，委外加工、工单来源会到FQC或直接入库
select TLF02, TLF03, count(1)
from ods_erp.TLF_FILE
where TLF02 in (10, 11, 14, 16, 60)
group by TLF02, TLF03;


# 入库单来源（20检验去 25FQC 60工单/委外加工 90杂项 99 731销单销退入库）
select TLF02, TLF03, count(1)
from ods_erp.TLF_FILE
where TLF03 in (50)
group by TLF02, TLF03;


# 出库单去向（31退货补货 40报废 60工单 90杂项 99 724销单出貨項次新增）
select TLF02, TLF03, count(1)
from ods_erp.TLF_FILE
where TLF02 in (50)
group by TLF02, TLF03;

