*** Settings ***

Resource    ../../../BPMLC01_resource/import.robot

### --- Toàn bộ keyword chuyển bước yêu cầu phát hành luồng nhanh chưa phát hành nháp
*** Keywords ***
#-- Maker gửi yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker send request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_send}
    sleep    1
    # [BPM] - Input text into textbox    ${textarea_confirm}    Auto Testing
    # sleep    2
    [BPM] - Click element    ${btn_submit}
    [BPM] - Wait for element not to appear on page    ${loading_page}    120

#-- Maker lưu nháp yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_draft}
    sleep    1

#-- Maker hủy yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker cancel request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_cancel}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    1

#-- Maker xác nhận lưu nháp yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker verify draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${sidebar_minimizer}
    sleep    1
    [BPM] - Click element    ${tray_maker_dangxuly}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_makerdangxuly_status}    Lưu nháp

#-- Maker xác nhận trả yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker verify rollback request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${sidebar_minimizer}
    sleep    1
    [BPM] - Click element    ${tray_maker_dangxuly}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_makerdangxuly_status}    Chờ bổ sung

#-- Maker xác nhận hủy yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - Maker verify cancel request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${tray_maker_dangxuly}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify page should not contain element    //tr[@ng-reflect-data='[object Object]']
    
#-- TFO nhập dữ liệu hợp lệ phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFO input data
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${tray_tfo_dangxuly}    20
    [BPM] - Click element    ${tray_tfo_dangxuly}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${tb_quicksearch}    20
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_fee}    120
    [BPM] - Input text into textbox    ${tb_swift}    ${data_rma_ABBKVNVX}
    sleep    3
    [BPM] - Click element   ${button_check_rma}    
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${btn_next}    20
    [BPM] - Click element    ${btn_next}
    sleep    1

#-- TFO gửi yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFO send request
    [BPM] - Wait for element to appear on page    ${tb_refLc}    20
    [BPM] - Input text into textbox    ${tb_refLc}    ${requestCode_pType_53}
    sleep    2
    [BPM] - Wait for element to appear on page    ${btn_approve}
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    15

#-- TFO gửi trả yêu cầu phát hành luồng nhanh chưa phát hành nháp cho Maker
[phnhanh] - TFO rollback request to maker
    [BPM] - Wait for element to appear on page    ${tb_refLc}    20
    [BPM] - Input text into textbox    ${tb_refLc}    ${requestCode_pType_53}
    sleep    2
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
    sleep    1

#-- TFO đóng yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFO close request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${tray_bpm_ops}    20
    [BPM] - Click element    ${tray_bpm_ops}
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${tray_bpm_ops_new}
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120    
    [BPM] - Wait for element to appear on page    ${tray_tfo_dahoanthanh}    20
    [BPM] - Click element    ${tray_tfo_dahoanthanh}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${tb_quicksearch}    20
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    3
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Click element    ${btn_next}
    sleep    1
    [BPM] - Click element    ${btn_next}
    sleep    1
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_agree}
    sleep    15

#-- TFO lưu nháp yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFO draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_draft}
    sleep    1

#-- TFS gửi trả yêu cầu phát hành luồng nhanh chưa phát hành nháp cho Maker
[phnhanh] - TFS rollback request to maker
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

#-- TFS gửi trả yêu cầu phát hành luồng nhanh chưa phát hành nháp cho TFO
[phnhanh] - TFS rollback request to tfo
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

#-- TFO xác nhận lưu nháp yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFO verify draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${sidebar_minimizer}
    sleep    1
    [BPM] - Click element    ${tray_tfo_dangxuly}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_tfodangxuly_status}    Đang xử lý

#-- TFO xác nhận đóng yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFO verify close request
    [BPM] - Wait for element to appear on page    ${tray_tfo_dahoanthanh}
    [BPM] - Click element    ${tray_tfo_dahoanthanh}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_dahoanthanh_status}    Đóng

#-- TFO xác nhận trả yêu cầu phát hành luồng nhanh chưa phát hành nháp về cho maker
[phnhanh] - TFO verify rollback request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    # [BPM] - Click element    ${sidebar_minimizer}
    # sleep    1
    [BPM] - Click element    ${tray_tfo_canbosung}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify page should contain element    //tr[@ng-reflect-data='[object Object]']

#-- TFS gửi yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFS send request
    [BPM] - Wait for element to appear on page    ${btn_approve}
    [BPM] - Click element    ${btn_approve}
    sleep    1
    [BPM] - Click element    ${btn_accept}
    sleep    30

#-- TFS nhập dữ liệu hợp lệ phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFS input data
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${tray_tfs_dangxuly}    5
    [BPM] - Click element    ${tray_tfs_dangxuly}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    2
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element   ${col_bpmid}    
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${btn_expand}    120
    [BPM] - Click element    ${btn_expand}
    sleep    3
    [BPM] - Click element    ${btn_next}
    sleep    2

#-- TFS lưu nháp yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFS draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${btn_draft}
    sleep    1

#-- TFS xác nhận lưu nháp yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFS verify draft request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${sidebar_minimizer}
    sleep    1
    [BPM] - Click element    ${tray_tfs_dangxuly}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify element should contain text    ${col_tfsdangxuly_status}    Đang xử lý

#-- TFS xác nhận trả yêu cầu phát hành luồng nhanh chưa phát hành nháp
[phnhanh] - TFS verify rollback request
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    # [BPM] - Click element    ${sidebar_minimizer}
    # sleep    1
    [BPM] - Click element    ${tray_tfs_canbosung}
    sleep    3
    [BPM] - Input text into textbox    ${tb_quicksearch}    ${requestCode_pType_53}
    sleep    1
    Press Keys    ${tb_quicksearch}    ENTER
    sleep    1
    [Assert] - Verify page should contain element    //tr[@ng-reflect-data='[object Object]']


