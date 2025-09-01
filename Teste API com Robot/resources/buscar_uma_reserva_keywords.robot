* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Library    RequestsLibrary

* Keywords *
GET Endpoint /booking/:id
    ${response}=    GET On Session    alias=Booker    url=/booking/1
    Log To Console    message= ${response.content}
    Set Global Variable    ${response} 