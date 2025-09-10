*** Settings ***
Documentation           Arquivos de testes para o endpoint /usuarios
Resource                ../support/base.robot


Suite Setup     Criar Sessao 



*** Test Cases ***
Cenário: POST | Cadastrar Cliente Válido
    [Documentation]    Verifica se é possível cadastrar um cliente válido
    [Tags]    POST   Usuarios
    Criar Cliente Valido
    Validar Status Code "201"

Cenário: POST | Cadastrar Cliente com e-mail já Existente
    [Documentation]    Verifica se não é possível cadastrar um cliente com e-mail já existente
    [Tags]    POST   Usuarios
    Criar Cliente Valido
    POST Endpoint /usuarios    ${payload['nome']}    ${payload['email']}    ${payload['password']}   admin=false
    Validar Status Code "400"
    Validar mensagem de erro:    Este email já está sendo usado

Cenário: POST | Cadastrar Cliente com e-mail Gmail
    [Documentation]    Verifica se é possível cadastrar um cliente com e-mail do Gmail
    [Tags]    POST   Usuarios
    Criar Usuario Gmail Invalido
    Validar Status Code "400"

Cenário: POST | Cadastrar Cliente com e-mail Hotmail
    [Documentation]    Verifica se é possível cadastrar um cliente com e-mail do Hotmail
    [Tags]    POST   Usuarios
    Criar Usuario Hotmail Invalido
    Validar Status Code "400"