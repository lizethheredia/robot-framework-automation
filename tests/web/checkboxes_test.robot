*** Settings ***
Resource        ../../resources/keywords/checkboxes_keywords.resource
Variables       ../../variables/dev.yaml

*** Test Cases ***
Check First Checkbox
    Open Browser Session
    Check First Checkbox
    [Teardown]    Close Browser Session With Screenshot On Failure

Uncheck Second Checkbox
    Open Browser Session
    Uncheck Second Checkbox
    [Teardown]    Close Browser Session With Screenshot On Failure
