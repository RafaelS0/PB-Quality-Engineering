*** Settings ***
Documentation    Elementos e ações do componente card de filme

Resource    ../../../support/base.resource

*** Keywords ***
Click More Details
    [Arguments]    ${movie_name}
    Scroll Element Into View   xpath=//div[@class='movie-info'][.//h3[normalize-space()='${movie_name}']]//a[normalize-space()='Ver Detalhes']
    Click Element    xpath=//div[@class='movie-info'][.//h3[normalize-space()='${movie_name}']]//a[normalize-space()='Ver Detalhes']
    Sleep    1s
   