*** Settings ***
Library    Browser

*** Variables ***
${ALERTS_URL}         ${BASE_URL}/javascript_alerts
${JS_ALERT_BTN}       css=button[onclick="jsAlert()"]
${JS_CONFIRM_BTN}     css=button[onclick="jsConfirm()"]
${JS_PROMPT_BTN}      css=button[onclick="jsPrompt()"]
${RESULT_TEXT}        id=result

*** Keywords ***
Open Alerts Page
    New Page    ${ALERTS_URL}

Click JS Alert Button
    Click    ${JS_ALERT_BTN}

Click JS Confirm Button
    Click    ${JS_CONFIRM_BTN}

Click JS Prompt Button
    Click    ${JS_PROMPT_BTN}

Get Result Text
    ${text}=    Get Text    ${RESULT_TEXT}
    RETURN    ${text}
