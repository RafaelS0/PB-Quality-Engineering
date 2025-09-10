*** Settings ***
Documentation           Keywords e Variáveis Comuns
Library                 OperatingSystem
Resource                ../../keywords/login_keywords.robot
Resource                ../../keywords/cadastro_usuario_keywords.robot

*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Importar JSON Estatico
    [Arguments]    ${nome_arquivo}
    ${conteudo}=    Get File    ${EXECDIR}/${nome_arquivo}
    ${json_data}=    Evaluate    json.loads('''${conteudo}''')    json
    [Return]    ${json_data}