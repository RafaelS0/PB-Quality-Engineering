*** Settings ***
Documentation     Test suite for login functionality
Library           SeleniumLibrary
Resource          ../env.resource

*** Keywords ***

Enviar formulario de login
    [Arguments]    ${user}
    Input Text    id=email        ${user}[email]
    Input Text    css=input[placeholder="Senha"]    ${user}[password]
    Click Button   css=button[type="submit"]



