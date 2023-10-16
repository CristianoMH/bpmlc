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
Resource    ../BPMLC05_keyword/keyword_account.robot
Resource    ../BPMLC05_keyword/keyword_assert.robot
Resource    ../BPMLC05_keyword/keyword_workflow.robot