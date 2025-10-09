*** Settings ***
Documentation    Testes para o endpoint /sessions

Resource    ../support/base.resource

Suite Setup    Make New Session

*** Test Cases ***
CT010.001 - Criar uma nova sessão
    [Tags]    CT010

    ${movie}=    Fill with movie    5
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    4
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
    Remove Session From Database    ${session}[datetime]
    Create Movie Session   ${session}
    Validate Status Code "201"
    Validar Success    ${True}


CT011.001 - Editar uma sessão
    [Tags]    CT011

    ${movie}=    Fill with movie    5
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}
    
    ${theater}=    Fill with Theater    2
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
   
   ${session_unedited}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session_unedited}
    Remove Session From Database    ${session_unedited}[datetime]
    Create Movie Session    ${session_unedited}
    ${session_id}=    Get Session ID    ${session_unedited}
    Validate Status Code "201"
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

    Validate Status Code "200"
    Validar Success    ${True}

CT012.001 - Deletar Uma Sessão Válida
    [Tags]    CT012

    ${session}=    Fill with Session    1
    Delete Session Data    ${session}
    Validar Success    ${True}
    Validate Status Code "200"

