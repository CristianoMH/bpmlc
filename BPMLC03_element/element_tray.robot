*** Variables ***

# Tất cả các khay trên hệ thống BPm
### -------------------------------------------------------------- ###
#-- Avatar
${li_link_avatar}    //app-header[@ng-reflect-navbar-brand-router-link='/home']
${a_link_avatar}    //a[@class='nav-link avatar-user']

#-- Alert thông báo
${div_alert}    //div[@role='alert']

#-- Mini sidebar
${sidebar_minimizer}    //app-sidebar-minimizer

#-- Link Đăng xuất
${link_logout}    //a[contains(.,'Đăng xuất')]

#-- Khay ông Vận hành
${tray_bpm_ops}    //a[@class='nav-link nav-dropdown-toggle' and not(contains(.,'BPM Vận hành (NEW)')) and contains(.,'Vận hành')]

#-- Khay cha Tiện ích BPM
${tray_extension}    //a[contains(.,'Tiện ích BPM')]

#-- Khay con Tìm kiếm hồ sơ
${tray_search_request}    //app-sidebar-nav-link//a[contains(.,'Tìm kiếm hồ sơ')] 

#-- Khay cha BPM vận hành (NEW)
${tray_bpm_ops_new}    //a[contains(.,'BPM Vận hành (NEW)')]    

#-- Khay con Yêu cầu đang xử lý (Maker)
${tray_maker_dangxuly}    //a[@href='/v2/request-list/MAKER_DANG_XU_LY']

#-- Khay con Yêu cầu đang xử lý (Maker)
${tray_maker_dahoanthanh}    //a[@href='/v2/request-list/DA_HOAN_THANH']

#-- Khay con Yêu cầu chờ xử lý (TFO)
${tray_tfo_choxuly}    //a[@href='/v2/request-list/CCO1_CHO_XU_LY']

#-- Khay con Yêu cầu đang xử lý (TFO)
${tray_tfo_dangxuly}    //a[@href='/v2/request-list/CCO1_DANG_XU_LY']

#-- Khay con Yêu cầu cần bổ sung (TFO)
${tray_tfo_canbosung}    //a[@href='/v2/request-list/CCO1_CAN_BO_SUNG']

#-- Khay con Yêu cầu đã hoàn thành (TFO)
${tray_tfo_dahoanthanh}    //a[@href='/v2/request-list/DA_HOAN_THANH_TFO']

#-- Khay con Yêu cầu chờ xử lý (TFS)
${tray_tfs_choxuly}    //a[@href='/v2/request-list/CCO2_CHO_XU_LY']

#-- Khay con Yêu cầu đang xử lý (TFS)
${tray_tfs_dangxuly}    //a[@href='/v2/request-list/CCO2_DANG_XU_LY']

#-- Khay con Yêu cầu cần bổ sung (TFS)
${tray_tfs_canbosung}    //a[@href='/v2/request-list/CCO2_CAN_BO_SUNG']

#-- button tạo yêu cầu tại màn hình lưới
${btn_create}    //button[contains(.,'Tạo yêu cầu')]

#-- Pop-up Tạo yêu cầu
${dialog_create}    //div[@role='dialog']

#-- radioBtn Tài trợ thương mại
${radioBtn_lc}    //p-radiobutton[@ng-reflect-label='Tài Trợ Thương Mại']

#-- button Tạo yêu cầu trong pop-up
${btn_dialog_create}    //div[@role='dialog']//button[contains(.,'Tạo yêu cầu')]

#-- Nghiệp vụ LC nhập khẩu
${btn_dialog_lcnk}    //span[contains(.,'LC Nhập khẩu')]//ancestor::tr//i

#-- Nghiệp vụ Phát hành LC
${btn_dialog_phat_hanh}    //span[contains(.,'Phát hành LC') and not(contains(.,'Phát hành LC luồng nhanh'))]//ancestor::tr//i

#-- radio button Luồng Phát hành LC nháp lần đầu
${radiobtn_dialog_50}    //tr[@class='ng-star-inserted'][3]//div[@class='p-radiobutton-box']

#-- radio button Luồng Phát hành LC chính thức chưa phát hành nháp
${radiobtn_dialog_0}    //tr[@class='ng-star-inserted'][7]//div[@class='p-radiobutton-box']

#-- Nghiệp vụ Phát hành LC - phát hành nhanh
${btn_dialog_phat_hanh_nhanh}    //span[contains(.,'Phát hành LC luồng nhanh')]//ancestor::tr//i

#-- radio button Luồng Phát hành LC luồng nhanh chưa phát hành nháp
${radiobtn_dialog_53}    //label[contains(.,'Phát hành LC luồng nhanh chưa phát hành nháp')]//ancestor::p-radiobutton//div[@class='p-radiobutton-box']    

#-- Nút tạo trong pop-up Tạo yêu cầu
${btn_dialog_create_2}    //div[@role='dialog']//button[contains(.,'Tạo')]

#-- textbox CIF trong pop-up Tìm kiếm thông tin khách hàng
${tb_cif}    //input[@name='cif']

#-- btn Tìm kiếm trong pop-up Tìm kiếm thông tin khách hàng
${btn_search_1}    //button[contains(.,'Tìm kiếm')]

#-- radio button thông tin chi tiết khách hàng
${radioBtn_cif}    //div[@class='p-radiobutton-box']

#-- radio button hạn mức con 801 đầu tiên
${radioBtn_first_cusLimit_801}    //tr[contains(.,'801')][1]//div[@class='p-radiobutton-box']

#-- Datatable

#- Textbox tìm kiếm nhanh
${tb_quicksearch}    //input[@ng-reflect-text='Nhấn enter để search']

#- Button Tiếp nhận yêu cầu
${btn_pickup}    //span[contains(.,'Tiếp nhận yêu cầu')]

#- ID BPM
${col_bpmid}    //td[@class='ng-star-inserted'][1]

#- Trạng thái
${col_dahoanthanh_status}    //td//span[@class='badge-status-cho-phan-cong status-badge']

${col_tfodangxuly_status}    //td//span[@class='badge-status-dang-xu-ly status-badge']

${col_tfsdangxuly_status}    //td//span[@class='badge-status-dang-xu-ly status-badge']

${col_makerdangxuly_status}    //td//span[@class='badge-status-luu-nhap status-badge']

${col_huy_status}        //td//span[@class='badge-status-huy status-badge']

#--locators của loading page
${loading_page}    //div[contains(@class,'overlay') and contains(@class,'ng-trigger')]
${loading_fee}    //app-fee-progress-spinner[@ng-reflect-is-loading='true']
