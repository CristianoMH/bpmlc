*** Variables ***
### -------------------------------------------------------------- ###

#--locators của các element trong Login form
${tb_login_username}    //input[@id='username']
${tb_login_password}    //input[@id='txtPassword']
${btn_login}    //button[@value='Login']

#--locators của loading page
${loading_page}    //div[contains(@class,'overlay') and contains(@class,'ng-trigger')]