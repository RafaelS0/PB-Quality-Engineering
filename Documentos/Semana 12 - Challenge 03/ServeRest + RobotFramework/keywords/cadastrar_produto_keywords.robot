* Settings *
Documentation    Keywords e Variáveis para Criação de Usuários
Library    RequestsLibrary
Resource   ../support/base.robot


*** Keywords *
POST Endpoint /produtos
    [Arguments]       ${nome}    ${descricao}    ${preco}    ${quantidade}    
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=${token}
    ${payload}=    Create Dictionary
    ...    nome=${nome}
    ...    descricao=${descricao}
    ...    preco=${preco}
    ...    quantidade=${quantidade}
    ${response}=    POST On Session    alias=ServeRest    url=/produtos    json=${payload}    headers=${header}    expected_status=any
    Log To Console      Response Status: ${response.status_code}
    Log To Console      Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}

POST Endpoint /produtos Sem Token
    [Arguments]       ${nome}    ${descricao}    ${preco}    ${quantidade}    
    &{header}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    ...    nome=${nome}
    ...    descricao=${descricao}
    ...    preco=${preco}
    ...    quantidade=${quantidade}
    ${response}=    POST On Session    alias=ServeRest    url=/produtos    json=${payload}    headers=${header}    expected_status=any
    Log To Console      Response Status: ${response.status_code}
    Log To Console      Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}


Criar Produto Dinamico
    ${payload}=    Criar Produto Valido
    Set Global Variable    ${payload}
    POST Endpoint /produtos    ${payload['nome']}    ${payload['descricao']}    ${payload['preco']}    ${payload['quantidade']}  

Criar Produto Sem Autenticação
    ${payload}=    Criar Produto Valido
    Set Global Variable    ${payload}
    POST Endpoint /produtos Sem Token    ${payload['nome']}    ${payload['descricao']}    ${payload['preco']}    ${payload['quantidade']}    



