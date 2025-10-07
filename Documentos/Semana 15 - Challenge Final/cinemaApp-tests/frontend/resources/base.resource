*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    JSONLibrary
Library    String
Library    ../resources/libs/database.py
Resource    env.resource
Resource    ../resources/pages/SignupPage.resource
Resource    ../resources/pages/components/header.resource

*** Keywords ***
Start Session
    Open Browser    ${BASE_URL}    chrome