*** Variables ***
### -------------------------------------------------------------- ###

#---- locators của các element trong tab Thông tin nhập liệu

#--- Tab Thông tin nhập liệu

#-- Vùng Thông tin chung
#- CIF
${label_cif}    //td[@class='ng-star-inserted'][1]
#- Tên khách hàng
${label_customerName}    //td[@class='ng-star-inserted'][2]
#- Nghiệp vụ
${label_business}    //td[@class='ng-star-inserted'][3]
#- Loại sản phẩm
${label_productType}    //td[@class='ng-star-inserted'][4]
#- Thời gian khởi tạo
${label_createDate}    //td[@class='ng-star-inserted'][5]
#- Thời gian dự kiến hoàn thành
${label_completeDate}    //td[@class='ng-star-inserted'][6]
#- Trạng thái
${label_status}    //td[@class='ng-star-inserted'][7]

#-- Vùng Thông tin khách hàng
#- CIF khách hàng
${tb_cif}    //input[@name='customerDtoCif']
#- Tên khách hàng
${tb_customerName}    //input[@name='customerDtoName']
#- Chi nhánh
${dropList_branchCode}    //p-dropdown[@name='customerDtoBranchCode']
#- Địa chỉ
${textarea_Address}    //textarea[@name='cusstomerDtoAddress']
#- Địa chỉ email
${tb_email}    //input[@name='customerDtoEmail']

#-- Vùng Thông tin phát hành
#- Giá trị lc
${tb_lcValue}    //input[@name='importLCInfoDtoLcValue']
#- Dung sai trên
${tb_toTolerance}    //input[@name='importLCInfoDtoToTolerance']
#- Dung sai dưới
${tb_fromTolerance}    //input[@name='importLCInfoDtoFromTolerance']
#- Loại LC
${droplist_lcType}    //span[@class='ng-tns-c410-6 p-dropdown-label p-inputtext ng-star-inserted']
#- Phương thức thanh toán
${droplist_paymentMethod}    //span[@class='ng-tns-c410-7 p-dropdown-label p-inputtext ng-star-inserted']
#- Ngân hàng tài trợ
${drolist_sponsorBank}    //span[@class='ng-tns-c196-8 p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
#- Điều kiện giao hàng
${droplist_deliveryCondition}    //span[@class='ng-tns-c196-9 p-dropdown-label p-inputtext ng-star-inserted']
#- Ngày hết hạn LC
${dpicker_ExpirationDate}    //input[@name='importLCInfoDtoLcExpirationDate']
#- Nơi hết hạn LC
${droplist_lcExpirationLocation}    //span[@class='ng-tns-c196-11 p-dropdown-label p-inputtext p-placeholder ng-star-inserted']
#- Tỷ lệ ký quỹ
${tb_marginRate}    //input[@name='importLCInfoDtoMarginRate']
#- Số tiền ký quỹ
${tb_depositAmount}    //input[@name='importLCInfoDtoDepositAmount']
#- Địa chỉ email
${tb_email}    //input[@id='check']

#--- Tab Danh mục hồ sơ
#-- Nợ chứng từ
#- Nợ chứng từ của Yêu cầu mở thư tín dụng
${dpicker_docDebt_1}    //tr[@class='_highlight ng-star-inserted'][1]//input[@name='effectiveDate']
#- Nợ chứng từ của Hợp đồng/invoice
${dpicker_docDebt_2}    //tr[@class='_highlight ng-star-inserted'][2]//input[@name='effectiveDate']
#- Nợ chứng từ của Mail xác nhận nguồn ngân hàng tài trợ
${dpicker_docDebt_3}    //tr[@class='_highlight ng-star-inserted'][3]//input[@name='effectiveDate']
#- Nợ chứng từ của Mail xác nhận nguồn confirm
${dpicker_docDebt_4}    //tr[@class='ng-star-inserted'][1]//input[@name='effectiveDate']
#- Nợ chứng từ của Chứng từ khác
${dpicker_docDebt_5}    //tr[@class='ng-star-inserted'][2]//input[@name='effectiveDate']

#-- Upload file
#- Upload file của Yêu cầu mở thư tín dụng
${icon_upload_1}    //tr[@class='_highlight ng-star-inserted'][1]//i[@class='icon-msb-upload-line2 __icon-action']
#- Upload file của Hợp đồng/invoice
${icon_upload_2}    //tr[@class='_highlight ng-star-inserted'][2]//i[@class='icon-msb-upload-line2 __icon-action']
#- Upload file của Mail xác nhận nguồn ngân hàng tài trợ
${icon_upload_3}    //tr[@class='_highlight ng-star-inserted'][3]//i[@class='icon-msb-upload-line2 __icon-action']
#- Upload file của Mail xác nhận nguồn confirm
${icon_upload_4}    //tr[@class='ng-star-inserted'][1]//i[@class='icon-msb-upload-line2 __icon-action']
#- Upload file của Chứng từ khác
${icon_upload_5}    //tr[@class='ng-star-inserted'][2]//i[@class='icon-msb-upload-line2 __icon-action']

#--- Các button xử lý
#-- Button Lịch sử yêu cầu
${btn_history}    //button[contains(.,'Lịch sử yêu cầu')]
#-- Button Mở rộng
${btn_expand}    //i[@class='icon-msb-circle-double-down text-danger pl-3 border-left']
#-- Button Thu gọn
${btn_collapse}    //i[@class='icon-msb-circle-double-up text-danger']
#-- Button Quay lại
${btn_back}    //button[contains(.,'Quay lại')]
#-- Button Hủy yêu cầu
${btn_cancel}    //button[contains(.,'Hủy yêu cầu')]
#-- Button Lưu yêu cầu
${btn_draft}    //button[contains(.,'Lưu yêu cầu')]
#-- Button Tiếp theo
${btn_next}    //button[contains(.,'Tiếp theo')]