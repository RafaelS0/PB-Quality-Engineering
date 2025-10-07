*** Settings ***
Documentation    Keywords Reutilizaveis
Resource    ../base.resource


*** Keywords ***
Validate Redirection 
    [Arguments]    ${page}
    Location Should Be    ${BASE_URL}${page}


Default Client Data
    ${user}=    Create Dictionary
    ...    name=John Doe
    ...    email=john.doe@tester.com
    ...    password=password12345
    Clean user from database    ${user}[email]
    RETURN    ${user}



