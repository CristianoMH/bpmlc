*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword chuyển duyệt yêu cầu
*** Keywords ***
#-- Maker gửi yêu cầu phát hành chính thức chưa phát hành nháp
[phct] - Maker send request
    [BPM] - Wait for element to appear on page    ${btn_draft}
    [BPM] - Click element    ${btn_draft}
    sleep    3
    [BPM] - Click element    ${btn_send}
    sleep    3
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    sleep    15