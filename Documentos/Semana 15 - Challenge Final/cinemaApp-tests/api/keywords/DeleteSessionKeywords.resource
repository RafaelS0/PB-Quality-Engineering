*** Settings ***
Documentation    Keywords para apagar de uma Sala de Cinema - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
DELETE Endpoint /sessions/id
    [Arguments]      ${id}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=     DELETE On Session    CinemaApp    url=/sessions/${id}        headers=${header}    expected_status=any
    Log    ${response.content}
    Log    ${response.status_code}
    Set Global Variable    ${response}


Delete Session Data
    [Arguments]    ${session}    
    Utilizar Token de Administrador
    ${session_id}=    Get Session ID   ${session}
    DELETE Endpoint /sessions/_id    ${session_id}
