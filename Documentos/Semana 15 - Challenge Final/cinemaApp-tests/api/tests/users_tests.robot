*** Settings ***
Documentation    Testes para o endpoint /users
Resource    ../support/base.resource

Suite Setup    Make New Session


*** Test Cases ***

Deletar um usuário

    ${customer_user}    Create Dictionary
    ...    email=kurt@nirvana.com
    ...    password=pwd12345    
    ${user_id}=    Get User ID   ${customer_user}
    Deletar usuário    ${user_id}
    Validate Status Code "200"
    Validar Success    ${True}
    