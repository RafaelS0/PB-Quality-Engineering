*** Settings ***
Documentation    Keywords para criação de uma sessão - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
POST Endpoint /sessions
    [Arguments]    ${movie}    ${theater}    ${datetime}    ${fullPrice}    ${halfPrice}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    movie=${movie}
    ...    theater=${theater}
    ...    datetime=${datetime}
    ...    fullPrice=${fullPrice}
    ...    halfPrice=${halfPrice}
    ${response}=     POST On Session    CinemaApp    url=/sessions    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}
    Log    ${response.status_code}


Create Movie Session
    [Arguments]      ${session}
    ${admin_token}=    Generate admin token
    POST Endpoint /sessions    ${session}[movie]    ${session}[theater]    ${session}[datetime]    ${session}[fullPrice]    ${session}[halfPrice]    ${admin_token}
