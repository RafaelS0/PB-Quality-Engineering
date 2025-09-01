* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary
Resource   ./login_keywords.robot

* Keywords *
POST Endpoint /booking
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${bookingdates}=    Create Dictionary    checkin=2025-08-25    checkout=2025-08-28
    ${payload}=    Create Dictionary  
    ...    firstname=Rafael    
    ...    lastname=Silva    
    ...    totalprice=150    
    ...    depositpaid=${True}
    ...    bookingdates=${bookingdates}
    ...    additionalneeds=Breakfast

    ${response}=    POST On Session    Booker    /booking    headers=${header}    json=${payload}
    Log To Console    Response: ${response.status_code}
    Log To Console    Response body: ${response.content}
    ${body}=    Evaluate    json.dumps(${response.json()}, indent=2)    json
    Log    ${body}
    ${id}=    Set Variable    ${response.json()['bookingid']}
    Set Suite Variable    ${id_reserva}    ${id}
    BuiltIn.Set Global Variable    ${response}
