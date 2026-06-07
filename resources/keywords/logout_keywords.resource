*** Settings ***
Resource    ../common/browser_wrapper.resource
Resource    ../pages/login_page.resource
Resource    ../pages/logout_page.resource

*** Keywords ***
Login And Logout
    [Arguments]    ${username}    ${password}
    Open Login Page
    Fill Text    ${USERNAME_FIELD}    ${username}
    Fill Text    ${PASSWORD_FIELD}    ${password}
    Click    ${LOGIN_BUTTON}
    Wait For Elements State    ${LOGOUT_BUTTON}    visible    timeout=10s
    Click Logout Button

Logout Should Succeed
    Wait For Elements State    ${FLASH_MESSAGE}    visible    timeout=10s
    ${message}=    Get Logout Flash Message
    Should Contain    ${message}    logged out of the secure area
