*** Settings ***
Documentation    Keywords para editar uma sessão - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
PUT Endpoint /sessions
    [Arguments]    ${movie}    ${theater}    ${datetime}    ${fullPrice}    ${halfPrice}    ${session_id}    ${token}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    movie=${movie}
    ...    theater=${theater}
    ...    datetime=${datetime}
    ...    fullPrice=${fullPrice}
    ...    halfPrice=${halfPrice}
    ${response}=     PUT On Session    CinemaApp    url=/sessions/${session_id}    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}
    Log    ${response.status_code}
    


Update Session Data
    [Arguments]      ${session}
    ${admin_token}=    Generate admin token
    ${session_id}=    Get Session ID    ${session}
    PUT Endpoint /sessions    ${session}[movie]    ${session}[theater]    ${session}[datetime]    ${session}[fullPrice]    ${session}[halfPrice]    ${session_id}    ${admin_token}

Update Session Data without default token
    [Arguments]      ${session}    ${token}
    ${admin_token}=    Generate admin token
    ${session_id}=    Get Session ID    ${session}
    PUT Endpoint /sessions    ${session}[movie]    ${session}[theater]    ${session}[datetime]    ${session}[fullPrice]    ${session}[halfPrice]    ${session_id}    ${token}
