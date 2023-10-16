*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

### --- Toàn bộ keywords nhập liệu theo từng role role
*** Keywords ***
##---------------------------------------- Maker -----------------------------------------------------
#-- Maker nhập dữ liệu tại màn hình Thông tin nhập liệu
[phnhanh][Maker][TTNL] - Input data 
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    Wait Until Element Is Visible    ${btn_expand}     120
    [BPM] - Click element    ${btn_expand}
    sleep    1
    [BPM] - Click element    ${tb_currency}
    sleep    1
    [BPM] - Click element    ${data_currency_vnd}
    sleep    1
    [lcnk] - Genenate random data
    sleep    1
    [BPM] - Input text into textbox    ${tb_lcValue}    ${data_lcValue}
    sleep    1
    [BPM] - Clear element text using backspace    ${tb_toTolerance}    
    [BPM] - Input text into textbox    ${tb_toTolerance}    ${data_toTolerance}
    sleep    1
    [BPM] - Clear element text using backspace    ${tb_fromTolerance}  
    [BPM] - Input text into textbox    ${tb_fromTolerance}    ${data_fromTolerance}
    sleep    1
    [BPM] - Click element    ${droplist_sponsorBank}
    sleep    1
    [BPM] - Click element    ${data_sponsorBank_ADCB}
    sleep    1
    [BPM] - Input text into textbox    ${dpicker_ExpirationDate}    ${data_expirationDate}
    sleep    1
    [BPM] - Click element    ${droplist_lcExpirationLocation}
    sleep    1
    [BPM] - Click element    ${data_lcExpirationLocation_argentina}
    sleep    1
    [BPM] - Input text into textbox    ${tb_marginRate}    ${data_marginRate}
    sleep    1
    [BPM] - Click element    ${tb_depositAmount}
    sleep    1 
    [BPM] - Click element    ${droplist_depositForm}
    sleep    1
    [BPM] - Click element    ${data_depositForm_pttk}
    sleep    1
    [BPM] - Click element    ${tb_debitAccount}
    sleep    1
    [BPM] - Click element    ${data_debitAccount_no1}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_fee}    120
    [BPM] - Click element    ${btn_next}
    sleep    1
    #Get requestCode
    ${requestCode}     get text    ${label_requestcode}
    [BPM] - Set test variable    name=requestCode_pType_53    value=${requestCode}
    log to console     --------${requestCode_pType_53}

#-- Maker nhập dữ liệu tại màn hình Danh mục hồ sơ
[phnhanh][Maker][DMHS] - Input data
    [phnhanh] - Maker upload file to all required checklists

#-- Maker nhập toàn bộ dữ liệu tại các màn hình
[phnhanh][Maker] - Input data
    [phnhanh][Maker][TTNL] - Input data
    [phnhanh][Maker][DMHS] - Input data

##----------------------------------------- TFO -----------------------------------------------------
#-- TFO nhập dữ liệu tại màn hình Thông tin nhập liệu
[phnhanh][TFO][TTNL] - Input data
    [BPM] - Open detail request    ${tray_tfo_dangxuly}    ${requestCode_pType_53}
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_fee}    120
    [BPM] - Input text into textbox    ${tb_swift}    ${data_rma_ABBKVNVX}
    sleep    3
    [BPM] - Click element   ${button_check_rma}    
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_next}
    sleep    1

#-- TFO nhập dữ liệu tại màn hình Danh mục hồ sơ
[phnhanh][TFO][DMHS] - Input data
    [phnhanh] - TFO upload file

#-- TFO nhập dữ liệu tại màn hình Hồ sơ LC
[phnhanh][TFO][HSLC] - Input data
    [BPM] - Input text into textbox    ${tb_refLc}    ${requestCode_pType_53}
    sleep    2

#-- TFO nhập toàn bộ dữ liệu tại các màn hình
[phnhanh][TFO] - Input data
    [phnhanh][TFO][TTNL] - Input data
    [phnhanh][TFO][DMHS] - Input data
    [phnhanh][TFO][HSLC] - Input data

##----------------------------------------- TFS -----------------------------------------------------
#-- TFS nhập dữ liệu tại màn hình Thông tin nhập liệu
[phnhanh][TFS][TTNL] - Input data
    [BPM] - Open detail request    ${tray_tfs_dangxuly}    ${requestCode_pType_53}
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_next}
    sleep    1

#-- TFS nhập dữ liệu tại màn hình Danh mục hồ sơ
[phnhanh][TFS][DMHS] - Input data
    [phnhanh] - TFS upload file

#-- TFS nhập toàn bộ dữ liệu tại các màn hình
[phnhanh][TFS] - Input data
    [phnhanh][TFS][TTNL] - Input data
    [phnhanh][TFS][DMHS] - Input data
