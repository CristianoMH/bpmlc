*** Variables ***

# Tất cả các khay trên hệ thống BPm
### -------------------------------------------------------------- ###
#-- Khay cha BPM vận hành (NEW)
${tray_bpm_ops_new}    //a[contains(.,'BPM Vận hành (NEW)')]    

#-- Khay con Yêu cầu đang xử lý (Maker)
${tray_maker_dangxuly}    //a[@href='/v2/request-list/MAKER_DANG_XU_LY']

#-- button tạo yêu cầu tại màn hình lưới
${btn_create}    //button[contains(.,'Tạo yêu cầu')]

#-- Pop-up Tạo yêu cầu
${dialog_create}    //div[@role='dialog']

#-- radioBtn Tài trợ thương mại
${radioBtn_lc}    //p-radiobutton[@name='radioGroup']

#-- button Tạo yêu cầu trong pop-up
${btn_dialog_create}    //div[@role='dialog']//button[contains(.,'Tạo yêu cầu')]

#-- Nghiệp vụ LC nhập khẩu
${btn_dialog_lcnk}    //tr[@class='ng-star-inserted'][1]//i[@class='pi pi-fw pi-chevron-right']

#-- Nghiệp vụ Phát hành LC
${btn_dialog_phat_hanh}    //tr[@class='ng-star-inserted'][2]//i

#-- radio button Luồng Phát hành LC nháp lần đầu
${radiobtn_dialog_50}    //tr[@class='ng-star-inserted'][3]//div[@class='p-radiobutton-box']

#-- Nút tạo trong pop-up Tạo yêu cầu
${btn_dialog_create_2}    //div[@role='dialog']//button[contains(.,'Tạo')]

#-- textbox CIF trong pop-up Tìm kiếm thông tin khách hàng
${tb_cif}    //input[@name='cif']

#-- btn Tìm kiếm trong pop-up Tìm kiếm thông tin khách hàng
${btn_search_1}    //button[contains(.,'Tìm kiếm')]


${radioBtn_cif}    //div[@class='p-radiobutton-box']

