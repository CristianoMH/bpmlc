*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#- Toàn bộ keywords đăng nhập hệ thống theo role và đăng xuất khỏi hệ thống
*** Keywords ***
#-- Mở trình duyệt chrome
Open browser with chrome browser
    [BPM] - Open Chrome Browser with mode    ${url_sit} 
    sleep    1
    [BPM] - Maximize browser size to fit screen
    sleep    1
    # Open Browser       ${url}    headlesschrome
    # sleep    1
    # [BPM] - Maximize browser size to fit screen
    # sleep    1

#-- Đăng nhập với user có role Maker
[login] - Login with role Maker
    Open browser with chrome browser
    [Common] - Refresh Page Until Page Contains Element    ${tb_login_username}
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login_username}  
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_maker}
    sleep    1
    [BPM] - Click element    ${tb_login_password}
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_maker}
    sleep    1
    [BPM] - Click element    ${btn_login} 
    sleep    1

#-- Đăng nhập với user có role TFO
[login] - Login with role TFO
    [BPM] - Refresh Page Until Page Contains Element    ${tb_login_username}
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login__username}
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_tfo}
    [BPM] - Click element    ${tb_login_password}
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_tfo}
    [BPM] - Click element    ${btn_login}
    sleep    1 

#-- Đăng nhập với user có role TFS
[login] - Login with role TFS
    [BPM] - Refresh Page Until Page Contains Element    ${tb_login_username}
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login__username}    
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_tfs}  
    [BPM] - Click element    ${tb_login_password}
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_tfs} 
    [BPM] - Click element    ${btn_login}

#-- Đăng nhập với user có role dpv
[login] - Login with role DPV
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login_username}    
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_dpv}
    sleep    1    
    [BPM] - Click element    ${tb_login_password}
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_dpv}
    sleep    1 
    [BPM] - Click element    ${btn_login}
    sleep    4  

#-- Đăng xuất khỏi hệ thống
[logout] - Logout system
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${li_link_avatar}    20  
    [BPM] - Execute JavaScript Click On Element By Xpath    ${a_link_avatar}
    sleep    2
    [BPM] - Wait for element not to appear on page    ${loading_page}    120
    [BPM] - Wait for element to appear on page    ${link_logout}
    [BPM] - Click element    ${link_logout}
    sleep    5

#-- Đóng trình duyệt
[BPM] - Close Browser 
    close browser