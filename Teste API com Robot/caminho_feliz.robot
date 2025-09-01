*** Settings ***
Documentation           Requisições HTTP para a API Restful-Booker
Library                 RequestsLibrary
Resource                ./resources/login_keywords.robot
Resource                ./resources/nova_reserva_keywords.robot
Resource                ./resources/editar_reserva_keywords.robot
Resource                ./resources/atualizar_reserva_parcial_keywords.robot
Resource                ./resources/buscar_uma_reserva_keywords.robot
Resource                ./resources/deletar_reserva_keywords.robot
*** Variables ***


*** Test Cases ***
Cenário: GET | Obter uma reserva pelo ID
    [Documentation]    Verifica se é possível obter uma reserva específica
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /booking/:id
    Validar Status Code "200"

Cenário: POST | Fazer Login
    [Documentation]    Verifica se é possível fazer login
    [Tags]    POST    Login
    Criar Sessao
    POST Endpoint /auth
    Validar Status Code "200"

Cenário: POST | Criar uma Reserva
    [Documentation]    Verifica se é possível criar uma reserva
    [Tags]    POST
    Criar Sessao
    POST Endpoint /booking
    Validar Status Code "200"

Cenário: PUT | Editar uma Reserva
    [Documentation]    Verifica se é possível editar uma reserva
    [Tags]    PUT
    Criar Sessao
    PUT Endpoint /booking/:id
    Validar Status Code "200"

Cenário: PATCH | Atualizar parcialmente uma Reserva
    [Documentation]    Verifica se é possível atualizar uma reserva
    [Tags]    PATCH
    Criar Sessao
    PATCH Endpoint /booking/:id
    Validar Status Code "200"

Cenário: DELETE | Deletar uma Reserva
    [Documentation]    Verifica se é possível deletar uma reserva
    [Tags]    DELETE
    Criar Sessao
    DELETE Endpoint /booking/:id
    Validar Status Code "201"

* Keywords * 
Criar Sessao
    Create Session    alias=Booker    url=https://restful-booker.herokuapp.com
   

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

