*** Settings ***
Documentation    Keywords para Editar um Filme - Exclusivo Administrador
Resource    ../support/base.resource


*** Keywords ***
PUT Endpoint /movies/_id
    [Arguments]         ${title}    ${synopsis}    ${director}    ${genres}    ${duration}    ${classification}    ${poster}    ${releaseDate}    ${movie_id}    ${token}
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
    ${response}=    PUT On Session    alias=CinemaApp    url=/movies/${movie_id}    json=${payload}    headers=${header}    expected_status=any
    Log       Response Status: ${response.status_code}
    Log       Response: ${response.content}
    BuiltIn.Set Global Variable    ${response}


Update Movie Data
    [Arguments]    ${movie_edited}    ${original_movie}    
    ${admin_token}=    Generate admin token
    ${movie_id}=    Get Movie ID    ${original_movie}

    PUT Endpoint /movies/_id    
    ...    ${movie_edited}[title]    
    ...    ${movie_edited}[synopsis]    
    ...    ${movie_edited}[director]    
    ...    ${movie_edited}[genres]    
    ...    ${movie_edited}[duration]    
    ...    ${movie_edited}[classification]    
    ...    ${movie_edited}[poster]    
    ...    ${movie_edited}[releaseDate]
    ...    ${movie_id}
    ...    ${admin_token}    

Update Movie Data without default token
    [Arguments]    ${movie_edited}    ${original_movie}    ${token}   
 
    ${movie_id}=    Get Movie ID    ${original_movie}

    PUT Endpoint /movies/_id    
    ...    ${movie_edited}[title]    
    ...    ${movie_edited}[synopsis]    
    ...    ${movie_edited}[director]    
    ...    ${movie_edited}[genres]    
    ...    ${movie_edited}[duration]    
    ...    ${movie_edited}[classification]    
    ...    ${movie_edited}[poster]    
    ...    ${movie_edited}[releaseDate]
    ...    ${movie_id}
    ...    ${token}    
    




