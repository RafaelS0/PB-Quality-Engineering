* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary
Resource   ./login_keywords.robot
Resource   ./nova_reserva_keywords.robot

* Keywords *
PUT Endpoint /booking/:id
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

    ${response}=    PUT On Session    Booker    /booking/${id_reserva}    headers=${header}    json=${payload}
    Log To Console    Response: ${response.status_code}
    Log To Console    Response body: ${response.content}
    ${body}=    Evaluate    json.dumps(${response.json()}, indent=2)    json
    Log    ${body}
    BuiltIn.Set Global Variable    ${response}
