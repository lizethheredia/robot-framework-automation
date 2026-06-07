*** Settings ***
Library    Browser

*** Variables ***
${CHECKBOXES_URL}    ${BASE_URL}/checkboxes
${CHECKBOX_1}        css=input[type="checkbox"]:nth-of-type(1)
${CHECKBOX_2}        css=input[type="checkbox"]:nth-of-type(2)

*** Keywords ***
Open Checkboxes Page
    New Page    ${CHECKBOXES_URL}

Check Checkbox 1
    Check Checkbox    ${CHECKBOX_1}

Uncheck Checkbox 2
    Uncheck Checkbox    ${CHECKBOX_2}

Checkbox 1 Should Be Checked
    Get Checkbox State    ${CHECKBOX_1}    ==    checked

Checkbox 2 Should Be Unchecked
    Get Checkbox State    ${CHECKBOX_2}    ==    unchecked
