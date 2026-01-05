*** Settings ***
Documentation    Logout

*** Variables ***
${BTN_LOGOUT}        //button[normalize-space()='Logout']
${MENU_NAVEGACAO}    //div[@id='navbarTogglerDemo01']

*** Keywords ***
Given que estou logado na ServeRest
    Realizar Login
    Wait Until Element Is Visible    ${MENU_NAVEGACAO} 

When clico no botão logout
    Click Button    ${BTN_LOGOUT}     

Then o logout deverá ser realizado redirecionando para página de login
    Wait Until Element Is Visible    ${LOGIN_IMAGE} 

