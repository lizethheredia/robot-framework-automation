*** Settings ***
Resource        ../../resources/keywords/api_keywords.resource
Variables       ../../variables/dev.yaml

Suite Setup     Setup API Suite

*** Variables ***
${DATA_FILE}    ${EXECDIR}/data/api_data.json

*** Test Cases ***
Get User By ID Should Return 200
    ${data}=        Load API Data
    ${response}=    Get User By ID    ${data}[existing_user][id]
    Response Status Should Be         ${response}    200
    Response Field Should Equal       ${response}    name    ${data}[existing_user][name]
    Response Field Should Equal       ${response}    username    ${data}[existing_user][username]

Get All Users Should Return List
    ${response}=    Get All Users
    Response Status Should Be    ${response}    200
    ${users}=       Set Variable    ${response.json()}
    Length Should Be    ${users}    10

Create Post Should Return 201
    ${data}=        Load API Data
    ${response}=    Create Post    ${data}[new_post]
    Response Status Should Be       ${response}    201
    Response Field Should Equal     ${response}    title    ${data}[new_post][title]
    Response Field Should Equal     ${response}    body     ${data}[new_post][body]

*** Keywords ***
Setup API Suite
    ${data}=    Load API Data
    Create API Session    ${data}[base_url]
