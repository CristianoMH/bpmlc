*** Settings ***

Resource    ../BPMLC01_resource/import.robot

#- Toàn bộ keywords đăng nhập hệ thống theo role
*** Keywords ***

#-- Đăng nhập với user có role Maker
Login with role Maker
    Open browser with chrome browser
    [Common] - Wait for element to appear on page    ${tb_login_username}
    [Common] - Click element    ${tb_login_username}    
    sleep    1
    [Common] - Input text into textbox    ${tb_login_username}    ${data_username_maker}
    sleep    1    
    [Common] - Click element    ${tb_login_password}
    sleep    1
    [Common] - Input text into textbox    ${tb_login_password}    ${data_password_maker}
    sleep    1 
    [Common] - Click element    ${btn_login}
    sleep    4     

#-- Đăng nhập với user có role TFO
Login with role TFO
    Open browser with chrome browser
    [Common] - Wait for element to appear on page    ${tb_login_username}
    [Common] - Click element    ${tb_login__username}    
    sleep    1
    [Common] - Input text into textbox    ${tb_login_username}    ${data_username_tfo}
    sleep    1    
    [Common] - Click element    ${tb_login_password}
    sleep    1
    [Common] - Input text into textbox    ${tb_login_password}    ${data_password_tfo}
    sleep    1 
    [Common] - Click element    ${btn_login}
    sleep    4  

#-- Đăng nhập với user có role TFS
Login with role TFS
    Open browser with chrome browser
    [Common] - Wait for element to appear on page    ${tb_login_username}
    [Common] - Click element    ${tb_login__username}    
    sleep    1
    [Common] - Input text into textbox    ${tb_login_username}    ${data_username_tfs}
    sleep    1    
    [Common] - Click element    ${tb_login_password}
    sleep    1
    [Common] - Input text into textbox    ${tb_login_password}    ${data_password_tfs}
    sleep    1 
    [Common] - Click element    ${btn_login}
    sleep    4  

#-- Đăng nhập với user có role dpv
Login with role DPV
    Open browser with chrome browser
    [Common] - Wait for element to appear on page    ${tb_login_username}
    [Common] - Click element    ${tb_login_username}    
    sleep    1
    [Common] - Input text into textbox    ${tb_login_username}    ${data_username_dpv}
    sleep    1    
    [Common] - Click element    ${tb_login_password}
    sleep    1
    [Common] - Input text into textbox    ${tb_login_password}    ${data_password_dpv}
    sleep    1 
    [Common] - Click element    ${btn_login}
    sleep    4  