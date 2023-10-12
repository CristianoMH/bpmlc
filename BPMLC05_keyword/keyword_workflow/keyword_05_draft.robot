*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Keyword lưu nháp yêu cầu
*** Keywords ***
#-- Lưu nháp yêu cầu
[BPM] - Draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_draft}
    sleep    1