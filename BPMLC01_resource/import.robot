*** Settings ***

####    LIBRARY    ####
Library           SeleniumLibrary
Library           String
Library           Collections

###    COMMON KEYWORDS    ###
Resource    ../BPMLC02_common/web_common.robot

###    ELEMENT    ###
Resource    ../BPMLC03_element/element_login.robot
Resource    ../BPMLC03_element/element_common.robot
Resource    ../BPMLC03_element/element_tray.robot
Resource    ../BPMLC03_element/element_checklist.robot
Resource    ../BPMLC03_element/element_phathanh_detail.robot

###    DATA    ###
Resource    ../BPMLC04_data/data_common.robot
Resource    ../BPMLC04_data/data_login.robot
Resource    ../BPMLC04_data/LC/LCNK/data_phathanh.robot

###    KEYWORD    ###
Resource    ../BPMLC05_keyword/keyword_common.robot
Resource    ../BPMLC05_keyword/keyword_checklist.robot
Resource    ../BPMLC05_keyword/keyword_detail.robot
Resource    ../BPMLC05_keyword/keyword_login.robot
Resource    ../BPMLC05_keyword/keyword_tray.robot
Resource    ../BPMLC05_keyword/LC/LCNK/keyword_luong_50.robot
