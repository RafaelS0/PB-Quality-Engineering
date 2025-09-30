*** Settings ***
Documentation    Testes para o endpoint /users
Resource    ../support/base.resource
Resource    ../keywords/deleteUserKeywords.resource



*** Test Cases ***

Deletar um usuário
    Criar Sessao
    ${customer_user}    Create Dictionary
    ...    email=kurt@nirvana.com
    ...    password=pwd12345    
    Pegar o ID de um usuário    ${customer_user}
    Deletar usuário    ${user_id}
    