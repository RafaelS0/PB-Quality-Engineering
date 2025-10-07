*** Settings ***
Documentation    Fluxo de cadastro, escolha de um filme, escolha de uma sessão e compra de um ingresso

Resource    ../../support/base.resource


Suite Setup    Start Session

*** Test Cases ***

Create a new account
    ${user}=    Default Client Data
    Set Global Variable    ${user}
    Clean user from database    ${user}[email]
   
    Access SignUp Page
    Send SignUp Form    ${user}
    Validate Redirection    /

Choose a movie
    Click More Details    The Avengers
    
Choose a session
    Choose Session    30/09/2025    12:00
    Validate Session info    The Avengers    30 de setembro de 2025

Chosse a Seat
    Choose Seat    A    6
    Buy Seats

Buy the ticket
    Choose Payment Method    PIX
    Buy Ticket
    Confirmation Message
    