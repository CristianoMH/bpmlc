*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#- Toàn bộ keywords liên quan đến đi luồng
*** Keywords ***
#------------------------------------------------------- Search -----------------------------------------------------------------#
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

#------------------------------------------------------- Create -----------------------------------------------------------------#
#-- Maker khởi tạo yêu cầu
[BPM] - Create new request
    [BPM] - Click element    ${btn_dialog_create}
    sleep    3

#------------------------------------------------------- Submit -----------------------------------------------------------------#

#-- Maker gửi yêu cầu
[BPM][Maker] - Send request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${tab_checklist}
    sleep    1
    [BPM] - Click element    ${btn_send}
    sleep    1
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    sleep    1

#-- Maker gửi lại yêu cầu do TFO/TFS trả về
[BPM][Maker] - Send back request
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1
    [BPM] - Open detail request    ${tray_maker_dangxuly}    ${requestCode_pType_53}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Close rollback pop-up
    sleep    1
    [BPM] - Click element    ${tab_checklist}
    sleep    1
    [BPM] - Click element    ${btn_send}
    sleep    1
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    sleep    1

#-- TFO/TFS gửi yêu cầu
[BPM][TFO/TFS] - Send request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${tab_hosoLC}
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    15

#-- Maker gửi lại yêu cầu do TFO/TFS trả về
[BPM][TFO/TFS] - Send back request
    [Documentation]    Rollback request
    [Arguments]     ${locator_tray}    ${request_code}    ${isRollback}
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1
    [BPM] - Open detail request    ${locator_tray}    ${request_code}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    Run Keyword If   '${isRollback}' == ${true}    [BPM] - Close rollback pop-up
    [BPM] - Click element    ${tab_hosoLC}
    sleep    1
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    15

#-- TFO đóng yêu cầu
[BPM][TFO] - Close request
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    60
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    1
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

#------------------------------------------------------- Rollback -----------------------------------------------------------------#
#-- Gửi trả yêu cầu
[BPM] - Rollback request
    [Documentation]    Rollback request
    [Arguments]     ${rollbackTo}
    [BPM] - Click element    ${btn_rollback}
    sleep    1
    Run Keyword If   '${rollbackTo}' == ${true}    Run Keywords
    ...    [BPM] - Click element    ${droplist_rollbackto_tfo}
    ...    [BPM] - Click element    ${data_rollbackto_maker}
    [BPM] - Click element    ${droplist_rollback_reason}
    sleep    1
    [BPM] - Click element    ${data_reasonrollback_TTTTKTK}
    sleep    1
    [BPM] - Click element    ${btn_close_popup_rollback}
    sleep    1        
    [BPM] - Input text into textbox    ${textarea_rollback_content}    ${data_contentrollback}
    sleep    2
    [BPM] - Click element    ${btn_dialog_rollback}

#------------------------------------------------------- Draft -----------------------------------------------------------------#
#-- Lưu nháp yêu cầu
[BPM] - Draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_draft}
    sleep    1

#------------------------------------------------------- Cancel -----------------------------------------------------------------#
#-- Hủy yêu cầu
[BPM] - Cancel request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_cancel}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    1

#------------------------------------------------------- getDetail -----------------------------------------------------------------#
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

#------------------------------------------------------- Pickup -----------------------------------------------------------------#
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

#------------------------------------------------------- Close Rollback Pop-up -----------------------------------------------------------------#
[BPM] - Close rollback pop-up
    [Documentation]    Close rollback pop-up
    [BPM] - Wait for element to appear on page    ${popup_rollback}    120
    [BPM] - Click element    ${btn_close}