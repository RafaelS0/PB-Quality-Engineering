*** Settings ***
Documentation    Keywords para edição de uma resesrva
Resource    ../support/base.resource


*** Keywords ***
PUT Endpoint /reservations/id
    [Arguments]    ${status}    ${paymentStatus}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    status=${status}
    ...    paymentStatus=${paymentStatus}
    ${response}=     PUT On Session    CinemaApp    url=/reservations/${reservation_id}    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}



Edit reservation status
    [Arguments]    ${reservation}    ${status}
    Utilizar Token de Administrador
    Get ID from Reservations    ${reservation}
    PUT Endpoint /reservations/id    ${status}[status]    ${status}[paymentStatus]


