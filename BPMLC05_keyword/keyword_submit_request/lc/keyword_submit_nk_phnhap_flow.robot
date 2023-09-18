*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword chuyển duyệt yêu cầu
*** Keywords ***
#-- Maker gửi yêu cầu phát hành nháp lần đầu
[phnhap] - Maker send request
    [BPM] - Wait for element to appear on page    ${btn_draft}
    [BPM] - Click element    ${btn_draft}
    sleep    3
    [BPM] - Click element    ${btn_send}
    sleep    3
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    sleep    15
    
#-- TFO nhập dữ liệu hợp lệ phát hành nháp lần đầu
[phnhap] - TFO input data
    [BPM] - Wait for element to appear on page    ${tray_tfo_dangxuly}
    [BPM] - Click element    ${tray_tfo_dangxuly}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Input text into textbox    ${tb_swift}    ABBKVNVX
    sleep    1
    [BPM] - Click element   ${button_check_rma}    
    sleep    1
    [BPM] - Click element    ${btn_next}
    sleep    1    

#-- TFO gửi yêu cầu phát hành nháp lần đầu
[phnhap] - TFO send request
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    5  

#-- Maker xác nhận đóng yêu cầu phát hành nháp lần đầu thành công
[phnhap] - Maker verify request
    [BPM] - Wait for element to appear on page    ${tray_maker_dahoanthanh}
    [BPM] - Click element    ${tray_maker_dahoanthanh}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_status}    Đóng