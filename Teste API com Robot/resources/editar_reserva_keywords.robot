* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary
Resource   ./login_keywords.robot
Resource   ./nova_reserva_keywords.robot

* Keywords *
PUT Endpoint /booking/:id
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${bookingdates}=    Create Dictionary    checkin=2018-01-01    checkout=2019-01-01
    ${payload}=    Create Dictionary  
    ...    firstname=Rafael    
    ...    lastname=Editado    
    ...    totalprice=150    
    ...    depositpaid=${True}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=Cafe

    ${response}=    PUT On Session    Booker    /booking/${id_reserva}    headers=${header}    json=${payload}
    Log To Console    Response: ${response.status_code}
    Log To Console    Response body: ${response.content}
    ${body}=    Evaluate    json.dumps(${response.json()}, indent=2)    json
    Log    ${body}
    BuiltIn.Set Global Variable    ${response}
