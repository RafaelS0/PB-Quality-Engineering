*** Settings ***
Documentation    Testes para o endpoint /auth
Resource    ../support/base.resource

Suite Setup    Make New Session
  
*** Test Cases ***

CT001.001 - Cadastrar um Cliente Válido 
    [Tags]    CT001-register

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=kurt@nirvana.com
    ...    password=pwd12345    
    
    Clean user from database    ${customer_user}[email]
    Criar Cliente Valido    ${customer_user}   
    Validate Status Code "201"
    Validar Success    ${True}

CT001.002 - Cadastrar com um email inválido
    [Tags]    CT001-register

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=kurt@nirvana!!!.ocm
    ...    password=pwd12345    
    

    Criar Cliente Valido    ${customer_user}   
    Validate Status Code "400"
    Validar Success    ${False}


CT001.003 - Cadastrar com campos em branco
    [Tags]    CT001-register

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=
    ...    password=    
    

    Criar Cliente Valido    ${customer_user}   
    Validate Status Code "400"
    Validar Success    ${False}


CT001.004 - Cadastrar com um email já existente
    [Tags]    CT001-register

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=kurt@nirvana.com
    ...    password=pwd12345    
    
    Clean user from database    ${customer_user}[email]
    Criar Cliente Valido    ${customer_user}
    Criar Cliente Valido    ${customer_user}   
    Validate Status Code "400"
    Validar Success    ${False}



CT002.001 - Fazer Login com dados válidos
    [Tags]    CT002-login

    ${customer_user}    Create Dictionary
    ...    name=Kurt Cobain
    ...    email=kurt@nirvana.com
    ...    password=pwd12345
    Clean user from database    ${customer_user}[email]
    Criar Cliente Valido    ${customer_user}
    
    
    Fazer Login    ${customer_user}
    Validate Status Code "200"   
    Validar Success    ${True}

CT002.002 - Fazer Login com dados não cadastrados
    [Tags]    CT002-login

    ${customer_user}    Create Dictionary
    ...    name=Chris Cornell
    ...    email=chris@soundgarden.com
    ...    password=pwd12345
    Clean user from database    ${customer_user}[email]
        
    Fazer Login    ${customer_user}
    Validate Status Code "400"   
    Validar Success    ${False}


CT002.003 - Fazer Login com email invalido
    [Tags]    CT002-login

    ${customer_user}    Create Dictionary
    ...    name=Chris Cornell
    ...    email=chris@soundgarden.com
    ...    password=pwd12345
    
    Clean user from database    ${customer_user}[email]
    Criar Cliente Valido    ${customer_user}
    
    # Alterar o email para um que não existe
    Set To Dictionary    ${customer_user}
    ...    email=chris@sound!garen.ocm    
    
        
    Fazer Login    ${customer_user}
    Validate Status Code "400"   
    Validar Success    ${False}