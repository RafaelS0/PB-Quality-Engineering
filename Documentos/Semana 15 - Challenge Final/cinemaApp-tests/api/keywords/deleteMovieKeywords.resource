*** Settings ***
Documentation    Keywords para deletar um filme - exclusivo para administrador
Resource    ../support/base.resource

*** Keywords ***
DELETE Endpoint /movies/_id
    [Arguments]    ${id}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    alias=CinemaApp    url=/movies/${id}    headers=${header}    expected_status=any
    Log    ${response.content}



Deletar um filme
    [Arguments]     ${movie}
    Pegar ID de um filme    ${movie}
    Utilizar Token de Administrador
    DELETE Endpoint /movies/_id    ${movie_id}