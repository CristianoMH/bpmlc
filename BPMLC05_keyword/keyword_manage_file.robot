*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#- Toàn bộ keywords quản lý file
*** Keywords ***

#-- Maker upload hồ sơ trong Danh mục hồ sơ
[phnhap] - Maker upload file
    Wait Until Element Is Visible    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//a    20s
    Choose file    ${icon_upload_1}   ${CURDIR}${/}file_test${/}test01.docx
    sleep    5
    Wait Until Element Is Visible    //tr[./td[contains(text(),'Hợp đồng/invoice')]]//a    20s
    Choose file    ${icon_upload_2}   ${CURDIR}${/}file_test${/}test02.docx
    sleep    5
    Wait Until Element Is Visible    //tr[./td[contains(text(),'Mail xác nhận nguồn ngân hàng tài trợ')]]//a    20s
    Choose file    ${icon_upload_3}   ${CURDIR}${/}file_test${/}test03.docx
    sleep    5

#-- TFO upload hồ sơ trong Danh mục hồ sơ
[phnhap] - TFO upload file
    [Common] - Click element    ${btn_next}
    sleep    3