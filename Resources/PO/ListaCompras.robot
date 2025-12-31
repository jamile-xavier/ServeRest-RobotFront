*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resource.robot
 

*** Variables ***
${TITULO_LISTA_COMPRAS}    //h1[normalize-space()='Lista de Compras']

*** Keywords ***