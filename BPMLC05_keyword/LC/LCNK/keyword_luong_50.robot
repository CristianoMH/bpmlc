*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- All keywords of header part
*** Keywords ***

#-- Maker tạo yêu cầu
Maker create request
    [Common] - Input text into textbox    ${tb_cif}    ${data_cif}
    sleep    1
    [Common] - Click element    ${btn_search_1}
    sleep    1
    [Common] - Click element    ${radioBtn_cif}
    sleep    1
    [Common] - Click element    ${btn_dialog_create}
    sleep    5
    ${requestCode}     get text    ${label_requestcode}
    [Common] - Set test variable    name=requestCode_pType_50    value=${requestCode}

#-- Maker nhập dữ liệu hợp lệ
Maker input data
    [Common] - Wait for element to appear on page    ${btn_expand}
    [Common] - Click element    ${btn_expand}
    sleep    3
    [Common] - Input text into textbox    ${tb_lcValue}    1234.56
    sleep    3
    [Common] - Click element    ${droplist_sponsorBank}
    sleep    1
    [Common] - Click element    //li[@aria-label='ADCB']
    sleep    1
    [Common] - Click element    ${btn_draft}
    sleep    3
    [Common] - Click element    ${btn_next}
    sleep    2

#-- Maker upload hồ sơ trong Danh mục hồ sơ
Maker upload file
    Wait Until Element Is Visible    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//a    20s
    Choose file    ${icon_upload_1}   ${CURDIR}${/}file_test${/}test01.docx
    sleep    3
    Wait Until Element Is Visible    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//a    20s
    Choose file    ${icon_upload_2}   ${CURDIR}${/}file_test${/}test02.docx
    sleep    3
    Wait Until Element Is Visible    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//a    20s
    Choose file    ${icon_upload_3}   ${CURDIR}${/}file_test${/}test03.docx
    sleep    3
    
#-- Maker gửi yêu cầu
Maker send request
    [Common] - Wait for element to appear on page    ${btn_draft}
    [Common] - Click element    ${btn_draft}
    sleep    3
    [Common] - Click element    ${btn_send}
    sleep    3
    # [Common] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [Common] - Click element    ${btn_submit}
    sleep    10

#-- TFO nhập dữ liệu hợp lệ
TFO input data
    [Common] - Wait for element to appear on page    ${tray_tfo_dangxuly}
    [Common] - Click element    ${tray_tfo_dangxuly}
    sleep    3
    [Common] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [Common] - Click element   ${col_bpmid}    
    sleep    3
    [Common] - Click element    ${btn_expand}
    sleep    3
    [Common] - Input text into textbox    ${tb_swift}    ABBKVNVX
    sleep    1
    [Common] - Click element   ${button_check_rma}    
    sleep    1
    [Common] - Click element    ${btn_next}
    sleep    1    

#-- TFO upload hồ sơ trong Danh mục hồ sơ
TFO upload file
    [Common] - Click element    ${btn_next}
    sleep    3

#-- TFO gửi yêu cầu
TFO send request
    [Common] - Click element    ${btn_approve}
    sleep    1
    [Common] - Click element    ${btn_accept}
    sleep    5  

#-- Assert data
Maker verify data
    [Common] - Wait for element to appear on page    ${tray_maker_dahoanthanh}
    [Common] - Click element    ${tray_maker_dahoanthanh}
    sleep    3
    [Common] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_50}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Common] - Verify element should contain text    ${col_status}    Đóng

    