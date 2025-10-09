*** Settings ***
Documentation    Keywords para criação de uma Sala de Cinema - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
PUT Endpoint /theaters/id
    [Arguments]    ${name}    ${capacity}    ${type}    ${id}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    name=${name}
    ...    capacity=${capacity}
    ...    type=${type}
    ${response}=     PUT On Session    CinemaApp    url=/theaters/${id}    json=${payload}    headers=${header}    expected_status=any
    Log    ${response.content}


Update Theater Data
    [Arguments]    ${original_theater}    ${edited_theater}
    ${admin_token}=    Generate admin token
    ${theater_id}=    Get Theater ID    ${original_theater}
    PUT Endpoint /theaters/id    ${edited_theater}[name]    ${edited_theater}[capacity]    ${edited_theater}[type]    ${theater_id}    ${admin_token}
