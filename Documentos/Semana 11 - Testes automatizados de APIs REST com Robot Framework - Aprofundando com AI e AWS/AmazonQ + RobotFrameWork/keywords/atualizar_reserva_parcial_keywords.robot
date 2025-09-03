* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary
Resource   ../support/base.robot

* Keywords *
PATCH Endpoint /booking/:id
    [Arguments]    ${firstname}    ${lastname}    ${totalprice}    ${needs}
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${payload}=    Create Dictionary
    ...    firstname=${firstname}
    ...    lastname=${lastname}
    ...    totalprice=${totalprice}
    ...    additionalneeds=${needs}

    ${response}=    PATCH On Session    Booker    /booking/${id_reserva}    headers=${header}    json=${payload}
    Log To Console    Response: ${response.status_code}
    Log To Console    Response body: ${response.content}
    ${body}=    Evaluate    json.dumps(${response.json()}, indent=2)    json
    Log    ${body}
    BuiltIn.Set Global Variable    ${response}
