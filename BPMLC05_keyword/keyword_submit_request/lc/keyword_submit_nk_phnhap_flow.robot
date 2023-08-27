*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword chuyển duyệt yêu cầu
*** Keywords ***
#-- TFO nhập dữ liệu hợp lệ phát hành nháp lần đầu
[phnhap] - TFO input data
    [Common] - Wait for element to appear on page    ${tray_tfo_dangxuly}
    [Common] - Click element    ${tray_tfo_dangxuly}
    sleep    3
    [Common] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [Common] - Click element   ${col_bpmid}    
    sleep    3
    [Common] - Click element    ${btn_expand}
    sleep    3
    [Common] - Input text into textbox    ${tb_swift}    ABBKVNVX
    sleep    1
    [Common] - Click element   ${button_check_rma}    
    sleep    1
    [Common] - Click element    ${btn_next}
    sleep    1    

#-- TFO gửi yêu cầu phát hành nháp lần đầu
[phnhap] - TFO send request
    [Common] - Click element    ${btn_approve}
    sleep    1
    [Common] - Click element    ${btn_accept}
    sleep    5  

#-- Maker xác nhận đóng yêu cầu phát hành nháp lần đầu thành công
[phnhap] - Maker verify request
    [Common] - Wait for element to appear on page    ${tray_maker_dahoanthanh}
    [Common] - Click element    ${tray_maker_dahoanthanh}
    sleep    3
    [Common] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Common] - Verify element should contain text    ${col_status}    Đóng