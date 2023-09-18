*** Settings ***

Resource         ../../BPMLC01_resource/import.robot
Test Setup    Run keywords
#-- Đăng nhập vào hệ thống với role Maker
...    [login] - Login with role Maker
#-- Maker mở khay Đang xử lý
...    [tray] - Open tray Maker dang xu ly
#-- Maker chọn yêu cầu phát hành chính thức
...    [tray][phct] - Maker choose request
# Test Teardown    [BPM] - Close Browser

### --- Tất cả các test case của luồng phát hành LC chính thức chưa phát hành nháp
*** Test Cases ***
TC1 - Phát hành LC chính thức chưa phát hành nháp thành công  
    [Tags]    LC0    lc    nhapkhau       
    #-- Maker tạo yêu cầu
    [phct] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phct] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phct] - Maker upload file
    #-- Maker gửi yêu cầu
    [phct] - Maker send request
    #-- Maker đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- Mở khay TFO chờ xử lý và tìm kiếm hồ sơ phát hành chính thức chưa phát hành nháp
    [tray][phct] - TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    [phct] - TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    [phct] - TFO upload file
    #-- TFO gửi yêu cầu
    [phct] - TFO send request
    #-- TFO đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFS
    [login] - Login with role TFS
    #-- Mở khay TFS chờ xử lý và tìm kiếm hồ sơ phát hành chính thức chưa phát hành nháp
    [tray][phct] - TFS pick up request
    #-- TFS nhập dữ liệu hợp lệ
    [phct] - TFS input data
    #-- TFS upload hồ sơ trong Danh mục hồ sơ
    [phct] - TFS upload file
    #-- TFS gửi yêu cầu
    [phct] - TFS send request
    #-- TFS đăng xuất khỏi hệ thống
    [logout] - Logout system
    #-- Đăng nhập vào hệ thống với role TFO
    [login] - Login with role TFO
    #-- TFO đóng yêu cầu phát hành chính thức chưa phát hành nháp
    [phct] - TFO close request
    #-- TFO xác nhận đóng yêu cầu phát hành chính thức chưa phát hành nháp
    [phct] - TFO verify request