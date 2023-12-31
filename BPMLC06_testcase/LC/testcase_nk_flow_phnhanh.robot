*** Settings ***

Resource         ../../BPMLC01_resource/import.robot

#-- Mở trình duyệt chrome và đăng nhập vào hệ thống BPM với role Maker
Test Setup    [BPM] - Open browser and login to system with role Maker
Test Teardown    [BPM] - Close Browser

### --- Tất cả các test case của luồng phát hành luồng nhanh chưa phát hành nháp
*** Test Cases ***
TC1 - Phát hành luồng nhanh chưa phát hành nháp - Flow chính
    [Tags]    lc    nhapkhau    luong53    close
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker gửi yêu cầu
    [BPM][Maker] - Send request
    #-- Maker đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfo_choxuly}    ${requestCode_pType_53}    
    #-- TFO nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFO] - Input data
    #-- TFO gửi yêu cầu
    [BPM][TFO/TFS] - Send request
    #-- TFO đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [BPM] - Login into system        ${data_username_tfs}    ${data_password_tfs}
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfs_choxuly}    ${requestCode_pType_53}
    #-- TFS nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFS] - Input data
    #-- TFS gửi yêu cầu
    [BPM][TFO/TFS] - Send request
    #-- TFS đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- TFO đóng yêu cầu và đóng yêu cầu
    [BPM][TFO] - Close request    ${tray_tfo_dahoanthanh}    ${requestCode_pType_53}


TC2 - Phát hành luồng nhanh chưa phát hành nháp - Flow gửi trả
    [Tags]    lc    nhapkhau    luong53    rollback01
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker gửi yêu cầu
    [BPM][Maker] - Send request
    #-- Maker đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfo_choxuly}    ${requestCode_pType_53}
    #-- TFO nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFO] - Input data
    #-- TFO gửi trả yêu cầu cho Maker
    [BPM] - Rollback request    ${false}
    #-- TFO đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Maker đăng nhập vào hệ thống
    [BPM] - Login into system    ${data_username_maker}    ${data_password_maker}
    sleep    1
    #-- Maker gửi lại chi tiết yêu cầu
    [BPM][Maker] - Send back request
    #-- Maker đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- TFO gửi yêu cầu
    [BPM][TFO/TFS] - Send back request    ${tray_tfo_dangxuly}    ${requestCode_pType_53}    ${false}
    #-- TFO đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [BPM] - Login into system    ${data_username_tfs}    ${data_password_tfs}
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfs_choxuly}    ${requestCode_pType_53}
    #-- TFS nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFS] - Input data
    #-- TFS gửi trả yêu cầu cho Maker
    [BPM] - Rollback request    ${false}
    #-- TFS đăng xuất khỏi hệ thống
    [BPM] - Logout system
        #-- TFO đăng nhập vào hệ thống
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- TFO gửi yêu cầu
    [BPM][TFO/TFS] - Send back request    ${tray_tfo_dangxuly}    ${requestCode_pType_53}    ${true}
    #-- TFO đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [BPM] - Login into system    ${data_username_tfs}    ${data_password_tfs}
    #-- TFS gửi yêu cầu
    [BPM][TFO/TFS] - Send back request    ${tray_tfs_dangxuly}    ${requestCode_pType_53}    ${false}
    #-- TFS đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- TFO đóng yêu cầu và đóng yêu cầu
    [BPM][TFO] - Close request    ${tray_tfo_dahoanthanh}    ${requestCode_pType_53}

TC3 - Phát hành luồng nhanh chưa phát hành nháp - Maker lưu nháp yêu cầu
    [Tags]    lc    nhapkhau    luong53    close
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker lưu nháp yêu cầu và verify toast thông báo thành công
    [BPM] - Draft request and verify toast notification

TC4 - Phát hành luồng nhanh chưa phát hành nháp - TFO lưu nháp yêu cầu
    [Tags]    lc    nhapkhau    luong53    close
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker gửi yêu cầu
    [BPM][Maker] - Send request
    #-- Maker đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfo_choxuly}    ${requestCode_pType_53}    
    #-- TFO nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFO] - Input data
    #-- TFO lưu nháp yêu cầu và verify toast thông báo thành công
    [BPM] - Draft request and verify toast notification

TC5 - Phát hành luồng nhanh chưa phát hành nháp - TFS lưu nháp yêu cầu
    [Tags]    lc    nhapkhau    luong53    close
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker gửi yêu cầu
    [BPM][Maker] - Send request
    #-- Maker đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [BPM] - Login into system    ${data_username_tfo}    ${data_password_tfo}
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfo_choxuly}    ${requestCode_pType_53}    
    #-- TFO nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFO] - Input data
    #-- TFO gửi yêu cầu
    [BPM][TFO/TFS] - Send request
    #-- TFO đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [BPM] - Login into system        ${data_username_tfs}    ${data_password_tfs}
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ
    [BPM] - Pick up request    ${tray_tfs_choxuly}    ${requestCode_pType_53}
    #-- TFS nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][TFS] - Input data
    #-- TFS lưu nháp yêu cầu và verify toast thông báo thành công
    [BPM] - Draft request and verify toast notification

TC6 - Phát hành luồng nhanh chưa phát hành nháp - Maker hủy yêu cầu
    [Tags]    lc    nhapkhau    luong53    close
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker hủy yêu cầu
    [BPM] - Cancel request    ${tray_search_request}    ${requestCode_pType_53}
