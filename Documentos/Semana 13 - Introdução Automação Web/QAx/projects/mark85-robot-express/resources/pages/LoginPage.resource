*** Settings ***
Documentation     Test suite for login functionality
Library           SeleniumLibrary
Library           String
Resource          ../env.resource

*** Keywords ***

Enviar formulario de login
    [Arguments]    ${user}
    Input Text    id=email        ${user}[email]
    Input Text    css=input[placeholder="Senha"]    ${user}[password]
    Click Button   css=button[type="submit"]

Usuario deve estar logado
    [Arguments]    ${user}

    Wait Until Element Is Visible    css=header .right small
    ${text}=    Get Text    css=header .right small
    Should Be Equal    ${text}    Olá, ${user}[name]    ignore_case=True

