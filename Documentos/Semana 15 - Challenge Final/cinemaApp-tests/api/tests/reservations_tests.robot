*** Settings ***
Documentation    Testes para o endpoint /reservations

Resource    ../support/base.resource

Suite Setup    Make New Session


*** Test Cases ***

CT005.001 - Criar uma nova reserva

    ${movie}=    Fill with movie    4
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    1
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
    Criar uma sessão    ${session}
    ${session_id}=    Get Session ID    ${session}

    ${reservations}    Create Dictionary
    ...    session=${session_id}
    ...    row=A
    ...    number=${1}
    ...    type=full
    ...    paymentMethod=credit_card
    Criar uma Reserva    ${reservations}
    Validate Status Code "201"
    Validar Success    ${True}

CT006.002 Editar Status de uma reserva

    ${reservation}=    Fill with Reservation    2 
    ${user_id}=    Get User ID   ${customer}
    Remove Reservation by User    ${user_id}
    
    Criar uma Reserva    ${reservation}
    
    ${new_status}=    Create Dictionary
    ...    status=pending
    ...    paymentStatus=pending
    
    Edit reservation status    ${reservation}    ${new_status}
    Validate Status Code "200"
    Validar Success    ${True}
    Validate data    status    ${new_status}[status]   
    Validate data    paymentStatus    ${new_status}[paymentStatus] 

CT006.003 Deletar uma reserva

    ${reservation}=    Fill with Reservation    2 
    Criar uma Reserva    ${reservation}
    Deletar reserva    ${reservation}    
    Validate Status Code "200"
    Validar Success    ${True}
    

    
