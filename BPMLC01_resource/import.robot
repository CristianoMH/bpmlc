*** Settings ***

####    LIBRARY    ####
Library           SeleniumLibrary
Library           String
Library           Collections

###    COMMON KEYWORDS    ###
Resource    ../BPMLC02_common/web_common.robot
Resource    ../BPMLC02_common/assert_common.robot
Resource    ../BPMLC02_common/bpm_common.robot

###    ELEMENT    ###
Resource    ../BPMLC03_element/element_account.robot
Resource    ../BPMLC03_element/element_tray.robot
Resource    ../BPMLC03_element/element_lcnk.robot

###    DATA    ###
Resource    ../BPMLC04_data/data_account.robot
Resource    ../BPMLC04_data/data_lcnk.robot

###    KEYWORD    ###
Resource    ../BPMLC05_keyword/keyword_checklist/keyword_flow_phnhanh.robot
Resource    ../BPMLC05_keyword/keyword_input/keyword_flow_phnhanh.robot
Resource    ../BPMLC05_keyword/keyword_submit_request/lc/keyword_submit_nk_phnhanh_flow.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_01_search.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_02_create.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_03_submit.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_04_rollback.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_05_draft.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_06_cancel.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_07_getDetail.robot
Resource    ../BPMLC05_keyword/keyword_workflow/keyword_08_pickup.robot
Resource    ../BPMLC05_keyword/keyword_account.robot
Resource    ../BPMLC05_keyword/keyword_assert.robot