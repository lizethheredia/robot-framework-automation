*** Settings ***
Resource        ../../resources/keywords/database_keywords.resource
Variables       ../../variables/dev.yaml

Suite Setup     Setup Database
Suite Teardown  Teardown Database

*** Test Cases ***
Database Should Have Correct User Count
    ${data}=    Load DB Data
    ${expected}=    Evaluate    len($data['users'])
    Table Should Contain Row Count    users    ${expected}

Admin User Should Exist
    ${data}=    Load DB Data
    ${admin}=   Set Variable    ${data}[users][0]
    User Should Exist In Database    ${admin}[name]    ${admin}[email]
    User Role Should Be              ${admin}[email]    admin

Regular Users Should Have Correct Role
    ${data}=    Load DB Data
    FOR    ${user}    IN    @{data}[users]
        IF    '${user}[role]' == 'user'
            User Role Should Be    ${user}[email]    user
        END
    END

Query Should Return Correct User
    ${result}=    Query    SELECT name, email FROM users WHERE id=1
    Should Be Equal As Strings    ${result}[0][0]    Alice
    Should Be Equal As Strings    ${result}[0][1]    alice@example.com
