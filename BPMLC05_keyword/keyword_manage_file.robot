*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#- Toàn bộ keywords quản lý file
*** Keywords ***

#-- Maker upload hồ sơ trong Danh mục hồ sơ của phát hành nháp lần đầu
[phnhap] - Maker upload file
    Wait Until Element Is Visible    ${a_upload_ycmttd}    20s
    Choose file    ${input_upload_ycmttd}   ${EXECDIR}\\BPMLC04_data\\file_test\\test01.docx
    sleep    5
    Wait Until Element Is Visible    ${a_upload_hdi}    20s
    Choose file    ${input_upload_hdi}   ${EXECDIR}\\BPMLC04_data\\file_test\\test02.docx
    sleep    5
    Wait Until Element Is Visible    ${a_upload_mxnnnhtt}    20s
    Choose file    ${input_upload_mxnnnhtt}   ${EXECDIR}\\BPMLC04_data\\file_test\\test03.docx
    sleep    5

#-- Maker upload hồ sơ trong Danh mục hồ sơ của phát hành chính thức chưa phát hành nháp
[phct] - Maker upload file
    Wait Until Element Is Visible    ${a_upload_ycmttd}    20s
    Choose file    ${input_upload_ycmttd}   ${EXECDIR}\\BPMLC04_data\\file_test\\test01.docx
    sleep    5
    Wait Until Element Is Visible    ${a_upload_hdi}    20s
    Choose file    ${input_upload_hdi}   ${EXECDIR}\\BPMLC04_data\\file_test\\test02.docx
    sleep    5
    Wait Until Element Is Visible    ${a_upload_gcnbh}    20s
    Choose file    ${input_upload_gcnbh}   ${EXECDIR}\\BPMLC04_data\\file_test\\test03.docx
    sleep    5
    Wait Until Element Is Visible    ${a_upload_mxnnnhtt}    20s
    Choose file    ${input_upload_mxnnnhtt}   ${EXECDIR}\\BPMLC04_data\\file_test\\test04.docx
    sleep    5

#-- TFO upload hồ sơ trong Danh mục hồ sơ của phát hành nháp lần đầu
[phnhap] - TFO upload file
    [BPM] - Click element    ${btn_next}
    sleep    3

#-- TFO upload hồ sơ trong Danh mục hồ sơ của phát hành chính thức chưa phát hành nháp
[phct] - TFO upload file
    [BPM] - Click element    ${btn_next}
    sleep    3

#-- TFS upload hồ sơ trong Danh mục hồ sơ của phát hành chính thức chưa phát hành nháp
[phct] - TFS upload file
    [BPM] - Click element    ${btn_next}
    sleep    3