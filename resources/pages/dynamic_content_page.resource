*** Settings ***
Library    Browser

*** Variables ***
${DYNAMIC_URL}        ${BASE_URL}/dynamic_loading/1
${START_BUTTON}       css=#start button
${LOADING_SPINNER}    id=loading
${FINISH_TEXT}        id=finish

*** Keywords ***
Open Dynamic Loading Page
    New Page    ${DYNAMIC_URL}

Click Start Button
    Click    ${START_BUTTON}

Wait For Loading To Finish
    Wait For Elements State    ${LOADING_SPINNER}    hidden    timeout=15s

Get Finish Text
    ${text}=    Get Text    ${FINISH_TEXT}
    RETURN    ${text}
