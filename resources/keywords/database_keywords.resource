*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    Collections
Library    ${EXECDIR}/libraries/DatabaseSetup.py

*** Keywords ***
Load DB Data
    [Arguments]    ${data_file}=${EXECDIR}/data/db_data.json
    ${json}=    Get File    ${data_file}
    ${data}=    Evaluate    __import__('json').loads($json)
    RETURN      ${data}

Setup Database
    ${data}=      Load DB Data
    ${db_path}=   Setup Test Database
    Connect To Database
    ...    sqlite3
    ...    ${db_path}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}

Teardown Database
    Disconnect From Database
    Teardown Test Database

Table Should Contain Row Count
    [Arguments]    ${table}    ${expected_count}
    ${count}=    Row Count    SELECT * FROM ${table}
    Should Be Equal As Integers    ${count}    ${expected_count}

User Should Exist In Database
    [Arguments]    ${name}    ${email}
    Row Count Is Equal To X
    ...    SELECT * FROM users WHERE name='${name}' AND email='${email}'
    ...    1

User Role Should Be
    [Arguments]    ${email}    ${expected_role}
    ${result}=    Query    SELECT role FROM users WHERE email='${email}'
    Should Be Equal As Strings    ${result}[0][0]    ${expected_role}
