*** Settings ***
Library                                SeleniumLibrary
Resource                               ${CURDIR}/Variables.robot

*** Keywords ***
Open web browser
    # ${chrome_options}                   Evaluate                          sys.modules['selenium.webdriver'].ChromeOptions()    sys
    # ${chrome_options.binary_location}   Set Variable                      ${CHROME_BROWSER_PATH}
    Open browser                        ${url}                            ${browser}    
	# ...    options=${chrome_options}
    Maximize Browser Window

Login page
    [Arguments]                         ${email}                          ${pass}
    Wait Until Page Contains            Kru P' Beam
    Wait Until Element Is Visible       ${locator_emailLogin}
    Input Text                          ${locator_emailLogin}             ${email}
    Wait Until Element Is Visible       ${locator_passwordLogin}
    ${p}                                Set Variable                      ${pass}
    Input Password                      ${locator_passwordLogin}          ${p}
    Wait Until Element Is Visible       ${locator_login}
    Click Element                       ${locator_login}
    Wait Until Page Contains            Search Filters

Logout page
    Click Element                       ${locator_imgProfile}
	Click Element                       ${locator_btnLogout}
	Wait Until Page Contains            Welcome to Kru P' Beam!

# @{role}	admin	author	editor	maintainer	subscriber
Verify search filters for role
	[Arguments]                      ${roleOfKeywords}
	FOR           ${index}           IN RANGE           1    100
	${path}       Set Variable       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[${index}]/div[3]/div/p
	# Log To Console                   ${index}
	${c} =   Get Element Count       ${path}
	Run Keyword If                   ${c}>0        Verify search filters        ${path}        ${roleOfKeywords}
	Exit For Loop If                 ${c}<=0
	END

# @{plan}	basic	company		enterprise	team
Verify search filters for plan
	[Arguments]                      ${planOfKeywords}
	FOR           ${index}           IN RANGE           1    100
	${path}       Set Variable       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[${index}]/div[4]/h6
	${c} =   Get Element Count       ${path}
	Run Keyword If                   ${c}>0        Verify search filters        ${path}        ${planOfKeywords}
	Exit For Loop If                 ${c}<=0
	END

# @{status}	pending	active	inactive
Verify search filters for status
	[Arguments]                      ${statusOfKeywords}
	FOR           ${index}           IN RANGE            1    100
	${path}       Set Variable       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[${index}]/div[5]/div/span
	${c} =   Get Element Count       ${path}
	Run Keyword If                   ${c}>0        Verify search filters        ${path}        ${statusOfKeywords}
	Exit For Loop If                 ${c}<=0
	END

Verify search filters
	[Arguments]                      ${path}                	${keyword}
	${getKeyword}                    Get Text                   ${path}
	should be equal as Strings  	 ${getKeyword}              ${keyword}

Input data
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${phone}    ${gender}    ${num_courses}    ${nationality}    ${role}        ${plan}
	Input Text	                   ${locator_firstname}	        ${firstname}
	Input Text			           ${locator_lastname}          ${lastname}
	Input Text		               ${locator_emailLogin}	    ${email}
	${pass}                        Set Variable		            ${password}
	Input Text			           ${locator_password}	        ${pass}
	Input Text		               ${locator_phone}	            ${phone}
	Select Radio Button gender     ${gender}
	Select checkbox courses        ${num_courses}
	Select list nationality        ${nationality}
	Select list role               ${role}    
	Select list plan               ${plan}
	
    # Input data add user     Phonsuda    Naloeng	    nan@gmail.com	    12345689	    0803536704	    female    4     thai    Admin    team    ${EMPTY}

Login data empty

    Wait Until Element Is Visible    ${locator_emailLogin}
    Wait Until Element Is Visible    ${locator_password}
    Input Text   ${locator_emailLogin}    ${EMPTY}
    Input Text   ${locator_password}    ${EMPTY}
    Wait Until Element Is Visible    ${locator_login}
    Click Element    ${locator_login}
    Wait Until Element Is Visible    ${locator_msg_email}
    ${mag_email}    Get Text    ${locator_msg_email}
    # Should Be Equal As Strings    ${mag_email}    email is a required field
    Element Text Should Be    ${mag_email}    email is a required field
    Wait Until Element Is Visible    ${locator_msg_password}
    ${msg_password}    Get Text    ${locator_msg_password}
    Should Be Equal As Strings    ${msg_password}    password must be at least 5 characters

Input data add user
    Open web browser
    Login page              user.test@krupbeam.com            123456789
    Click Element           ${locator_btnAddUser}
	[Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${phone}    ${gender}    ${num_courses}    ${nationality}    ${role}        ${plan}    ${msg_error}
	Input Text	                   ${locator_firstname}	        ${firstname}
	${getMsg_error}                  Get Text             ${locator_firstname}

	# Element Text Should Be        ${locator_firstname}            '${firstname}'

	Input Text			           ${locator_lastname}          ${lastname}
    # Element Text Should Be        ${locator_lastname}          "${lastname}"
	Input Text		               ${locator_emailLogin}	    ${email}
	# Element Text Should Be        ${locator_emailLogin}	    "${email}"
	# ${pass}                        Set Variable		            ${password}
	# Input Text			           ${locator_password}	        ${pass}
	# Input Text		               ${locator_phone}	            ${phone}
	# Select Radio Button gender     ${gender}
	# Select checkbox courses        ${num_courses}
	# Select list nationality        ${nationality}
	# Select list role               ${role}    
	# Select list plan               ${plan}

	# Click Element                  ${locator_btnSignUp}
    # Verify Input data add user     ${msg_error}
	Close Browser


Verify Input data add user
    [Arguments]    ${msg_error}
	IF  "${msg_error}" == "${EMPTY}"
	Wait Until Page Contains         Register Success
	Wait Until Element Is Visible    ${locator_btnOK}
	Click Element                    ${locator_btnOK}
	ELSE
	Error message                    ${msg_error}
	END

Select Radio Button gender
    [Arguments]    ${gender}
	IF    "${gender}" == "female"
	Select Radio Button              ${locator_gender}            ${gender}
	ELSE IF    "${gender}" == "male"
	Select Radio Button              ${locator_gender}            ${gender}
	END

Error message
    [Arguments]    ${msg_error}
    @{locator_error} =    Create List    id=error-firstname    id=error-lastname    id=error-email    id=error-password    id=error-mobile-phone    id=validation-basic-gender    id=validation-basic-courses    id=validation-basic-nationality    id=validation-role    id=validation-plan
	FOR  ${locator}  IN  @{locator_error}
	${c} =   Get Element Count       ${locator}
	Run Keyword If                   ${c}>0    Check for error message    ${locator}    ${msg_error}
	END

Check for error message
    [Arguments]                      ${locator}           ${msg_error}
    Wait Until Element Is Visible                         ${locator}
    ${getMsg_error}                  Get Text             ${locator}
	Should Be Equal As Strings       ${getMsg_error}      ${msg_error}

Select checkbox courses
	[Arguments]    ${num}
	IF  "${num}" != "${EMPTY}"
	IF	${num} == 1
	Select Checkbox                  ${locator_courseSql}
	ELSE IF	${num} == 2
	Select Checkbox                  ${locator_courseSql}
	Select Checkbox                  ${locator_courseManual}
	ELSE IF	${num} == 3
	Select Checkbox                  ${locator_courseSql}
	Select Checkbox                  ${locator_courseManual}
	Select Checkbox                  ${locator_courseAutomate}
	ELSE IF	${num} == 4
	Select Checkbox                  ${locator_courseSql}
	Select Checkbox                  ${locator_courseManual}
	Select Checkbox                  ${locator_courseAutomate}
	Select Checkbox                  ${locator_courseTest2}
	END
	END

Select list nationality
    [Arguments]    ${nationality}
	IF  "${nationality}" == "thai"
	Wait Until Element Is Visible    ${locator_nationality}
	Click Element                    ${locator_nationality}
	Wait Until Element Is Visible    ${nationality_thai}
	Click Element    	             ${nationality_thai}
	END

# @{role_value}	admin	author	editor	maintainer	subscriber
Select list role
	[Arguments]    ${role}
	Wait Until Element Is Visible  ${locator_selectRole}
	IF  "${role}" != "${EMPTY}"
	Click Element                  ${locator_selectRole}
    IF             "${role}" == "admin" or "${role}" == "Admin"
	Click Element                  ${locator_roleAdmin}
	ELSE IF        "${role}" == "author" or "${role}" == "Author"
	Click Element                  ${locator_roleAuthor}
	ELSE IF        "${role}" == "editor" or"${role}" == "Editor"
	Click Element                  ${locator_roleEditor}
	ELSE IF        "${role}" == "maintainer" or "${role}" == "Maintainer"
	Click Element                  ${locator_roleMaintainer}
	ELSE IF        "${role}" == "subscriber" or "${role}" == "Subscriber"
	Click Element                  ${locator_roleSubscriber}
	END
    END

Select list plan
	[Arguments]     ${plan}
	IF  "${plan}" != "${EMPTY}"
	Wait Until Element Is Visible  ${locator_selectPlan}
	Click Element                  ${locator_selectPlan}
	IF	            "${plan}" == "basic" or "${plan}" == "Basic"
	Click Element                  ${locator_planBasic}
	ELSE IF	        "${plan}" == "company" or "${plan}" == "Company"
	Click Element                  ${locator_planCompany}
	ELSE IF	        "${plan}" == "enterprise" or "${plan}" == "Enterprise"
	Click Element                  ${locator_planEnterprise}
	ELSE IF	        "${plan}" == "team" or "${plan}" == "Team"
	Click Element                  ${locator_planTeam}
	END
	END

Verify clear button
    Wait Until Element Contains    ${role_empty}           ${EMPTY}
    Wait Until Element Contains    ${plan_empty}           ${EMPTY}
    Wait Until Element Contains    ${status_empty}         ${EMPTY}
    Wait Until Element Contains    ${displayRows}          0–0 of 0
	
Verify reset button
    Wait Until Element Contains    ${locator_firstname}    ${EMPTY}
    Wait Until Element Contains    ${locator_lastname}     ${EMPTY}
    Wait Until Element Contains    ${locator_emailLogin}   ${EMPTY}
    Wait Until Element Contains    ${locator_password}     ${EMPTY}
    Wait Until Element Contains    ${locator_phone}        ${EMPTY}

    Radio Button Should Not Be Selected                    ${locator_gender}

	Checkbox Should Not Be Selected                        ${locator_courseManual}
	Checkbox Should Not Be Selected                        ${locator_courseAutomate}
	Checkbox Should Not Be Selected                        ${locator_courseSql}
	Checkbox Should Not Be Selected                        ${locator_courseTest2}

    ${nationality}                 Get Text                ${nationality_empty}
    Should Be Equal As Strings     ${nationality}          ${EMPTY}
    ${role}                        Get Text                ${role_empty}
    Should Be Equal As Strings     ${role}                 ${EMPTY}
    ${plan}                        Get Text                ${plan_empty}
    Should Be Equal As Strings     ${plan}                 ${EMPTY}

Verify notifications icon
	Click Element                        ${locator_notifications}
	Wait Until Page Contains             Notifications
	Wait Until Element Is Visible        ${locator_reedAll}
	Click Element                        ${locator_reedAll}
	Wait Until Page Does Not Contain     Notifications    

Select search filters
    [Arguments]    ${num}
	IF  ${num} == 0
    Click Element                       ${locator_btnSearch}
    Wait Until Element Contains         ${displayRows}                 1–10 of 53

	ELSE IF  ${num} == 1
	Click Element                       ${locator_selectRole}
	Wait Until Element Is Visible       ${locator_selectRole1}
	Click Element                       ${locator_selectRole1}
    Click Element                       ${locator_btnSearch}
    Verify search filters for role      Admin

	ELSE IF   ${num} == 2
	Wait Until Element Is Visible       ${locator_selectRole}
	Click Element                       ${locator_selectRole}
	Wait Until Element Is Visible       ${locator_selectRole3}
	Click Element                       ${locator_selectRole3}

    Wait Until Element Is Visible       ${locator_selectPlan}
	Click Element                       ${locator_selectPlan}
	Wait Until Element Is Visible       ${locator_selectPlan2}
	Click Element                       ${locator_selectPlan2}
    Click Element                       ${locator_btnSearch}
    Verify search filters for role      Editor
    Verify search filters for plan      Company

	ELSE IF   ${num} == 3
	Wait Until Element Is Visible       ${locator_selectRole}
	Click Element                       ${locator_selectRole}
	Wait Until Element Is Visible       ${locator_selectRole4}
	Click Element                       ${locator_selectRole4}

    Wait Until Element Is Visible       ${locator_selectPlan}
	Click Element                       ${locator_selectPlan}
	Wait Until Element Is Visible       ${locator_selectPlan4}
	Click Element                       ${locator_selectPlan4}

	Wait Until Element Is Visible       ${locator_selectStatus}
	Click Element                       ${locator_selectStatus}
	Wait Until Element Is Visible       ${locator_selectStatus2}
	Click Element                       ${locator_selectStatus2}

    Click Element                       ${locator_btnSearch}
    Verify search filters for role      Maintainer
    Verify search filters for plan      Team
    Verify search filters for status    Active

	ELSE IF   ${num} == 4
	Wait Until Element Is Visible       ${locator_selectRole}
	Click Element                       ${locator_selectRole}
	Wait Until Element Is Visible       ${locator_selectRole5}
	Click Element                       ${locator_selectRole5}

    Wait Until Element Is Visible       ${locator_selectStatus}
	Click Element                       ${locator_selectStatus}
	Wait Until Element Is Visible       ${locator_selectStatus3}
	Click Element                       ${locator_selectStatus3}

    Click Element                       ${locator_btnSearch}
    Verify search filters for role      Subscriber
    Verify search filters for status    Inactive
	END

Verify rows per page
	Click Element                       ${locator_page}
	Wait Until Element Is Visible       ${locator_page10}
	Click Element                       ${locator_page10}
	Wait Until Element Contains         ${displayRows}                 1–10 of 53

	Click Element                       ${locator_page}
	Wait Until Element Is Visible       ${locator_page25}
	Click Element                       ${locator_page25}
	Wait Until Element Contains         ${displayRows}                 1–25 of 53

	Click Element                       ${locator_page}
	Wait Until Element Is Visible       ${locator_page50}
	Click Element                       ${locator_page50}
	Wait Until Element Contains         ${displayRows}                 1–50 of 53

Verify next page and back page
	Wait Until Element Contains         ${displayRows}                 1–10 of 53
    @{num_page} =    Create List    1–10 of 53    11–20 of 53    21–30 of 53    31–40 of 53    41–50 of 53    51–53 of 53
	
	FOR  ${page}  IN  @{num_page}
	IF    "${page}" == "1–10 of 53"     CONTINUE
	Wait Until Element Is Enabled       ${next_page}
	Click Element                       ${next_page}
	Wait Until Element Contains         ${displayRows}                 ${page}
    # Log To Console    ${page}
	END
    
	Wait Until Element Contains         ${displayRows}                 51–53 of 53
    FOR	${index}	IN RANGE	4    -1    -1
	Wait Until Element Is Enabled       ${back_page}
	Click Element                       ${back_page}
	Wait Until Element Contains         ${displayRows}                 ${num_page}[${index}]
    # Log To Console    ${num_page}[${index}]
    END