*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resource.robot
Resource    ../Resources/PO/ListaCompras.robot
 

*** Variables ***
${H1_HOME}                   //h1
${INPUT_PESQUISA}            //input[@placeholder='Pesquisar Produtos']
${BTN_PESQUISAR}             //button[normalize-space()='Pesquisar']
${CARD_PRODUTO}              //div[@class='card col-3']
${BTN_ADD_LISTA}             //div[@class='container-fluid']//div//div[1]//div[1]//div[1]//a[2]//button[1]
${BTN_CADASTRAR_USUARIO}     //a[@data-testid='cadastrarUsuarios']

*** Keywords ***
Given que estou logado como usuario comum
    Realizar Login

When clico no campo de Pesquisar produtos e digito o nome do produto "${PRODUTO}" 
    Input Text    ${INPUT_PESQUISA}     ${PRODUTO}   

And clico no botão Pesquisar
    Click Button    ${BTN_PESQUISAR} 

Then deverá mostrar o produto que pesquisei
    Wait Until Element Is Visible     ${CARD_PRODUTO}   

When clico em adicionar o produto à lista
    Wait Until Element Is Visible     ${CARD_PRODUTO}  
    Click Button    ${BTN_ADD_LISTA}

Then o produto deverá ser adicionado à lista redirecionando para a página Lista de Compras
    Wait Until Element Is Visible    ${TITULO_LISTA_COMPRAS} 
    Wait Until Element Is Visible    ${CARD_PRODUTO}   

Given que estou logado como usuario admin
    Realizar Login

When clico no botão "Cadastrar"
    Click Button     ${BTN_CADASTRAR_USUARIO} 