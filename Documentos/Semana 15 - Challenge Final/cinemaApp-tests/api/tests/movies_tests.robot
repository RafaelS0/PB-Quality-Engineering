*** Settings ***
Documentation    Testes para o endpoint /auth

Resource    ../support/base.resource


  
*** Test Cases ***

CT004.001 - Cadastrar um Filme
    [Tags]    CT001
    
    ${genres}=    Create List    Drama    
    ${movie}    Create Dictionary    
    ...    title=Manchester à Beira-Mar
    ...    synopsis=Em Manchester à Beira-Mar, Lee Chandler é forçado a retornar para sua cidade natal com o objetivo de tomar conta de seu sobrinho adolescente, após o seu irmão Kyle Chandler falecer precocemente. Este retorno ficará ainda mais complicado quando Lee precisar enfrentar as razões que o fizeram deixar sua família e ir embora, anos antes.
    ...    director=Kenneth Lonergan
    ...    genres=${genres}
    ...    duration=137
    ...    classification=+14
    ...    poster=manchester_poster.jpg
    ...    releaseDate=2016-11-18
    
    Clean Movie from Database    ${movie}[title]
    Criar Sessao
    Criar filme    ${movie} 


CT004.002 - Editar um Filme Cadastrado
    [Tags]    CT001
    
    ${genres}=    Create List    Drama    Esporitvo
    ${movie_edited}    Create Dictionary    
    ...    title=Rocky, um Lutador - EDITADO
    ...    synopsis=EDITADO
    ...    director=John G Avildsen
    ...    genres=${genres}
    ...    duration=130
    ...    classification=+16
    ...    poster=rocky.jpg
    ...    releaseDate=1977-01-07

    ${movies_json}=    Ler JSON de Filmes
    ${movie_list}=    Get Value From Json    ${movies_json}    $.movie2
    ${movie_unedited}=    Set Variable    ${movie_list}[0]
    Clean Movie from Database    ${movie_edited}[title]
    Clean Movie from Database    ${movie_unedited}[title]
    Insert movie into database   ${movie_unedited}
    Pegar ID de um filme    ${movie_unedited}
    Criar Sessao
    Editar um Filme    ${movie_edited}


CT004.003 - Deletar um Filme Cadastrado
    [Tags]    CT001

    ${movies_json}=    Ler JSON de Filmes
    ${movie_list}=    Get Value From Json    ${movies_json}    $.movie3
    ${movie}=     Set Variable    ${movie_list}[0] 
   
    Clean Movie from Database    ${movie}[title]
    Insert movie into database   ${movie}
    Criar Sessao
    Deletar um filme    ${movie}



    
   

