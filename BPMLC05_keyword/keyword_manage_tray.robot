*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#-- Toàn bộ keywords liên quan đến khay của BPM
*** Keywords ***

#-- Mở khay Maker đang xử lý
[tray] - Open tray Maker dang xu ly
    [Common] - Wait for element to appear on page    ${tray_bpm_ops}
    [Common] - Click element    ${tray_bpm_ops}
    sleep    1
    [Common] - Click element    ${tray_bpm_ops_new}
    sleep    1    
    [Common] - Click element    ${tray_maker_dangxuly}
    sleep    4

#-- Maker chọn yêu cầu Phát hành LC nháp lần đầu
[tray] - Maker choose request: productType = 50
    [Common] - Wait for element to appear on page    ${btn_create}
    [Common] - Click element    ${btn_create}    
    sleep    1
    [Common] - Click element    ${radioBtn_lc}
    sleep    1
    [Common] - Click element    ${btn_dialog_create}
    sleep    1
    [Common] - Click element    ${btn_dialog_lcnk}
    sleep    1
    [Common] - Click element    ${btn_dialog_phat_hanh}
    sleep    1
    [Common] - Click element    ${radiobtn_dialog_50}
    sleep    1
    [Common] - Click element    ${btn_dialog_create_2}
    sleep    1

#-- Mở khay TFO chờ xử lý
[tray] - TFO pick up request
    [Common] - Wait for element to appear on page    ${tray_tfo_choxuly}
    [Common] - Click element    ${tray_tfo_choxuly}
    sleep    3
    [Common] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    Open context menu   ${col_bpmid}    
    sleep    1
    [Common] - Click element    ${btn_pickup}
    sleep    5

