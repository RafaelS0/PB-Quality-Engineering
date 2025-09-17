*** Settings ***

Library    libs/database.py
Library    SeleniumLibrary
Library    FakerLibrary

*** Keywords ***
Iniciar Sessão
    Open Browser    http://localhost:3000    chrome