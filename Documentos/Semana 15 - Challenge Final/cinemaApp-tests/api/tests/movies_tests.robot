*** Settings ***
Documentation    Testes para o endpoint /auth

Resource    ../support/base.resource

Suite Setup    Make New Session
  
*** Test Cases ***

CT003.001 - Cadastrar um Filme válido
    [Tags]    CT003
    
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
    Create Movie   ${movie} 
    Validate Status Code "201"
    Validar Success    ${True}


CT003.002 - Cadastrar um filme com campos em branco
    [Tags]    CT003
    
    ${genres}=    Create List    Infantil    Animação    Comédia    
    ${movie}    Create Dictionary    
    ...    title=Toy Story
    ...    synopsis=
    ...    director=
    ...    genres=${genres}
    ...    duration=137
    ...    classification=
    ...    poster=toystory.jpg
    ...    releaseDate=
    
    Clean Movie from Database    ${movie}[title]
    Create Movie    ${movie} 
    Validate Status Code "400"
    Validar Success    ${False}


CT003.003 - Cadastrar um Filme sem token de autorização
    [Tags]    CT003
    
    ${genres}=    Create List   Terror    Suspense   
    ${movie}    Create Dictionary    
    ...    title=The Evil Dead
    ...    synopsis= Em 1979, um grupo de estudantes universitários viaja para uma cabana isolada na floresta, onde descobrem o Livro dos Mortos e acidentalmente libertam demônios que os possuem. Agora, eles devem lutar pela sobrevivência enquanto são caçados por forças sobrenaturais.
    ...    director=Sam Raimi
    ...    genres=${genres}
    ...    duration=85
    ...    classification=+18
    ...    poster=evildead.jpg
    ...    releaseDate=1981-10-15
    
    Clean Movie from Database    ${movie}[title]
    Create Movie without default token    ${movie}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${False}

CT003.004 - Cadastrar um Filme com token de cliente
    [Tags]    CT003
    
    ${genres}=    Create List   Terror    Suspense   
    ${movie}    Create Dictionary    
    ...    title=The Evil Dead
    ...    synopsis= Em 1979, um grupo de estudantes universitários viaja para uma cabana isolada na floresta, onde descobrem o Livro dos Mortos e acidentalmente libertam demônios que os possuem. Agora, eles devem lutar pela sobrevivência enquanto são caçados por forças sobrenaturais.
    ...    director=Sam Raimi
    ...    genres=${genres}
    ...    duration=85
    ...    classification=+18
    ...    poster=evildead.jpg
    ...    releaseDate=1981-10-15
    
    Clean Movie from Database    ${movie}[title]
    ${customer_token}=    Generate customer token
    Create Movie without default token    ${movie}    ${customer_token}
    Validate Status Code "403"
    Validar Success    ${False}



CT004.001 - Editar um Filme Cadastrado
    [Tags]    CT004

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
    ${original_movie}=    Fill with movie    2
    Update Movie Data    ${movie_edited}    ${original_movie}
    Validate Status Code "200"
    Validar Success    ${True}

CT004.002 - Editar um Filme Cadastrado sem token de autorização
    [Tags]    CT004

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
    ${original_movie}=    Fill with movie    2
    Update Movie Data without default token    ${movie_edited}    ${original_movie}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${False}


CT004.003 - Editar um Filme Cadastrado com token de cliente
    [Tags]    CT004
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
    ${original_movie}=    Fill with movie    2
    ${token}=    Generate customer token
    Update Movie Data without default token    ${movie_edited}    ${original_movie}    ${token}
    Validate Status Code "403"
    Validar Success    ${False}



CT005.001 - Deletar um Filme Cadastrado
    [Tags]    CT005
    ${movie}=     Fill with movie    3
    
    Delete Movie Data    ${movie}
    Validate Status Code "200"
    Validar Success    ${True}



    
   

