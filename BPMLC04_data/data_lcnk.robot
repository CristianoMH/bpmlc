*** Settings ***
Documentation
*** Keywords ***

[lcnk] - Genenate random data 
    #-- giá trị LC
    ${data_lcValue}    Generate random string    8    0123456789
    #-- dung sai trên     
    ${data_toTolerance}=    Generate random string    1    0123456789
    #-- dung sai dưới
    ${data_fromTolerance}=    Generate random string    1    0123456789
    #-- Tỉ lệ kí quỹ
    ${data_marginRate}    Generate random string    2    0123456789
    [BPM] - Set test variable    name=data_lcValue    value=${data_lcValue}
    [BPM] - Set test variable    name=data_toTolerance    value=${data_toTolerance}
    [BPM] - Set test variable    name=data_fromTolerance    value=${data_fromTolerance}
    [BPM] - Set test variable    name=data_marginRate    value=${data_marginRate}

*** Variables ***
#-- cif khách hàng
${data_cif}    1509182
#-- đơn vị tiền tệ
${data_currency_vnd}    //li[@aria-label='VND']
#-- Ngân hàng tài trợ
${data_sponsorBank_ADCB}    //li[@aria-label='ADCB']
#-- Ngày hết hạn LC
${data_expirationDate}    01/01/2025
#-- Nơi hết hạn LC
${data_lcExpirationLocation_vietnam}    //li[contains(.,'VIET NAM')]    
#-- Hình thức kí quỹ
${data_depositForm_pttk}    //span[contains(.,'Phong tỏa tài khoản thanh toán')]            
#-- Tài khoản ghi nợ
${data_debitAccount_no1}    //p-dropdownitem[1]//li[@role='option']
#-- Thông tin RMA
${data_rma_ABBKVNVX}    ABBKVNVX
#-- Lý do gửi trả
${data_reasonrollback_TTTTKTK}    //span[contains(.,'Thiếu tiền trong TKTT của KH')]
#-- Nội dung gửi trả
${data_contentrollback}    auto test
#-- Người được gửi trả là maker
${data_rollbackto_maker}    //li[@aria-label='Maker']
#-- Người được gửi trả là tfo
${data_rollbackto_tfo}    //li[@aria-label='TFO']