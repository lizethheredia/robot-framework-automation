*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_URL}         ${BASE_URL}/login
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      css=button[type="submit"]
${ERROR_MESSAGE}     id=flash

*** Keywords ***
Open Login Page
    New Page    ${LOGIN_URL}

Enter Username
    [Arguments]    ${username}
    Fill Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Fill Text    ${PASSWORD_FIELD}    ${password}

Click Login Button
    Click    ${LOGIN_BUTTON}

Get Flash Message
    ${message}=    Get Text    ${ERROR_MESSAGE}
    RETURN    ${message}