SELECT
    #        for dm
    TLF01    as 異動料件編號,    -- 異動料件編號
    TLF02    as 來源,    -- 來源狀況,儲存發生異動的來源狀況
    TLF020   as 異動來源營運中心編號,   -- 異動來源營運中心編號
    TLF021   as 來源倉庫,   -- 儲存發生異動的來源倉庫別
    TLF022   as 儲存發生異動的來源儲位,   -- 儲存發生異動的來源儲位
    TLF023   as 來源批號,   -- 批號 （庫存批號）
    TLF024   as 異動後庫存,   -- 異動後庫存數量
    TLF025   as 異動後庫存數量單位,   -- 異動後庫存數量單位
    TLF026   as 來源異動單據編號,   -- 單據編號，儲存發生異動的來源異動單據編號
    TLF027   as 來源異動單據項次,   -- 單據項次
    TLF03    as 目的,    --  目的狀況,儲存發生異動的目的狀況
    TLF030   as 異動目的營運中心編號,   -- 異動目的營運中心編號
    TLF031   as 目的倉庫,   -- 儲存發生異動的目的倉庫別
    TLF032   as 目的儲位,   -- 儲存發生異動的目的儲位
    TLF033   as 目的批號,   -- 批號 （庫存批號）
    TLF034   as 異動後庫存數,   -- 異動後庫存數量
    TLF035   as 數量單位,   -- 異動後庫存數量單位
    TLF036   as 目的異動單據編號,   -- 單據編號，儲存發生異動的目的異動單據編號
    TLF037   as 目的異動單據項次,   -- 單據項次
    TLF04    as 工作站,    -- 工作站
#     TLF05    as TLF05,    -- 作業編號
#     TLF06    as TLF06,    -- 單據扣帳日期
#     TLF07    as TLF07,    -- 執行扣帳日期
#     TLF08    as tlf08,    -- 異動資料產生時間
#     TLF09    as tlf09,    -- 異動資料發出者
    TLF10    as 異動數量,    -- 異動數量
    TLF11    as tlf11,    -- 異動數量單位
    TLF12    as tlf12,    -- 異動數量單位與異動目的數量
    TLF13    as tlf13,    -- 異動命令代號
    TLF14    as tlf14,    -- 異動原因
#     TLF15    as tlf15,    -- 借方會計科目
#     TLF16    as tlf16,    -- 貸方會計科目
    TLF17    as tlf17,    -- 備註
    TLF18    as tlf18,    -- 異動後總庫存量
    TLF19    as tlf19,    -- 異動廠商, -- 客戶編號, -- 部門編號
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
    TLF907   as tlf907,   -- *入出庫碼
    TLF43    as tlf43,    -- 理由碼
    TLFPLANT as tlfplant, -- *所屬營運中心
    TLFLEGAL as tlflegal, -- *所屬法人
    TLF013   as tlf013    -- 製程序
FROM ods_erp.TLF_FILE;
