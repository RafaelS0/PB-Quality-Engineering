*** Settings ***
Documentation    Elementos e ações da página de sessões de um filme

Resource    ../base.resource

*** Keywords ***

Choose Session
    [Arguments]    ${date}    ${time}
    Click Element    xpath=//h3[text()="${date}"]/following-sibling::div//div[contains(.,"${time}")]/ancestor::div[@class="session-card"]//a[contains(@class,"session-button")]

Choose Seat
    [Arguments]    ${row}    ${number}
    ${seat_locator}=    Set Variable    xpath=//button[@title="Fileira ${row}, Assento ${number} - Status: available"]
    Wait Until Element Is Visible    ${seat_locator}
    Scroll Element Into View    ${seat_locator}
    Sleep    1s
    Click Element    ${seat_locator}

Buy Seats
    Click Button    //button[@class='btn btn-primary checkout-button']


Validate Session info
    [Arguments]    ${movie_name}    ${date}
    Sleep    1s
    Element Should Be Visible    xpath=//h1[text()="${movie_name}"]
    Element Should Be Visible    xpath=//p[contains(.,"${date}")]


    


