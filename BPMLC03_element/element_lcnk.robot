*** Variables ***
### -------------------------------------------------------------- ###

#---- locators của các element trong tab Thông tin nhập liệu

#--- Tab Thông tin nhập liệu
${tab_input}    //button[contains(.,'Thông tin nhập liệu')]
#-- Breadcrumb
${label_requestcode}    //li[@ng-reflect-ng-class='[object Object]'][3]    

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
#- Đơn vị tiền tệ
${tb_currency}    //p-dropdown[@name='importLCInfoDtoCurrency']//span[contains(.,'USD')]
#- Dung sai trên
${tb_toTolerance}    //input[@name='importLCInfoDtoToTolerance']
#- Dung sai dưới
${tb_fromTolerance}    //input[@name='importLCInfoDtoFromTolerance']
#- Loại LC
${droplist_lcType}    //span[@class='ng-tns-c410-6 p-dropdown-label p-inputtext ng-star-inserted']
#- Phương thức thanh toán
${droplist_paymentMethod}    //span[@class='ng-tns-c410-7 p-dropdown-label p-inputtext ng-star-inserted']
#- Ngân hàng tài trợ
${droplist_sponsorBank}    //span[contains(.,'Chọn Ngân hàng tài trợ')]
#- Điều kiện giao hàng
${droplist_deliveryCondition}    //span[@class='ng-tns-c196-9 p-dropdown-label p-inputtext ng-star-inserted']
#- Ngày hết hạn LC
${dpicker_ExpirationDate}    //input[@name='importLCInfoDtoLcExpirationDate']
#- Nơi hết hạn LC
${droplist_lcExpirationLocation}    //span[contains(.,'Nơi hết hạn LC')]
#- Tỷ lệ ký quỹ
${tb_marginRate}    //input[@name='importLCInfoDtoMarginRate']
#- Số tiền ký quỹ
${tb_depositAmount}    //input[@name='importLCInfoDtoDepositAmount']
#- Hình thức ký quỹ
${droplist_depositForm}    //p-dropdown[@name='importLCInfoDtoDepositForm']
#- Số tài khoản ghi nợ
${tb_debitAccount}    //span[contains(.,'Số tài khoản ghi nợ')]
#- Địa chỉ email
${tb_email_lq}    //input[@role='searchbox']

#-- Vùng Thông tin RMA
#- Ngân hàng thụ hưởng
${tb_swift}    //input[@name='lcRmaDtoSwiftCode']
${button_check_rma}    //button[contains(.,'Kiểm tra')]

#--- Tab Danh mục hồ sơ
${tab_checklist}    //button[contains(.,'Danh mục hồ sơ')]

#--- Tab Hồ sơ LC
${tab_hosoLC}    //button[contains(.,'Hồ sơ LC')]
${tb_refLc}    //input[@name='lcGeneralInfoDtoRefNumber']

#-- Nợ chứng từ
#- Nợ chứng từ của Yêu cầu mở thư tín dụng
${dpicker_docDebt_ycmttd}    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//input[@name='effectiveDate']
#- Nợ chứng từ của Hợp đồng/invoice
${dpicker_hdi}    //tr[./td[contains(text(),'Hợp đồng/invoice')]]//input[@name='effectiveDate']
#- Nợ chứng từ của Mail xác nhận nguồn ngân hàng tài trợ
${dpicker_mxnnnhtt}    //tr[./td[contains(text(),'Mail xác nhận nguồn ngân hàng tài trợ')]]//input[@name='effectiveDate']
#- Nợ chứng từ của Mail xác nhận nguồn confirm
${dpicker_docDebt_mxnnc}    //tr[./td[contains(text(),'Mail xác nhận nguồn confirm')]]//input[@name='effectiveDate']
#- Nợ chứng từ của Chứng từ khác
${dpicker_docDebt_ctk}    //tr[./td[contains(text(),'Chứng từ khác')]]//input[@name='effectiveDate']

#-- Upload file
#- Thẻ input file của Yêu cầu mở thư tín dụng
${input_upload_ycmttd}    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//a//input
#- Thẻ a file của Yêu cầu mở thư tín dụng
${a_upload_ycmttd}    //tr[./td[contains(text(),'Yêu cầu mở thư tín dụng')]]//a
#- Thẻ input file của Hợp đồng/invoice
${input_upload_hdi}    //tr[./td[contains(text(),'Hợp đồng/invoice')]]//a//input
#- Thẻ a file của Hợp đồng/invoice
${a_upload_hdi}    //tr[./td[contains(text(),'Hợp đồng/invoice')]]//a
#- Thẻ input file của Mail xác nhận nguồn ngân hàng tài trợ
${input_upload_mxnnnhtt}    //tr[./td[contains(text(),'Mail xác nhận nguồn ngân hàng tài trợ')]]//a//input
#- Thẻ a file của Mail xác nhận nguồn ngân hàng tài trợ
${a_upload_mxnnnhtt}    //tr[./td[contains(text(),'Mail xác nhận nguồn ngân hàng tài trợ')]]//a
#- Thẻ input file của Mail xác nhận nguồn confirm
${input_upload_mxnnc}    //tr[./td[contains(text(),'Mail xác nhận nguồn confirm')]]//a//input
#- Thẻ a file của Mail xác nhận nguồn confirm
${a_upload_mxnnc}    //tr[./td[contains(text(),'Mail xác nhận nguồn confirm')]]//a
#- Thẻ input file của Chứng từ khác
${input_upload_ctk}    //tr[./td[contains(text(),'Chứng từ khác')]]//a//input
#- Thẻ a file của Chứng từ khác
${a_upload_ctk}    //tr[./td[contains(text(),'Chứng từ khác')]]//a
#- Thẻ input file của Cam kết của bên yêu cầu mở thư tín dụng
${input_upload_ckcbycmttd}    //tr[./td[contains(text(),'Cam kết của bên yêu cầu mở thư tín dụng')]]//a//input
#- Thẻ a file của Cam kết của bên yêu cầu mở thư tín dụng
${a_upload_ckcbycmttd}    //tr[./td[contains(text(),'Cam kết của bên yêu cầu mở thư tín dụng')]]//a
#- Thẻ input file của Giấy chứng nhận bảo hiểm
${input_upload_gcnbh}    //tr[./td[contains(text(),'Giấy chứng nhận bảo hiểm')]]//a//input
#- Thẻ a file của Giấy chứng nhận bảo hiểm
${a_upload_gcnbh}    //tr[./td[contains(text(),'Giấy chứng nhận bảo hiểm')]]//a

#-- Pop-up

#- Pop-up gửi trả
${popup_rollback}    //div[@class='modal-content']
#- Nội dung xác nhận
${textarea_confirm}    //textarea[@placeholder]
#- Lý do gửi trả
${droplist_rollback_reason}    //p-multiselect//div[@ng-reflect-tooltip-position='right']
#- Tắt lý do gửi trả
${btn_close_popup_rollback}    //span[contains(@class,'p-multiselect-close-icon')]
#- Nội dung gửi trả
${textarea_rollback_content}    //textarea[@placeholder='Nhập nội dung...']
#- Người được gửi trả
${droplist_rollbackto_tfo}    //p-dropdown[@optionvalue='id']//span[contains(.,'TFO')]
${droplist_rollbackto_maker}    //p-dropdown[@optionvalue='id']//span[contains(.,'Maker')]

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
#-- Button Gửi yêu cầu
${btn_send}    //button[contains(.,'Gửi yêu cầu')]
#-- Button Gửi
${btn_submit}    //button[@type = 'submit']
#-- Button Phê duyệt
${btn_approve}    //button[contains(.,'Phê duyệt')]
#-- Button Đồng ý
${btn_agree}    //button[contains(.,'Đồng ý')]
#-- Button Duyệt
${btn_accept}    //button[contains(.,'Duyệt')]
#-- Button Phản hồi
${btn_rollback}    //button[contains(.,'Phản hồi')]
#-- Button phản hồi trong pop-up
${btn_dialog_rollback}    //button[contains(.,'Phản hồi') and @type='submit']
#- Button Đóng pop-up
${btn_close}    //button[contains(.,'Đóng')]