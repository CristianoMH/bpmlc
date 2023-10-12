*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Keyword hủy yêu cầu
*** Keywords ***
#-- Hủy yêu cầu
[BPM] - Cancel request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_cancel}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    1