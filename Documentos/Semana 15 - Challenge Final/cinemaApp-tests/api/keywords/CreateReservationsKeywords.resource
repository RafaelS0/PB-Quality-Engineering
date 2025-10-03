*** Settings ***
Documentation    Keywords para criação de uma resesrva
Resource    ../support/base.resource


*** Keywords ***
POST Endpoint /reservations
    [Arguments]    ${session}    ${seats}    ${paymentMethod}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    session=${session}
    ...    seats=${seats}
    ...    paymentMethod=${paymentMethod}
    ${response}=     POST On Session    CinemaApp    url=/reservations    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}



Criar uma Reserva
    [Arguments]     ${reservations}
    Utilizar Token de Cliente
    ${seat}=    Create Dictionary    row=${reservations}[row]    number=${reservations}[number]    type=${reservations}[type]
    ${seats}=    Create List    ${seat}
    POST Endpoint /reservations    ${reservations}[session]    ${seats}    ${reservations}[paymentMethod]