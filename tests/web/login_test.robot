*** Settings ***
Library         ../../libraries/EnvLoader.py
Resource        ../../resources/keywords/login_keywords.resource
Variables       ../../variables/dev.yaml

*** Test Cases ***
Valid Login
    Load Env
    ${username}=    Get Env Variable    USERNAME
    ${password}=    Get Env Variable    PASSWORD
    Open Browser Session
    Login With Valid Credentials    ${username}    ${password}
    Login Should Succeed
    [Teardown]    Close Browser Session

Invalid Login
    Open Browser Session
    Login With Valid Credentials    wronguser    wrongpassword
    Login Should Fail
    [Teardown]    Close Browser Session