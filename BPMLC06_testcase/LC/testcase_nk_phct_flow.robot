*** Settings ***

Resource         ../../BPMLC01_resource/import.robot
Test Setup    Run keywords
...    [login] - Login with role Maker
...    [tray] - Open tray Maker dang xu ly
...    [tray] - Maker choose request: productType = 0
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