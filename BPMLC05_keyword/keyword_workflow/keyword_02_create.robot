*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Toàn bộ keywords tìm kiếm theo thông tin khách hàng, hạn mức, ref BCT, ref LC, ...
*** Keywords ***
#-- Maker khởi tạo yêu cầu
[BPM] - Create new request
    [BPM] - Click element    ${btn_dialog_create}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    120