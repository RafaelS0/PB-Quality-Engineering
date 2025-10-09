*** Settings ***
Documentation    Keywords para criação de usuário
Resource    ../support/base.resource

*** Keywords ***
POST Endpoint /auth/register
    [Arguments]    ${name}    ${email}    ${password}
    &{header}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    password=${password}
    ${response}=     POST On Session    CinemaApp    url=/auth/register    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}
    Log    ${response.status_code}



POST Endpoint setup/admin
    [Arguments]    ${name}    ${email}    ${password}
    &{header}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    password=${password}
    ${response}=     POST On Session    CinemaApp    url=/setup/admin   json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}


Criar Cliente Valido
    [Arguments]    ${customer_user}
    POST Endpoint /auth/register    ${customer_user}[name]    ${customer_user}[email]    ${customer_user}[password]

Criar um Administrador
    [Arguments]    ${admin_user}
    POST Endpoint setup/admin    ${admin_user}[name]    ${admin_user}[email]    ${admin_user}[password]    