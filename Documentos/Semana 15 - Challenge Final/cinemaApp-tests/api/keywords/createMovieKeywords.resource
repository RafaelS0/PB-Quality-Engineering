*** Settings ***
Documentation    Keywords para criação de um filme - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
POST Endpoint /movies
    [Arguments]     ${title}    ${synopsis}    ${director}    ${genres}    ${duration}    ${classification}    ${poster}    ${releaseDate}    
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${payload}=    Create Dictionary
    ...    title=${title}   
    ...    synopsis=${synopsis}
    ...    director=${director} 
    ...    genres=${genres}
    ...    duration=${duration}
    ...    classification=${classification} 
    ...    poster=${poster}
    ...    releaseDate=${releaseDate} 

    ${response}=    POST On Session    alias=CinemaApp    url=/movies    json=${payload}    headers=${header}    expected_status=any
    Set Global Variable    ${response}
    Log    ${response.content}


Criar filme
    [Arguments]    ${movie}
    Utilizar Token de Administrador
    POST Endpoint /movies    
    ...    ${movie}[title]    
    ...    ${movie}[synopsis]    
    ...    ${movie}[director]    
    ...    ${movie}[genres]    
    ...    ${movie}[duration]    
    ...    ${movie}[classification]    
    ...    ${movie}[poster]    
    ...    ${movie}[releaseDate]    


