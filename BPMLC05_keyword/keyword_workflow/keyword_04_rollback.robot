*** Settings ***

Resource    ../../BPMLC01_resource/import.robot

#- Keyword gửi trả yêu cầu
*** Keywords ***
#-- TFO gửi trả yêu cầu cho Maker
[BPM] - TFO rollback request to Maker
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_cancel}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    1

#-- TFS gửi trả yêu cầu cho Maker
[BPM] - TFS rollback request to Maker
    [BPM] - Click element    ${btn_rollback}
    sleep    1
    [BPM] - Click element    ${droplist_rollbackto}
    sleep    1
    [BPM] - Click element    ${data_rollbackto_maker}
    sleep    1
    [BPM] - Click element    ${droplist_rollback_reason}
    sleep    1
    [BPM] - Click element    ${data_reasonrollback_TTTTKTK}
    sleep    1
    [BPM] - Click element    ${btn_close_popup_rollback}
    sleep    1        
    [BPM] - Input text into textbox    ${textarea_rollback_content}    ${data_contentrollback}
    sleep    2
    [BPM] - Click element    ${btn_dialog_rollback}

#-- TFS gửi trả yêu cầu cho TFO
[BPM] - TFS rollback request to TFO
    [BPM] - Click element    ${btn_rollback}
    sleep    1
    [BPM] - Click element    ${droplist_rollback_reason}
    sleep    1
    [BPM] - Click element    ${data_reasonrollback_TTTTKTK}
    sleep    1
    [BPM] - Click element    ${btn_close_popup_rollback}
    sleep    1        
    [BPM] - Input text into textbox    ${textarea_rollback_content}    ${data_contentrollback}
    sleep    2
    [BPM] - Click element    ${btn_dialog_rollback}
