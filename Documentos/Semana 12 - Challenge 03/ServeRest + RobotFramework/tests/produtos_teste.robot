*** Settings ***
Documentation           Arquivos de testes para o endpoint /produtos
Resource                ../support/base.robot

Suite Setup     Criar Sessao 

*** Test Cases ***
Cenário: POST | Cadastrar Produto Válido
    [Documentation]    Verifica se é possível cadastrar um produto válido
    [Tags]    POST   Produtos
    Criar Administrador Valido
    Fazer Login  
    Criar Produto Dinamico    
    Validar Status Code "201"
Cenário: POST | Cadastrar Produto Sem Autenticação
    [Documentation]    Verifica se não é possível cadastrar um produto sem autenticação
    [Tags]    POST   Produtos
    Criar Produto Sem Autenticação
    Validar Status Code "401"
    Validar mensagem de erro:  Token de acesso ausente, inválido, expirado ou usuário do token não existe mais

Cenário: POST | Cadastrar Produto como Cliente
    [Documentation]    Verifica se é possível cadastrar um produto válido
    [Tags]    POST   Produtos
    Criar Cliente Valido
    Fazer Login  
    Criar Produto Dinamico    
    Validar Status Code "403"
    Validar mensagem de erro:  Rota exclusiva para administradores