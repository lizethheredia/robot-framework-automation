*** Settings ***
Resource    ../common/browser_wrapper.resource
Resource    ../pages/alerts_page.resource

*** Keywords ***
Handle JS Alert
    Open Alerts Page
    Handle Future Dialogs    action=accept
    Click JS Alert Button
    ${result}=    Get Result Text
    Should Contain    ${result}    You successfully clicked an alert

Handle JS Confirm Accept
    Open Alerts Page
    Handle Future Dialogs    action=accept
    Click JS Confirm Button
    ${result}=    Get Result Text
    Should Contain    ${result}    You clicked: Ok

Handle JS Confirm Dismiss
    Open Alerts Page
    Handle Future Dialogs    action=dismiss
    Click JS Confirm Button
    ${result}=    Get Result Text
    Should Contain    ${result}    You clicked: Cancel

Handle JS Prompt
    [Arguments]    ${text}
    Open Alerts Page
    Handle Future Dialogs    action=accept    prompt_input=${text}
    Click JS Prompt Button
    ${result}=    Get Result Text
    Should Contain    ${result}    You entered: ${text}
