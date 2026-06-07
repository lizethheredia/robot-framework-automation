*** Settings ***
Resource        ../../resources/keywords/dynamic_content_keywords.resource
Variables       ../../variables/dev.yaml

*** Test Cases ***
Dynamic Content Loads Successfully
    Open Browser Session
    Load Dynamic Content And Verify
    [Teardown]    Close Browser Session With Screenshot On Failure
