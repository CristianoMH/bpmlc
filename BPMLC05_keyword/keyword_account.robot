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
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login_username}    
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_maker}
    sleep    1    
    [BPM] - Click element    ${tb_login_password}
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_maker}
    sleep    1 
    [BPM] - Click element    ${btn_login}
    sleep    4     

#-- Đăng nhập với user có role TFO
[login] - Login with role TFO
    Open browser with chrome browser
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login__username}    
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_tfo}
    sleep    1    
    [BPM] - Click element    ${tb_login_password}
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_tfo}
    sleep    1 
    [BPM] - Click element    ${btn_login}
    sleep    4  

#-- Đăng nhập với user có role TFS
[login] - Login with role TFS
    Open browser with chrome browser
    [BPM] - Wait for element to appear on page    ${tb_login_username}
    [BPM] - Click element    ${tb_login__username}    
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_username}    ${data_username_tfs}
    sleep    1    
    [BPM] - Click element    ${tb_login_password}
    sleep    1
    [BPM] - Input text into textbox    ${tb_login_password}    ${data_password_tfs}
    sleep    1 
    [BPM] - Click element    ${btn_login}
    sleep    4  

#-- Đăng nhập với user có role dpv
[login] - Login with role DPV
    Open browser with chrome browser
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

#-- Đóng trình duyệt
[BPM] - Close Browser 
    close browser