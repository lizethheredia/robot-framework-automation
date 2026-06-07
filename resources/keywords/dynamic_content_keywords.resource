*** Settings ***
Resource    ../common/browser_wrapper.resource
Resource    ../pages/dynamic_content_page.resource

*** Keywords ***
Load Dynamic Content And Verify
    Open Dynamic Loading Page
    Click Start Button
    Wait For Loading To Finish
    Wait For Elements State    ${FINISH_TEXT}    visible    timeout=10s
    ${text}=    Get Finish Text
    Should Contain    ${text}    Hello World!
