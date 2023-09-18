*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#-- Toàn bộ keywords liên quan đến khay của BPM
*** Keywords ***

#-- Mở khay Maker đang xử lý
[tray] - Open tray Maker dang xu ly
    [BPM] - Wait for element to appear on page    ${tray_bpm_ops}    20
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1    
    [BPM] - Click element    ${tray_maker_dangxuly}
    sleep    4

#-- Maker chọn yêu cầu Phát hành LC nháp lần đầu
[tray][phnhap] - Maker choose request
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${btn_create}    20
    [BPM] - Click element    ${btn_create}    
    sleep    1
    [BPM] - Click element    ${radioBtn_lc}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create}
    sleep    1
    [BPM] - Click element    ${btn_dialog_lcnk}
    sleep    1
    [BPM] - Click element    ${btn_dialog_phat_hanh}
    sleep    1
    [BPM] - Click element    ${radiobtn_dialog_50}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create_2}
    sleep    1

#-- Maker chọn yêu cầu Phát hành chính thức chưa phát hành nháp
[tray][phct] - Maker choose request
    [BPM] - Wait for element to appear on page    ${btn_create}    20
    [BPM] - Click element    ${btn_create}    
    sleep    1
    [BPM] - Click element    ${radioBtn_lc}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create}
    sleep    1
    [BPM] - Click element    ${btn_dialog_lcnk}
    sleep    1
    [BPM] - Click element    ${btn_dialog_phat_hanh}
    sleep    1
    [BPM] - Click element    ${radiobtn_dialog_0}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create_2}
    sleep    1

#-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ phát hành nháp lần đầu
[tray][phnhap] - TFO pick up request
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tray_tfo_choxuly}
    [BPM] - Click element    ${tray_tfo_choxuly}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    Open context menu   ${col_bpmid}    
    sleep    1
    [BPM] - Click element    ${btn_pickup}
    sleep    5

#-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ phát hành chính thức chưa phát hành nháp
[tray][phct] - TFO pick up request
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tray_bpm_ops}    20
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1
    [Common] - Wait for element not to appear on page    ${loading_page}    60    
    [BPM] - Wait for element to appear on page    ${tray_tfo_choxuly}
    [BPM] - Click element    ${tray_tfo_choxuly}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_0}
    sleep    2
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    5
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${col_bpmid}    20
    Open context menu   ${col_bpmid}
    sleep    1
    [BPM] - Click element    ${btn_pickup}
    sleep    5

#-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ phát hành chính thức chưa phát hành nháp
[tray][phct] - TFS pick up request
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Wait for element to appear on page    ${tray_bpm_ops}    20
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1
    [Common] - Wait for element not to appear on page    ${loading_page}    60    
    [BPM] - Wait for element to appear on page    ${tray_tfs_choxuly}
    [BPM] - Click element    ${tray_tfs_choxuly}
    sleep    3
    [Common] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_0}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    Open context menu   ${col_bpmid}    
    sleep    1
    [BPM] - Click element    ${btn_pickup}
    sleep    5