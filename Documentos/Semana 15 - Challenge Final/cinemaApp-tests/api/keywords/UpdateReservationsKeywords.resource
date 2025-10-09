*** Settings ***
Documentation    Keywords para edição de uma resesrva
Resource    ../support/base.resource


*** Keywords ***
PUT Endpoint /reservations/id
    [Arguments]    ${status}    ${paymentStatus}    ${reservation_id}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    status=${status}
    ...    paymentStatus=${paymentStatus}
    ${response}=     PUT On Session    CinemaApp    url=/reservations/${reservation_id}    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}



Edit reservation status
    [Arguments]    ${reservation}    ${status}
    ${admin_token}=    Generate admin token
    ${reservation_id}=    Get ID from Reservations    ${reservation}
    PUT Endpoint /reservations/id    ${status}[status]    ${status}[paymentStatus]    ${reservation_id}    ${admin_token}

Edit reservation status without default token
    [Arguments]    ${reservation}    ${status}    ${token}
    ${reservation_id}=    Get ID from Reservations    ${reservation}
    PUT Endpoint /reservations/id    ${status}[status]    ${status}[paymentStatus]    ${reservation_id}    ${token}



