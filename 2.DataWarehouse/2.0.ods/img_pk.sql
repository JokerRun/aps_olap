SELECT IMG01, IMG02, COUNT(1)
from ods_erp.IMG_FILE
GROUP BY IMG01, IMG02
HAVING count(1) > 1
;

# img01       varchar2(40) NOT NULL,   /*料件編號                               */
#                                      /*儲存存放地點的料件編號                 */
# img02       varchar2(10) NOT NULL,   /*倉庫編號                               */
#                                      /*儲存料件所在之倉庫編號                 */
# img03       varchar2(10) NOT NULL,   /*儲位                                   */
#                                      /*儲存料件所在之儲位                     */
# img04       varchar2(24) NOT NULL,   /*批號                                   */
#                                      /*批號(進貨)                             */
#                                      /*儲存料件所在之進貨批號                 */

select *
from ods_erp.IMG_FILE where IMG01 in ('40100200001', '4016050073', '4016050082', '4116010005', '4116680002', '4126020165', '9ABC110A004', '9ABC110A004', '9ABC110A005', '9ABC110A005', 'P2036010225');

