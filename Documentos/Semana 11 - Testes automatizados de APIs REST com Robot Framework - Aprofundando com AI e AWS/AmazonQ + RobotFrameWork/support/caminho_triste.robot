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

Cenário: POST | Criar uma Reserva Inválida
    [Documentation]    Criar uma reserva onde há campos obrigatórios vazios
    [Tags]    POST
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /booking    ${EMPTY}    ${EMPTY}    150    True    2025-08-25    2025-08-28    Breakfast
    Validar Status Code "400"

Cenário: GET | Obter uma reserva pelo ID Inválido
    [Documentation]    Solicitar uma reserva inexistente
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /booking/:id    99999999999        
    Validar Status Code "404"

Cenário: DELETE | Deletar uma Reserva Inválida
    [Documentation]    Deletar uma reserva inexistente
    [Tags]    DELETE
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /booking/:id  99999990
    Validar Status Code "405"

* Keywords * 
Criar Sessao
    Create Session    alias=Booker    url=https://restful-booker.herokuapp.com

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}