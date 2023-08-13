*** Settings ***

Resource         ../../../BPMLC01_resource/import.robot
Test Setup    Run keywords
...    Login with role Maker
...    Open tray Maker dang xu ly
...    Maker choose request: productType = 50
Test Teardown    [Common] - Close Browser
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
    Maker input data
    Maker upload file
    Maker send request
    TFO pick up request
    TFO input data
    TFO upload file
    TFO send request
    Maker verify data