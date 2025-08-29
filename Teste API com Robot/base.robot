*** Settings ***
Documentation        Requisições HTTP para a API X
Library              RequestsLibrary

*** Variables ***
${BASE_URL}          https://jsonplaceholder.typicode.com

*** Test Cases ***


* Keywords * 
Criar status_code_desejado
    Create Session    api_session    ${BASE_URL}
