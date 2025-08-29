*** Settings ***
Documentation           Requisições HTTP para a API Restful-Booker
Library                 RequestsLibrary

*** Variables ***


*** Test Cases ***
Cenário: GET livro específico
    [Documentation]    Verifica se é possível obter um livro específico
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /booking/1
    Validar Status Code "200"


* Keywords * 
Criar Sessao
    Create Session    alias=Booker    url=https://restful-booker.herokuapp.com

GET Endpoint /booking/1
    ${response}=    GET On Session    alias=Booker    url=/booking/1
    BuiltIn.Set Global Variable    ${response}    

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

