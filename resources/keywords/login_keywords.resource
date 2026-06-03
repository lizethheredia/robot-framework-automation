*** Settings ***
Resource    ../common/browser_wrapper.resource
Resource    ../pages/login_page.resource

*** Keywords ***
Login With Valid Credentials
    [Arguments]    ${username}    ${password}
    Open Login Page
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button

Login Should Succeed
    Wait For Elements State    h2    visible    timeout=10s
    Get Text    h2    ==    Secure Area

Login Should Fail
    ${message}=    Get Flash Message
    Should Contain    ${message}    Your username is invalid!
