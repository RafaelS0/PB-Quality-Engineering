*** Settings ***
Documentation    Test suite for login functionality
Resource         ../resources/base.resource
Library          Collections

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    [Documentation]    Teste de login com usuário válido
   
    ${user}    Create Dictionary
    ...    name=Rafael
    ...    email=rafael@example.com
    ...    password=pwd12345
    
    Remove user from database    ${user}[email]
    Insert user into database    ${user}
    
    Iniciar Sessão
    Enviar formulario de login   ${user}
    Usuario deve estar logado   ${user}
    
Não deve logar com senha inválida
    [Documentation]    Teste de login com senha inválida
   
    ${user}    Create Dictionary
    ...    name= Steve 
    ...    email=steve@apple.com
    ...    password=wrongpwd
    
    Remove user from database    ${user}[email]
    Insert user into database    ${user}

    Set To Dictionary    dictionary=${user}    password=pwd123456
    
    Iniciar Sessão
    Enviar formulario de login   ${user}
    Deve conter a mensagem    Ocorreu um erro ao fazer login, verifique suas credenciais.    