*** Settings ***
Resource        ../../resources/keywords/file_keywords.resource
Variables       ../../variables/dev.yaml

Suite Setup     Setup File Suite
Suite Teardown  Cleanup File Suite

*** Variables ***
${OUTPUT_DIR}    ${EXECDIR}/results/files

*** Test Cases ***
Create And Verify Text File
    ${data}=        Load File Data
    ${file_info}=   Set Variable    ${data}[files][0]
    ${path}=        Write File From Data    ${OUTPUT_DIR}    ${file_info}
    File Should Exist                       ${path}
    File Should Contain Expected Content    ${path}    ${file_info}[content]

Create And Verify CSV File
    ${data}=        Load File Data
    ${file_info}=   Set Variable    ${data}[files][1]
    ${path}=        Write File From Data    ${OUTPUT_DIR}    ${file_info}
    File Should Exist               ${path}
    CSV Should Have Correct Row Count    ${path}    2

All Files Should Be Created
    ${data}=    Load File Data
    FOR    ${file_info}    IN    @{data}[files]
        ${path}=    Set Variable    ${OUTPUT_DIR}/${file_info}[filename]
        File Should Exist    ${path}
    END

*** Keywords ***
Setup File Suite
    ${data}=    Load File Data
    Create Output Directory    ${OUTPUT_DIR}

Cleanup File Suite
    Remove Directory    ${OUTPUT_DIR}    recursive=True
