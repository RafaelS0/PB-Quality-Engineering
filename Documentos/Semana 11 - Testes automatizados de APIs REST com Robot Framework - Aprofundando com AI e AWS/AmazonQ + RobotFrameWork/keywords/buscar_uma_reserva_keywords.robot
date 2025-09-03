* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Resource   ../support/base.robot

* Keywords *
GET Endpoint /booking/:id
    [Arguments]    ${id_reserva}
    ${response}=    GET On Session    alias=Booker    url=/booking/${id_reserva}     expected_status=any
    Log To Console    message= ${response.content}
    Set Global Variable    ${response}
    [Return]    ${response}

