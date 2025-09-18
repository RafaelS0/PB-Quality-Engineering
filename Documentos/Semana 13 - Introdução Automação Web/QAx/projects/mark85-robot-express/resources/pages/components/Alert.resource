*** Settings ***
Documentation     Test suite for login functionality
Library           SeleniumLibrary

*** Keywords ***
Alerta no formulario
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    xpath=//small[text()="${expected_message}"]   10s
    Page Should Contain Element     xpath=//small[text()="${expected_message}"]
