*** Settings ***
Documentation     Pagina de cadastro de tarefas
Library           SeleniumLibrary


*** Keywords ***
Enviar formulário de tarefa
    [Arguments]    ${task}
    Wait Until Element Is Visible    css=form
    Input Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]

    Log    ${task}[tags]
    
    FOR    ${element}    IN    @{task}[tags]
        Log    Elemento atual: ${element}
        Input Text    css=input[name=tags]    ${element}
         Sleep    1
        Press Keys    css=input[name=tags]    ENTER      
    END
    
    Click Button    css=form button[type="submit"]
