*** Settings ***

Resource    ../BPMLC01_resource/import.robot

### --- All keywords of header part
*** Keywords ***

#-- Mở trình duyệt chrome
Open browser with chrome browser
    [Common] - Open Chrome Browser with mode    ${url_sit} 
    sleep    1
    [Common] - Maximize browser size to fit screen
    sleep    1
    # Open Browser       ${url}    headlesschrome
    # sleep    1
    # [Common] - Maximize browser size to fit screen
    # sleep    1

#-- Đóng trình duyệt
[Common] - Close Browser 
    close browser