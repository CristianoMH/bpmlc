*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword chuyển bước theo role
*** Keywords ***
#-- Maker gửi yêu cầu
[BPM][Maker] - Send request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_send}
    sleep    1
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    sleep    1

#-- TFO/TFS gửi yêu cầu
[BPM][TFO/TFS] - Send request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    15

#-- TFO đóng yêu cầu
[BPM][TFO] - Close request
    [BPM] - Open detail request    ${tray_tfo_dahoanthanh}    ${requestCode_pType_53}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Click element    ${btn_next}
    sleep    1
    [BPM] - Click element    ${btn_next}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    15