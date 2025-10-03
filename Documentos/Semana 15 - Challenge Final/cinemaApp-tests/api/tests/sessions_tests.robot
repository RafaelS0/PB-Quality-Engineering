*** Settings ***
Documentation    Testes para o endpoint /sessions

Resource    ../support/base.resource

Suite Setup    Criar Sessao

*** Test Cases ***
CT005.001 - Criar uma nova sessão

    ${movies_json}=    Read JSON File    movies.json
    ${movie}=    Set Variable    ${movies_json}[movie5]
    Clean Movie from Database    ${movie}[title]
    Criar filme    ${movie} 
    Pegar ID de um filme    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater_json}=    Read JSON File    theaters.json
    ${theater}=    Set Variable    ${theater_json}[theater1]
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