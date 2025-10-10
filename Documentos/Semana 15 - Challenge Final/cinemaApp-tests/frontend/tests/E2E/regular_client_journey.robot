*** Settings ***
Documentation    Fluxo de login, escolha de um filme, escolha de uma sessão e compra de um ingresso

Resource    ../../support/base.resource

Suite Setup    Start Session    

*** Test Cases ***

Make Login
    ${user}=    Default Client Data

    Set Global Variable    ${user}
    Insert user into database    ${user}
    

    Access Login Page 
    Send Login Form    ${user}
    Validate Redirection    /

Choose a movie
    Click More Details    Inception

Choose a session
    Choose Session    30/09/2025    12:00
    Clean reservations    Theater 3
    Validate Session info    Inception   30 de setembro de 2025

Choose a Seat
    Choose Seat    E    4
    Buy Seats

Buy the ticket
    Choose Payment Method    Cartão de Crédito
    Buy Ticket
    Confirmation Message
    
