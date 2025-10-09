*** Settings ***
Documentation    Testes para o endpoint /reservations

Resource    ../support/base.resource

Suite Setup    Make New Session


*** Test Cases ***

CT012.001 - Criar uma nova reserva válida
    [Tags]    CT012-new-reservation
    
    ${movie}=    Fill with movie    4
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    1
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
    Clean All Sessions From Theater    ${theater_id}

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-12-02T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
    Remove Session From Database    ${session}[datetime]
    Create Movie Session   ${session}
    ${session_id}=    Get Session ID    ${session}

    ${reservations}    Create Dictionary
    ...    session=${session_id}
    ...    row=A
    ...    number=${1}
    ...    type=full
    ...    paymentMethod=credit_card
    Create Reservations   ${reservations}
    Validate Status Code "201"
    Validar Success    ${True}
    Clean All Sessions From Theater    ${theater_id}

CT012.002 - Criar uma nova reserva sem token de autenticação
    [Tags]    CT012-new-reservation
    
    ${movie}=    Fill with movie    4
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}

    ${theater}=    Fill with Theater    1
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
    

   ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=2025-10-01T17:32:36.261Z
    ...    fullPrice=15
    ...    halfPrice=7.5
    Log    Session data: ${session}
    Remove Session From Database    ${session}[datetime]
    Create Movie Session   ${session}
    ${session_id}=    Get Session ID    ${session}

    ${reservations}    Create Dictionary
    ...    session=${session_id}
    ...    row=A
    ...    number=${1}
    ...    type=full
    ...    paymentMethod=credit_card
    Create Reservations without default token   ${reservations}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${false}


CT012.003 - Criar uma nova reserva duplicada
    [Tags]    CT012-new-reservation
    
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
    Create Movie Session   ${session}
    ${session_id}=    Get Session ID    ${session}

    ${reservations}    Create Dictionary
    ...    session=${session_id}
    ...    row=A
    ...    number=${1}
    ...    type=full
    ...    paymentMethod=credit_card
    Create Reservations   ${reservations}
    Create Reservations   ${reservations}
    Validate Status Code "400"
    Validar Success    ${false}


CT013.001 Editar Status de uma reserva
    [Tags]    CT013-edit-resertvations

    ${reservation}=    Fill with Reservation    2 
    Create Reservations   ${reservation}
    
    ${new_status}=    Create Dictionary
    ...    status=pending
    ...    paymentStatus=pending
    
    Edit reservation status    ${reservation}    ${new_status}
    Validate Status Code "200"
    Validar Success    ${True}
    Validate data    status    ${new_status}[status]   
    Validate data    paymentStatus    ${new_status}[paymentStatus] 

CT013.002 Editar Status de uma reserva sem autenticação
    [Tags]    CT013-edit-resertvations
    ${reservation}=    Fill with Reservation    2 
    Create Reservations   ${reservation}
    
    ${new_status}=    Create Dictionary
    ...    status=pending
    ...    paymentStatus=pending
    
    Edit reservation status without default token    ${reservation}    ${new_status}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${false}

CT013.003 Editar Status de uma reserva com token de cliente
    [Tags]    CT013-edit-resertvations
    ${reservation}=    Fill with Reservation    2 
    Create Reservations   ${reservation}
    
    ${new_status}=    Create Dictionary
    ...    status=pending
    ...    paymentStatus=pending
    
    ${token}=    Generate customer token
    Edit reservation status without default token    ${reservation}    ${new_status}    ${token}
    Validate Status Code "403"
    Validar Success    ${false}




CT014.001 Deletar uma reserva válida
    [Tags]    CT014-delete-reservation            

    ${reservation}=    Fill with Reservation    2 
    Create Reservations   ${reservation}
    Delete reservation Data   ${reservation}    
    Validate Status Code "200"
    Validar Success    ${True}
    
CT014.002 Deletar uma reserva válida sem token de autenticação
    [Tags]    CT014-delete-reservation              

    ${reservation}=    Fill with Reservation    2 
    Create Reservations   ${reservation}
    Delete reservation Data without default token   ${reservation}    ${EMPTY}  
    Validate Status Code "401"
    Validar Success    ${false}
    

CT014.002 Deletar uma reserva válida com token de cliente
    [Tags]    CT014-delete-reservation              

    ${reservation}=    Fill with Reservation    2 
    Create Reservations   ${reservation}
    ${token}=    Generate customer token
    
    Delete reservation Data without default token   ${reservation}  ${token}  
    Validate Status Code "403"
    Validar Success    ${false}
    
