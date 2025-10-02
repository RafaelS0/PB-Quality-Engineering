*** Settings ***
Documentation    Keywords Reutilizaveis
Resource    ../base.resource



*** Keywords ***

Pegar o ID de um usuário
    [Arguments]    ${user}
    Fazer Login    ${user}
    ${user_id}=    Set Variable    ${response.json()['data']['_id']}
    Set Global Variable    ${user_id}

Pegar ID de um filme
    [Arguments]     ${movie}
    ${movie_data} =     Get movie by title    ${movie}[title]
    ${movie_id} =     Set Variable    ${movie_data}[_id]
    Set Global Variable    ${movie_id}

Pegar ID de uma Sala
    [Arguments]    ${theater}
    ${theater_data}=    Get Theater by Name    ${theater}[name]
    Should Not Be Equal    ${theater_data}    ${None}    Theater not found in database
    ${theater_id} =     Set Variable    ${theater_data}[_id]
    Set Global Variable    ${theater_id}

Utilizar Token de Administrador
    ${admin_user}    Create Dictionary
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
    Criar Sessao
    Fazer Login    ${admin_user}
    