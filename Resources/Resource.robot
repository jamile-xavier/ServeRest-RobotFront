*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ${EXECDIR}/Library/faker_api.py
Resource    ${EXECDIR}/Resources/PO/CadastroUsuario.robot
Resource    ${EXECDIR}/Resources/PO/Login.robot
Resource    ${EXECDIR}/Resources/PO/Logout.robot
Resource    ${EXECDIR}/Resources/PO/Home.robot
Resource    ${EXECDIR}/Resources/PO/CadastroProduto.robot
Resource    ${EXECDIR}/Resources/PO/ListaUsuarios.robot
Resource    ${EXECDIR}/Resources/PO/ListaCompras.robot
Resource    ${EXECDIR}/Resources/PO/ListaProdutos.robot

*** Variables ***
${BROWSER}    firefox

*** Keywords ***

Abrir o navegador
    Open Browser    about:blank    ${BROWSER}

Fechar o navegador
    Close Browser