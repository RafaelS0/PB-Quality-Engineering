*** Settings ***
Documentation    Keywords Reutilizaveis
Resource    ../base.resource


*** Keywords ***
Validate Redirection To Home Page
    Location Should Be    ${BASE_URL}/