*** Settings ***

Resource    ../BPMLC01_resource/import.robot

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

#-- Maker nhập dữ liệu hợp lệ
Maker input data
    [Common] - Wait for element to appear on page    ${btn_expand}
    [Common] - Click element    ${btn_expand}
    sleep    3
    [Common] - Input text into textbox    ${tb_lcValue}    10000.00
    sleep    1
    [Common] - Click element    ${droplist_sponsorBank}
    sleep    1
    [Common] - Click element    //li[@aria-label='ADCB']
    sleep    1
    [Common] - Click element    ${btn_next}
    sleep    1

#-- Maker upload hồ sơ trong Danh mục hồ sơ
Maker upload file
    [Common] - Click element    ${icon_upload_1}
    sleep    1
    log to console    ----------${CURDIR}${/}test01.docx
    Choose file    ${icon_upload_1}    ${CURDIR}${/}test01.docx

#-- Maker gửi yêu cầu
Maker send request

#-- Assert data
Maker verify data