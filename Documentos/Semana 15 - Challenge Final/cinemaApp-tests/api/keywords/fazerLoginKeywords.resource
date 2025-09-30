*** Settings ***
Documentation    Keywords para o Login de usuários
Resource    ../support/base.resource


*** Keywords ***

POST Endpoint /auth/login
    [Arguments]     ${email}    ${password}
    ${payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    alias=CinemaApp    url=/auth/login    json=${payload}    expected_status=any
    Set Global Variable    ${response}
    Run Keyword If    ${response.status_code} == 200    Extract JWT
    Log    ${response.content}


Extract JWT
    ${token}=    Set Variable    ${response.json()['data']['token']}
    Log    Token obtido: ${token}
    Set Global Variable    ${token}


Fazer Login
    [Arguments]    ${user}
    POST Endpoint /auth/login    ${user}[email]    ${user}[password]
        