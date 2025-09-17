*** Settings ***
Documentation       Cenários de teste do cadastro de usuários
Resource            ../resources/base.robot
Resource    ../resources/pages/SignupPage.robot


Library    Screenshot

*** Test Cases ***
Cadastro de usuário com sucesso
    [Documentation]    Verifica se o cadastro de usuário é realizado com sucesso

    ${new_user}=    Create Dictionary    
    ...    name=João Rodrigues
    ...    email=joaorodrigues@hotmail.com
    ...    password=pwd1234
    
    Remove user from database    ${new_user['email']}

    Iniciar Sessão
    Acessar página de cadastro
    Enviar formulario de cadastro    ${new_user}
    Deve conter a mensagem    Boas vindas ao Mark85, o seu gerenciador de tarefas.
    Take Screenshot
    Remove user from database    joaorodrigues@hotmail.com
    Close Browser


Não deve permitir cadastro com email já utilizado
    [Documentation]    Verifica se o sistema não permite o cadastro com um email já utilizado
    [Tags]    duplicado
    
    ${duplicate_user}=    Create Dictionary    
    ...    name=Joao da Silva
    ...    email=joao.silva@yahoo.com
    ...    password=pwd1234

    Remove user from database    ${duplicate_user['email']}
    Insert user into database    ${duplicate_user}

    Iniciar Sessão
    Acessar página de cadastro
    Enviar formulario de cadastro    ${duplicate_user}
    Deve conter a mensagem    Oops! Já existe uma conta com o e-mail informado.
    
    Take Screenshot
    Close Browser