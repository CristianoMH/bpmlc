*** Settings ***

Resource    ../BPMLC01_resource/import.robot

### --- Toàn bộ keyword verify yêu cầu
*** Keywords ***
#-- Xác nhận đóng yêu cầu thành công
[BPM] - Verify close request
    [Documentation]    Search request by request code and verify status of request display on screen
    [Arguments]    ${locator_tray}    ${request_code}    ${status}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${locator_tray}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${request_code}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_dahoanthanh_status}    ${status}
    sleep    10

#-- Xác nhận hủy yêu cầu thành công
[BPM] - Verify cancel request
    [Documentation]    Search request by request code and verify request not display on screen
    [Arguments]    ${locator_tray}    ${request_code}    ${locator_request}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${locator_tray}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${request_code}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify page should not contain element    ${locator_request}
    sleep    5

#-- Xác nhận lưu nháp yêu cầu thành công
[BPM] - Verify draft request
    [Documentation]    Search request by request code and verify status of request display on screen
    [Arguments]    ${locator_tray}    ${request_code}    ${locator_status}    ${status}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${sidebar_minimizer}
    sleep    1
    [BPM] - Click element    ${locator_tray}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_tfodangxuly_status}    ${status}
    sleep    5

#-- Xác nhận gửi trả yêu cầu thành công
[BPM] - Verify rollback request
    [Documentation]    Search request by request code and verify page should contains request on table
    [Arguments]    ${locator_tray}    ${request_code}    ${locator_request}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${locator_tray}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${request_code}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify page should contain element    ${locator_request}
    sleep    5

    