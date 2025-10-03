*** Settings ***
Documentation    Testes para endpoint /theaters

Resource    ../support/base.resource

Suite Setup    Make New Session

*** Test Cases ***

CT007.001 - Criar uma Sala de Cinema com Sucesso

    ${theater}    Create Dictionary
    ...    name=Sala - 1
    ...    capacity= 60
    ...    type=standard    
    Remove Theater From Database    ${theater}[name]
    Criar um Sala de Cinema    ${theater}
    Validate Status Code "201"
    Validar Success    ${True}