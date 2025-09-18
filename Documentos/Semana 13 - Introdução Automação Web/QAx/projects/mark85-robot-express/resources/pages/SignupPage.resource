*** Settings ***
Documentation       Elementos e ações da página de cadastro de usuários
Library    SeleniumLibrary
Resource    ../env.resource


*** Keywords ***
Acessar página de cadastro
    Click Link    xpath=//a[@href='/signup']
    Wait Until Element Is Visible    xpath=//h1[contains(., 'Faça seu cadastro')]    10s
    Page Should Contain Element     xpath=//h1[contains(., 'Faça seu cadastro')]


Enviar formulario de cadastro
    [Arguments]    ${user}
    Input Text    xpath=//input[@id='name']    ${user['name']}
    Input Text    xpath=//input[@id='email']   ${user['email']}
    Input Text    xpath=//input[@id='password']    ${user['password']}
    Click Button    xpath=//button[@type='submit']



Alerta no formulario
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    xpath=//small[text()="${expected_message}"]   10s
    Page Should Contain Element     xpath=//small[text()="${expected_message}"]

