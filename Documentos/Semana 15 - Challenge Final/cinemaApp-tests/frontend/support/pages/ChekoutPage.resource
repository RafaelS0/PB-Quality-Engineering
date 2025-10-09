*** Settings ***
Documentation    Elementos e ações da página de checkout

Resource    ../base.resource
*** Keywords ***
Choose Payment Method
    [Arguments]    ${paymentMethod}
    Click Element    //span[text()='${paymentMethod}']    
    Sleep    1s

Buy Ticket
    Click Button    //button[@class="btn btn-primary btn-checkout"]
    Sleep    2s


Confirmation Message
    Element Should Be Visible    //h1[text()="Reserva Confirmada!"]   

    


    

