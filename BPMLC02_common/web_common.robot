*** Settings ***

Resource    ../BPMLC01_resource/import.robot

*** Variables ***
${SPECIAL}      !#%^*()-_
${NUMBERS}      1234567890

*** Keywords ***
[Common] - Maximize browser size to fit screen
    Set window position    0    0
    Set window size        1440    900

[Common] - Resize windows to ignore responsive display
    Set Window Size    1440    900

[Common] - Open PhantomJS Browser
    [Arguments]    ${url}
    ${service_args}=    Create List    --ignore-ssl-errors=true
    Create Webdriver    PhantomJS    service_args=${service_args}
    Go To    ${url}

[Common] - Open Chrome Headless Browser with DownloadDir
    [Arguments]    ${url}           ${downloadDir}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --test-type
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-web-security
    Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-impl-side-painting
    Create Webdriver    Chrome        chrome_options=${chrome_options}
    [Common] - Maximize browser size to fit screen
    Go To    ${url}

[Common] - Open Chrome Browser with DownloadDir
    [Arguments]    ${url}           ${downloadDir}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --test-type
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-web-security
    Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-impl-side-painting
    Create Webdriver    Chrome        chrome_options=${chrome_options}
    [Common] - Maximize browser size to fit screen
    Go To    ${url}

[Common] - Open Chrome Browser with mode
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
    ...        AND    [Common] - Maximize browser size to fit screen
    ...     ELSE IF   '${browser}' == 'headlesschrome'    Run keywords
    ...             Open Browser    ${url}    ${browser}    desired_capabilities=${desired_capabilities}
#    ...             Open Chrome Headless Browser    ${url}
    ...        AND     [Common] - Maximize browser size to fit screen
    ...     ELSE        should be true  ${FALSE}


[Common] - Open Browser with default downloadDir config
    [Arguments]         ${downloadDir}
    [Documentation]    Open Back Office url with browser option
    Run Keyword If    '${browser}' == 'phantomjs'         Run Keywords
    ...              Open PhantomJS Browser         ${back_office_ui_url}
    ...        AND     [Common] - Maximize browser size to fit screen
    ...     ELSE IF   '${browser}' == 'chrome'            Run Keywords
    ...             [Common] - Open Chrome Browser with DownloadDir         ${back_office_ui_url}           ${downloadDir}
    ...        AND     [Common] - Maximize browser size to fit screen
    ...     ELSE IF   '${browser}' == 'headlesschrome'    Run keywords
    ...             [Common] - Open Chrome Headless Browser with DownloadDir        ${back_office_ui_url}           ${downloadDir}
    ...        AND     [Common] - Maximize browser size to fit screen
    ...     ELSE        should be true  ${FALSE}

[Common] - Open Safari browser 
    [Arguments]  ${url}
    Create Webdriver  Safari  executable_path=/Applications/Safari Technology Preview.app/Contents/MacOS/safaridriver
    Go To   ${url}

[Common] - Close Browser 
     close browser

[Common] - Select Iframe
    [Arguments]   ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    Select Frame    ${element_loc}

[Common] - click element
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    click element    ${element_loc}


[Common] - Execute JavaScript Click On Element By Xpath
    [Documentation]    Execute JavaScript Click On Element By Xpath
    [Arguments]  ${element_xpath}
    wait until page contains element     ${element_xpath}
    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().click()

[Common] - Click on element and wait for expected item to appear
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    click element  ${locator}
    [Common] - Wait For Element To Appear On Page    ${expectedItem}    ${timeout}

[Common] - Click on element and wait for expected item not to appear
    [Arguments]  ${locator}      ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} not to appear
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    click element  ${locator}
    [Common] - Wait for element not to appear on page    ${expectedItem}    ${timeout}

[Common] - Try to click on element until expected item appears
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    Wait until keyword succeeds    30s     1s       run keywords
    ...     click element       ${locator}      AND
    ...     element should be visible      ${expectedItem}

[Common] - Try to click on element until expected item unappears
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    Wait until keyword succeeds    30s     1s       run keywords
    ...     click element       ${locator}      AND
    ...     element should not be visible      ${expectedItem}

[Common] - Click on element and wait for expected item to appear using JS
    [Arguments]  ${locator}     ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} appears
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    execute javascript click on element by xpath        ${locator}
    [Common] - Wait for element to appear on page    ${expectedItem}    ${timeout}

[Common] - Click on element and wait for expected item not to appear using JS
    [Arguments]  ${locator}      ${expectedItem}     ${timeout}=30
    [Documentation]    Try to click element at ${locator} and wait for ${expectedItem} not to appear
    ...     with the total timeout of ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    execute javascript click on element by xpath        ${locator}
    [Common] - Wait for element not to appear on page    ${expectedItem}    ${timeout}


[Common] - Execute JavaScripts Wait Element Is Visible
    [Documentation]    Execute JavaScripts Wait Element Is Visible
    [Arguments]  ${element_xpath}
    ${isVisible}    run keyword and return status    Wait Until Keyword Succeeds    5s   1s    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${true}    convert to boolean      TRUE
    Should Be Equal    ${isVisible}     ${true}    Element ${element_xpath} is not Visible !

[Common] - Execute JavaScripts Wait Element Is Not Visible
    [Documentation]    Execute JavaScripts Wait Element Is Visible
    [Arguments]  ${element_xpath}
    ${isVisible}    run keyword and return status    Wait Until Keyword Succeeds    5s   1s    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${false}=    convert to boolean      FALSE
    Should Be Equal    ${isVisible}     ${false}    Element ${element_xpath} is Visible !

[Common] - Execute JavaScripts to Input Text
    [Documentation]    Execute JavaScripts to Input Text
    [Arguments]  ${element_xpath}    ${text}
    ${isVisible}    run keyword and return status    Wait Until Keyword Succeeds    5s   1s    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().value = "${text}";
    ${true}    convert to boolean      TRUE
    Should Be Equal    ${isVisible}     ${true}    Element ${element_xpath} is not Visible !

[Common] - Wait for element to appear on page
     [Arguments]  ${locator}      ${timeout}=30
     [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
#     ${previous_kw}=    Register Keyword To Run On Failure    Nothing
     wait until keyword succeeds    ${timeout}s     1s       element should be visible       ${locator}
#     Register Keyword To Run On Failure    ${previous_kw}
 
[Common] - Wait for element not to appear on page
     [Arguments]  ${locator}      ${timeout}=30
     [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
#     ${previous_kw}=    Register Keyword To Run On Failure    Nothing
     wait until keyword succeeds    ${timeout}s     1s       element should not be visible         ${locator}
#     Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait For Spinner is not Visible
    ${previous_kw}=    Register Keyword To Run On Failure    Nothing
    Wait Until Keyword Succeeds  30s  1s  Page Should Not Contain Element    //div[contains(@class, 'ant-spin-spinning')]
    Register Keyword To Run On Failure    ${previous_kw}   

[Common] - Wait for Spinner is loading successful
    Wait Until Keyword Succeeds  20s  1s  Page Should Not Contain Element    //div[contains(@class,'_loading_overlay_content')]

[Common] - Wait for page to finish loading
#   ${previous_kw}=    Register Keyword To Run On Failure    Nothing
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //div[@id='fetching_menu_preloader']
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //span[@class='ant-spin-dot ant-spin-dot-spin']
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //div[@class='ant-spin-container ant-spin-blur']
#   Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait for datagrid to finish refreshing
#   ${previous_kw}=    Register Keyword To Run On Failure    Nothing
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //span[@class='ant-spin-dot ant-spin-dot-spin']
   wait until keyword succeeds    60s     1s    Element Should Not Be Visible       //div[@class='ant-spin ant-spin-spinning']
#   Register Keyword To Run On Failure    ${previous_kw}

[Common] - Wait for screen to finish loading data
   Wait for page to finish loading
   Wait for datagrid to finish refreshing

[Common] - Input text into textbox
    [Arguments]    ${textbox_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${text}
    [return]     ${text}

[Common] - Delete text from the field by using Backspace key
    [Arguments]        ${str_value}        ${locator}
    [Documentation]    Clear element text using backspace
    ${line_length}     Get Length          ${str_value}
    FOR    ${INDEX}    IN RANGE    1     ${line_length}1
        press key        ${locator}     \\08
    END

[Common] - Clear element text using backspace
    [Arguments]        ${locator}
    [Documentation]    Clear element text using backspace
    execute javascript      document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.select()
    press key        ${locator}     \\08

[Common] - Set element text to blank
    [Arguments]  ${locator}
    [Documentation]    Set element text to blank
    execute javascript      document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value=''

[Common] - Clear textbox
    [Arguments]    ${textbox_loc}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${EMPTY}

[Common] - Wait until message is invisible
    [Arguments]  ${message}
    wait until keyword succeeds     5s    1s    page should not contain    ${message}

[Common] - Convert Boolean to Shown Value
    [Arguments]     ${val}
    return from keyword if      ${val}          Yes
    [Return]        No

[Common] - Select label of dropdownlist by label
    [Arguments]  ${dropdownlist_xpath}   ${label}
    click element   ${dropdownlist_xpath}
    click element   //li[@role='option' and text()='${label}']

[Common] - Get selected value of dropdownlist
    [Arguments]  ${dropdownlist_id}
    ${get_selected_value}=      get selected list value  ${dropdownlist_id}
    [Return]  ${get_selected_value}

[Common] - Get selected label of dropdownlist
    [Arguments]  ${dropdownlist_id}
    ${get_selected_label}=      get selected list label  ${dropdownlist_id}
    [Return]  ${get_selected_label}

[Common] - Get selected label of dropdownlist by index
     [Arguments]  ${dropdownlist_id}   ${index}
    ${dropdownlist_id1}=     replace string     ${dropdownlist_id}      =     ='
    ${dropdownlist_id2}=    replace string using regexp     ${dropdownlist_id1}    $     '
#    click element   ${dropdownlist_id}
    ${get_selected_label}=    get text   xpath=//*[@${dropdownlist_id2}]/option[${index}]
    [Return]  ${get_selected_label}

[Common] - convert to lowercase and replace spaces into underscore
    [Arguments]  ${string}
    ${string_lower}=   convert to lowercase    ${string}
    ${string_repl}=   replace string   ${string_lower}     ${SPACE}     _
    [Return]  ${string_repl}

[Common] - Get Element Attribute
    [Arguments]     ${locator}     ${attribute}
    run keyword and return      SeleniumLibrary.Get Element Attribute         ${locator}     ${attribute}

[Common] - Get value with prefix
    [Arguments]         ${value}          ${prefix}
    ${returnValue}=     Catenate          ${prefix}           ${value}
    [Return]            ${returnValue}

[Common] - Get value with postfix
    [Arguments]         ${value}          ${postfix}
    ${returnValue}=     Catenate          ${value}       ${postfix}
    [Return]            ${returnValue}

[Common] - Scroll To Element By Xpath
    [Documentation]    Scroll To Element By Xpath
	[Arguments]  ${element_xpath}
	wait until page contains element     ${element_xpath}
	Execute Javascript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(false);

[Common] - Scroll To Element By Xpath with additional alignment
    [Documentation]    true - the top of the element will be aligned to the top of the visible area of the scrollable ancestor
    ...     false - the bottom of the element will be aligned to the bottom of the visible area of the scrollable ancestor
    ...     If omitted, it will scroll to the top of the element
	[Arguments]  ${element_xpath}       ${align_to}=true
	wait until page contains element     ${element_xpath}
	Execute Javascript    document.evaluate("${element_xpath}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(${align_to});

[Common] - Scroll right on page
    Execute Javascript	window.scrollTo(document.body.scrollWidth,document.body.scrollHeight);

[Common] - scroll down on page
    Execute Javascript	window.scrollTo(0,document.body.scrollHeight);

[Common] - Get page source
    ${myHtml} =    Get Source
    log     ${myHtml}
    [Return]            ${myHtml}

[Common] - Get page title
    ${page_title}=      Get Title
    log     ${page_title}
    [Return]            ${page_title}
