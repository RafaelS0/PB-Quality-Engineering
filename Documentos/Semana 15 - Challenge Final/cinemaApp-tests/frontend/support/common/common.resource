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

Clean User Reservations
    [Arguments]    ${user}
    ${id}=    Get user ID    ${user}[email]
    Run Keyword If    '${id}' != 'None'    Remove Reservation by User    ${id}
    ...    ELSE    Log    User not found, no reservations to clean

Clean reservations
    [Arguments]    ${theater}
    ${theater_data}=    Get Theater by Name    ${theater}
    ${session_id}=    Get Session ID by Theater    ${theater_data}[_id]
    Set All Seats Available    ${session_id}


