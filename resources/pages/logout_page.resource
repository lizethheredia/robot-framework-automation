*** Settings ***
Library    Browser

*** Variables ***
${LOGOUT_BUTTON}    css=a[href="/logout"]
${FLASH_MESSAGE}    id=flash

*** Keywords ***
Click Logout Button
    Click    ${LOGOUT_BUTTON}

Get Flash Message
    ${message}=    Get Text    ${FLASH_MESSAGE}
    RETURN    ${message}
