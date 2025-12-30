*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    firefox

*** Keywords ***

Abrir o navegador
    Open Browser    about:blank    ${BROWSER}

Fechar o navegador
    Close Browser