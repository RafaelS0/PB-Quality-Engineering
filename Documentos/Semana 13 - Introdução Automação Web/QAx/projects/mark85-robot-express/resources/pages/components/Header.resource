*** Settings ***
Documentation     Elementos do cabeçalho

Library           SeleniumLibrary
Library           String

*** Keywords ***

Usuario deve estar logado
    [Arguments]    ${user}

    Wait Until Element Is Visible    css=header .right small
    ${text}=    Get Text    css=header .right small
    Should Be Equal    ${text}    Olá, ${user}[name]    ignore_case=True

Abrir formulário de cadastro de tarefa
    Wait Until Element Is Visible    css=.button-add    5s
    Click Button    css=.button-add
