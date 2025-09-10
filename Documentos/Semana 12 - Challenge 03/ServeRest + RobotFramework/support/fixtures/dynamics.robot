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