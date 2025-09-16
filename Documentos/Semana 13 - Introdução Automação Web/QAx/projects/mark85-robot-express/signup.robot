*** Settings ***
Documentation       Cenários de teste do cadastro de usuários
Library             SeleniumLibrary
Library             FakerLibrary

*** Test Cases ***
Cadastro de usuário com sucesso
    [Documentation]    Verifica se o cadastro de usuário é realizado com sucesso

    ${name}=    FakerLibrary.name
    ${email}=    FakerLibrary.email
    ${password}=    SetVariable    senha123

    Open Browser    http://localhost:3000    chrome
    Click Link    xpath=//a[@href='/signup']
    Wait Until Element Is Visible    xpath=//h1[contains(., 'Faça seu cadastro')]    10s
    Page Should Contain Element     xpath=//h1[contains(., 'Faça seu cadastro')]

    Input Text    xpath=//input[@id='name']    ${name}
    Input Text    xpath=//input[@id='email']   ${email}
    Input Text    xpath=//input[@id='password']    ${password}
    Click Button    xpath=//button[@type='submit']
   
    Wait Until Element Is Visible    xpath=//p[contains(., 'Boas vindas ao Mark85, o seu gerenciador de tarefas.')]    10s
    Page Should Contain Element     xpath=//p[contains(., 'Boas vindas ao Mark85, o seu gerenciador de tarefas.')]
