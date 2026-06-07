*** Settings ***
Library    Browser

*** Keywords ***
Open Browser Session
    [Arguments]    ${browser}=${BROWSER}
    New Browser    ${browser}    headless=False
    New Context    viewport={'width': 1280, 'height': 720}

Close Browser Session
    Close Browser

Close Browser Session With Screenshot On Failure
    Run Keyword If Test Failed    Take Screenshot    filename=FAIL-{index}
    Close Browser

Take Page Screenshot
    [Arguments]    ${filename}=screenshot
    Take Screenshot    filename=${filename}