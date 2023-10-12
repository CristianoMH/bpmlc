*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Keyword gắp hồ sơ về khay chung
*** Keywords ***
#-- Vào khay và xem chi tiết hồ sơ
[BPM] - Open detail request
    [Documentation]    User open detail request from individual tray with params: locators of individual tray and request code
    [Arguments]     ${locator_tray}    ${request_code}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${locator_tray}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${request_code}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element   ${col_bpmid}    
    sleep    3