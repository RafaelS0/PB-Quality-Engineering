* Settings *
Documentation    Keywords e Variáveis para deletar uma reserva
Resource   ../support/base.robot

* Keywords *
DELETE Endpoint /booking/:id
    [Arguments]    ${id_reserva}
    &{header}=    Create Dictionary    Content-Type=application/json    Cookie=token=${token_auth}
    ${response}=   DELETE On Session    alias=Booker    url=/booking/${id_reserva}    headers=&{header}    expected_status=any
    Log To Console    message= ${response.content}
    Set Global Variable    ${response} 