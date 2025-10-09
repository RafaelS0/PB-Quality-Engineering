*** Settings ***
Documentation    Keywords para o Login de usuários
Resource    ../support/base.resource


*** Keywords ***

POST Endpoint /auth/login
    [Arguments]     ${email}    ${password}
    ${payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    alias=CinemaApp    url=/auth/login    json=${payload}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}


Extract JWT
    [Arguments]    ${email}    ${password}
    POST Endpoint /auth/login    ${email}    ${password}
    Should Be Equal As Integers    ${response.status_code}    200    msg="Falha ao fazer login com usuário válido"
    Should Contain    ${response.json()}    data
    Should Contain    ${response.json()['data']}    token
    ${token}=    Set Variable    ${response.json()['data']['token']}
    Log    Token obtido: ${token}
    RETURN    ${token}

Fazer Login
    [Arguments]    ${user}
    POST Endpoint /auth/login    ${user}[email]    ${user}[password]
        