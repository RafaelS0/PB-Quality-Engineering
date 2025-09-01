* Settings *
Documentation           Keywords e Variáveis para Login
Library    RequestsLibrary

* Variables *
${username}     admin
${password}     password123

* Keywords *
POST Endpoint /auth
    ${payload}=    Create Dictionary    username=${username}    password=${password}
    ${response}=    POST On Session    alias=Booker    url=/auth    json=${payload}
    ${token}=    Set Variable    ${response.json()['token']}
    Log to Console    Token obtido: ${token}
    Set Global Variable    ${response}
    Set Suite Variable    ${token_auth}    ${token}
    [Return]    ${token}

Validar Login
    Should Not Be Empty    ${response.json()["token"]}