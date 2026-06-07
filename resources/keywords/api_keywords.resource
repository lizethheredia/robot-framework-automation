*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    JSONLibrary

*** Keywords ***
Load API Data
    [Arguments]    ${data_file}=${EXECDIR}/data/api_data.json
    ${json}=       Get File    ${data_file}
    ${data}=       Evaluate    __import__('json').loads($json)
    RETURN         ${data}

Create API Session
    [Arguments]    ${base_url}
    Create Session    api    ${base_url}    verify=True

Get User By ID
    [Arguments]    ${user_id}
    ${response}=    GET On Session    api    /users/${user_id}
    RETURN          ${response}

Get All Users
    ${response}=    GET On Session    api    /users
    RETURN          ${response}

Create Post
    [Arguments]    ${payload}
    ${response}=    POST On Session    api    /posts    json=${payload}
    RETURN          ${response}

Response Status Should Be
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}

Response Field Should Equal
    [Arguments]    ${response}    ${field}    ${expected_value}
    ${body}=       Set Variable    ${response.json()}
    Should Be Equal As Strings    ${body}[${field}]    ${expected_value}
