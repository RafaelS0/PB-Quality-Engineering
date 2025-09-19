* Settings *
Documentation    Keywords e Variáveis para Criação de Livros
Resource   ../support/base.robot


*** Keywords ***
PUT Endpoint /produtos
    [Arguments]      ${id}    ${nome}    ${descricao}    ${preco}    ${quantidade}    
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=${token}
    ${payload}=    Create Dictionary
    ...    nome=${nome}
    ...    descricao=${descricao}
    ...    preco=${preco}
    ...    quantidade=${quantidade}
    ${response}=    PUT On Session    alias=ServeRest    url=/produtos/${id}    json=${payload}    headers=${header}    expected_status=any
    Log To Console      Response Status: ${response.status_code}
    Log To Console      Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}


Criar um produto como administrador
    Criar Administrador Valido
    Fazer Login  
    Criar Produto Dinamico  
