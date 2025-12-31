*** Settings ***
Resource    ../Resources/Resource.robot
Resource    ../Resources/PO/CadastroUsuario.robot
Resource    ../Resources/PO/Login.robot
Resource    ../Resources/PO/Home.robot

Suite Setup       Abrir o navegador
Test Setup        Cadastro de usuario
Suite Teardown    Fechar o navegador

*** Test Cases ***
CT01 - Realizar logout
    Given que estou logado na ServeRest
    When clico no botão logout
    Then o logout deverá ser realizado redirecionando para página de login

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

