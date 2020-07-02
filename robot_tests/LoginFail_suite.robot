*** Settings ***
Test Setup        Login Page Display    ${loginpage}
Test Template     Test Login    # This template will test all possible login validation
Library           SeleniumLibrary

*** Variables ***
${email}          nguyen.thi.phuong+11@vareal.vn
${password}       123456
${failurepage}    https://pre-stage.vareal.work/login
${loginpage}      https://pre-stage.vareal.work/login
${message}        メールアドレスまたはパスワードが正しくありません
${message1}       メールアドレスを入力してください
${message2}       パスワードを入力してください

*** Test Cases ***
Invalid Email
    abc@vareal.vn    ${password}    ${message}

Invalid Password
    ${email}    147852    ${message}

Invalid Email and Password
    abc@vareal.vn    147852    ${message}

Empty Email
    ${EMPTY}    ${password}    ${message1}

Empty Password
    ${email}    ${EMPTY}    ${message2}

Empty Email and Password
    ${EMPTY}    ${EMPTY}    ${message1}

*** Keywords ***
Login Page Display
    [Arguments]    ${loginpage}
    Go To    ${loginpage}
    Title Should Be    Vareal WORK - リアルを超えるコラボレーション - Collaboration Beyond Reality

Test Login
    [Arguments]    ${email}    ${password}    ${message}
    Enter Email    ${email}
    Enter Password    ${password}
    Sleep    1s
    Submit Details
    Sleep    2s
    Login Should Fail
    Page Should Contain    ${message}

Enter Email
    [Arguments]    ${email}
    Input Text    name:email    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    name:password    ${password}

Submit Details
    Click Button    class:signup-button

Login Should Fail
    Location Should Be    ${failurepage}
    Title Should Be    Vareal WORK - リアルを超えるコラボレーション - Collaboration Beyond Reality
