*** Settings ***

Resource         ../../../BPMLC01_resource/import.robot
Test Setup    Run keywords
...    Login with role Maker
...    Open tray Maker dang xu ly
...    Maker choose request: productType = 50
# Test Teardown    [Common] - Close Browser

### --- All test cases of header part
*** Test Cases ***

###    ATM CARD    ###
###    -----------------------------------------------------------------------    ###

###    NAPAS    ###
TC1 - Phát hành LC   
    [Tags]    LC50    lc    nhapkhau       
    #-- Maker tạo yêu cầu
    Maker create request
    #-- Maker nhập dữ liệu hợp lệ
    Maker input data
    #-- Maker upload hồ sơ trong Danh mục hồ sơ
    Maker upload file
    #-- Maker gửi yêu cầu
    Maker send request
    #-- TFO pick hồ sơ về khay cá nhân
    TFO pick up request
    #-- TFO nhập dữ liệu hợp lệ
    TFO input data
    #-- TFO upload hồ sơ trong Danh mục hồ sơ
    TFO upload file
    #-- TFO gửi yêu cầu
    TFO send request
    #-- Xác nhận trạng thái Đóng hồ sơ
    Maker verify data