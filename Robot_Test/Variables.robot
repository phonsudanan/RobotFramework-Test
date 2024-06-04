*** Settings ***
Library                           SeleniumLibrary

*** Variables ***
${url}                            https://automate-test.stpb-digital.com/
${browser}                        gc
${CHROME_BROWSER_PATH}            C:${/}chromeForTesting${/}bin${/}chrome-win64${/}chrome.exe

#Login
${locator_emailLogin}             id=email
${locator_passwordLogin}          name=password
${locator_login}                  id=btn-login

#Logout
${locator_imgProfile}             xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_btnLogout}              xpath=/html/body/div[3]/div[3]/ul/li

#Search Filters
${locator_selectRole}             id=select-role
${locator_selectRole0}            id=option-select-role-0
${locator_selectRole1}            id=option-select-role-1
${locator_selectRole2}            id=option-select-role-2
${locator_selectRole3}            id=option-select-role-3
${locator_selectRole4}            id=option-select-role-4
${locator_selectRole5}            id=option-select-role-5

${locator_selectPlan}             id=select-plan
${locator_selectPlan0}            id=option-select-plan-0
${locator_selectPlan1}            id=option-select-plan-1
${locator_selectPlan2}            id=option-select-plan-2
${locator_selectPlan3}            id=option-select-plan-3
${locator_selectPlan4}            id=option-select-plan-4

${locator_selectStatus}           id=select-status
${locator_selectStatus0}          id=option-select-status-0
${locator_selectStatus1}          id=option-select-status-1
${locator_selectStatus2}          id=option-select-status-2
${locator_selectStatus3}          id=option-select-status-3

${locator_btnClear}               id=btn-clear
${locator_btnSearch}              id=btn-search
${locator_btnAddUser}             xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a

${locator_page}                   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]
${locator_page10}                 xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_page25}                 xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_page50}                 xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${displayRows}                    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]
${back_page}                      xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[1]
${next_page}                      xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]

#Add User
${locator_btnBack}                xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button

${locator_formUser}               xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/h5/a
${locator_reset}                  id=reset
${locator_firstname}              id=firstname
${locator_lastname}               id=lastname
${locator_password}               id=password
${locator_phone}                  id=mobile-phone
${locator_gender}                 validation-basic-radio
${locator_courseSql}              name=courses.SQL
${locator_courseManual}           name=courses.Test Manual
${locator_courseAutomate}         name=courses.Automate Test
${locator_courseTest2}            name=courses.Automate Test2
${locator_nationality}            id=nationality
${nationality_thai}               xpath=//*[@id="menu-"]/div[3]/ul/li[221]

${locator_roleAdmin}              xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_roleAuthor}             xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_roleEditor}             xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_roleMaintainer}         xpath=//*[@id="menu-"]/div[3]/ul/li[4]
${locator_roleSubscriber}         xpath=//*[@id="menu-"]/div[3]/ul/li[5]

${locator_planBasic}              xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_planCompany}            xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_planEnterprise}         xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_planTeam}               xpath=//*[@id="menu-"]/div[3]/ul/li[4]

${locator_msgFirstname}           id=error-firstname
${locator_msgLastname}            id=error-lastname
${locator_msgEmail}               id=error-email
${locator_msgPassword}            id=error-password
${locator_msgPhone}               id=error-mobile-phone
${locator_msgGender}              id=validation-basic-gender
${locator_msgCourse}              id=validation-basic-courses
${locator_msgNationality}         id=validation-basic-nationality
${locator_msgRole}                id=validation-role
${locator_msgPlan}                id=validation-plan

${locator_btnSignUp}              xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button
${locator_btnOK}                  id=btn-ok

${nationality_empty}              css=#nationality
${role_empty}                     css=#select-role
${plan_empty}                     css=#select-plan
${status_empty}                   css=#select-status

${locator_notifications}          xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_reedAll}                css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-1p3ebxb > button
