*** Settings ***
Documentation    Keywords para deletar uma reserva - exclusivo para administrador
Resource    ../support/base.resource

*** Keywords ***
DELETE Endpoint /reservations/id
    [Arguments]    ${id}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    alias=CinemaApp    url=/reservations/${id}    headers=${header}    expected_status=any
    Log    ${response.content}
    Set Global Variable    ${response}



Delete reservation Data
    [Arguments]    ${reservation}
    ${admin_token}=    Generate admin token
    ${id}=     Get ID from Reservations    ${reservation}
    DELETE Endpoint /reservations/_id   ${id}    ${admin_token}


Delete reservation Data without default token
    [Arguments]    ${reservation}    ${token}
    ${admin_token}=    Generate admin token
    ${id}=     Get ID from Reservations    ${reservation}
    DELETE Endpoint /reservations/_id   ${id}    ${token}
    
