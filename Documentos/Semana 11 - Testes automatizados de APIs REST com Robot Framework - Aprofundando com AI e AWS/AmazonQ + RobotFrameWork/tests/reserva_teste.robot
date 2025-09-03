*** Settings ***
Documentation           Arquivos de testes para o endpoint /auth
Resource                ../support/base.robot



*** Test Cases ***

Cenário: GET | Obter uma reserva pelo ID
    [Documentation]    Verifica se é possível obter uma reserva específica
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /booking/:id    1
    Validar Status Code "200"



Cenário: POST | Criar uma Reserva
    [Documentation]    Verifica se é possível criar uma reserva
    [Tags]    POST
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /booking    Rafael    Silva    150    True    2025-08-25    2025-08-28    Breakfast
    Validar Status Code "200"

Cenário: PUT | Editar uma Reserva
    [Documentation]    Verifica se é possível editar uma reserva
    [Tags]    PUT    
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /booking/:id    Rafael    Editado    150    True    2025-08-25    2025-08-28    Cafe
    Validar Status Code "200"

Cenário: PATCH | Atualizar parcialmente uma Reserva
    [Documentation]    Verifica se é possível atualizar uma reserva
    [Tags]    PATCH
    Criar Sessao
    Fazer Login e Armazenar Token
    PATCH Endpoint /booking/:id   Rafael    via Patch    150    Patch no Cafe
    Validar Status Code "200"

Cenário: DELETE | Deletar uma Reserva
    [Documentation]    Verifica se é possível deletar uma reserva
    [Tags]    DELETE
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /booking/:id  ${id_reserva}
    Validar Status Code "201"



Cenário: POST | Criar uma Reserva Dinâmica
    [Tags]    POST
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Reserva Dinamica Valida
    Validar Status Code "200"

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
