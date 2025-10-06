*** Settings ***
Documentation    Testes para endpoint /theaters

Resource    ../support/base.resource

Suite Setup    Make New Session

*** Test Cases ***

CT007.001 - Criar uma Sala de Cinema com Sucesso

    [Tags]    CT007

    ${theater}    Create Dictionary
    ...    name=Sala - 1
    ...    capacity= 60
    ...    type=standard    
    Remove Theater From Database    ${theater}[name]
    Criar um Sala de Cinema    ${theater}
    Validate Status Code "201"
    Validar Success    ${True}


CT008.001 - Editar Uma Sala De Cinema Válida
    [Tags]    CT008

    ${original_theater}=    Fill with Theater    1
    Criar um Sala de Cinema    ${original_theater}
        
    ${edited_theater}    Create Dictionary
    ...    name=Sala Editada
    ...    capacity=90
    ...    type=3D    
    
    Update Theater Data    ${original_theater}    ${edited_theater}
    Validate Status Code "200"

CT009.001 - Deletar Uma Sala de Cinema Válida
    [Tags]    CT009
    ${theater}=    Fill with Theater    3
    Criar um Sala de Cinema    ${theater}
    Delete Theater Data    ${theater}
    Validar Success    ${true}
    Validate Status Code "200"


