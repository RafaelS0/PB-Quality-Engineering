*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    JSONLibrary
Library    String
Library    ../support/libs/database.py
Resource    env.resource
Resource    ../support/pages/SignupPage.resource
Resource    ../support/common/common.resource
Resource    ../support/pages/SessionsPage.resource
Resource    ../support/pages/components/MovieCard.resource
Resource    ../support//pages/ChekoutPage.resource
Resource    ../support/pages/LoginPage.resource
Resource    ../support/pages/components/Header.resource

*** Keywords ***
Start Session
    Open Browser    ${BASE_URL}    chrome