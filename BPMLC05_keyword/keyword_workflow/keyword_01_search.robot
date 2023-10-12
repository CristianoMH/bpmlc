*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Toàn bộ keywords tìm kiếm theo thông tin khách hàng, hạn mức, ref BCT, ref LC, ...
*** Keywords ***
#-- Maker chọn yêu cầu để khởi tạo
[BPM] - Choose request type to create
    [Documentation]    User choose request type following module, business, flow and sub_flow   
    [Arguments]     ${locator_module}    ${locator_business}    ${locator_flow}    ${locator_sub_flow}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    Wait Until Element Is Not Visible    ${div_alert}    60    
    [Common] - Refresh Page Until Page Contains Element    ${tray_bpm_ops}
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [BPM] - Click element    ${tray_bpm_ops_new} 
    sleep    1
    [BPM] - Click element    ${tray_maker_dangxuly}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_create}
    sleep    1 
    [BPM] - Click element    ${radioBtn_lc}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create}
    sleep    1
    [BPM] - Click element    ${locator_module}
    sleep    1
    [BPM] - Click element    ${locator_business}
    sleep    1
    [BPM] - Click element    ${locator_flow}
    sleep    1
    [BPM] - Click element    ${locator_sub_flow}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create_2}
    sleep    1

#-- Maker tìm kiếm yêu cầu theo hạn mức
[BPM] - Search customer limit following cif code
    [Documentation]    Search customer limit following cif code and select valid limit
    [Arguments]     ${cif}    ${locator_limit}
    [BPM] - Refresh Page Until Page Contains Element    ${tb_cif}
    [BPM] - Input text into textbox    ${tb_cif}    ${cif}
    sleep    1    
    [BPM] - Click element    ${btn_search_1}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${locator_limit}
    sleep    1

#-- Maker tìm kiếm yêu cầu theo thông tin khách hàng

#-- Maker tìm kiếm yêu cầu theo ref BCT

#-- Maker tìm kiếm yêu cầu theo ref LC