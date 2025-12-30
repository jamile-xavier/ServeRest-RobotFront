*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${HOME_URL}     https://front.serverest.dev/login
${HOME_IMAGE}    //img[@class='imagem']
${BTN_ENTRAR}    //button[normalize-space()='Entrar']
${LINK_CADASTRO}    //a[normalize-space()='Cadastre-se']

*** Keywords ***

Given que estou na página inicial
    Go To    ${HOME_URL}
    Wait Until Element Is Visible    ${HOME_IMAGE}

And clico em "Entrar"
    Click Button    ${BTN_ENTRAR}  

And clico em "Cadastre-se"
    Click Link    ${LINK_CADASTRO}