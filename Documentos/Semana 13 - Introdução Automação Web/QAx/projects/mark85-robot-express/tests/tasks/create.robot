*** Settings ***
Documentation     Cenários de cadastro
Resource          ../../resources/base.resource
Resource    ../../resources/pages/TaskCreatePage.resource
Library           JSONLibrary
*** Test Cases ***
Deve poder cadastrar uma nova tarefa
   ${data}=    Get fixtures    tasks    create
   
    Clean user from database    ${data}[user][email]
    Insert user into database    ${data}[user]

   Iniciar Sessão
   Enviar formulario de login   ${data}[user]
   Abrir formulário de cadastro de tarefa
   Enviar formulário de tarefa    ${data}[task]
   
   
   Log    ${data}