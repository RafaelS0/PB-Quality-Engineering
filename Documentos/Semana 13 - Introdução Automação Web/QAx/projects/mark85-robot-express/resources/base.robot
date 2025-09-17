*** Settings ***

Library    libs/database.py
Library    SeleniumLibrary
Library    FakerLibrary
Resource    env.robot
Resource    ../resources/pages/SignupPage.robot

*** Keywords ***
Iniciar Sessão
    Open Browser    ${BASE_URL}    chrome