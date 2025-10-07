*** Settings ***
Documentation    Elementos e ações da página de cadastro de usuário

Library    SeleniumLibrary

*** Keywords ***
Access SignUp Page
    Click Link    //a[(text())='Cadastrar']
    Wait Until Element Is Visible    //p[(text())='Crie sua conta para reservar ingressos']
