*** Settings ***
Documentation    Keywords para deletar um filme - exclusivo para administrador
Resource    ../support/base.resource

*** Keywords ***
DELETE Endpoint /movies/_id
    [Arguments]    ${id}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    alias=CinemaApp    url=/movies/${id}    headers=${header}    expected_status=any
    Log    ${response.content}
    Set Global Variable    ${response}


Delete Movie Data
    [Arguments]     ${movie}
    ${movie_id}=    Get Movie ID    ${movie}
    ${admin_token}=    Generate admin token
    DELETE Endpoint /movies/_id    ${movie_id}    ${admin_token}