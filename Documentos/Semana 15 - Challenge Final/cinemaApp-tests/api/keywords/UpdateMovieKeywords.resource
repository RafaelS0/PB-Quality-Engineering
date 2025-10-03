*** Settings ***
Documentation    Keywords para Editar um Filme - Exclusivo Administrador
Resource    ../support/base.resource


*** Keywords ***
PUT Endpoint /movies/_id
    [Arguments]         ${title}    ${synopsis}    ${director}    ${genres}    ${duration}    ${classification}    ${poster}    ${releaseDate}
    &{header}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer    ${token}
    ${payload}=    Create Dictionary
    ...    title=${title}   
    ...    synopsis=${synopsis}
    ...    director=${director} 
    ...    genres=${genres}
    ...    duration=${duration}
    ...    classification=${classification} 
    ...    poster=${poster}
    ...    releaseDate=${releaseDate} 
    ${response}=    PUT On Session    alias=CinemaApp    url=/movies/${movie_id}    json=${payload}    headers=${header}    expected_status=any
    Log       Response Status: ${response.status_code}
    Log       Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}


Editar um Filme 
    [Arguments]    ${movie}
    Utilizar Token de Administrador
    PUT Endpoint /movies/_id    
    ...    ${movie}[title]    
    ...    ${movie}[synopsis]    
    ...    ${movie}[director]    
    ...    ${movie}[genres]    
    ...    ${movie}[duration]    
    ...    ${movie}[classification]    
    ...    ${movie}[poster]    
    ...    ${movie}[releaseDate]    



