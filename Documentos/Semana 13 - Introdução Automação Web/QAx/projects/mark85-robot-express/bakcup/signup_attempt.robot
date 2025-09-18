*** Settings ***
Documentation       Cenários de teste do cadastro de usuários
Resource            ../resources/base.resource
Test Template       Senha Curta



***Test Cases ***

Não deve cadastar com senha de 1 digito    1
Não deve cadastar com senha de 2 digitos    12
Não deve cadastar com senha de 3 digitos    123
Não deve cadastar com senha de 4 digitos    1234
Não deve cadastar com senha de 5 digitos    12345






*** Keywords ***
Senha Curta
    [Arguments]    ${senha_curta}

    ${user} =    Create Dictionary    
    ...    name=João Silva
    ...    email=joaosilva@gmail.com
    ...    password=${senha_curta}
    Iniciar Sessão
    Acessar página de cadastro
    Enviar formulario de cadastro    ${user}
    Alerta no formulario    Informe uma senha com pelo menos 6 digitos
   