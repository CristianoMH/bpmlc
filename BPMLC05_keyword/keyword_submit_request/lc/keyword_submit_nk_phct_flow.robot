*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword chuyển duyệt yêu cầu
*** Keywords ***
#-- Maker gửi yêu cầu phát hành chính thức chưa phát hành nháp
[phct] - Maker send request
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${btn_draft}    20
    [BPM] - Click element    ${btn_draft}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${btn_send}    20
    [BPM] - Click element    ${btn_send}
    sleep    3
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    sleep    15

#-- TFO nhập dữ liệu hợp lệ phát hành chính thức chưa phát hành nháp
[phct] - TFO input data
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tray_tfo_dangxuly}    20
    [BPM] - Click element    ${tray_tfo_dangxuly}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tb_quicksearch}    20
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_0}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Input text into textbox    ${tb_swift}    ABBKVNVX
    sleep    3
    [BPM] - Click element   ${button_check_rma}    
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${btn_next}    20
    [BPM] - Click element    ${btn_next}
    sleep    1

#-- TFO gửi yêu cầu phát hành chính thức chưa phát hành nháp
[phct] - TFO send request
    [BPM] - Wait for element to appear on page    ${tb_refLc}    20
    [BPM] - Input text into textbox    ${tb_refLc}    ${requestCode_pType_0}
    sleep    2
    [BPM] - Wait for element to appear on page    ${btn_approve}
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    15

#-- TFO đóng yêu cầu phát hành chính thức chưa phát hành nháp
[phct] - TFO close request
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tray_bpm_ops}    20
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    2
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    2
    [Common] - Wait for element not to appear on page    ${loading_page}    60    
    [BPM] - Wait for element to appear on page    ${tray_tfo_dahoanthanh}    20
    [BPM] - Click element    ${tray_tfo_dahoanthanh}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tb_quicksearch}    20
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_0}
    sleep    3
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Click element    ${btn_next}
    sleep    1
    [BPM] - Click element    ${btn_next}
    sleep    1
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    15

#-- TFS gửi yêu cầu phát hành chính thức chưa phát hành nháp
[phct] - TFS send request
    [BPM] - Wait for element to appear on page    ${btn_approve}
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    30

#-- TFS nhập dữ liệu hợp lệ phát hành chính thức chưa phát hành nháp
[phct] - TFS input data
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tray_tfs_dangxuly}    5
    [BPM] - Click element    ${tray_tfs_dangxuly}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_0}
    sleep    2
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Click element    ${btn_next}
    sleep    2

#-- TFO xác nhận đóng yêu cầu phát hành chính thức chưa phát hành nháp
[phct] - TFO verify request
    [BPM] - Wait for element to appear on page    ${tray_tfo_dahoanthanh}
    [BPM] - Click element    ${tray_tfo_dahoanthanh}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_0}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_status}    Đóng