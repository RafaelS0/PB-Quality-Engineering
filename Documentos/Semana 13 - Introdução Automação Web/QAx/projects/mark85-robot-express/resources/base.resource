*** Settings ***

Library    libs/database.py
Library    SeleniumLibrary
Library    FakerLibrary
Library    Collections
Library    JSONLibrary
Resource    env.resource
Resource    ../resources/pages/SignupPage.resource
Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/components/Notice.resource
Resource    ../resources/pages/components/Alert.resource
Resource    ../resources/pages/components/Header.resource
Resource    ../resources/pages/TaskCreatePage.resource

*** Keywords ***
Iniciar Sessão
    Open Browser    ${BASE_URL}    chrome


# Helpers
Get fixtures
    [Arguments]    ${file_name}    ${scenario}
    ${data}=    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=UTF-8
   RETURN    ${data}[${scenario}]
    