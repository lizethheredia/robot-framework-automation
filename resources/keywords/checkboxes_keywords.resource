*** Settings ***
Resource    ../common/browser_wrapper.resource
Resource    ../pages/checkboxes_page.resource

*** Keywords ***
Check First Checkbox
    Open Checkboxes Page
    Check Checkbox 1
    Checkbox 1 Should Be Checked

Uncheck Second Checkbox
    Open Checkboxes Page
    Uncheck Checkbox 2
    Checkbox 2 Should Be Unchecked
