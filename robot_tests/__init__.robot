*** Settings ***
Suite Setup       Open Login Page    ${loginpage}    ${browser}    # setup to open login page
Suite Teardown    Close Browser
Library           SeleniumLibrary

*** Variables ***
${loginpage}      https://pre-stage.vareal.work/login    # url for login page
${browser}        chrome

*** Keywords ***
Open Login Page
    [Arguments]    ${loginpage}    ${browser}
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    window-size\=1280,1696
    ${options}=    Call Method    ${chrome_options}    to_capabilities
    Open Browser    ${loginpage}    ${browser}    desired_capabilities=${options}
    Maximize Browser Window
    Title Should Be    Vareal WORK - リアルを超えるコラボレーション - Collaboration Beyond Reality
