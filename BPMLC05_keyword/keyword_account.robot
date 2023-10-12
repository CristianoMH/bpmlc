*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#- Toàn bộ keywords đăng nhập hệ thống theo role và đăng xuất khỏi hệ thống
*** Keywords ***
#-- Mở trình duyệt chrome
[BPM] - Open browser with chrome browser
    [BPM] - Open Chrome Browser with mode    ${url_sit} 
    sleep    1
    Maximize Browser Window
    sleep    1
    # Open Browser       ${url}    headlesschrome
    # sleep    1

#-- Đăng nhập vào hệ thống BPM
[BPM] - Login into system
    [Documentation]    Login to BPM system with username and password
    [Arguments]     ${username}    ${password}
    [Common] - Refresh Page Until Page Contains Element    ${tb_login_username}
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login_username}
    [BPM] - Input text into textbox    ${tb_login_username}    ${username}
    sleep    1
    [BPM] - Click element    ${tb_login_password}
    [BPM] - Input text into textbox    ${tb_login_password}    ${password}
    sleep    1
    [BPM] - Click element    ${btn_login} 
    sleep    1   

#-- Đăng xuất khỏi hệ thống BPM
[BPM] - Logout system
    [Documentation]    Logout system with click button logout on avatar
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Execute JavaScript Click On Element By Xpath    ${a_link_avatar}
    sleep    3
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Click element    ${link_logout}
    sleep    5

#-- Mở trình duyệt và đăng nhập vào hệ thống BPM với role Maker
[BPM] - Open browser and login to system with role Maker
    [BPM] - Open browser with chrome browser
    sleep    1
    [BPM] - Login into system    ${data_username_maker}    ${data_password_maker}
    sleep    1
    
#-- Đóng trình duyệt
[BPM] - Close Browser 
    close browser