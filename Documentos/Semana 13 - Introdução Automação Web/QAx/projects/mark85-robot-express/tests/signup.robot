*** Settings ***
Documentation       Cenários de teste do cadastro de usuários
Resource            ../resources/base.robot




*** Test Cases ***
Cadastro de usuário com sucesso
    [Documentation]    Verifica se o cadastro de usuário é realizado com sucesso

    
    Iniciar Sessão
    Click Link    xpath=//a[@href='/signup']
    Wait Until Element Is Visible    xpath=//h1[contains(., 'Faça seu cadastro')]    10s
    Page Should Contain Element     xpath=//h1[contains(., 'Faça seu cadastro')]

    Input Text    xpath=//input[@id='name']    João Rodrigues 
    Input Text    xpath=//input[@id='email']   joaorodrigues@hotmail.com    
    Input Text    xpath=//input[@id='password']    pwd1234
    Click Button    xpath=//button[@type='submit']
   
    Wait Until Element Is Visible    xpath=//p[contains(., 'Boas vindas ao Mark85, o seu gerenciador de tarefas.')]    10s
    Page Should Contain Element     xpath=//p[contains(., 'Boas vindas ao Mark85, o seu gerenciador de tarefas.')]
    Remove user from database    joaorodrigues@hotmail.com
    Close Browser


Não deve permitir cadastro com email já utilizado
    [Documentation]    Verifica se o sistema não permite o cadastro com um email já utilizado
    [Tags]    duplicado
    
    ${name}=    Set Variable    Joao da Silva
    ${email}=    Set Variable    joao.silva@yahoo.com
    ${password}=    Set Variable    pwd1234

    Remove user from database    ${email}
    Insert user into database    ${name}    ${email}    ${password}

    Iniciar Sessão
    Click Link    xpath=//a[@href='/signup']
    Wait Until Element Is Visible    xpath=//h1[contains(., 'Faça seu cadastro')]    10s
    Page Should Contain Element     xpath=//h1[contains(., 'Faça seu cadastro')]

    Input Text    xpath=//input[@id='name']    ${name}
    Input Text    xpath=//input[@id='email']   ${email}
    Input Text    xpath=//input[@id='password']    ${password}
    Click Button    xpath=//button[@type='submit']
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Oops! Já existe uma conta com o e-mail informado.')]    10s
    Page Should Contain Element     xpath=//p[contains(text(), 'Oops! Já existe uma conta com o e-mail informado.')]
    Close Browser