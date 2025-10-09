*** Settings ***
Documentation    Keywords para deletar um usuário
Resource    ../support/base.resource

*** Keywords ***
DELETE Endpoint /users/_id
    [Arguments]    ${id}    ${token}    
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${response}=    DELETE On Session    alias=CinemaApp    url=/users/${id}    headers=${header}    expected_status=any
    Log    ${response.content}
    Set Global Variable    ${response}



Delete user Data
    [Arguments]    ${id}
    ${admin_token}=    Generate admin token
    DELETE Endpoint /users/_id   ${id}    ${admin_token}
    
