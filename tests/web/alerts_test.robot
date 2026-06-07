*** Settings ***
Resource        ../../resources/keywords/alerts_keywords.resource
Variables       ../../variables/dev.yaml

*** Test Cases ***
Handle JS Alert
    Open Browser Session
    Handle JS Alert
    [Teardown]    Close Browser Session With Screenshot On Failure

Handle JS Confirm Accept
    Open Browser Session
    Handle JS Confirm Accept
    [Teardown]    Close Browser Session With Screenshot On Failure

Handle JS Confirm Dismiss
    Open Browser Session
    Handle JS Confirm Dismiss
    [Teardown]    Close Browser Session With Screenshot On Failure

Handle JS Prompt With Text
    Open Browser Session
    Handle JS Prompt    Hello Robot!
    [Teardown]    Close Browser Session With Screenshot On Failure
