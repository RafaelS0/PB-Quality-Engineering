*** Settings ***
Documentation    Testes para o endpoint /auth

Resource    ../support/base.resource

Suite Setup    Criar Sessao
  
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
    Criar filme    ${movie} 
    Validar Status Code "201"
    Validar Success    ${True}


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
    
    Clean Movie from Database    ${movie_edited}[title]
    Fill with movie    2
    Editar um Filme    ${movie_edited}
    Validar Status Code "200"
    Validar Success    ${True}



CT004.003 - Deletar um Filme Cadastrado
    [Tags]    CT001
    ${movie}=     Fill with movie    3
    
    Deletar um filme    ${movie}
    Validar Status Code "200"
    Validar Success    ${True}



    
   

