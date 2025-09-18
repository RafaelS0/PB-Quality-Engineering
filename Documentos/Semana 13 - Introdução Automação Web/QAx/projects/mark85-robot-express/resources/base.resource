*** Settings ***

Library    libs/database.py
Library    SeleniumLibrary
Library    FakerLibrary
Resource    env.resource
Resource    ../resources/pages/SignupPage.resource
Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/components/Notice.resource


*** Keywords ***
Iniciar Sessão
    Open Browser    ${BASE_URL}    chrome