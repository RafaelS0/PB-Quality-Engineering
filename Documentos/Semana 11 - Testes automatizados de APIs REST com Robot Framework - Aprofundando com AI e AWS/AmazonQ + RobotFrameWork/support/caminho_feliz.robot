*** Settings ***
Documentation           Requisições HTTP para a API Restful-Booker
Library                 RequestsLibrary
Resource                ../keywords/login_keywords.robot
Resource                ../keywords/nova_reserva_keywords.robot
Resource                ../keywords/editar_reserva_keywords.robot
Resource                ../keywords/atualizar_reserva_parcial_keywords.robot
Resource                ../keywords/buscar_uma_reserva_keywords.robot
Resource                ../keywords/deletar_reserva_keywords.robot
*** Variables ***



*** Test Cases ***

Cenário: POST | Fazer Login
    [Documentation]    Verifica se é possível fazer login
    [Tags]    POST    Login
    Criar Sessao
    POST Endpoint /auth
    Validar Login
    Validar Status Code "200"

Cenário: POST | Criar uma Reserva
    [Documentation]    Verifica se é possível criar uma reserva
    [Tags]    POST
    Criar Sessao
    POST Endpoint /booking    Rafael    Silva    150    True    2025-08-25    2025-08-28    Breakfast
    Validar Status Code "200"

Cenário: GET | Obter uma reserva pelo ID
    [Documentation]    Verifica se é possível obter uma reserva específica
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /booking/:id    1
    Validar Status Code "200"

Cenário: PUT | Editar uma Reserva
    [Documentation]    Verifica se é possível editar uma reserva
    [Tags]    PUT    
    Criar Sessao
    PUT Endpoint /booking/:id    Rafael    Editado    150    True    2025-08-25    2025-08-28    Cafe
    Validar Status Code "200"

Cenário: PATCH | Atualizar parcialmente uma Reserva
    [Documentation]    Verifica se é possível atualizar uma reserva
    [Tags]    PATCH
    Criar Sessao
    PATCH Endpoint /booking/:id   Rafael    via Patch    150    Patch no Cafe
    Validar Status Code "200"

Cenário: DELETE | Deletar uma Reserva
    [Documentation]    Verifica se é possível deletar uma reserva
    [Tags]    DELETE
    Criar Sessao
    DELETE Endpoint /booking/:id  ${id_reserva}
    Validar Status Code "201"



Cenário: POST Criar Massa de Agendamentos
    [Tags]    POST
    Criar Sessao
    Criar Reserva Dinamica Valida
    Validar Status Code "200"

* Keywords * 
Criar Sessao
    Create Session    alias=Booker    url=https://restful-booker.herokuapp.com



