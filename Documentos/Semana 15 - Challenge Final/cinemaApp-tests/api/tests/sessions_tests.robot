*** Settings ***
Documentation    Testes para o endpoint /auth

Resource    ../support/base.resource

Suite Setup    Criar Sessao


*** Test Cases ***

CT005.001 - Criar uma nova sessão

    ${genres}=    Create List    Ação    Crime    
    ${movie}    Create Dictionary    
    ...    title=The Batman
    ...    synopsis=Após dois anos espreitando as ruas como Batman, Bruce Wayne se encontra nas profundezas mais sombrias de Gotham City. Com poucos aliados confiáveis, o vigilante solitário se estabelece como a personificação da vingança para a população.
    ...    director=Matt Reeves
    ...    genres=${genres}
    ...    duration=176
    ...    classification=+14
    ...    poster=batman.jpg
    ...    releaseDate=2022-03-03
    Clean Movie from Database    ${movie}[title]
    Criar Sessao
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