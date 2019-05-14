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
