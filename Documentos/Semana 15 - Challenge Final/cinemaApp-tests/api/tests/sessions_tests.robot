*** Settings ***
Documentation    Testes para o endpoint /sessions

Resource    ../support/base.resource

Suite Setup    Make New Session

*** Test Cases ***
CT009.001 - Criar uma nova sessão
    [Tags]    CT009-new-session

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

    Create Movie Session   ${session}
    Validate Status Code "201"
    Validar Success    ${True}
    Clean All Sessions From Theater    ${theater_id}
CT009.002 - Criar uma nova sessão sem token de autenticação
    [Tags]    CT009-new-session

    ${movie}=    Fill with movie    5
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    4
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
    Clean All Sessions From Theater    ${theater_id}

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
    
    
    Create Movie Session without default token   ${session}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${false}
    Clean All Sessions From Theater    ${theater_id}
CT009.003 - Criar uma nova sessão com token de cliente
    [Tags]    CT009-new-session

    ${movie}=    Fill with movie    5
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    4
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
    Clean All Sessions From Theater    ${theater_id}

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
    
    ${token}=    Generate customer token
    Create Movie Session without default token   ${session}    ${token}
    Validate Status Code "403"
    Validar Success    ${false}
    Clean All Sessions From Theater    ${theater_id}
CT009.004 - Criar uma sessão duplicada
    [Tags]    CT009-new-session

    ${movie}=    Fill with movie    5
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    4
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-11-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
   
    Create Movie Session  ${session}
    Create Movie Session  ${session}      
    Validate Status Code "409"
    Validar Success    ${false}
    Clean All Sessions From Theater    ${theater_id}



CT010.001 - Editar uma sessão válida
    [Tags]    CT010-edit-session

    ${movie}=    Fill with movie    5
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}
    
    ${theater}=    Fill with Theater    2
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
    Clean All Sessions From Theater    ${theater_id}
   
   ${session_unedited}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session_unedited}
    
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
    
    Update Session Data    ${session_edited}

    Validate Status Code "200"
    Validar Success    ${True}
    Clean All Sessions From Theater    ${theater_id}

CT010.002 - Editar uma sessão sem token de autenticação
    [Tags]     CT010-edit-session

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
    
    Update Session Data without default token    ${session_edited}    ${EMPTY}

    Validate Status Code "401"
    Validar Success    ${false}


CT010.003 - Editar uma sessão com token de cliente
    [Tags]    CT010-edit-session

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
    Remove Session by Theater    ${theater_id}        
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
    
    ${token}=    Generate customer token
    Update Session Data without default token    ${session_edited}    ${token}

    Validate Status Code "403"
    Validar Success    ${false}



CT011.001 - Deletar Uma Sessão Válida
    [Tags]    CT012-delete-session

    ${session}=    Fill with Session    1
    Delete Session Data    ${session}
    Validar Success    ${True}
    Validate Status Code "200"

CT011.002 - Deletar Uma Sessão sem token de autenticação
    [Tags]    CT012-delete-session

    ${session}=    Fill with Session    1
    Delete Session Data without default token    ${session}    ${EMPTY}
    Validar Success    ${False}
    Validate Status Code "401"

CT011.003 - Deletar Uma Sessão com token de cliente
    [Tags]    CT012-delete-session

    ${session}=    Fill with Session    1
    ${token}=    Generate customer token
    Delete Session Data without default token    ${session}    ${token}
    Validar Success    ${False}
    Validate Status Code "403"