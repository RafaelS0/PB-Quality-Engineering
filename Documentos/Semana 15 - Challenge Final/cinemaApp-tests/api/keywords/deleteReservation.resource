*** Settings ***
Documentation    Keywords para deletar uma reserva - exclusivo para administrador
Resource    ../support/base.resource

*** Keywords ***
DELETE Endpoint /reservations/id
    [Arguments]    ${id}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    alias=CinemaApp    url=/reservations/${id}    headers=${header}    expected_status=any
    Log    ${response.content}




Deletar reserva
    [Arguments]    ${reservation}
    Utilizar Token de Administrador
    ${id}=     Get ID from Reservations    ${reservation}

    DELETE Endpoint /users/_id   ${id}
    
