* Settings *
Documentation    Keywords e Variáveis para deletar uma reserva
Library    RequestsLibrary
Resource   ./login_keywords.robot

* Keywords *
DELETE Endpoint /booking/:id
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${response}=   DELETE On Session    alias=Booker    url=/booking/1    headers=&{header}
    Log To Console    message= ${response.content}
    Set Global Variable    ${response} 