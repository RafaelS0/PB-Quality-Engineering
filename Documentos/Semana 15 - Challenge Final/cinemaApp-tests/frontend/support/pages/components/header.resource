*** Settings ***
Documentation    Elementos do cabeçalho
Resource    ../../base.resource

*** Keywords ***

Access SignUp Page
    Click Link    //a[(text())='Cadastrar']
    Wait Until Element Is Visible    //p[(text())='Crie sua conta para reservar ingressos']

Access Login Page
    Click Link    //header//a[@href="/login"]
    Wait Until Element Is Visible    //p[(text())='Entre com suas credenciais para acessar sua conta']