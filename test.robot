# *** Settings ***
# Library        SeleniumLibrary
# Library        ExcelRobot

# *** Variables ***
# ${path}		        ${EXECDIR}/FormUser.xls
# ${sheet}	    	user

# *** Keywords ***
# read
#     Open Excel	    ${path}
# 	${rowcount}	    Get Row Count	    ${sheet}
# 	# FOR	${item}	IN RANGE	1	${rowcount}
# 	${as}    Read Cell Data    	${sheet}	1	2
# 	${getAS}    Set Variable    ${as}

# 	# ${aa}    Read Cell Data	    ${sheet}	2	${item}
# 	# ${aw}    Read Cell Data	    ${sheet}	3	${item}
# 	# ${aq}    Read Cell Data    	${sheet}	4	${item}
# 	# Log To Console    ${as}    ${aa}    ${aw}    ${aq}
# 	Log To Console    ${getAS}
# 	# Log To Console    ${aa}
# 	# Log To Console    ${aw}
# 	# Log To Console    ${aq}
# 	# END

# getData
# 	Open Excel	${excelPath}
# 	${rowcount}	Get Row Count	${excelSheet}
# 	FOR	${row}	IN RANGE	2	${rowcount}
# 	${firstname}        Read Cell Data    ${excelSheet}	1	${row}
# 	${lastname}         Read Cell Data    ${excelSheet}	2	${row}
# 	${email}            Read Cell Data    ${excelSheet}	3	${row}
# 	${password}         Read Cell Data    ${excelSheet}	4	${row}
# 	${phone}            Read Cell Data    ${excelSheet}	5	${row}
# 	${gender}           Read Cell Data    ${excelSheet}	6	${row}
# 	${num_courses}      Read Cell Data    ${excelSheet}	7	${row}
# 	${role}             Read Cell Data    ${excelSheet}	8	${row}
# 	${plan}             Read Cell Data    ${excelSheet}	9	${row}

# 	${setFirstname}        Set Variable    ${firstname}
# 	${setLastname}         Set Variable    ${lastname}
# 	${setEmail}            Set Variable    ${email}
# 	${setPassword}         Set Variable    ${password}
# 	${setPhone}            Set Variable    ${phone}
# 	${setGender}           Set Variable    ${gender}
# 	${setNum_courses}      Set Variable    ${num_courses}
# 	${setRole}             Set Variable    ${role}
# 	${setPlan}             Set Variable    ${plan}

#     Input data add user    ${setFirstname}    ${setLastname}    ${setEmail}    ${setPassword}    ${setPhone}    ${setGender}    ${setNum_courses}    ${setRole}    ${setPlan}

# 	END 
	


# *** Test Cases ***
# T1
#     read


# *** Settings ***
# Library    SeleniumLibrary
# Library    ChromeForTesting
# Suite Setup                 Set Selenium Speed    5s

# *** Variables ***
# # # ${CHROME_BROWSER_PATH}     C:${/}ChromeForTesting${/}bin${/}chrome-win64
# # # ${CHROME_DRIVER_PATH}      C:${/}ChromeForTesting${/}bin${/}chrome-win64${/}chromedriver
# ${URL}    http://www.google.com
# ${BROWSER}    chrome options=binary_location=r"C:\\chromeForTesting\\bin\\chrome-win64\\chrome.exe"


# *** Test Cases ***
# Demo Open Google Website With Chrome Browser
# #     ${chrome_options.binary_location}     Set Variable       ${CHROME_BROWSER_PATH} 
# #     ${service}   Evaluate   sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
# #     Create Webdriver    Chrome    options=${chrome_options.binary_location}    service=${service}
# #     Go To    ${URL}

#     Open Browser    ${URL}    ${BROWSER}
	
	# open browser    browser=Chrome options=binary_location=r"C:\\ChromeForTesting\\bin\\chrome-win64\\chrome.exe"


# *** Test Cases ***
# CFT_001 : Start Chrome For Testing
#     [Teardown]  Close All Browsers
#     ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
#     ${chrome_options.binary_location}     Set Variable       ${CHROME_BROWSER_PATH} 
#     ${service}   Evaluate   sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
#     Create Webdriver    Chrome    options=${chrome_options}    service=${service}
#     Go To    ${URL}




# *** Settings ***
# Library    ChromeForTesting

# *** Keywords ***
# Open Chrome Browser    ${url}
#     ${binary_location}    Initialise Chrome For Testing    ${channel}=stable
#     ${options}    Set Variable    add_argument("--binary-location=${binary_location}")
#     Open Browser    ${url}    chrome    options=${options}


# *** Test Cases ***
# Open page
#     Open Chrome Browser    https://en.wikipedia.org/wiki/Grapefruit

*** Settings ***
Library  SeleniumLibrary
Suite Setup                 Set Selenium Speed    20s

# C:\\ChromeForTesting\\bin\\chrome-win64\\chrome.exe

*** Variables ***
${CHROME_BROWSER_PATH}     C:${/}chromeForTesting${/}bin${/}chrome-win64${/}chrome.exe
# ${CHROME_DRIVER_PATH}      C:${/}chromeForTesting${/}bin${/}chromedriver
${URL}                     https://www.google.co.th/?hl=th

*** Test Cases ***
CFT_001 : Start Chrome For Testing
    [Teardown]  Close All Browsers
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}     Set Variable       ${CHROME_BROWSER_PATH} 
    # ${service}   Evaluate   sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}   