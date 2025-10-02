*** Settings ***
Documentation    Testes para o endpoint /reservations

Resource    ../support/base.resource

Suite Setup    Criar Sessao


*** Test Cases ***

CT005.001 - Criar uma nova reserva

    ${genres}=    Create List    Ação    Thriller    
    ${movie}    Create Dictionary    
    ...    title=John Wick 4: Baba Yaga
    ...    synopsis=O ex-assassino de aluguel John Wick é procurado pelo mundo todo e a recompensa por sua captura aumenta cada vez mais. 
    ...    director=Chad Stahelski
    ...    genres=${genres}
    ...    duration=169
    ...    classification=+16
    ...    poster=johnwick.jpg
    ...    releaseDate=2023-03-23
    Clean Movie from Database    ${movie}[title]
    Criar Sessao
    Criar filme    ${movie} 
    Pegar ID de um filme    ${movie}
    Log    Movie ID: ${movie_id}
    
    ${theater}    Create Dictionary
    ...    name=Sala - 004
    ...    capacity= 50
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
    Pegar ID de uma sessão    ${session}

    ${reservations}    Create Dictionary
    ...    session=${session_id}
    ...    row=A
    ...    number=${1}
    ...    type=full
    ...    paymentMethod=credit_card
    Criar uma Reserva    ${reservations}