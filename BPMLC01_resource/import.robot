*** Settings ***

####    LIBRARY    ####
Library           SeleniumLibrary
Library           String
Library           Collections

###    COMMON KEYWORDS    ###
Resource    ../BPMLC02_common/web_common.robot
Resource    ../BPMLC02_common/assert_common.robot
Resource    ../BPMLC02_common/bpm_common.robot
Resource    ../BPMLC02_common/sql_common.robot

###    ELEMENT    ###
Resource    ../BPMLC03_element/element_account.robot
Resource    ../BPMLC03_element/element_tray.robot
Resource    ../BPMLC03_element/element_lcnk.robot
Resource    ../BPMLC03_element/element_lcxk.robot
Resource    ../BPMLC03_element/element_ntnk.robot
Resource    ../BPMLC03_element/element_ntxk.robot

###    DATA    ###
Resource    ../BPMLC04_data/data_account.robot
Resource    ../BPMLC04_data/data_lcnk.robot
Resource    ../BPMLC04_data/data_lcxk.robot
Resource    ../BPMLC04_data/data_ntnk.robot
Resource    ../BPMLC04_data/data_ntxk.robot

###    KEYWORD    ###
Resource    ../BPMLC05_keyword/keyword_create_request/lc/keyword_create_nk_phnhap_flow.robot
Resource    ../BPMLC05_keyword/keyword_submit_request/lc/keyword_submit_nk_phnhap_flow.robot
Resource    ../BPMLC05_keyword/keyword_account.robot
Resource    ../BPMLC05_keyword/keyword_manage_file.robot
Resource    ../BPMLC05_keyword/keyword_read_jsonfile.robot
Resource    ../BPMLC05_keyword/keyword_manage_tray.robot