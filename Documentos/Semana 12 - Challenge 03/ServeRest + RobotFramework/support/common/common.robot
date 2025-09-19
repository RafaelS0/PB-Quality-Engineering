*** Settings ***
Documentation           Keywords e Variáveis Comuns
Library                 OperatingSystem
Resource                ../base.robot
*** Keywords ***
Validar Status Code "${statuscode}"
    Variable Should Exist    ${response}    msg=Variável response não foi definida. Verifique se a requisição foi executada.
    Should Be True    ${response.status_code} == ${statuscode}


Validar mensagem de erro:
    [Arguments]    ${expected_message}
    ${response_message}=    Set Variable    ${response.json()['message']}
    Should Be Equal As Strings    ${response_message}    ${expected_message}    msg=Mensagem de erro inesperada. Esperado: ${expected_message}, Obtido: ${response_message}


Importar JSON Estatico
    [Arguments]    ${nome_arquivo}
    ${conteudo}=    Get File    ${EXECDIR}/${nome_arquivo}
    ${json_data}=    Evaluate    json.loads('''${conteudo}''')    json
    [Return]    ${json_data}