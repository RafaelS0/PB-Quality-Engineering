*** Settings ***
Documentation    Keywords para criação de um filme - exclusivo para administrador
Resource    ../support/base.resource


*** Keywords ***
POST Endpoint /movies
    [Arguments]     ${title}    ${synopsis}    ${director}    ${genres}    ${duration}    ${classification}    ${poster}    ${releaseDate}    ${token}    
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


Create Movie
    [Arguments]    ${movie}
    ${admin_token}=    Generate admin token
    POST Endpoint /movies    
    ...    ${movie}[title]    
    ...    ${movie}[synopsis]    
    ...    ${movie}[director]    
    ...    ${movie}[genres]    
    ...    ${movie}[duration]    
    ...    ${movie}[classification]    
    ...    ${movie}[poster]    
    ...    ${movie}[releaseDate]
    ...    ${admin_token}    

Create Movie without default token
    [Arguments]    ${movie}    ${token}
    POST Endpoint /movies    
    ...    ${movie}[title]    
    ...    ${movie}[synopsis]    
    ...    ${movie}[director]    
    ...    ${movie}[genres]    
    ...    ${movie}[duration]    
    ...    ${movie}[classification]    
    ...    ${movie}[poster]    
    ...    ${movie}[releaseDate]
    ...    ${token}     


