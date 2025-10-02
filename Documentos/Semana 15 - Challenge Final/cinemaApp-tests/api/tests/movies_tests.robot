*** Settings ***
Documentation    Testes para o endpoint /auth

Resource    ../support/base.resource
Resource    ../keywords/createMovieKeywords.resource
Resource    ../keywords/deleteMovieKeywords.resource

  
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
    
    ${genres}=    Create List    Drama    Esportivo        
    ${movie_unedited}    Create Dictionary    
    ...    title= Rocky, um Lutador
    ...    synopsis=Rocky Balboa, um pequeno boxeador da classe trabalhadora da Filadélfia, é arbitrariamente escolhido para lutar contra o campeão dos pesos pesados, Apollo Creed, quando o adversário do invicto lutador agendado para a luta é ferido.
    ...    director=John G Avildsen
    ...    genres=${genres}
    ...    duration=119
    ...    classification=+14
    ...    poster=rocky.jpg
    ...    releaseDate=1977-01-07
    Clean Movie from Database    ${movie_unedited}[title]
    Insert movie into database   ${movie_unedited}
    Pegar ID de um filme    ${movie_unedited}

    ${movie_edited}    Create Dictionary    
    ...    title= Rocky, um Lutador - EDITADO
    ...    synopsis=EDITADO
    ...    director=John G Avildsen
    ...    genres=${genres}
    ...    duration=130
    ...    classification=+16
    ...    poster=rocky.jpg
    ...    releaseDate=1977-01-07
    
    Criar Sessao
    Editar um Filme    ${movie_edited}


CT004.003 - Deletar um Filme Cadastrado
    [Tags]    CT001
    
    ${genres}=    Create List    Slasher    Terror        
    ${movie}    Create Dictionary    
    ...    title= Scream
    ...    synopsis=Na pequena cidade de Woodsboro, um grupo de jovens do ensino médio enfrenta um assassino mascarado que testa seus conhecimentos sobre filmes de terror. Sidney Prescott, traumatizada após o brutal assassinato de sua mãe, é o alvo preferido do misterioso homicida que aterroriza a outrora pacata comunidade.
    ...    director=Wes Craven
    ...    genres=${genres}
    ...    duration=111
    ...    classification=+16
    ...    poster=scream.jpg
    ...    releaseDate=1997-01-31
    Clean Movie from Database    ${movie}[title]
    Insert movie into database   ${movie}
    Criar Sessao
    Deletar um filme    ${movie}



    
   

