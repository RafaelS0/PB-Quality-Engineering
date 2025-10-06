*** Settings ***
Documentation    Keywords para deletar um usuário
Resource    ../support/base.resource

*** Keywords ***
DELETE Endpoint /users/_id
    [Arguments]    ${id}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    alias=CinemaApp    url=/users/${id}    headers=${header}    expected_status=any
    Log    ${response.content}
    Set Global Variable    ${response}



Deletar usuário
    [Arguments]    ${id}
    Utilizar Token de Administrador
    DELETE Endpoint /users/_id   ${id}
    
