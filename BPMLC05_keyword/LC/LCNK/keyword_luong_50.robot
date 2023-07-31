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
    sleep    1

#-- Maker nhập dữ liệu hợp lệ

#-- Maker upload hồ sơ trong Danh mục hồ sơ

#-- Maker gửi yêu cầu
