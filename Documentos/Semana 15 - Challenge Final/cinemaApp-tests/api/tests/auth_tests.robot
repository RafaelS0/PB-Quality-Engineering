*** Settings ***
Documentation    Testes para o endpoint /auth
Resource    ../support/base.resource

Suite Setup    Make New Session
  
*** Test Cases ***

CT001.001 - Cadastrar um Cliente Válido 
    [Tags]    CT001

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=kurt@nirvana.com
    ...    password=pwd12345    
    
    Clean user from database    ${customer_user}[email]
    Criar Cliente Valido    ${customer_user}   
    Validate Status Code "201"
    Validar Success    ${True}

CT002.001 - Fazer Login com dados válidos
    [Tags]    CT002

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=kurt@nirvana.com
    ...    password=pwd12345
    Clean user from database    ${customer_user}[email]
    Criar Cliente Valido    ${customer_user}
    
    
    Fazer Login    ${customer_user}
    Validate Status Code "200"   
    Validar Success    ${True}