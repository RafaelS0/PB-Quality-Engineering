*** Settings ***
Documentation    Elementos e ações da página de cadastro de usuário

Resource    ../base.resource
*** Keywords ***

Send Login Form
    [Arguments]     ${user}
    Input Text    //input[@id='email']    ${user}[email]
    Input Text    //input[@id='password']    ${user}[password]
    Sleep    1s
    Click Button    //button[@type='submit']
    Sleep    2s
    

