* Settings *
Documentation           Keywords e Variáveis para Login
Resource   ../support/base.robot



* Keywords *
POST Endpoint /login
    [Arguments]    ${email}    ${password}
    ${payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    alias=serveRest    url=/login    json=${payload}    expected_status=any     
    Set Global Variable    ${response}
    Run Keyword If    ${response.status_code} == 200    Extract Token       

Extract Token
    ${token}=    Set Variable    ${response.json()['authorization']}
    Log to Console    Token obtido: ${token}
    Set Global Variable    ${token}

Verificar se o Token foi gerado
    Should Not Be Empty    ${token}    msg=Token não foi gerado. 
    Log to Console    Token verificado com sucesso: ${token}


    