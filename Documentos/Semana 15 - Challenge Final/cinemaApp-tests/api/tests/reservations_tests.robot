*** Settings ***
Documentation    Testes para o endpoint /reservations

Resource    ../support/base.resource

Suite Setup    Criar Sessao


*** Test Cases ***

CT005.001 - Criar uma nova reserva

    ${movie}=    Fill with movie    4
    Pegar ID de um filme    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    1
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
    Validar Status Code "201"
    Validar Success    ${True}

CT006.002 Editar Status de uma reserva

    ${reservation}=    Fill with Reservation    2 
    Pegar o ID de um usuário    ${customer}
    Remove Reservation by User    ${user_id}
    
    Criar uma Reserva    ${reservation}
    
    ${new_status}=    Create Dictionary
    ...    status=pending
    ...    paymentStatus=pending
    
    Edit reservation status    ${reservation}    ${new_status}
    Validar Status Code "200"
    Validar Success    ${True}
    Validate data    status    ${new_status}[status]   
    Validate data    paymentStatus    ${new_status}[paymentStatus]  
    
