*** Settings ***
Documentation     Pagina de cadastro de tarefas
Library           SeleniumLibrary


*** Keywords ***
Enviar formulário de tarefa
    [Arguments]    ${task}
    Wait Until Element Is Visible    css=form
    Input Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]
    Click Button    css=form button[type="submit"]