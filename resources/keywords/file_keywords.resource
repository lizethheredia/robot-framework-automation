*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String

*** Keywords ***
Load File Data
    [Arguments]    ${data_file}=${EXECDIR}/data/file_data.json
    ${json}=    Get File    ${data_file}
    ${data}=    Evaluate    __import__('json').loads($json)
    RETURN      ${data}

Create Output Directory
    [Arguments]    ${dir}
    Create Directory    ${dir}

Write File From Data
    [Arguments]    ${output_dir}    ${file_info}
    ${path}=    Set Variable    ${output_dir}/${file_info}[filename]
    Create File    ${path}    ${file_info}[content]
    RETURN         ${path}

File Should Contain Expected Content
    [Arguments]    ${path}    ${expected_content}
    ${content}=    Get File    ${path}
    Should Be Equal    ${content}    ${expected_content}

CSV Should Have Correct Row Count
    [Arguments]    ${path}    ${expected_rows}
    ${content}=    Get File    ${path}
    ${lines}=      Split To Lines    ${content}
    ${data_lines}=    Evaluate    len($lines) - 1
    Should Be Equal As Integers    ${data_lines}    ${expected_rows}
