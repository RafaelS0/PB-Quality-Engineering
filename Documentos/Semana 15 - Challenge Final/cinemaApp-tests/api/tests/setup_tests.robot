*** Settings ***
Documentation    Testes para endpoint /setup exclusivo para Dev

Resource    ../support/base.resource

Suite Setup    Make New Session

*** Test Cases ***

Cadastrar um Administrador 
    [Tags]    admin

    ${admin_user}    Create Dictionary
    ...    name=Lex Luthor
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
    
    Criar um Administrador    ${admin_user}
    Validate Status Code "201"
    Validar Success    ${True}

Fazer Login como um Administrador
    [Tags]    admin

    ${admin_user}    Create Dictionary
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
   
    Fazer Login    ${admin_user}
    Validate Status Code "200"
    Validar Success    ${True}



