*** Settings ***
Documentation       Cenários de teste do cadastro de usuários
Resource            ../resources/base.resource


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

Campos Obrigatórios
    [Documentation]    Verifica se o sistema valida os campos obrigatórios no cadastro de usuário
    [Tags]    campos-obrigatorios

    ${user} =    Create Dictionary    
    ...    name=${EMPTY}
    ...    email=${EMPTY}
    ...    password=${EMPTY}

    Iniciar Sessão
    Acessar página de cadastro
    Enviar formulario de cadastro    ${user}
    
    Alerta no formulario    Informe seu nome completo
    Alerta no formulario    Informe seu e-email
    Alerta no formulario    Informe uma senha com pelo menos 6 digitos

    Take Screenshot
    Close Browser

Não deve cadastrar com email incorreto
    [Tags]    email-invalido
    [Documentation]    Verifica se o sistema valida o formato do email no cadastro de usuário
    ${user} =    Create Dictionary    
    ...    name=João Silva
    ...    email=joaosilva.com.br
    ...    password=pwd1234
    
    Iniciar Sessão
    Acessar página de cadastro
    Enviar formulario de cadastro    ${user}
    Alerta no formulario    Digite um e-mail válido
    Close Browser



Não deve cadastrar com senha muito curta
    [Tags]    short-password

    @{passwords_list}    Create List     1    12    123    1234    12345
    FOR    ${password}    IN    @{passwords_list}
        ${user} =    Create Dictionary    
        ...    name=João Silva
        ...    email=joaosilva@gmail.com    
        ...    password=${password}
        
        Acessar página de cadastro
        Enviar formulario de cadastro    ${user}
        Alerta no formulario    Informe uma senha com pelo menos 6 digitos
        
        
    END