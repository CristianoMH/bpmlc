*** Settings ***

Resource         ../../BPMLC01_resource/import.robot
Test Setup    Run keywords
#-- Đăng nhập vào hệ thống với role Maker
...    [login] - Login with role Maker
#-- Maker mở khay Đang xử lý
...    [tray] - Open tray Maker dang xu ly
#-- Maker chọn yêu cầu phát hành chính thức
...    [tray][phnhanh] - Maker choose request
Test Teardown    [BPM] - Close Browser

### --- Tất cả các test case của luồng phát hành luồng nhanh chưa phát hành nháp
*** Test Cases ***
TC1 - Phát hành thành công - TFO đóng yêu cầu
    [Tags]    lc    nhapkhau    luong53    close       
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
    #-- TFS gửi yêu cầu
    [phnhanh] - TFS send request
    #-- TFS đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- TFO đóng yêu cầu
    [phnhanh] - TFO close request
    #-- TFO xác nhận đóng yêu cầu
    [phnhanh] - TFO verify close request

TC2 - Phát hành thành công - Maker hủy yêu cầu
    [Tags]    lc    nhapkhau    luong53    cancel       
    #-- Maker tạo yêu cầu
    [phnhanh] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhanh] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhanh] - Maker upload file
    #-- Maker hủy yêu cầu
    [phnhanh] - Maker cancel request
    #-- Maker xác nhận hủy yêu cầu
    [phnhanh] - Maker verify cancel request

TC3 - Phát hành thành công - TFO gửi trả cho Maker
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
    #-- TFO gửi trả yêu cầu cho Maker
    [phnhanh] - TFO rollback request to maker
    #-- TFO xác nhận trả yêu cầu phát hành luồng nhanh chưa phát hành nháp về cho maker
    [phnhanh] - TFO verify rollback request

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
        [Tags]    lc    nhapkhau    luong53    close       
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
    