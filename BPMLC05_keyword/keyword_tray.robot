*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#-- Toàn bộ keywords liên quan đến khay của BPM
*** Keywords ***

#-- Mở khay Maker đang xử lý
Open tray Maker dang xu ly
    [Common] - Wait for element to appear on page    ${tray_bpm_ops}
    [Common] - Click element    ${tray_bpm_ops}
    sleep    1
    [Common] - Click element    ${tray_bpm_ops_new}
    sleep    1    
    [Common] - Click element    ${tray_maker_dangxuly}
    sleep    4

#-- Maker chọn yêu cầu Phát hành LC nháp
Maker choose request: productType = 50
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


