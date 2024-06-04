*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/
${browser}    Chrome
${locator_email}    id=email
${locator_password}    name=password
${locator_btn_Login}    id=btn-login
${locator_msg_email}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_password}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_msg_login_fail}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_hyperlink}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a
${locator_page_name}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > div.MuiBox-root.css-17kxzui > h6
${locator_search_filters}    css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(1) > div > div.MuiCardHeader-root.css-1lbhvlm > div > span
${locator_name_register}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > div > div.MuiBox-root.css-gmuwbf > h6

*** Keywords ***   
Open web brower
    Set Selenium Speed    0.3
    Open Browser    ${url}    ${browser}
    # Maximize Browser Window
    Wait Until Page Contains    Welcome to Kru P' Beam!

Page name
    Wait Until Element Is Visible    ${locator_page_name}
    ${taxt}    Get Text    ${locator_page_name}
    Should Be Equal As Strings    ${taxt}    Kru P' Beam    

Login pass
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    ${password}    Set Variable    ${123456789}
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Password    ${locator_password}    ${password}
    Wait Until Element Is Visible    ${locator_btn_Login}
    Click Element    ${locator_btn_Login}
    Wait Until Page Contains Element	${locator_search_filters}

Link register
    Wait Until Element Is Visible    ${locator_hyperlink}
    Click Element    ${locator_hyperlink}
    Wait Until Page Contains Element    ${locator_name_register}    5s

Input email fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text    ${locator_email}    Beam12345678
    Wait Until Element Is Enabled    ${locator_btn_Login}
    Click Element    ${locator_btnLogin}
    Wait Until Element Is Visible    ${locator_msg_email}
    ${msg_error}    Get Text    ${locator_msg_email}
    should be equal as Strings    ${msg_error}    email must be a valid email

Input password fail
    Wait Until Element Is Visible    ${locator_password}
    ${p}    Set Variable    123
    Input Text    ${locator_password}    ${p}
    Wait Until Element Is Enabled    ${locator_btn_Login}
    Click Element    ${locator_btnLogin}
    Wait Until Element Is Visible    ${locator_msg_password}
    ${msg_error}    Get Text    ${locator_msg_password}
    should be equal as Strings    ${msg_error}    password must be at least 5 characters

Login fail
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    ${password}    Set Variable    ${12345678}
    Input Text    ${locator_email}    test@krupbeam.com
    Input Password    ${locator_password}    ${password}
    Wait Until Element Is Visible    ${locator_btn_Login}
    Click Element    ${locator_btn_Login}
    Wait Until Element Is Visible    ${locator_msg_login_fail}
    ${mag_error}    Get Text    ${locator_msg_login_fail}
    Should Be Equal As Strings    ${mag_error}    Email or Password is invalid

Login data empty
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text   ${locator_email}    ${EMPTY}
    Input Text   ${locator_password}    ${EMPTY}
    Wait Until Element Is Visible    ${locator_btn_Login}
    Click Element    ${locator_btnLogin}
    Wait Until Element Is Visible    ${locator_msg_email}
    ${mag_email}    Get Text    ${locator_msg_email}
    # Should Be Equal As Strings    ${mag_email}    email is a required field
    Element Text Should Be    ${mag_email}    email is a required field
    Wait Until Element Is Visible    ${locator_msg_password}
    ${msg_password}    Get Text    ${locator_msg_password}
    Should Be Equal As Strings    ${msg_password}    password must be at least 5 characters

*** Test Cases ***
TC-001 Default Page
    Open web brower
    Wait Until Page Contains    Welcome to Kru P' Beam!
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locator_btn_Login}
    Wait Until Element Is Visible    ${locator_hyperlink}
    Close Browser

TC-002 Check for page name
    Open web brower
    Page name
    Close Browser

TC-003 Input data for login page case pass
    Open web brower
    Login pass
    Close Browser

TC-004 Select hyperlink create an account
    Open web brower
    Link register
    Close Browser

TC-005 Input data for input email fail
    Open web brower
    Input email fail
    Close Browser

TC-006 Input data for input password fail
    Open web brower
    Input password fail
    Close Browser

TC-007 Test for empty input value
    Open web brower
    Login data empty
    Close Browser

TC-008 Input data for login page case fail
    Open web brower
    Login fail
    Close Browser