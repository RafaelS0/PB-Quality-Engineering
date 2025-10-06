*** Settings ***
Documentation    Keywords Reutilizaveis
Resource    ../base.resource



*** Keywords ***

Validate Status Code "${statuscode}"
    Variable Should Exist    ${response}    response não foi definida. Verifique a requisição
    Should Be True    ${response.status_code} == ${statuscode}    

Validar Success
    [Arguments]    ${expected_success}
    Variable Should Exist    ${response}    response não foi definida. Verifique a requisição
    ${response_success}=    Set Variable    ${response.json()['success']}
    Should Be Equal    ${response_success}    ${expected_success}    msg=Campo success inesperado. Esperado: ${expected_success}, Obtido: ${response_success}

Validate data
    [Arguments]    ${expected_field}    ${expected_value}
    Variable Should Exist    ${response}    response não foi definida. Verifique a requisição
    ${json_data}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json_data['data']}    ${expected_field}
    ${actual_value}=    Set Variable    ${json_data['data']['${expected_field}']}
    Should Be Equal    ${actual_value}    ${expected_value}    msg=Campo ${expected_field} - Esperado: ${expected_value}, Obtido: ${actual_value}

    
Get User ID
    [Arguments]    ${user}
    Fazer Login    ${user}
    ${user_id}=    Set Variable    ${response.json()['data']['_id']}
    RETURN    ${user_id}
Get Movie ID
    [Arguments]     ${movie}
    ${movie_data} =     Get movie by title    ${movie}[title]
    ${movie_id} =     Set Variable    ${movie_data}[_id]
    RETURN     ${movie_id}

#IA
Get Theater ID
    [Arguments]    ${theater}
    ${theater_data}=    Get Theater by Name    ${theater}[name]
    Should Not Be Equal    ${theater_data}    ${None}    Theater not found in database
    ${theater_id} =     Set Variable    ${theater_data}[_id]
    RETURN    ${theater_id}

Get Session ID
    [Arguments]    ${session}
    ${session_data}=    Get Session by Theater    ${session}[theater]   
    Should Not Be Equal    ${session_data}    ${None}    Session not found in database
    ${session_id}=    Set Variable    ${session_data}[_id]  
    RETURN    ${session_id}  

Get ID from Reservations
    [Arguments]    ${reservation}
    ${reservation_data}=    Get Reservation by Session    ${reservation}[session]   
    Should Not Be Equal    ${reservation_data}    ${None}    Reservation not found in database
    ${reservation_id}=    Set Variable    ${reservation_data}[_id]  
    RETURN    ${reservation_id}


Utilizar Token de Administrador
    ${admin_user}    Create Dictionary
    ...    name= Lex Luthr
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
    POST Endpoint /auth/register    ${admin_user}[name]    ${admin_user}[email]    ${admin_user}[password]
    POST Endpoint /auth/login    ${admin_user}[email]   ${admin_user}[password]
    Set Global Variable    ${admin_user}
Utilizar Token de Cliente
    ${customer}    Create Dictionary
    ...    name= Linus
    ...    email= linus.torvalds@unix.com
    ...    password=ilovelinux
    POST Endpoint /auth/register    ${customer}[name]    ${customer}[email]    ${customer}[password]
    POST Endpoint /auth/login    ${customer}[email]   ${customer}[password]
    Set Global Variable    ${customer}

Read JSON File
    [Arguments]    ${file}
    ${json}=    Load Json From File    ${EXECDIR}/support/fixtures/${file}
    RETURN    ${json}


Fill with movie
    [Arguments]    ${index}
    ${movies_json}=    Read JSON File    movies.json
    ${movie}=    Set Variable    ${movies_json}[movie${index}]
    Clean Movie from Database    ${movie}[title]
    Criar filme    ${movie} 
    ${movie_id}=    Get Movie ID    ${movie}
    Log    Movie ID: ${movie_id}
    RETURN     ${movie}

Fill with Theater
    [Arguments]    ${index}
    ${theater_json}=    Read JSON File    theaters.json
    ${theater}=    Set Variable    ${theater_json}[theater${index}]
    Remove Theater From Database    ${theater}[name]
    Criar um Sala de Cinema    ${theater}
    ${theater_id}=    Get Theater ID    ${theater}
    Log    Theater ID: ${theater_id}
    RETURN    ${theater}

#FEITO COM AJUDA DE IA
Fill with Session
    [Arguments]    ${index}
    ${sessions_json}=    Read JSON File    sessions.json
    ${session_data}=    Set Variable    ${sessions_json}[session${index}]
    
    ${movie}=    Fill with movie    ${session_data}[movieIndex]
    ${theater}=    Fill with Theater    ${session_data}[theaterIndex]
    
    ${movie_id}=    Get Movie ID    ${movie}
    ${theater_id}=    Get Theater ID    ${theater}
    
    ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=${session_data}[datetime]
    ...    fullPrice=${session_data}[fullPrice]
    ...    halfPrice=${session_data}[halfPrice]
    Remove Session By Theater And Date    ${theater_id}    ${session}[datetime]
    Criar uma sessão    ${session}
    ${session_id}=    Get Session ID    ${session}
    
    RETURN    ${session}

#FEITO COM AJUDA DE IA
Fill with Reservation
    [Arguments]    ${index}
    ${reservations_json}=    Read JSON File    reservations.json
    ${reservation_data}=    Set Variable    ${reservations_json}[reservation${index}]
    
    # Preparar filme e teatro
    ${movie}=    Fill with movie    ${reservation_data}[movieIndex]
    ${theater}=    Fill with Theater    ${reservation_data}[theaterIndex]
    
    ${movie_id}=    Get Movie ID    ${movie}
    ${theater_id}=    Get Theater ID    ${theater}

    
    # Criar sessão
    ${session}=    Create Dictionary
    ...    movie=${movie_id}
    ...    theater=${theater_id}
    ...    datetime=${reservation_data}[session][datetime]
    ...    fullPrice=${reservation_data}[session][fullPrice]
    ...    halfPrice=${reservation_data}[session][halfPrice]
    Remove Session By Theater And Date    ${theater_id}    ${session}[datetime]
    Criar uma sessão    ${session}
    ${session_id}=    Get Session ID    ${session}
    
    # Criar cliente para a reserva
    
    Utilizar Token de Cliente
    ${reservation}=    Create Dictionary
    ...    session=${session_id}
    ...    row=${reservation_data}[row]
    ...    number=${reservation_data}[number]
    ...    type=${reservation_data}[type]
    ...    paymentMethod=${reservation_data}[paymentMethod]
    
    RETURN    ${reservation}
