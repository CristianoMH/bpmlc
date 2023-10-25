*** Settings ***

Resource    ../BPMLC01_resource/import.robot

*** Variables ***
${SPECIAL}      !#%^*()-_
${NUMBERS}      1234567890

*** Keywords ***
[BPM] - Maximize browser size to fit screen
    Set window position    0    0
    Set window size        1920    1080

[BPM] - Open Chrome Browser with mode
    [Arguments]     ${url}
    ${browser}    convert to lowercase    ${browser}
    ${true}       convert to boolean      true
    ${list_options}      Create List    --no-sandbox	--headless     --ignore-certificate-errors      --disable-web-security     --disable-impl-side-painting    --enable-features=NetworkService,NetworkServiceInProcess

    ${args}        Create Dictionary    args=${list_options}
    ${desired_capabilities}     create dictionary
    ...         acceptSslCerts=${true}
    ...         acceptInsecureCerts=${true}
    ...         ignore-certificate-errors=${true}
    ...         chromeOptions=${args}

    Run Keyword If   '${browser}' == 'chrome'            Run Keywords
    ...             Open Browser    ${url}    ${browser}
    ...        AND    [BPM] - Maximize browser size to fit screen
    ...     ELSE IF   '${browser}' == 'headlesschrome'    Run keywords
    ...             Open Browser    ${url}    ${browser}    desired_capabilities=${desired_capabilities}
#    ...             Open Chrome Headless Browser    ${url}
    ...        AND     [BPM] - Maximize browser size to fit screen
    ...     ELSE        should be true  ${FALSE}

[BPM] - Click element
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    click element    ${element_loc}

[BPM] - Press key into textbox
    [Arguments]    ${textbox_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    Press keys    ${textbox_loc}    ${text}
    [return]     ${text}    

[BPM] - Mouse over element
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    mouse over    ${element_loc}

[BPM] - Execute JavaScript Click On Element By Xpath
    [Documentation]    Execute JavaScript Click On Element By Xpath
    [Arguments]  ${element_xpath}
    wait until page contains element     ${element_xpath}
    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().click()

[BPM] - Wait for element to appear on page
     [Arguments]  ${locator}      ${timeout}=30
     [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
#     ${previous_kw}=    Register Keyword To Run On Failure    Nothing
     wait until keyword succeeds    ${timeout}s     15s       element should be visible       ${locator}
#     Register Keyword To Run On Failure    ${previous_kw}
 
[BPM] - Wait for element not to appear on page
     [Arguments]  ${locator}      ${timeout}=30
     [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
#     ${previous_kw}=    Register Keyword To Run On Failure    Nothing
     wait until keyword succeeds    ${timeout}s     1s       element should not be visible         ${locator}
#     Register Keyword To Run On Failure    ${previous_kw}

[BPM] - Input text into textbox
    [Arguments]    ${textbox_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${text}
    [return]     ${text}

[BPM] - Delete text from the field by using Backspace key
    [Arguments]        ${str_value}        ${locator}
    [Documentation]    Clear element text using backspace
    ${line_length}     Get Length          ${str_value}
    FOR    ${INDEX}    IN RANGE    1     ${line_length}1
        press keys        ${locator}     \\08
    END

[BPM] - Clear element text using backspace
    [Arguments]        ${locator}
    [Documentation]    Clear element text using backspace
    execute javascript      document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.select()
    press key        ${locator}     \\08

[BPM] - Set element text to blank
    [Arguments]  ${locator}
    [Documentation]    Set element text to blank
    execute javascript      document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value=''

[BPM] - Clear textbox
    [Arguments]    ${textbox_loc}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${EMPTY}

[BPM] - Select label of dropdownlist by label
    [Arguments]  ${dropdownlist_xpath}   ${label}
    click element   ${dropdownlist_xpath}
    click element   //li[@role='option' and text()='${label}']

[BPM] - Get selected value of dropdownlist
    [Arguments]  ${dropdownlist_id}
    ${get_selected_value}=      get selected list value  ${dropdownlist_id}
    [Return]  ${get_selected_value}

[BPM] - Get selected label of dropdownlist
    [Arguments]  ${dropdownlist_id}
    ${get_selected_label}=      get selected list label  ${dropdownlist_id}
    [Return]  ${get_selected_label}

[BPM] - Get Element Attribute
    [Arguments]     ${locator}     ${attribute}
    run keyword and return      SeleniumLibrary.Get Element Attribute         ${locator}     ${attribute}

[BPM] - Refresh Page Until Page Contains Element
    [Documentation]    Refresh Page Until Page Contains Element
	[Arguments]  ${element_xpath}
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element    ${element_xpath}
    WHILE    ${Reload} != ${TRUE}
        sleep    4
        RELOAD PAGE
        ${Reload}=  Run Keyword And Return Status  Page Should Contain element    ${element_xpath}
    END

[BPM] - Set test variable
    [Arguments]    ${name}    ${value}
    Set Test Variable    \${${name}}    ${value}

[BPM] - Set suite variable
    [Arguments]    ${name}    ${value}
    Set Suite Variable    \${${name}}    ${value}
