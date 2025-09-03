* Settings *
Documentation           Keywords e Variáveis para Login
Library    RequestsLibrary

* Variables *
${username_de_login}     admin
${password_para_login}     password123

* Keywords *
POST Endpoint /auth
    ${payload}=    Create Dictionary    username=${username_de_login}    password=${password_para_login}
    ${response}=    POST On Session    alias=Booker    url=/auth    json=${payload}
    ${token}=    Set Variable    ${response.json()['token']}
    Log to Console    Token obtido: ${token}
    Set Global Variable    ${response}

    

Validar Login
    Should Not Be Empty    ${response.json()["token"]}

Fazer Login e Armazenar Token
    POST Endpoint /auth
    Validar Login
    ${token_auth}=    Set Variable    ${response.json()['token']}
    Set Global Variable    ${token_auth}   