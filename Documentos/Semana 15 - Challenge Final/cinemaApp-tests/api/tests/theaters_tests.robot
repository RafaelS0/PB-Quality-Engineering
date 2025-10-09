*** Settings ***
Documentation    Testes para endpoint /theaters

Resource    ../support/base.resource

Suite Setup    Make New Session

*** Test Cases ***

CT006.001 - Criar uma Sala de Cinema com Sucesso

    [Tags]    CT006-new-theater

    ${theater}    Create Dictionary
    ...    name=Sala - 90
    ...    capacity= 60
    ...    type=standard    
    Remove Theater From Database    ${theater}[name]
    Create Theater Data    ${theater}
    Validate Status Code "201"
    Validar Success    ${True}

CT006.002 - Criar uma Sala de Cinema com duplicada

    [Tags]    CT006-new-theater

    ${theater}    Create Dictionary
    ...    name=Sala - 90
    ...    capacity= 60
    ...    type=standard    
    Remove Theater From Database    ${theater}[name]
    Create Theater Data    ${theater}
    Create Theater Data    ${theater}
    Validate Status Code "409"
    Validar Success    ${False}


CT006.003 - Criar uma Sala de Cinema sem token de autenticação

    [Tags]    CT006-new-theater

    ${theater}    Create Dictionary
    ...    name=Sala - 90
    ...    capacity= 60
    ...    type=standard    
    Remove Theater From Database    ${theater}[name]
    Create Theater Data without default token    ${theater}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${False}

CT006.004 - Criar uma Sala de Cinema com token de cliente

    [Tags]    CT006-new-theater

    ${theater}    Create Dictionary
    ...    name=Sala - 90
    ...    capacity= 60
    ...    type=standard    
    Remove Theater From Database    ${theater}[name]
    ${token}=    Generate customer token
    Create Theater Data without default token    ${theater}    ${token}
    Validate Status Code "403"
    Validar Success    ${False}

CT007.001 - Editar Uma Sala De Cinema Válida
    [Tags]    CT007-edit-theater

    ${original_theater}=    Fill with Theater    1
    Create Theater Data    ${original_theater}
        
    ${edited_theater}    Create Dictionary
    ...    name=Sala Editada
    ...    capacity=90
    ...    type=3D    
    
    Update Theater Data    ${original_theater}    ${edited_theater}
    Validate Status Code "200"

CT007.002 - Editar Uma Sala De Cinema Válida sem token de autenticação
    [Tags]    CT007-edit-theater


    ${original_theater}=    Fill with Theater    1
    Create Theater Data    ${original_theater}
        
    ${edited_theater}    Create Dictionary
    ...    name=Sala Editada
    ...    capacity=90
    ...    type=3D    
    
    Update Theater Data without default token    ${original_theater}    ${edited_theater}    ${EMPTY}
    Validate Status Code "401"
    Validar Success    ${False}

CT007.003 - Editar Uma Sala De Cinema Válida com token de cliente
    [Tags]    CT007-edit-theater

    ${original_theater}=    Fill with Theater    1
    Create Theater Data    ${original_theater}
        
    ${edited_theater}    Create Dictionary
    ...    name=Sala Editada
    ...    capacity=90
    ...    type=3D    
    ${token}=    Generate customer token
    Update Theater Data without default token    ${original_theater}    ${edited_theater}    ${token}
    Validate Status Code "403"
    Validar Success    ${False}

CT007.004 - Editar uma sala e preencher com um nome já existente
    [Tags]    CT007-edit-theater

    ${original_theater}=    Fill with Theater    1
    Create Theater Data    ${original_theater}
        
    ${edited_theater}    Create Dictionary
    ...    name=Theater 1
    ...    capacity=40
    ...    type=3D    
    Update Theater Data    ${original_theater}    ${edited_theater}
    Validate Status Code "409"
    Validar Success    ${False}


CT008.001 - Deletar Uma Sala de Cinema Válida
    [Tags]    CT008-delete-theater
    ${theater}=    Fill with Theater    3
    Create Theater Data    ${theater}
    Delete Theater Data    ${theater}
    Validar Success    ${true}
    Validate Status Code "200"

CT008.002 - Deletar Uma Sala de Cinema sem token de autenticação
    [Tags]    CT008-delete-theater
    ${theater}=    Fill with Theater    3
    Create Theater Data    ${theater}
    
    Delete Theater Data without default token    ${theater}    ${EMPTY}    
    Validar Success    ${false}
    Validate Status Code "401"

CT008.003 - Deletar Uma Sala de Cinema com token de cliente
    [Tags]    CT008-delete-theater
    ${theater}=    Fill with Theater    3
    Create Theater Data    ${theater}
    ${token}=    Generate customer token
    Delete Theater Data without default token    ${theater}    ${token}    
    Validar Success    ${false}
    Validate Status Code "403"
