*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Toàn bộ keywords quản lý checklist
*** Keywords ***

#-- User upload hồ sơ trong Danh mục hồ sơ của toàn bộ checklist bắt buộc của phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker upload file to all required checklists
    Wait Until Element Is Visible    ${a_upload_ycmttd}    20s
    Choose file    ${input_upload_ycmttd}   ${EXECDIR}\\BPMLC04_data\\file_test\\test01.docx
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    Wait Until Element Is Visible    ${a_upload_hdi}    20s
    Choose file    ${input_upload_hdi}   ${EXECDIR}\\BPMLC04_data\\file_test\\test02.docx
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    Wait Until Element Is Visible    ${a_upload_mxnnnhtt}    20s
    Choose file    ${input_upload_mxnnnhtt}   ${EXECDIR}\\BPMLC04_data\\file_test\\test04.docx
    sleep    2