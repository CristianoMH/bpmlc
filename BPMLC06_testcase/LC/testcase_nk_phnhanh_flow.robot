*** Settings ***

Resource         ../../BPMLC01_resource/import.robot
Test Setup    Run keywords
#-- Đăng nhập vào hệ thống với role Maker
...    [login] - Login with role Maker
#-- Maker mở khay Đang xử lý
...    [tray] - Open tray Maker dang xu ly
#-- Maker chọn yêu cầu phát hành chính thức
...    [tray][phnhanh] - Maker choose request
# Test Teardown    [BPM] - Close Browser

### --- Tất cả các test case của luồng phát hành luồng nhanh chưa phát hành nháp
*** Test Cases ***
TC1 - Phát hành LC luồng nhanh chưa phát hành nháp thành công  
    [Tags]    LC0    lc    nhapkhau       
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
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ phát hành luồng nhanh chưa phát hành nháp
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
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ phát hành luồng nhanh chưa phát hành nháp
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
    #-- TFO đóng yêu cầu phát hành luồng nhanh chưa phát hành nháp
    [phnhanh] - TFO close request
    #-- TFO xác nhận đóng yêu cầu phát hành luồng nhanh chưa phát hành nháp
    [phnhanh] - TFO verify request