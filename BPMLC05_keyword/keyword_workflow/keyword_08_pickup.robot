*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Keyword gắp hồ sơ về khay chung
*** Keywords ***
#-- Mở khay chung và gắp hồ sơ về khay cá nhân
[BPM] - Pick up request
    [Documentation]    User pick up request from common tray with params: locators of common tray and request code
    [Arguments]     ${locator_common_tray}    ${request_code}
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    60    
    [BPM] - Click element    ${locator_common_tray}
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${request_code}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    Open context menu   ${col_bpmid}    
    sleep    1
    [BPM] - Click element    ${btn_pickup}
    sleep    1
    
