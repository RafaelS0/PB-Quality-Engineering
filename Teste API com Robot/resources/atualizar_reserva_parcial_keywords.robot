* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary
Resource   ./login_keywords.robot
Resource   ./nova_reserva_keywords.robot

* Keywords *
PATCH Endpoint /booking/:id
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${payload}=    Create Dictionary  
    ...    firstname=Rafael    
    ...    lastname=via Patch    
    ...    totalprice=150    
    ...    additionalneeds= Patch no Cafe

    ${response}=    PATCH On Session    Booker    /booking/${id_reserva}    headers=${header}    json=${payload}
    Log To Console    Response: ${response.status_code}
    Log To Console    Response body: ${response.content}
    ${body}=    Evaluate    json.dumps(${response.json()}, indent=2)    json
    Log    ${body}
    BuiltIn.Set Global Variable    ${response}
