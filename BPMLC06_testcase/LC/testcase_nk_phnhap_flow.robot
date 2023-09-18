*** Settings ***

Resource         ../../BPMLC01_resource/import.robot
Test Setup    Run keywords
...    [login] - Login with role Maker
...    [tray] - Open tray Maker dang xu ly
...    [tray][phnhap] - Maker choose request
Test Teardown    [BPM] - Close Browser

### --- Tất cả các test case của luồng phát hành nháp lần đầu
*** Test Cases ***
TC1 - Phát hành LC nhap lan dau thanh cong    
    [Tags]    LC50    lc    nhapkhau       
    #-- Maker tạo yêu cầu
    [phnhap] - Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    [phnhap] - Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    [phnhap] - Maker upload file
    #-- Maker gửi yêu cầu
    [phnhap] - Maker send request
    #-- TFO pick hồ sơ về khay cá nhân
    [tray][phnhap] - TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    [phnhap] - TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    [phnhap] - TFO upload file
    #-- TFO gửi yêu cầu
    [phnhap] - TFO send request
    #-- Xác nhận trạng thái Đóng hồ sơ
    [phnhap] - Maker verify request