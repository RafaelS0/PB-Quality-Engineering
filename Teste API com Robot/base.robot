*** Settings ***
Documentation           Requisições HTTP para a API Restful-Booker
Library                 RequestsLibrary
Resource                ./login_keywords.robot
Resource                ./nova_reserva_keywords.robot
*** Variables ***


*** Test Cases ***
Cenário: GET livro específico
    [Documentation]    Verifica se é possível obter um livro específico
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /booking/1
    Validar Status Code "200"

Cenário: POST fazer Login
    [Documentation]    Verifica se é possível fazer login
    [Tags]    POST    
    Criar Sessao
    POST Endpoint /auth
    Validar Status Code "200"

Cenário: POST - Criar uma Reserva
    [Documentation]    Verifica se é possível criar uma reserva
    [Tags]    POST
    Criar Sessao
    POST Endpoint /booking
    Validar Status Code "200"

* Keywords * 
Criar Sessao
    Create Session    alias=Booker    url=https://restful-booker.herokuapp.com

GET Endpoint /booking/1
    ${response}=    GET On Session    alias=Booker    url=/booking/1
    Set Global Variable    ${response}    

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

