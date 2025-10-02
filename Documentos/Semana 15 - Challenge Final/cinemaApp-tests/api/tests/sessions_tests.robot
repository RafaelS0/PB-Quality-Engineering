*** Settings ***
Documentation    Testes para o endpoint /sessions

Resource    ../support/base.resource

Suite Setup    Criar Sessao


*** Test Cases ***

CT005.001 - Criar uma nova sessão

    ${movies_json}=    Ler JSON de Filmes
    ${movie_list}=    Get Value From Json    ${movies_json}    $.movie5     
    ${movie}=    Set Variable    ${movie_list}[0]
    Clean Movie from Database    ${movie}[title]
    Criar filme    ${movie} 
    Pegar ID de um filme    ${movie}
    Log    Movie ID: ${movie_id}
    
    ${theater}    Create Dictionary
    ...    name=Sala - 007
    ...    capacity= 70
    ...    type=IMAX    
    Remove Theater From Database    ${theater}[name]
    Criar um Sala de Cinema    ${theater}
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