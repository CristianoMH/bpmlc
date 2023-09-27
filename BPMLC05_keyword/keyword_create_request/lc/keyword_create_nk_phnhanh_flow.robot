*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword khởi tạo yêu cầu
*** Keywords ***

#-- Maker tạo yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker create request
    [BPM] - Refresh Page Until Page Contains Element    ${tb_cif}
    [BPM] - Input text into textbox    ${tb_cif}    ${data_cif}
    sleep    1    
    [BPM] - Click element    ${btn_search_1}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${radioBtn_cusLimit_801}
    sleep    1
    [BPM] - Click element    ${btn_dialog_create}
    sleep    1

#-- Maker nhập dữ liệu hợp lệ yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker input data
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${btn_expand}    120
    [BPM] - Click element    ${btn_expand}
    sleep    1
    [BPM] - Click element    ${tb_currency}
    sleep    1
    [BPM] - Click element    //li[@aria-label='VND']
    sleep    1
    ${data_lcValue}    Generate random string    4    0123456789
    [BPM] - Input text into textbox    ${tb_lcValue}    ${data_lcValue}
    sleep    1
    [BPM] - Click element    ${droplist_sponsorBank}
    sleep    1
    [BPM] - Click element    //li[@aria-label='ADCB']
    sleep    1
    [BPM] - Input text into textbox    ${dpicker_ExpirationDate}    01/01/2025
    sleep    1
    [BPM] - Click element    ${droplist_lcExpirationLocation}
    sleep    1
    [BPM] - Click element    //li[contains(.,'VIET NAM')]
    sleep    1
    [BPM] - Input text into textbox    ${tb_marginRate}    10.00
    sleep    1
    [BPM] - Click element    ${tb_depositAmount}
    sleep    1 
    [BPM] - Click element    ${droplist_depositForm}
    sleep    1
    [BPM] - Click element    //span[contains(.,'Phong tỏa tài khoản thanh toán')]
    sleep    1
    [BPM] - Click element    ${tb_debitAccount}
    sleep    1
    [BPM] - Click element    //p-dropdownitem[1]//li[@role='option']
    sleep    1
    [BPM] - Click element    ${btn_next}
    sleep    1
    ${requestCode}     get text    ${label_requestcode}
    [BPM] - Set test variable    name=requestCode_pType_0    value=${requestCode}
    log to console     --------${requestCode_pType_0}