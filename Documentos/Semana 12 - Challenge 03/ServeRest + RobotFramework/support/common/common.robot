*** Settings ***
Documentation           Keywords e Variáveis Comuns
Library                 OperatingSystem
Resource                ../../keywords/login_keywords.robot
Resource                ../../keywords/nova_reserva_keywords.robot
Resource                ../../keywords/editar_reserva_keywords.robot
Resource                ../../keywords/atualizar_reserva_parcial_keywords.robot
Resource                ../../keywords/buscar_uma_reserva_keywords.robot
Resource                ../../keywords/deletar_reserva_keywords.robot

*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Importar JSON Estatico
    [Arguments]    ${nome_arquivo}
    ${conteudo}=    Get File    ${EXECDIR}/${nome_arquivo}
    ${json_data}=    Evaluate    json.loads('''${conteudo}''')    json
    [Return]    ${json_data}