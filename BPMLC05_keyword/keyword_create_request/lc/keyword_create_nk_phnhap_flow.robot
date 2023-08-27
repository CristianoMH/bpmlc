*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword khởi tạo yêu cầu
*** Keywords ***

#-- Maker tạo yêu cầu phát hành nháp lần đầu
[phnhap] - Maker create request
    [Common] - Input text into textbox    ${tb_cif}    ${data_cif}
    sleep    1
    [Common] - Click element    ${btn_search_1}
    sleep    1
    [Common] - Click element    ${radioBtn_cif}
    sleep    1
    [Common] - Click element    ${btn_dialog_create}
    sleep    5


#-- Maker nhập dữ liệu hợp lệ yêu cầu phát hành nháp lần đầu
[phnhap] - Maker input data
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
    sleep    3
    ${requestCode}     get text    ${label_requestcode}
    [Common] - Set test variable    name=requestCode_pType_50    value=${requestCode}

#-- Maker gửi yêu cầu phát hành nháp lần đầu
[phnhap] - Maker send request
    [Common] - Wait for element to appear on page    ${btn_draft}
    [Common] - Click element    ${btn_draft}
    sleep    3
    [Common] - Click element    ${btn_send}
    sleep    3
    # [Common] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [Common] - Click element    ${btn_submit}
    sleep    15