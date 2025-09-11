*** Settings ***
Documentation     Fake Documentation
Library           FakerLibrary    locale=pt_BR


*** Keywords ***
 Criar Usuario Valido

     ${nome} =  FakerLibrary.Name
     ${email} =  FakerLibrary.Email    
     ${password} =  FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
     

    &{payload}=  Create Dictionary    nome=${nome}    email=${email}    password=${password} 
     Log To Console    ${payload}
     [Return]          ${payload}

Criar Usuario Gmail Invalido

     ${nome} =  FakerLibrary.Name
     ${email} =  FakerLibrary.Email    domain=gmail.com
     ${password} =  FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
     

    &{payload}=  Create Dictionary    nome=${nome}    email=${email}    password=${password} 
     Log To Console    ${payload}
     [Return]          ${payload}

Criar Usuario Hotmail Invalido

     ${nome} =  FakerLibrary.Name
     ${email} =  FakerLibrary.Email    domain=hotmail.com
     ${password} =  FakerLibrary.Password    length=10    special_chars=True    digits=True    upper_case=True    lower_case=True
     

    &{payload}=  Create Dictionary    nome=${nome}    email=${email}    password=${password} 
     Log To Console    ${payload}
     [Return]          ${payload}

Criar Produto Valido

     ${nome} =  FakerLibrary.Word
     ${descricao} =  FakerLibrary.Sentence    nb_words=6
     ${preco} =  FakerLibrary.RandomNumber    digits=4
     ${quantidade} =  FakerLibrary.RandomNumber    digits=2
     

    &{payload}=  Create Dictionary    nome=${nome}    descricao=${descricao}    preco=${preco}    quantidade=${quantidade} 
     Log To Console    ${payload}
     [Return]          ${payload}

