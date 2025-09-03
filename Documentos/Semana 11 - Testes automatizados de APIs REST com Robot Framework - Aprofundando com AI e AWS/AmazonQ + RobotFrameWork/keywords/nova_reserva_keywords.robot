* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary
Resource   ../support/base.robot    

* Keywords *
POST Endpoint /booking
    [Arguments]    ${firstname}    ${lastname}    ${totalprice}    ${depositpaid}    ${checkin}    ${checkout}    ${needs}
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${bookingdates}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}
    ${payload}=    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${totalprice}
    ...    depositpaid=${depositpaid}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=${needs}

    ${response}=    POST On Session    Booker    /booking    headers=${header}    json=${payload}    expected_status=any
    Log To Console    Response: ${response.status_code}
    Log To Console    Response body: ${response.content}
    ${body}=    Evaluate    json.dumps(${response.json()}, indent=2)    json
    Log    ${body}
    ${id}=    Set Variable    ${response.json()['bookingid']}
    Set Suite Variable    ${id_reserva}    ${id}
    BuiltIn.Set Global Variable    ${response}

Criar Agendamento Estatico Valido
    ${json_data}=    Importar JSON Estatico    ../json_booking.json
    ${payload}=    Set Variable    ${json_data["agendamento_valido"]}
    Set Global Variable    ${payload}
    POST Endpoint /booking    ${payload['firstname']}    ${payload['lastname']}    ${payload['totalprice']}    ${payload['depositpaid']}    ${payload['bookingdates']['checkin']}    ${payload['bookingdates']['checkout']}    ${payload['additionalneeds']}

Criar Reserva Dinamica Valida
    ${payload}=    Criar Reservas Validas
    Set Global Variable    ${payload}
    POST Endpoint /booking    ${payload['firstname']}    ${payload['lastname']}    ${payload['totalprice']}    ${payload['depositpaid']}    ${payload['bookingdates']['checkin']}    ${payload['bookingdates']['checkout']}    ${payload['additionalneeds']}