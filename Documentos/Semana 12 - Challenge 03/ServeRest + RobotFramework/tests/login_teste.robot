*** Settings ***
Documentation           Arquivos de testes para o endpoint /login
Resource                ../support/base.robot


Suite Setup     Criar Sessao 


*** Test Cases ***
Cenário: POST | Fazer Login
    [Documentation]    Verifica se é possível fazer login
    [Tags]    POST   Login
    POST Endpoint /login    fulano@qa.com    teste
    Verificar se o Token foi gerado
    Validar Status Code "200"

Cenário: POST | Fazer Login com credencial não cadastrada
    [Documentation]    Verifica se é possível fazer login
    [Tags]    POST   Login
    POST Endpoint /login    naoCadastrado@qa.com    teste
    Validar Status Code "401"
    Validar mensagem de erro:   Email e/ou senha inválidos