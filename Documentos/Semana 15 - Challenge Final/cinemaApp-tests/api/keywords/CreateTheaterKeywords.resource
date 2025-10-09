*** Settings ***
Documentation    Keywords para criação de uma Sala de Cinema - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
POST Endpoint /theaters
    [Arguments]    ${name}    ${capacity}    ${type}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    name=${name}
    ...    capacity=${capacity}
    ...    type=${type}
    ${response}=     POST On Session    CinemaApp    url=/theaters    json=${payload}    headers=${header}    expected_status=any
    Log    ${response.content}
    Set Global Variable    ${response}


Create Theater Data
    [Arguments]    ${theater}
    ${admin_token}=    Generate admin token
    POST Endpoint /theaters    ${theater}[name]    ${theater}[capacity]    ${theater}[type]    ${admin_token}

Create Theater Data without default token
    [Arguments]    ${theater}    ${token}
   
    POST Endpoint /theaters    ${theater}[name]    ${theater}[capacity]    ${theater}[type]      ${token}