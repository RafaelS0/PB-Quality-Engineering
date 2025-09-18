*** Settings ***
Documentation     Componente de notificação
Resource          ../../base.resource


*** Keywords ***
Deve conter a mensagem
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    xpath=//p[contains(., '${expected_message}')]    10s
    Page Should Contain Element     xpath=//p[contains(., '${expected_message}')]