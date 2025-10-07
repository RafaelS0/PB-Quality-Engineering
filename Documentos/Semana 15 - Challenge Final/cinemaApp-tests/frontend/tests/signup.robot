*** Settings ***
Documentation    Cenários de teste para cadastro de usuário

Resource    ../resources/base.resource


Suite Setup    Start Session

*** Test Cases ***
CADASTRAR UM USUARIO
    ${new_user}=    Create Dictionary
    ...    name=Layne Staley
    ...    email=layne.staley@aliceinchains.ocom
    ...    password=password12345
    
    Clean user from database    ${new_user}[email]
    Access SignUp Page
    
        
    

