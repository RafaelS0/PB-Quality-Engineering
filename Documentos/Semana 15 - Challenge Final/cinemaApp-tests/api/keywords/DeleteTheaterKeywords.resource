*** Settings ***
Documentation    Keywords para apagar de uma Sala de Cinema - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
DELETE Endpoint /theaters/id
    [Arguments]      ${id}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=     DELETE On Session    CinemaApp    url=/theaters/${id}        headers=${header}    expected_status=any
    Log    ${response.content}
    Log    ${response.status_code}
    Set Global Variable    ${response}


Delete Theater Data
    [Arguments]    ${theater}    
    Utilizar Token de Administrador
    ${theater_id}=    Get Theater ID    ${theater}
    DELETE Endpoint /theaters/_id    ${theater_id}
