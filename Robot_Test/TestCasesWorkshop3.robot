*** Settings ***
Library                     SeleniumLibrary
Resource                    ${CURDIR}/Keywords.robot
Suite Setup                 Set Selenium Speed    0.3s
Test Setup                  Open web browser
Test Teardown               Close Browser
Suite Teardown              Close All Browsers

*** Test Cases ***
test
    [Tags]                  pass
    Open web browser
    
TC-001 Verify logout button
    [Documentation]         ตรวจสอบปุ่ม Logout
    [Tags]                  pass
    Login page              user.test@krupbeam.com           123456789
    Logout page

TC-002 Verify notifications icon
    [Documentation]         ตรวจสอบ icon แจ้งเตือน
    [Tags]                  pass
    Login page              user.test@krupbeam.com           123456789
    Verify notifications icon
    
TC-003 Verify Search Filters
    [Documentation]         ตรวจสอบการแสดงผล ของปุ่ม Search
    [Tags]                  pass
    Login page              user.test@krupbeam.com            123456789
    Select search filters   0
    Click Element           ${locator_btnClear}
    Select search filters   1
    Click Element           ${locator_btnClear}
    Select search filters   2
    Click Element           ${locator_btnClear}
    Select search filters   3
    Click Element           ${locator_btnClear}
    Select search filters   4
    Click Element           ${locator_btnClear}

TC-004 Verify Rows per page
    [Documentation]         ตรวจสอบการแสดงผล จำนวนแถวต่อหน้า
    [Tags]                  pass
    Login page              user.test@krupbeam.com            123456789
    Click Element           ${locator_btnSearch}
    Verify rows per page

TC-005 Verify Next page and Back page
    [Documentation]         ตรวจสอบปุ่มกด Next-Back page
    [Tags]                  pass
    Login page              user.test@krupbeam.com            123456789
    Click Element           ${locator_btnSearch}
    Verify next page and back page

TC-006 Verify clear button on the Search Filters page
    [Documentation]         ตรวจสอบปุ่ม Clear
    [Tags]                  pass
    Login page              user.test@krupbeam.com            123456789
    Click Element           ${locator_selectRole}
    Wait Until Element Is Visible        ${locator_selectRole}
    Click Element           ${locator_selectRole1}

    Click Element           ${locator_selectPlan}
    Wait Until Element Is Visible        ${locator_selectPlan}
    Click Element           ${locator_selectPlan2}

    Click Element           ${locator_selectStatus}
    Wait Until Element Is Visible        ${locator_selectStatus}
    Click Element           ${locator_selectStatus3}

    Click Element           ${locator_btnSearch}
    Click Element           ${locator_btnClear}
    Verify clear button

TC-007 Verify
    [Tags]                  passs
    Login data empty

TC-007 Verify sign up button on the add user page - Input data case pass
    [Documentation]         ตรวจสอบการกรอกข้อมูล  หน้า Form User Case pass 
    [Tags]                  pass
    Input data add user     Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female    4     thai    Admin    team    ${EMPTY}

TC-008 Verify back button on the add user page
    [Documentation]             ตรวจสอบปุ่ม back หน้า Form User
    [Tags]                      pass
    Login page                  user.test@krupbeam.com            123456789
    Click Element               ${locator_btnAddUser}
    Wait Until Page Contains    Kru P' Beam
    Click Element               ${locator_btnBack}
    Wait Until Page Contains    Search Filters

TC-009 Verify reset button on the add user page
    [Documentation]         ตรวจสอบปุ่ม reset หน้า Form User
    [Tags]                  pass
    Login page              user.test@krupbeam.com            123456789
    Click Element           ${locator_btnAddUser}
    Input data    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female     1    thai    Admin    team
    Execute JavaScript      window.scrollTo(document.body.scrollHeight,0)
    Click Link              ${locator_reset}
    Verify reset button

TC-010 Verify sign up button on the add user page - Input data case fail
    [Documentation]         ตรวจสอบการกรอกข้อมูล Case fail
    [Tags]                  pass
    [Template]              Input data add user
    ${EMPTY}    ${EMPTY}	    ${EMPTY}	    ${EMPTY}	    ${EMPTY}	    ${EMPTY}     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    This field is required
    ${EMPTY}    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female     1    thai    Admin    team    This field is required
    Phonsuda    ${EMPTY}	    nan@gmail.com	    12345689	    0803536704	    female     1    thai    Admin    team    This field is required
    Phonsuda    Naloeng	    ${EMPTY}	    12345689	    0803536704	    female     1    thai    Admin    team    This field is required
    Phonsuda    Naloeng	    ssssssss	    12345689	    0803536704	    female     1    thai    Admin    team    Invalid email address
    Phonsuda    Naloeng	    nan@gmail.com	    ${EMPTY}	    0803536704	    female     1    thai    Admin    team    This field is required
    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    ${EMPTY}	    female     1    thai    Admin    team    This field is required
    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    ${EMPTY}     1    thai    Admin    team    This field is required
    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female     ${EMPTY}    thai    Admin    team    This field is required
    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female     1    ${EMPTY}    Admin    team    This field is required
    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female     1    thai    ${EMPTY}    team    This field is required
    Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female     1    thai    Admin    ${EMPTY}    This field is required
    