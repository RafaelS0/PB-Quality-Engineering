*** Settings ***
Documentation    Testes para endpoint /setup exclusivo para Dev

Resource    ../support/base.resource


*** Test Cases ***

Cadastrar um Administrador 
    [Tags]    admin

    ${admin_user}    Create Dictionary
    ...    name=Lex Luthor
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
    Criar Sessao
    Criar um Administrador    ${admin_user}

Fazer Login como um Administrador
    [Tags]    admin

    ${admin_user}    Create Dictionary
    ...    email=lex.luthor@lexcorp.com
    ...    password=pwd12345    
    Criar Sessao
    Fazer Login    ${admin_user}


