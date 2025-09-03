*** Settings ***
Documentation     Fake Documentation
Library           FakerLibrary    locale=pt_BR


*** Keywords ***
 Criar Reservas Validas

     ${firstname} =  FakerLibrary.Name
     ${lastname} =  FakerLibrary.Last Name
     ${totalprice} =  FakerLibrary.Pricetag
     ${depositpaid} =  FakerLibrary.Boolean
     ${checkin} =  FakerLibrary.Date
     ${checkout} =  FakerLibrary.Date
     ${bookingdates}=    Create Dictionary    checkin=${checkin}    checkout=${checkout}
     ${additionalneeds} =  FakerLibrary.Text
     ${payload}=  Create Dictionary    firstname=${firstname}    lastname=${lastname}    totalprice=${totalprice}    depositpaid=${depositpaid}    bookingdates=${bookingdates}    additionalneeds=${additionalneeds}
     Log To Console    ${payload}
     [Return]          ${payload}