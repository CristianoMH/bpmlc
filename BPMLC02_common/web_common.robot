*** Settings ***

Resource    ../BPMLC01_resource/import.robot

*** Keywords ***

[Common] - Maximize browser size to fit screen
    Set window position    0    0
    Set window size        1920    1080

[Common] - Resize windows to ignore responsive display
    Set Window Size    1440    900

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

[Common] - Click element
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=10s    error=Could not find ${element_loc} element.
    click element    ${element_loc}

[Common] - Close Browser 
    close browser

[Common] - Select Iframe
    [Arguments]   ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=10s    error=Could not find ${element_loc} element.
    Select Frame    ${element_loc}

[Common] - Input text into textbox
    [Arguments]    ${textbox_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    input text    ${textbox_loc}    ${text}
    [return]     ${text}

[Common] - Press key into textbox
    [Arguments]    ${textbox_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Be Visible    ${textbox_loc}
    Press keys    ${textbox_loc}    ${text}
    [return]     ${text}    

[Common] - Mouse over element
    [Arguments]  ${element_loc}
    wait until keyword succeeds     5s    1s    Wait Until Element Is Visible    ${element_loc}    timeout=20s    error=Could not find ${element_loc} element.
    mouse over    ${element_loc}

[Common] - verify message is
    [Arguments]  ${message}
    wait until keyword succeeds     5s    1s    page should contain    ${message}

[Common] - Select label of dropdownlist by label 2
    [Arguments]  ${dropdownlist_xpath}   ${label}
    click element   ${dropdownlist_xpath}
    click element   ${dropdownlist_xpath}//option[@value='${label}' and text()='${label}']
    click element   ${dropdownlist_xpath}

[Common] - Get CSS Property Value
    [Documentation]
    ...    Get the CSS property value of an Element.
    ...    
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...    
    ...    Arguments:
    ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name     (string)    the name of the css property for which the value is returned.
    ...    
    ...    Returns             (string)    returns the string value of the given css attribute or fails.
    ...        
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    Log to console    ----------------${prop_val}

[Common] - Wait for element to appear on page
     [Arguments]  ${locator}      ${timeout}=30
     [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
#     ${previous_kw}=    Register Keyword To Run On Failure    Nothing
     wait until keyword succeeds    ${timeout}s     1s       element should be visible       ${locator}
#     Register Keyword To Run On Failure    ${previous_kw}

[Common] - Clear element text using backspace
    [Documentation]    Clear text inside element using backspace with argument ${element_loc}
    ...    ${element_loc} is locator of element
    [Arguments]        ${element_loc}
    execute javascript      document.evaluate("${element_loc}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.select()
    press key        ${element_loc}     \\08

[Common] - Select label of dropdownlist by label
    [Documentation]    Select label of dropdownlist with arguments ${dropdownlist_xpath} and ${label}
    ...    ${dropdownlist_xpath} is locator of dropdownlist
    ...    ${label} is label user select
    [Arguments]  ${dropdownlist_xpath}   ${label}
     Select From List By Label    ${dropdownlist_xpath}   ${label}

[Common] - Verify value is displayed on item
    [Documentation]    Verify text is display on item with arguments ${item_loc} and ${text}
    ...    ${item_loc} is locator of item
    ...    ${text} is expect text user verify
    [Arguments]     ${item_loc}     ${text}
    ${value}=    Get text    ${item_loc}
    Should Be Equal As Strings    ${text}     ${value}

[Common] - Verify color of element
    [Documentation]    Verify color text or backgroud color of element with arguments ${locator}, ${prop_val} and ${color_expect}
    ...    ${locator} is locator of element
    ...    ${prop_val} is CSS property of element
    ...    ${color_expect} is expect color user verify
    [Arguments]    ${locator}    ${prop_val}    ${color_expect}
    ${element_color}=    [Common] - Get CSS Property Value    ${locator}        ${prop_val}
    Should Be Equal    ${element_color}    ${color_expect}    Color is not as required

[Common] - Scrolling page using JS executor
    [Documentation]    Scroll page till it reach a pixel number with argument ${scroll_height}
    ...    ${scroll_height} is height of screen
    [Arguments]    ${scroll_height}
    execute javascript    window.scrollTo(0,${scroll_height})

[Common] - Verify element should contain text
    [Documentation]    Verify element should contain text as required with arguments ${element_loc} and ${text}
    ...    ${element_loc} is locator of element
    ...    ${text} is expect text user to verify
    [Arguments]    ${element_loc}    ${text}
    wait until keyword succeeds    10s     1s    Element Should Contain    ${element_loc}    ${text}

[Common] - Check page contains element text
    [Documentation]    Check page contains element text with arguments ${element_text}
    ...    ${element_text} is locator of element
    [Arguments]  ${element_text}
    wait until page contains    ${element_text}     10

[Common] - Verify it redirects to page
    [Documentation]    Verify it redirects to page has title as required with arguments ${page_title}
    ...    ${page_title} is title of page
    [Arguments]  ${page_title}
    [Common] - Check page contains element text  ${page_title}

[Common] - Verify dropdownlist contain options
    [Documentation]    Verify dropdownlist contain options with arguments  ${dropdown_item_loc} and @{expect_options}
    ...    ${dropdown_item_loc} is locator of drodownlistItem
    ...    @{expect_options} are list of options users expect
    [Arguments]  ${dropdown_item_loc}  @{expect_options}
    wait until keyword succeeds    20s     2s    page should contain element    ${dropdown_item_loc}
    @{list_elements}    Get WebElements    ${dropdown_item_loc}
    @{default_options}    Create List      
    FOR    ${element}    IN    @{list_elements}
    ${text_option}     get text   ${element}
    Append To List    ${default_options}    ${text_option}
    END
    ${list_1}    Create List    @{default_options}
    ${list_2}    Create List    @{expect_options}
    Lists Should Be Equal   ${list_1}      ${list_2}         The dropdown list does not have enough options
    
[Common] - Verify url
    [Documentation]    Verify url with argument ${url_expect}
    ...    ${url_expect} is url users expect
    [Arguments]    ${url_expect}
    ${url_default}=    Get Location
    ${sub_url_default}=    Get Substring    ${url_default}    0    21
    Should Be Equal As Strings    ${sub_url_default}    ${url_expect}    The URL is wrong, please check again

[Common] - Verify element has right attribute
    [Documentation]    Verify element has right attribute with arguments ${locator} and ${attri_val}
    ...    ${locator} is locator of element
    ...    ${attri_val} is attribute users expect
    [Arguments]    ${locator}    ${attri_val}
    ${attri_element}=    Get Element Attribute    ${locator}    class
    Should Be Equal    ${attri_element}   ${attri_val}    Class attribute is not as required

[Common] - Verify element has right css propery
    [Documentation]    Verify url with argument ${url_expect}
    ...    ${url_expect} is url users expect
    [Arguments]    ${locator}    ${css_prop_expect}    ${attribute_name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute_name}
    Should Be Equal    ${prop_val}   ${css_prop_expect}    Css property is not as required

[Common] - Verify button should not be visible
    [Documentation]    Verify button should not be visible with argument ${button}
    ...    ${button} is locator of button
    [Arguments]  ${button}
    Element Should Not Be Visible     ${button}    messsage=Element is visible

[Common] - Switch latest window
    [Documentation]    Switch latest window
    Switch Window    locator=NEW    timeout=None    browser=CURRENT

[Common] - Compare 2 lists with each other
    [Arguments]    ${list_elements_locator}    @{list_cb_color_expect}
    @{list_elements}    Get WebElements    ${list_elements_locator}
    @{MyList}    Create List
    FOR    ${i}    IN    @{list_elements}
    ${css}=         Get WebElement    ${i}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    background-color
    Append To List    ${MyList}    ${prop_val}
    END
    ${ls1}    Create List    @{MyList}
    ${ls2}    Create List    @{list_cb_color_expect}
    Lists Should Be Equal    ${ls1}      ${ls2}         Color is not as required

[Common] - Scroll page till go to bottom
    [Documentation]    Scroll page till go to bottom
    execute javascript    window.scrollTo(0,document.body.scrollHeight)
    sleep                 1
    execute javascript    window.scrollTo(0,document.body.scrollHeight)
    sleep                 3

[Common] - Set test variable
    [Arguments]    ${name}    ${value}
    Set Test Variable    \${${name}}    ${value}

[Common] - Convert amount to number format
    [Arguments]  ${amount}    ${output}=true_amount
    @{list_value} =  Split String    ${amount}
    ${first_value} =   Get From List   ${list_value}    0
    ${format_amount}    Remove String Using Regexp  ${first_value}    [,]
    [Common] - Set test variable    name=${output}    value=${format_amount}
