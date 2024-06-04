*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}                            https://automate-test.stpb-digital.com/register/
${browser}                        gc
${locator_pageName}               xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/div[1]/h6
${locator_reset}                  id=reset
${locator_firstname}              id=firstname
${locator_lastname}               id=lastname
${locator_email}                  id=email
${locator_password}               id=password
${locator_phone}                  id=mobile-phone
${locator_gender}                 validation-basic-radio    #female male
${locator_courseSql}              name=courses.SQL
${locator_courseManual}           name=courses.Test Manual
${locator_courseAutomate}         name=courses.Automate Test
${locator_courseTest2}            name=courses.Automate Test2
${locator_nationality}            id=nationality
${locator_role}                   id=select-role
${locator_plan}                   id=select-plan
${locator_btnSignUp}              id=btn-sign-up
${locator_hyperlink}              xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a
${locator_btnOk}                  id=btn-ok
${locator_msgSuccess}             xpath=/html/body/div[2]/div[3]/div/div[2]/p


#Select
${locator_selectNationality}      xpath=//*[@id="menu-"]/div[3]/ul/li[221]    #thai
${locator_selectRole}             xpath=//*[@id="menu-"]/div[3]/ul/li[3]      #editor
${locator_selectPlan}             xpath=//*[@id="menu-"]/div[3]/ul/li[2]      #company
#Message Error
${locator_msgErrorFirstname}      id=error-firstname
${locator_msgErrorLastname}	      id=error-lastname
${locator_msgErrorEmail}	      id=error-email
${locator_msgErrorPassword}	      id=error-password
${locator_msgErrorPhone}	      id=error-mobile-phone
${locator_msgErrorGender}         id=validation-basic-gender
${locator_msgErrorCourses}	      id=validation-basic-courses
${locator_msgErrorNationality}    id=validation-basic-nationality
${locator_msgErrorRole}		      id=validation-role
${locator_msgErrorPlan}		      id=validation-plan

*** Keywords ***
Open web browser
    Set Selenium Speed                0.2s
    Open Browser                      ${url}                                ${browser}
    Maximize Browser Window
    Wait Until Page Contains          Kru P' Beam

Select list nationality
    Wait Until Element Is Visible    ${locator_nationality}
    Click Element                    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_selectNationality}
    Click Element                    ${locator_selectNationality}
    
Select list role
    Wait Until Element Is Visible    ${locator_role}
    Click Element                    ${locator_role}
    Wait Until Element Is Visible    ${locator_selectRole}
    Click Element                    ${locator_selectRole}

Select list plan
    Wait Until Element Is Visible    ${locator_plan}
    Click Element                    ${locator_plan}
    Wait Until Element Is Visible    ${locator_selectPlan}
    Click Element                    ${locator_selectPlan}

Select checkbox courses
    Select Checkbox                  ${locator_courseSql}
    Select Checkbox                  ${locator_courseManual}
    Select Checkbox                  ${locator_courseAutomate}
    Select Checkbox                  ${locator_courseTest2}

Default Page
    Wait Until Page Contains         Kru P' Beam
    Wait Until Element Is Visible    ${locator_reset}
    Wait Until Element Is Visible    ${locator_firstname}
    Wait Until Element Is Visible    ${locator_lastname}
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locator_phone}
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[6]/div
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[1]
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[2]
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[3]
    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[4]
    Wait Until Element Is Visible    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_role}
    Wait Until Element Is Visible    ${locator_plan}
    Wait Until Element Is Visible    ${locator_btnSignUp}
    Wait Until Element Is Visible    ${locator_hyperlink}

Page name
    ${name}    Get Text              ${locator_pageName}
    Should Be Equal As Strings       ${name}                                Kru P' Beam

Input data
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Radio Button              ${locator_gender}                      male
    Select checkbox courses    
    Select list nationality
    Select list role
    Select list plan

Register button
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible    ${locator_msgSuccess}
    ${msg}                           Get Text                               ${locator_msgSuccess}
    Should Be Equal As Strings       ${msg}                                 Register Success
    Click Element                    ${locator_btnOk}
    Wait Until Page Contains         Welcome to Kru P' Beam!

First name field is empty - fail 
    Input Text	                     ${locator_firstname}	               	${EMPTY}
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorFirstname}
    ${msgErrorFirstname}	         Get Text		                        ${locator_msgErrorFirstname}
    should be equal as Strings     	 ${msgErrorFirstname}					This field is required

Last name field is empty - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		${EMPTY}
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorLastname}
    ${msgErrorLastname}	             Get Text		                        ${locator_msgErrorLastname}
    should be equal as Strings     	 ${msgErrorLastname}					This field is required

Data for case email - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    
Message error for input email is not format name@gmail.com - fail
    Input Text	                  	 ${locator_email}	              	    hello
    Wait Until Element Is Visible	 ${locator_msgErrorEmail}
    ${msgErrorEmail}	             Get Text		                        ${locator_msgErrorEmail}
    should be equal as Strings     	 ${msgErrorEmail}			        	Invalid email address

Message error for input email is empty - fail
    Input Text	                  	 ${locator_email}	              	    ${EMPTY}
    Wait Until Element Is Visible	 ${locator_msgErrorEmail}
    ${msgErrorEmail}	             Get Text		                        ${locator_msgErrorEmail}
    should be equal as Strings     	 ${msgErrorEmail}				    	This field is required

Password field is empty - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    Input Text		              	 ${locator_password}	                ${EMPTY}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorPassword}
    ${msgErrorPassword}	             Get Text		                        ${locator_msgErrorPassword}
    should be equal as Strings     	 ${msgErrorPassword}					This field is required

Phone field is empty - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	${EMPTY}
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorPhone}
    ${msgErrorPhone}	             Get Text		                        ${locator_msgErrorPhone}
    should be equal as Strings     	 ${msgErrorPhone}					    This field is required

Gender is empty - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorGender}
    ${msgErrorGender}	             Get Text		                       ${locator_msgErrorGender}
    should be equal as Strings     	 ${msgErrorGender}					   This field is required

Course is empty - fail
    Input Text	                     ${locator_firstname}	               phonsuda
    Input Text		                 ${locator_lastname}              	   naloeng
    Input Text	                  	 ${locator_email}	              	   nan@gmail.com
    ${password}                      Set Variable		                   nan12345678
    Input Text		              	 ${locator_password}	               ${password}
    Input Text	              	 	 ${locator_phone}	                   0809393333
    Select Radio Button              ${locator_gender}                     female
    Select list nationality
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorCourses}
    ${msgErrorCourses}	             Get Text		                        ${locator_msgErrorCourses}
    should be equal as Strings     	 ${msgErrorCourses}				        This field is required

Nationality is empty- fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list role
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorNationality}
    ${msgErrorNationality}	         Get Text		                        ${locator_msgErrorNationality}
    should be equal as Strings     	 ${msgErrorNationality}					This field is required

Role is empty - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list plan
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorRole}
    ${msgErrorRole}	                 Get Text		                        ${locator_msgErrorRole}
    should be equal as Strings     	 ${msgErrorRole}		        		This field is required

Plan is empty - fail
    Input Text	                     ${locator_firstname}	               	phonsuda
    Input Text		                 ${locator_lastname}              		naloeng
    Input Text	                  	 ${locator_email}	              	    nan@gmail.com
    ${password}                      Set Variable		                    nan12345678
    Input Text		              	 ${locator_password}	                ${password}
    Input Text	              	 	 ${locator_phone}	                	0809393333
    Select Radio Button              ${locator_gender}                      female
    Select Checkbox                  ${locator_courseSql}
    Select list nationality
    Select list role
    Click Element                    ${locator_btnSignUp}
    Wait Until Element Is Visible	 ${locator_msgErrorPlan}
    ${msgErrorPlan}	                 Get Text		                        ${locator_msgErrorPlan}
    should be equal as Strings     	 ${msgErrorPlan}					    This field is required




*** Test Cases ***
TC-001 Default Page
    Open web browser
    Default Page
    Close Browser

TC-002 Check for page name
    Open web browser
    Page name
    Close Browser

TC-003 Input data for register
    Open web browser
    Input data
    Register button
    Close Browser

TC-004 Reset data
    Open web browser
    Input data
    Click Element    ${locator_reset}
    Close Browser

TC-005 Click hyperlink Sign in instead
    Open web browser
    Click Element    ${locator_hyperlink}
    Wait Until Page Contains    Welcome to Kru P' Beam!
    Close Browser

TC-006 Verify first name case fail
    Open web browser
    First name field is empty - fail
    Close Browser

TC-007 Verify last name case fail
    Open web browser
    Last name field is empty - fail
    Close Browser

TC-008 Verify email empty input field case fail
    Open web browser
    Data for case email - fail
    Message error for input email is empty - fail
    Close Browser

TC-009 Verify email is not format name@gmail.com case fail
    Open web browser
    Data for case email - fail
    Message error for input email is not format name@gmail.com - fail
    Close Browser

TC-010 Verify password case fail
    Open web browser
    Password field is empty - fail
    Close Browser

TC-011 Verify phone case fail
    Open web browser
    Phone field is empty - fail
    Close Browser

TC-012 Verify gender case fail
    Open web browser
    Gender is empty - fail
    Close Browser

TC-013 Verify course case fail
    Open web browser
    Course is empty - fail
    Close Browser

TC-014 Verify nationality case fail
    Open web browser
    Nationality is empty - fail
    Close Browser

TC-015 Verify role case fail
    Open web browser
    Role is empty - fail
    Close Browser

TC-016 Verify plan case fail
    Open web browser
    Plan is empty - fail
    Close Browser