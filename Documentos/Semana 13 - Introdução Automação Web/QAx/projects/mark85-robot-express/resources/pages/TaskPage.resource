*** Settings ***
Documentation     Página de tarefas
Library           SeleniumLibrary

*** Keywords ***
Tarefa foi cadastrada
    [Arguments]    ${task_name}
    Wait Until Element Is Visible    css=.task-todo    5s
    ${text} =  Get Text    css=.task-todo
    Should Be Equal    ${text}    ${task_name}
    Log   Tarefa ${task_name} cadastrada com sucesso! 
    