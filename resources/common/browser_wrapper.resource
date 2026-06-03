*** Settings ***
Library    Browser

*** Keywords ***
Open Browser Session
    [Arguments]    ${browser}=${BROWSER}
    New Browser    ${browser}    headless=False

Close Browser Session
    Close Browser

Take Page Screenshot
    [Arguments]    ${filename}=screenshot
    Take Screenshot    filename=${filename}