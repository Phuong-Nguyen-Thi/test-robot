*** Settings ***
Test Setup        Login Page Display    ${loginpage}
Test Template     Test Login    # This template will test all possible login validation
Library           SeleniumLibrary

*** Variables ***
${email}          nguyen.thi.phuong+11@vareal.vn
${password}       123456
${successpage}    https://pre-stage.vareal.work/
${loginpage}      https://pre-stage.vareal.work/login

*** Test Cases ***
Valid Email and Password
    ${email}    ${password}

*** Keywords ***
Login Page Display
    [Arguments]    ${loginpage}
    Go To    ${loginpage}
    Title Should Be    Vareal WORK - リアルを超えるコラボレーション - Collaboration Beyond Reality

Test Login
    [Arguments]    ${email}    ${password}
    Enter Email    ${email}
    Enter Password    ${password}
    Sleep    1s
    Submit Details
    Sleep    2s
    Login Should Pass
    Sleep    4s
    Click Element    id:basic-nav-dropdown
    Sleep    1s
    Click Element    xpath=//a[contains(text(),'Logout')]
    Location Should Be    https://pre-stage.vareal.work/

Enter Email
    [Arguments]    ${email}
    Input Text    name:email    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    name:password    ${password}

Submit Details
    Click Button    class:signup-button

Login Should Pass
    Location Should Be    ${successpage}
    Title Should Be    Vareal WORK - リアルを超えるコラボレーション - Collaboration Beyond Reality
