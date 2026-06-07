*** Settings ***
Library         ../../libraries/EnvLoader.py
Resource        ../../resources/keywords/logout_keywords.resource
Variables       ../../variables/dev.yaml

*** Test Cases ***
Valid Logout
    Load Env
    ${username}=    Get Env Variable    USERNAME
    ${password}=    Get Env Variable    PASSWORD
    Open Browser Session
    Login And Logout    ${username}    ${password}
    Logout Should Succeed
    [Teardown]    Close Browser Session With Screenshot On Failure
