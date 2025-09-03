*** Settings ***
Documentation           Arquivos de testes para o endpoint /auth
Resource                ../support/base.robot

*** Test Cases ***

Cenário: POST | Fazer Login
    [Documentation]    Verifica se é possível fazer login
    [Tags]    POST    Login
    Criar Sessao
    POST Endpoint /auth
    Validar Login
    Validar Status Code "200"