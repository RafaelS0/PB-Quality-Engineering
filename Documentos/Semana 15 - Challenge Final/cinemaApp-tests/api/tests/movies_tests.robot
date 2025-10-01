*** Settings ***
Documentation    Testes para o endpoint /auth
Resource    ../support/base.resource
Resource    ../keywords/createMovieKeywords.resource

  
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
    Criar Sessao
    Criar filme    ${movie} 