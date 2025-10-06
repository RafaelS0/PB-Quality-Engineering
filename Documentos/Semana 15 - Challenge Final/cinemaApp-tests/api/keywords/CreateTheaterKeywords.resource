*** Settings ***
Documentation    Keywords para criação de uma Sala de Cinema - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
POST Endpoint /theaters
    [Arguments]    ${name}    ${capacity}    ${type}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    name=${name}
    ...    capacity=${capacity}
    ...    type=${type}
    ${response}=     POST On Session    CinemaApp    url=/theaters    json=${payload}    headers=${header}    expected_status=any
    Log    ${response.content}
    Set Global Variable    ${response}


Criar um Sala de Cinema
    [Arguments]    ${theater}
    Utilizar Token de Administrador
    POST Endpoint /theaters    ${theater}[name]    ${theater}[capacity]    ${theater}[type]