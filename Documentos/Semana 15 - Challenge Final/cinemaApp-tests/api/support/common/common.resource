*** Settings ***
Documentation    Keywords Reutilizaveis
Resource    ../base.resource



*** Keywords ***

Validar Status Code "${statuscode}"
    Variable Should Exist    ${response}    response não foi definida. Verifique se a requisição
    Should Be True    ${response.status_code} == ${statuscode}    


Validar Success
    [Arguments]    ${expected_success}
    Variable Should Exist    ${response}    response não foi definida. Verifique se a requisição
    ${response_success}=    Set Variable    ${response.json()['success']}
    Should Be Equal    ${response_success}    ${expected_success}    msg=Campo success inesperado. Esperado: ${expected_success}, Obtido: ${response_success}


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

#IA
Pegar ID de uma Sala
    [Arguments]    ${theater}
    ${theater_data}=    Get Theater by Name    ${theater}[name]
    Should Not Be Equal    ${theater_data}    ${None}    Theater not found in database
    ${theater_id} =     Set Variable    ${theater_data}[_id]
    Set Global Variable    ${theater_id}

Pegar ID de uma sessão
    [Arguments]    ${session}
    ${session_data}=    Get Session by Theater    ${session}[theater]   
    Should Not Be Equal    ${session_data}    ${None}    Session not found in database
    ${session_id}=    Set Variable    ${session_data}[_id]  
    Set Global Variable    ${session_id}   


Utilizar Token de Administrador
    ${admin_user}    Create Dictionary
    ...    name= Lex Luthr
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
    POST Endpoint /auth/register    ${admin_user}[name]    ${admin_user}[email]    ${admin_user}[password]
    POST Endpoint /auth/login    ${admin_user}[email]   ${admin_user}[password]
Utilizar Token de Cliente
    ${customer}    Create Dictionary
    ...    name= Linus
    ...    email= linus.torvalds@unix.com
    ...    password=ilovelinux
    POST Endpoint /auth/register    ${customer}[name]    ${customer}[email]    ${customer}[password]
    POST Endpoint /auth/login    ${customer}[email]   ${customer}[password]

Read JSON File
    [Arguments]    ${file}
    ${json}=    Load Json From File    ${EXECDIR}/support/fixtures/${file}
    RETURN    ${json}

