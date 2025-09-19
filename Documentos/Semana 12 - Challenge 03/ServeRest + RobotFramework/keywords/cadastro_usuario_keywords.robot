* Settings *
Documentation    Keywords e Variáveis para Criação de Usuários
Library    RequestsLibrary
Resource   ../support/base.robot


*** Keywords *
POST Endpoint /usuarios
    [Arguments]       ${nome}    ${email}    ${password}    ${admin}
    &{header}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${password}
    ...    administrador=${admin}
    ${response}=    POST On Session    alias=ServeRest    url=/usuarios    json=${payload}    headers=${header}    expected_status=any
    Log To Console      Response Status: ${response.status_code}
    Log To Console      Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}



Criar Cliente Valido
    ${payload}=    Criar Usuario Valido
    Set Global Variable    ${payload}
    POST Endpoint /usuarios    ${payload['nome']}    ${payload['email']}    ${payload['password']}    admin=false


Criar Administrador Valido
    ${payload}=    Criar Usuario Valido
    Set Global Variable    ${payload}
    POST Endpoint /usuarios    ${payload['nome']}    ${payload['email']}    ${payload['password']}    admin=true

Criar Cliente Gmail Invalido
    ${payload}=    Criar Usuario Gmail Invalido
    Set Global Variable    ${payload}
    POST Endpoint /usuarios    ${payload['nome']}    ${payload['email']}    ${payload['password']}    admin=false

Criar Cliente Hotmail Invalido
    ${payload}=    Criar Usuario Hotmail Invalido
    Set Global Variable    ${payload}
    POST Endpoint /usuarios    ${payload['nome']}    ${payload['email']}    ${payload['password']}    admin=false