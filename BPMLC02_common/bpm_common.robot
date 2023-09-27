*** Settings ***

Resource    ../BPMLC01_resource/import.robot

*** Variables ***
${SPECIAL}      !#%^*()-_
${NUMBERS}      1234567890

*** Keywords ***
[BPM] - Maximize browser size to fit screen
    Set window position    0    0
    Set window size        1920    1080

[BPM] - Resize windows to ignore responsive display
    Set Window Size    1440    900

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

[BPM] - Select Iframe
    [Arguments]   ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    Select Frame    ${element_loc}

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

[BPM] - Click on element and wait for expected item to appear
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    click element  ${locator}
    [BPM] - Wait For Element To Appear On Page    ${expectedItem}    ${timeout}

[BPM] - Click on element and wait for expected item not to appear
    [Arguments]  ${locator}      ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} not to appear
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    click element  ${locator}
    [BPM] - Wait for element not to appear on page    ${expectedItem}    ${timeout}

[BPM] - Try to click on element until expected item appears
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    Wait until keyword succeeds    30s     1s       run keywords
    ...     click element       ${locator}      AND
    ...     element should be visible      ${expectedItem}

[BPM] - Try to click on element until expected item unappears
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    Wait until keyword succeeds    30s     1s       run keywords
    ...     click element       ${locator}      AND
    ...     element should not be visible      ${expectedItem}

[BPM] - Click on element and wait for expected item to appear using JS
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    execute javascript click on element by xpath        ${locator}
    [BPM] - Wait for element to appear on page    ${expectedItem}    ${timeout}

[BPM] - Click on element and wait for expected item not to appear using JS
    [Arguments]  ${locator}      ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} not to appear
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    execute javascript click on element by xpath        ${locator}
    [BPM] - Wait for element not to appear on page    ${expectedItem}    ${timeout}


[BPM] - Execute JavaScripts Wait Element Is Visible
    [Documentation]    Execute JavaScripts Wait Element Is Visible
    [Arguments]  ${element_xpath}
    ${isVisible}    run keyword and return status    Wait Until Keyword Succeeds    5s   1s    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${true}    convert to boolean      TRUE
    Should Be Equal    ${isVisible}     ${true}    Element ${element_xpath} is not Visible !

[BPM] - Execute JavaScripts Wait Element Is Not Visible
    [Documentation]    Execute JavaScripts Wait Element Is Visible
    [Arguments]  ${element_xpath}
    ${isVisible}    run keyword and return status    Wait Until Keyword Succeeds    5s   1s    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${false}=    convert to boolean      FALSE
    Should Be Equal    ${isVisible}     ${false}    Element ${element_xpath} is Visible !

[BPM] - Execute JavaScripts to Input Text
    [Documentation]    Execute JavaScripts to Input Text
    [Arguments]  ${element_xpath}    ${text}
    ${isVisible}    run keyword and return status    Wait Until Keyword Succeeds    5s   1s    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().value = "${text}";
    ${true}    convert to boolean      TRUE
    Should Be Equal    ${isVisible}     ${true}    Element ${element_xpath} is not Visible !

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

[BPM] - Wait For Spinner is not Visible
    ${previous_kw}=    Register Keyword To Run On Failure    Nothing
    Wait Until Keyword Succeeds  30s  1s  Page Should Not Contain Element    //div[contains(@class, 'ant-spin-spinning')]
    Register Keyword To Run On Failure    ${previous_kw}   

[BPM] - Wait for Spinner is loading successful
    Wait Until Keyword Succeeds  20s  1s  Page Should Not Contain Element    //div[contains(@class,'_loading_overlay_content')]

[BPM] - Wait for page to finish loading
#   ${previous_kw}=    Register Keyword To Run On Failure    Nothing
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //div[@id='fetching_menu_preloader']
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //span[@class='ant-spin-dot ant-spin-dot-spin']
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //div[@class='ant-spin-container ant-spin-blur']
#   Register Keyword To Run On Failure    ${previous_kw}

[BPM] - Wait for datagrid to finish refreshing
#   ${previous_kw}=    Register Keyword To Run On Failure    Nothing
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //span[@class='ant-spin-dot ant-spin-dot-spin']
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //div[@class='ant-spin ant-spin-spinning']
#   Register Keyword To Run On Failure    ${previous_kw}

[BPM] - Wait for screen to finish loading data
   Wait for page to finish loading
   Wait for datagrid to finish refreshing

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
        press key        ${locator}     \\08
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

[BPM] - Wait until message is invisible
    [Arguments]  ${message}
    wait until keyword succeeds     5s    1s    page should not contain    ${message}

[BPM] - Convert Boolean to Shown Value
    [Arguments]     ${val}
    return from keyword if      ${val}          Yes
    [Return]        No

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

[BPM] - Get selected label of dropdownlist by index
     [Arguments]  ${dropdownlist_id}   ${index}
    ${dropdownlist_id1}=     replace string     ${dropdownlist_id}      =     ='
    ${dropdownlist_id2}=    replace string using regexp     ${dropdownlist_id1}    $     '
#    click element   ${dropdownlist_id}
    ${get_selected_label}=    get text   xpath=//*[@${dropdownlist_id2}]/option[${index}]
    [Return]  ${get_selected_label}

[BPM] - convert to lowercase and replace spaces into underscore
    [Arguments]  ${string}
    ${string_lower}=   convert to lowercase    ${string}
    ${string_repl}=   replace string   ${string_lower}     ${SPACE}     _
    [Return]  ${string_repl}

[BPM] - Get Element Attribute
    [Arguments]     ${locator}     ${attribute}
    run keyword and return      SeleniumLibrary.Get Element Attribute         ${locator}     ${attribute}

[BPM] - Get value with prefix
    [Arguments]         ${value}          ${prefix}
    ${returnValue}=     Catenate          ${prefix}           ${value}
    [Return]            ${returnValue}

[BPM] - Get value with postfix
    [Arguments]         ${value}          ${postfix}
    ${returnValue}=     Catenate          ${value}       ${postfix}
    [Return]            ${returnValue}

[BPM] - Scroll To Element By Xpath
    [Documentation]    Scroll To Element By Xpath
	[Arguments]  ${element_xpath}
	wait until page contains element     ${element_xpath}
	Execute Javascript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(false);

[BPM] - Scroll To Element By Xpath with additional alignment
    [Documentation]    true - the top of the element will be aligned to the top of the visible area of the scrollable ancestor
    ...     false - the bottom of the element will be aligned to the bottom of the visible area of the scrollable ancestor
    ...     If omitted, it will scroll to the top of the element
	[Arguments]  ${element_xpath}       ${align_to}=true
	wait until page contains element     ${element_xpath}
	Execute Javascript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(${align_to});

[BPM] - Refresh Page Until Page Contains Element
    [Documentation]    Refresh Page Until Page Contains Element
	[Arguments]  ${element_xpath}
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element    ${element_xpath}
    WHILE    ${Reload} != ${TRUE}
        sleep    4
        RELOAD PAGE
        ${Reload}=  Run Keyword And Return Status  Page Should Contain element    ${element_xpath}
    END

[BPM] - Scroll right on page
    Execute Javascript	window.scrollTo(document.body.scrollWidth,document.body.scrollHeight);

[BPM] - scroll down on page
    Execute Javascript	window.scrollTo(0,document.body.scrollHeight);

[BPM] - Get page source
    ${myHtml} =    Get Source
    log     ${myHtml}
    [Return]            ${myHtml}

[BPM] - Get page title
    ${page_title}=      Get Title
    log     ${page_title}
    [Return]            ${page_title}

[BPM] - Set test variable
    [Arguments]    ${name}    ${value}
    Set Test Variable    \${${name}}    ${value}

[BPM] - Set suite variable
    [Arguments]    ${name}    ${value}
    Set Suite Variable    \${${name}}    ${value}

Fill text
     [Arguments]   ${locator}   ${value}
     run keyword and continue on failure  input text  ${locator}  ${value}
