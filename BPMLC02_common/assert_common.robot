*** Settings ***
Resource    ../BPMLC01_resource/import.robot

*** Keywords ***

[Assert] - Verify value is not displayed on textbox
    [Arguments]     ${textbox_loc}
    ${value}=    Get text    ${textbox_loc}
    Should Be Equal As Strings    ${value}     ${EMPTY}

[Assert] - Verify value is displayed on textbox
    [Arguments]     ${textbox_loc}     ${text}
    ${value}=    Get value    ${textbox_loc}
    Should Be Equal As Strings    ${text}     ${value}

[Assert] - Verify page should not contain button
#    TODO will update to allow @{buttons} as web_locator arguments
    [Arguments]  ${button}
    Page Should Not Contain Element     xpath=${button}

[Assert] - Verify page should not contain element
#    TODO will update to allow @{buttons} as web_locator arguments
    [Arguments]  ${locator}
    Page Should Not Contain Element     xpath=${locator}

[Assert] - Verify page should contain element
#    TODO will update to allow @{buttons} as web_locator arguments
    [Arguments]  ${locator}
    Page Should Contain Element     xpath=${locator}

[Assert] - verify confirmation message is
    [Arguments]  ${message}
    wait until page contains    ${message}
    page should contain         ${message}

[Assert] - verify page title is
    [Arguments]  ${title}
    wait until page contains    ${title}     30


[Assert] - get text by attribute
    [Arguments]    ${element_loc}   ${atrribute}
    ${get_value}    Get element attribute    ${element_loc}  ${atrribute}
    [Return]    ${get_value}

[Assert] - verify page contain message 
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.

[Assert] - get text
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    ${get_text}  get text    ${element_loc}
    [Return]  ${get_text}

[Assert] - Verify page should contain labels
    [Arguments]    @{labels}
    FOR    ${label}    IN    @{labels}
       wait until page contains  ${label}   5s
       page should contain   ${label}
    END

[Assert] - verify dropdownlist contain options
    [Arguments]   ${dropdown_loc}   ${dropdown_item_loc}  @{options}
    wait until keyword succeeds    20s     2s    page should contain element    ${dropdown_loc}
    Execute JavaScript Click On Element By Xpath     ${dropdown_loc}
    wait until keyword succeeds    20s     2s    page should contain element    ${dropdown_item_loc}
    ${get_all_options}     get text   ${dropdown_item_loc}
    ${count}     Get Length   ${options}
    FOR    ${index}   IN RANGE     0   ${count}
       ${expected_option}     get from list   ${options}  ${index}
       should contain   ${get_all_options}  ${expected_option}
    END

[Assert] - verify dropdownlist contain correct options
    [Arguments]    ${dropdown_loc}  @{options}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${dropdown_loc}
    Execute JavaScript Click On Element By Xpath     ${dropdown_loc}
    ${count}     Get Length   ${options}
    FOR    ${index}   IN RANGE     0   ${count}
       ${option}     get from list   ${options}  ${index}
       Execute JavaScripts Wait Element Is Visible    //div[contains(@class,'ant-select-dropdown')]//li[text()='${option}']
    END

[Assert] - Verify element is invisible
    [Arguments]    ${element_loc}
    wait until keyword succeeds   5s   1s    Element Should Not Be Visible    ${element_loc}

[Assert] - Verify element is visible
    [Arguments]    ${element_loc}
    wait until keyword succeeds   5s   1s    Element Should Be Visible    ${element_loc}

[Assert] - verify message is
    [Arguments]  ${message}
    wait until keyword succeeds     5s    1s    page should contain    ${message}

[Assert] - Wait until element has text
    [Arguments]    ${element}
    wait until keyword succeeds    10s   2s  [Assert] - Get text and verify it has value     ${element}

[Assert] - Get text and verify it has value
    [Arguments]     ${element}
    ${text}     get text    ${element}
    should not be empty     ${text}

[Assert] - Verify url path is
    [Arguments]  ${url_path}
    ${url}=    get location
    ${match}=    Get Regexp Matches   ${url}    ${url_path}
    Should Not Be Empty     ${match}

[Assert] - verify it redirects to page
    [Arguments]  ${page_title}
    [Assert] - check page contains element text  ${page_title}

[Assert] - Verify maxlength of selected item is correct
    [Arguments]  ${locator}       ${expectedMaxlength}
    [Documentation]    verify element at ${locator} having correct maxlength on client-side as ${expectedMaxlength}
    Wait Until Element Is Visible    ${locator}
    element should be enabled       ${locator}
    clear element text       ${locator}
    ${tempLength}    evaluate    ${expectedMaxlength}1
    ${string}       generate random string      ${tempLength}   123456789
    input text      ${locator}      ${string}
    ${screenText} =    get value    ${locator}
    ${screenTextLength} =    get length    ${screenText}
    should be equal as integers     ${screenTextLength}         ${expectedMaxlength}

[Assert] - Verify value is displayed on item
    [Documentation]    Verify text is display on item with arguments ${item_loc} and ${text}
    ...    ${item_loc} is locator of item
    ...    ${text} is expect text user verify
    [Arguments]     ${item_loc}     ${text}
    ${value}=    Get text    ${item_loc}
    Should Be Equal As Strings    ${text}     ${value}

[Assert] - Verify element should contain text
    [Documentation]    Verify element should contain text as required with arguments ${element_loc} and ${text}
    ...    ${element_loc} is locator of element
    ...    ${text} is expect text user to verify
    [Arguments]    ${element_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Contain    ${element_loc}    ${text}

[Assert] - Verify color of element
    [Documentation]    Verify color text or backgroud color of element with arguments ${locator}, ${prop_val} and ${color_expect}
    ...    ${locator} is locator of element
    ...    ${prop_val} is CSS property of element
    ...    ${color_expect} is expect color user verify
    [Arguments]    ${locator}    ${prop_val}    ${color_expect}
    ${element_color}=    [Assert] - Get CSS Property Value    ${locator}        ${prop_val}
    Should Be Equal    ${element_color}    ${color_expect}    Color is not as required

[Assert] - check page contains element text
    [Arguments]  ${element_text}
    wait until page contains    ${element_text}     30

[Assert] - check page contains dropdownlists with valid data
    [Arguments]  @{ddl_names}
    FOR    ${name}   IN      @{ddl_names}
       ${ddl_text}=     get text      id=ddl_${name}
       should not start with     ${ddl_text}     None
    END

[Assert] - check page doesn't contain element texts
    [Arguments]  @{elements}
    FOR    ${element}  IN  @{elements}
       page should not contain     ${element}
    END