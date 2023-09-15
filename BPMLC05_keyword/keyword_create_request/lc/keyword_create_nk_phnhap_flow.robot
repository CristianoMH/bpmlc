*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword khởi tạo yêu cầu
*** Keywords ***

#-- Maker tạo yêu cầu phát hành nháp lần đầu
[phnhap] - Maker create request
    [BPM] - Input text into textbox    ${tb_cif}    ${data_cif}
    sleep    1
    [BPM] - Click element    ${btn_search_1}
    sleep    1
    [BPM] - Click element    ${radioBtn_cif}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create}
    sleep    5


#-- Maker nhập dữ liệu hợp lệ yêu cầu phát hành nháp lần đầu
[phnhap] - Maker input data
    [BPM] - Wait for element to appear on page    ${btn_expand}
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Input text into textbox    ${tb_lcValue}    1234.56
    sleep    3
    [BPM] - Click element    ${droplist_sponsorBank}
    sleep    1
    [BPM] - Click element    //li[@aria-label='ADCB']
    sleep    1
    [BPM] - Click element    ${btn_draft}
    sleep    3
    [BPM] - Click element    ${btn_next}
    sleep    3
    ${requestCode}     get text    ${label_requestcode}
    [BPM] - Set test variable    name=requestCode_pType_50    value=${requestCode}