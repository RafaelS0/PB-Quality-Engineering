*** Settings ***
Documentation    Elementos e ações da página de cadastro de usuário

Resource    ../base.resource
*** Keywords ***

Send SignUp Form
    [Arguments]     ${user}
    Input Text    //input[@id='name']    ${user}[name]
    Input Text    //input[@id='email']    ${user}[email]
    Input Text    //input[@id='password']    ${user}[password]
    Input Text    //input[@id='confirmPassword']    ${user}[password]
    Sleep    1s
    Click Button    //button[@type='submit']
    Sleep    2s
    

