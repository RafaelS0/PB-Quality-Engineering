*** Settings ***
Documentation    Testes para o endpoint /sessions

Resource    ../support/base.resource

Suite Setup    Criar Sessao

*** Test Cases ***
CT005.001 - Criar uma nova sessão

    ${movie}=    Fill with movie    5
    Pegar ID de um filme    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    4
    Pegar ID de uma Sala    ${theater}
    Log    Theater ID: ${theater_id}

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
    Remove Session From Database    ${session}[datetime]
    Criar uma sessão    ${session}
    Validar Status Code "201"
    Validar Success    ${True}


CT005.002 - Editar uma sessão

    Fill with movie    5
    Fill with Theater    2
   
   ${session_unedited}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session_unedited}
    Remove Session From Database    ${session_unedited}[datetime]
    Criar uma sessão    ${session_unedited}
    Pegar ID de uma sessão    ${session_unedited}
    Validar Status Code "201"
    Validar Success    ${True}

    ${session_edited}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-11-02T17:32:36.261Z
    ...    fullPrice=50
    ...    halfPrice=25
    Log    Session data: ${session_edited}
    Remove Session From Database    ${session_edited}[datetime]
    
    Editar uma sessão    ${session_edited}

    Validar Status Code "200"
    Validar Success    ${True}