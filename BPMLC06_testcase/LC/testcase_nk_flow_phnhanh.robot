*** Settings ***

Resource         ../../BPMLC01_resource/import.robot

#-- Mở trình duyệt chrome và đăng nhập vào hệ thống BPM với role Maker
Test Setup    [BPM] - Open browser and login to system with role Maker
# Test Teardown    [BPM] - Close Browser

### --- Tất cả các test case của luồng phát hành luồng nhanh chưa phát hành nháp
*** Test Cases ***
TC1 - Phát hành luồng nhanh chưa ph nháp - Flow chính
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
    #-- TFO đóng yêu cầu
    [BPM][TFO] - Close request
    #-- TFO xác nhận đóng yêu cầu
    [BPM] - Verify close request    ${tray_tfo_dahoanthanh}        ${requestCode_pType_53}    Đóng

TC2 - Phát hành thành công - Maker hủy yêu cầu
    [Tags]    lc    nhapkhau    luong53    cancel       
    #-- Maker chọn yêu cầu để khởi tạo
    [BPM] - Choose request type to create    ${btn_dialog_lcnk}    ${btn_dialog_phat_hanh}    ${btn_dialog_phat_hanh_nhanh}    ${radiobtn_dialog_53}
    #-- Maker tìm kiếm yêu cầu theo hạn mức
    [BPM] - Search customer limit following cif code    ${data_cif}    ${radioBtn_first_cusLimit_801}
    #-- Maker khởi tạo yêu cầu
    [BPM] - Create new request
    #-- Maker nhập toàn bộ dữ liệu tại các màn hình
    [phnhanh][Maker] - Input data
    #-- Maker hủy yêu cầu
    [BPM] - Cancel request
    #-- Maker xác nhận hủy yêu cầu
    [BPM] - Verify cancel request    ${tray_maker_dangxuly}    ${requestCode_pType_53}    //tr[@ng-reflect-data='[object Object]']            

TC3 - Phát hành thành công - TFO gửi trả cho Maker
    [Tags]    lc    nhapkhau    luong53    rollback
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
    [BPM] - TFO rollback request to Maker
    #-- TFO đăng xuất khỏi hệ thống
    [BPM] - Logout system
    #-- Đăng nhập vào hệ thống với role Maker
    [BPM] - Login into system    ${data_username_maker}    ${data_password_maker}
    

TC4 - Phát hành thành công - TFS gửi trả cho Maker
    [Tags]    lc    nhapkhau    luong53    rollback 
    #-- Maker tạo yêu cầu
    [phnhanh] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhanh] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - Maker upload file
    #-- Maker gửi yêu cầu
    [phnhanh] - Maker send request
    #-- Maker đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    [phnhanh] - TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFO upload file
    #-- TFO gửi yêu cầu
    [phnhanh] - TFO send request
    #-- TFO đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [login] - Login with role TFS
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFS pick up request
    #-- TFS nhập dữ liệu hợp lệ
    [phnhanh] - TFS input data
    #-- TFS upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFS upload file
    #-- TFS gửi trả yêu cầu cho Maker
    [phnhanh] - TFS rollback request to maker
    #-- TFS xác nhận trả yêu cầu 
    [phnhanh] - TFS verify rollback request

TC5 - Phát hành thành công - TFS gửi trả cho TFO
    [Tags]    lc    nhapkhau    luong53    rollback
    #-- Maker tạo yêu cầu
    [phnhanh] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhanh] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - Maker upload file
    #-- Maker gửi yêu cầu
    [phnhanh] - Maker send request
    #-- Maker đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    [phnhanh] - TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFO upload file
    #-- TFO gửi yêu cầu
    [phnhanh] - TFO send request
    #-- TFO đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [login] - Login with role TFS
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFS pick up request
    #-- TFS nhập dữ liệu hợp lệ
    [phnhanh] - TFS input data
    #-- TFS upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFS upload file
    #-- TFS gửi trả yêu cầu cho Maker
    [phnhanh] - TFS rollback request to tfo
    #-- TFS xác nhận trả yêu cầu 
    [phnhanh] - TFS verify rollback request

TC6 - Phát hành thành công - Maker lưu nháp
    [Tags]    lc    nhapkhau    luong53    draft
    #-- Maker tạo yêu cầu
    [phnhanh] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhanh] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - Maker upload file
    #-- Maker lưu nháp yêu cầu
    [phnhanh] - Maker draft request
    #-- Maker xác nhận lưu nháp yêu cầu
    [phnhanh] - Maker verify draft request

TC7 - Phát hành thành công - TFO lưu nháp
    [Tags]    lc    nhapkhau    luong53    draft
    #-- Maker tạo yêu cầu
    [phnhanh] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhanh] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - Maker upload file
    #-- Maker gửi yêu cầu
    [phnhanh] - Maker send request
    #-- Maker đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    [phnhanh] - TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFO upload file
    #-- TFO lưu nháp yêu cầu
    [phnhanh] - TFO draft request
    #-- TFO xác nhận lưu nháp yêu cầu
    [phnhanh] - TFO verify draft request

TC8 - Phát hành thành công - TFS lưu nháp
    [Tags]    lc    nhapkhau    luong53    draft
    #-- Maker tạo yêu cầu
    [phnhanh] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhanh] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - Maker upload file
    #-- Maker gửi yêu cầu
    [phnhanh] - Maker send request
    #-- Maker đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    [phnhanh] - TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFO upload file
    #-- TFO gửi yêu cầu
    [phnhanh] - TFO send request
    #-- TFO đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [login] - Login with role TFS
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ
    [tray][phnhanh] - TFS pick up request
    #-- TFS nhập dữ liệu hợp lệ
    [phnhanh] - TFS input data
    #-- TFS upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - TFS upload file
    #-- TFS lưu nháp yêu cầu
    [phnhanh] - TFS draft request
    #-- TFS xác nhận lưu nháp yêu cầu
    [phnhanh] - TFS verify draft request
    