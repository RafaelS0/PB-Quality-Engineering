***Settings ***
Documentation        Um exemplo em Robot Framework
Library              SeleniumLibrary

*** Variables ***
${URL}               http://localhost:3000/tasks
${BROWSER}           chrome    


***Test Cases *** 
Webapp deve estar online
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Mark85 by QAx
    Close Browser
